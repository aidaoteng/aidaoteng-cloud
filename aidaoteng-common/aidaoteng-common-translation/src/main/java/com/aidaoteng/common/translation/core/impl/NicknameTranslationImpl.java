package com.aidaoteng.common.translation.core.impl;

import lombok.AllArgsConstructor;
import org.apache.dubbo.config.annotation.DubboReference;
import com.aidaoteng.common.translation.annotation.TranslationType;
import com.aidaoteng.common.translation.constant.TransConstant;
import com.aidaoteng.common.translation.core.TranslationInterface;
import com.aidaoteng.system.api.RemoteUserService;

/**
 * 用户昵称翻译实现
 *
 * @author may
 */
@AllArgsConstructor
@TranslationType(type = TransConstant.USER_ID_TO_NICKNAME)
public class NicknameTranslationImpl implements TranslationInterface<String> {

    @DubboReference
    private RemoteUserService remoteUserService;

    @Override
    public String translation(Object key, String other) {
        if (key instanceof Long id) {
            return remoteUserService.selectNicknameByIds(id.toString());
        } else if (key instanceof String ids) {
            return remoteUserService.selectNicknameByIds(ids);
        }
        return null;
    }
}
