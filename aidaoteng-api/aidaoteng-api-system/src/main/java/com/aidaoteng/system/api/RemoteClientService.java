package com.aidaoteng.system.api;

import com.aidaoteng.system.api.domain.vo.RemoteClientVo;

/**
 * 客户端服务
 *
 * @author Michelle.Chung
 */
public interface RemoteClientService {

    /**
     * 根据客户端id获取客户端详情
     *
     * @param clientId 客户端id
     * @return 客户端对象
     */
    RemoteClientVo queryByClientId(String clientId);

}
