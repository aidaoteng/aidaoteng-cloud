package com.aidaoteng.resource.domain.convert;

import io.github.linpeilie.BaseMapper;
import com.aidaoteng.resource.api.domain.RemoteFile;
import com.aidaoteng.resource.domain.vo.SysOssVo;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.MappingConstants;
import org.mapstruct.ReportingPolicy;

/**
 * 用户信息转换器
 * @author zhujie
 */
@Mapper(componentModel = MappingConstants.ComponentModel.SPRING, unmappedTargetPolicy = ReportingPolicy.IGNORE)
public interface SysOssVoConvert extends BaseMapper<SysOssVo, RemoteFile> {

    @Mapping(target = "name", source = "fileName")
    RemoteFile convert(SysOssVo sysOssVo);

}
