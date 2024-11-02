package com.aidaoteng.auth.service.impl;

import cn.dev33.satoken.stp.SaLoginModel;
import cn.dev33.satoken.stp.StpUtil;
import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.map.MapUtil;
import cn.hutool.http.HttpUtil;
import cn.hutool.http.Method;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import me.zhyd.oauth.model.AuthResponse;
import me.zhyd.oauth.model.AuthUser;
import org.apache.dubbo.config.annotation.DubboReference;
import com.aidaoteng.auth.domain.vo.LoginVo;
import com.aidaoteng.auth.form.SocialLoginBody;
import com.aidaoteng.auth.service.IAuthStrategy;
import com.aidaoteng.common.core.exception.ServiceException;
import com.aidaoteng.common.core.utils.StreamUtils;
import com.aidaoteng.common.core.utils.ValidatorUtils;
import com.aidaoteng.common.json.utils.JsonUtils;
import com.aidaoteng.common.satoken.utils.LoginHelper;
import com.aidaoteng.common.social.config.properties.SocialProperties;
import com.aidaoteng.common.social.utils.SocialUtils;
import com.aidaoteng.common.tenant.helper.TenantHelper;
import com.aidaoteng.system.api.RemoteSocialService;
import com.aidaoteng.system.api.RemoteUserService;
import com.aidaoteng.system.api.domain.vo.RemoteClientVo;
import com.aidaoteng.system.api.domain.vo.RemoteSocialVo;
import com.aidaoteng.system.api.model.LoginUser;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

/**
 * 第三方授权策略
 *
 * @author thiszhc is 三三
 */
@Slf4j
@Service("social" + IAuthStrategy.BASE_NAME)
@RequiredArgsConstructor
public class SocialAuthStrategy implements IAuthStrategy {

    private final SocialProperties socialProperties;

    @DubboReference
    private RemoteSocialService remoteSocialService;
    @DubboReference
    private RemoteUserService remoteUserService;

    /**
     * 登录-第三方授权登录
     *
     * @param body     登录信息
     * @param client   客户端信息
     */
    @Override
    public LoginVo login(String body, RemoteClientVo client) {
        SocialLoginBody loginBody = JsonUtils.parseObject(body, SocialLoginBody.class);
        ValidatorUtils.validate(loginBody);
        AuthResponse<AuthUser> response = SocialUtils.loginAuth(
            loginBody.getSource(), loginBody.getSocialCode(),
            loginBody.getSocialState(), socialProperties);
        if (!response.ok()) {
            throw new ServiceException(response.getMsg());
        }
        AuthUser authUserData = response.getData();
        if ("GITEE".equals(authUserData.getSource())) {
            // 如用户使用 gitee 登录顺手 star 给作者一点支持 拒绝白嫖
            HttpUtil.createRequest(Method.PUT, "https://gitee.com/api/v5/user/starred/dromara/Aidaoteng-Vue-Plus")
                .formStr(MapUtil.of("access_token", authUserData.getToken().getAccessToken()))
                .executeAsync();
            HttpUtil.createRequest(Method.PUT, "https://gitee.com/api/v5/user/starred/dromara/aidaoteng-cloud")
                .formStr(MapUtil.of("access_token", authUserData.getToken().getAccessToken()))
                .executeAsync();
        }

        List<RemoteSocialVo> list = remoteSocialService.selectByAuthId(authUserData.getSource() + authUserData.getUuid());
        if (CollUtil.isEmpty(list)) {
            throw new ServiceException("你还没有绑定第三方账号，绑定后才可以登录！");
        }
        RemoteSocialVo socialVo;
        if (TenantHelper.isEnable()) {
            Optional<RemoteSocialVo> opt = StreamUtils.findAny(list, x -> x.getTenantId().equals(loginBody.getTenantId()));
            if (opt.isEmpty()) {
                throw new ServiceException("对不起，你没有权限登录当前租户！");
            }
            socialVo = opt.get();
        } else {
            socialVo = list.get(0);
        }

        LoginUser loginUser = remoteUserService.getUserInfo(socialVo.getUserId(), socialVo.getTenantId());
        loginUser.setClientKey(client.getClientKey());
        loginUser.setDeviceType(client.getDeviceType());
        SaLoginModel model = new SaLoginModel();
        model.setDevice(client.getDeviceType());
        // 自定义分配 不同用户体系 不同 token 授权时间 不设置默认走全局 yml 配置
        // 例如: 后台用户30分钟过期 app用户1天过期
        model.setTimeout(client.getTimeout());
        model.setActiveTimeout(client.getActiveTimeout());
        model.setExtra(LoginHelper.CLIENT_KEY, client.getClientId());
        // 生成token
        LoginHelper.login(loginUser, model);

        LoginVo loginVo = new LoginVo();
        loginVo.setAccessToken(StpUtil.getTokenValue());
        loginVo.setExpireIn(StpUtil.getTokenTimeout());
        loginVo.setClientId(client.getClientId());
        return loginVo;
    }

}
