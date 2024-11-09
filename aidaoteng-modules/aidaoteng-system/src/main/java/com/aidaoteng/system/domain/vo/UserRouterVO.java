package com.aidaoteng.system.domain.vo;

import lombok.Data;

/**
 * 路由配置信息
 *
 * @author aidaoteng
 */
@Data
public class UserRouterVO {
    private String name;
    private String path;
    private String title;
    private boolean requiresAuth;
    private String icon;
    private String menuType;
    private String componentPath;
    private Long id;
    private Long pid;
    private boolean pinTab;
    private String href;
}
