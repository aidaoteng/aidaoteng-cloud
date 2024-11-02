package com.aidaoteng.system.dubbo;

import lombok.RequiredArgsConstructor;
import org.apache.dubbo.config.annotation.DubboService;
import com.aidaoteng.common.core.utils.MapstructUtils;
import com.aidaoteng.system.api.RemoteLogService;
import com.aidaoteng.system.api.domain.bo.RemoteLogininforBo;
import com.aidaoteng.system.api.domain.bo.RemoteOperLogBo;
import com.aidaoteng.system.domain.bo.SysLogininforBo;
import com.aidaoteng.system.domain.bo.SysOperLogBo;
import com.aidaoteng.system.service.ISysLogininforService;
import com.aidaoteng.system.service.ISysOperLogService;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

/**
 * 操作日志记录
 *
 * @author Lion Li
 */
@RequiredArgsConstructor
@Service
@DubboService
public class RemoteLogServiceImpl implements RemoteLogService {

    private final ISysOperLogService operLogService;
    private final ISysLogininforService logininforService;

    /**
     * 保存系统日志
     *
     * @param remoteOperLogBo 日志实体
     */
    @Async
    @Override
    public void saveLog(RemoteOperLogBo remoteOperLogBo) {
        SysOperLogBo sysOperLogBo = MapstructUtils.convert(remoteOperLogBo, SysOperLogBo.class);
        operLogService.insertOperlog(sysOperLogBo);
    }

    /**
     * 保存访问记录
     *
     * @param remoteLogininforBo 访问实体
     */
    @Async
    @Override
    public void saveLogininfor(RemoteLogininforBo remoteLogininforBo) {
        SysLogininforBo sysLogininforBo = MapstructUtils.convert(remoteLogininforBo, SysLogininforBo.class);
        logininforService.insertLogininfor(sysLogininforBo);
    }
}
