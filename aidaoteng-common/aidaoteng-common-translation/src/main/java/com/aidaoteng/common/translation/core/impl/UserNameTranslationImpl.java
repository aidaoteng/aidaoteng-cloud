package com.aidaoteng.common.translation.core.impl;

import com.aidaoteng.common.translation.annotation.TranslationType;
import com.aidaoteng.common.translation.constant.TransConstant;
import com.aidaoteng.common.translation.core.TranslationInterface;
import com.aidaoteng.system.api.RemoteUserService;
import lombok.AllArgsConstructor;
import org.apache.dubbo.config.annotation.DubboReference;

/**
 * 用户名翻译实现
 *
 * @author Lion Li
 */
@AllArgsConstructor
@TranslationType(type = TransConstant.USER_ID_TO_NAME)
public class UserNameTranslationImpl implements TranslationInterface<String> {

    @DubboReference
    private RemoteUserService remoteUserService;

    @Override
    public String translation(Object key, String other) {
        return remoteUserService.selectUserNameById((Long) key);
    }
}
