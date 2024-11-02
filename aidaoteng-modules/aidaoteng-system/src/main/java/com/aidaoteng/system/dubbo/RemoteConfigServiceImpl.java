package com.aidaoteng.system.dubbo;

import lombok.RequiredArgsConstructor;
import org.apache.dubbo.config.annotation.DubboService;
import com.aidaoteng.system.api.RemoteConfigService;
import com.aidaoteng.system.service.ISysConfigService;
import org.springframework.stereotype.Service;

/**
 * 配置服务
 *
 * @author Michelle.Chung
 */
@RequiredArgsConstructor
@Service
@DubboService
public class RemoteConfigServiceImpl implements RemoteConfigService {

    private final ISysConfigService configService;

    /**
     * 获取注册开关
     */
    @Override
    public boolean selectRegisterEnabled(String tenantId) {
        return configService.selectRegisterEnabled(tenantId);
    }

}
