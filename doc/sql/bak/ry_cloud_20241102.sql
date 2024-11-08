/*
SQLyog Ultimate v13.1.1 (64 bit)
MySQL - 8.0.35 : Database - ry_cloud
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`ry_cloud` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `ry_cloud`;

/*Table structure for table `gen_table` */

DROP TABLE IF EXISTS `gen_table`;

CREATE TABLE `gen_table` (
  `table_id` bigint NOT NULL COMMENT '编号',
  `data_name` varchar(200) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '数据源名称',
  `table_name` varchar(200) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) COLLATE utf8mb4_general_ci DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) COLLATE utf8mb4_general_ci DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '其它生成选项',
  `create_dept` bigint DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='代码生成业务表';

/*Data for the table `gen_table` */

/*Table structure for table `gen_table_column` */

DROP TABLE IF EXISTS `gen_table_column`;

CREATE TABLE `gen_table_column` (
  `column_id` bigint NOT NULL COMMENT '编号',
  `table_id` bigint DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) COLLATE utf8mb4_general_ci DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典类型',
  `sort` int DEFAULT NULL COMMENT '排序',
  `create_dept` bigint DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='代码生成业务表字段';

/*Data for the table `gen_table_column` */

/*Table structure for table `sys_client` */

DROP TABLE IF EXISTS `sys_client`;

CREATE TABLE `sys_client` (
  `id` bigint NOT NULL COMMENT 'id',
  `client_id` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '客户端id',
  `client_key` varchar(32) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '客户端key',
  `client_secret` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '客户端秘钥',
  `grant_type` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '授权类型',
  `device_type` varchar(32) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '设备类型',
  `active_timeout` int DEFAULT '1800' COMMENT 'token活跃超时时间',
  `timeout` int DEFAULT '604800' COMMENT 'token固定超时',
  `status` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `del_flag` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_dept` bigint DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='系统授权表';

/*Data for the table `sys_client` */

insert  into `sys_client`(`id`,`client_id`,`client_key`,`client_secret`,`grant_type`,`device_type`,`active_timeout`,`timeout`,`status`,`del_flag`,`create_dept`,`create_by`,`create_time`,`update_by`,`update_time`) values 
(1,'e5cd7e4891bf95d1d19206ce24a7b32e','pc','pc123','password,social','pc',1800,604800,'0','0',103,1,'2024-11-02 15:00:28',1,'2024-11-02 15:00:28'),
(2,'428a8310cd442757ae699df5d894f051','app','app123','password,sms,social','android',1800,604800,'0','0',103,1,'2024-11-02 15:00:28',1,'2024-11-02 15:00:28');

/*Table structure for table `sys_config` */

DROP TABLE IF EXISTS `sys_config`;

CREATE TABLE `sys_config` (
  `config_id` bigint NOT NULL COMMENT '参数主键',
  `tenant_id` varchar(20) COLLATE utf8mb4_general_ci DEFAULT '000000' COMMENT '租户编号',
  `config_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) COLLATE utf8mb4_general_ci DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_dept` bigint DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='参数配置表';

/*Data for the table `sys_config` */

insert  into `sys_config`(`config_id`,`tenant_id`,`config_name`,`config_key`,`config_value`,`config_type`,`create_dept`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values 
(1,'000000','主框架页-默认皮肤样式名称','sys.index.skinName','skin-blue','Y',103,1,'2024-11-02 15:00:22',NULL,NULL,'蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow'),
(2,'000000','用户管理-账号初始密码','sys.user.initPassword','123456','Y',103,1,'2024-11-02 15:00:22',NULL,NULL,'初始化密码 123456'),
(3,'000000','主框架页-侧边栏主题','sys.index.sideTheme','theme-dark','Y',103,1,'2024-11-02 15:00:22',NULL,NULL,'深色主题theme-dark，浅色主题theme-light'),
(5,'000000','账号自助-是否开启用户注册功能','sys.account.registerUser','false','Y',103,1,'2024-11-02 15:00:22',NULL,NULL,'是否开启注册用户功能（true开启，false关闭）'),
(11,'000000','OSS预览列表资源开关','sys.oss.previewListResource','true','Y',103,1,'2024-11-02 15:00:22',NULL,NULL,'true:开启, false:关闭');

/*Table structure for table `sys_dept` */

DROP TABLE IF EXISTS `sys_dept`;

CREATE TABLE `sys_dept` (
  `dept_id` bigint NOT NULL COMMENT '部门id',
  `tenant_id` varchar(20) COLLATE utf8mb4_general_ci DEFAULT '000000' COMMENT '租户编号',
  `parent_id` bigint DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(500) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '部门名称',
  `dept_category` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '部门类别编码',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `leader` bigint DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '邮箱',
  `status` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_dept` bigint DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='部门表';

/*Data for the table `sys_dept` */

insert  into `sys_dept`(`dept_id`,`tenant_id`,`parent_id`,`ancestors`,`dept_name`,`dept_category`,`order_num`,`leader`,`phone`,`email`,`status`,`del_flag`,`create_dept`,`create_by`,`create_time`,`update_by`,`update_time`) values 
(100,'000000',0,'0','XXX科技',NULL,0,NULL,'15888888888','xxx@qq.com','0','0',103,1,'2024-11-02 15:00:09',NULL,NULL),
(101,'000000',100,'0,100','深圳总公司',NULL,1,NULL,'15888888888','xxx@qq.com','0','0',103,1,'2024-11-02 15:00:09',NULL,NULL),
(102,'000000',100,'0,100','长沙分公司',NULL,2,NULL,'15888888888','xxx@qq.com','0','0',103,1,'2024-11-02 15:00:09',NULL,NULL),
(103,'000000',101,'0,100,101','研发部门',NULL,1,1,'15888888888','xxx@qq.com','0','0',103,1,'2024-11-02 15:00:09',NULL,NULL),
(104,'000000',101,'0,100,101','市场部门',NULL,2,NULL,'15888888888','xxx@qq.com','0','0',103,1,'2024-11-02 15:00:09',NULL,NULL),
(105,'000000',101,'0,100,101','测试部门',NULL,3,NULL,'15888888888','xxx@qq.com','0','0',103,1,'2024-11-02 15:00:09',NULL,NULL),
(106,'000000',101,'0,100,101','财务部门',NULL,4,NULL,'15888888888','xxx@qq.com','0','0',103,1,'2024-11-02 15:00:09',NULL,NULL),
(107,'000000',101,'0,100,101','运维部门',NULL,5,NULL,'15888888888','xxx@qq.com','0','0',103,1,'2024-11-02 15:00:09',NULL,NULL),
(108,'000000',102,'0,100,102','市场部门',NULL,1,NULL,'15888888888','xxx@qq.com','0','0',103,1,'2024-11-02 15:00:09',NULL,NULL),
(109,'000000',102,'0,100,102','财务部门',NULL,2,NULL,'15888888888','xxx@qq.com','0','0',103,1,'2024-11-02 15:00:09',NULL,NULL);

/*Table structure for table `sys_dict_data` */

DROP TABLE IF EXISTS `sys_dict_data`;

CREATE TABLE `sys_dict_data` (
  `dict_code` bigint NOT NULL COMMENT '字典编码',
  `tenant_id` varchar(20) COLLATE utf8mb4_general_ci DEFAULT '000000' COMMENT '租户编号',
  `dict_sort` int DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) COLLATE utf8mb4_general_ci DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `create_dept` bigint DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='字典数据表';

/*Data for the table `sys_dict_data` */

insert  into `sys_dict_data`(`dict_code`,`tenant_id`,`dict_sort`,`dict_label`,`dict_value`,`dict_type`,`css_class`,`list_class`,`is_default`,`create_dept`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values 
(1,'000000',1,'男','0','sys_user_sex','','','Y',103,1,'2024-11-02 15:00:21',NULL,NULL,'性别男'),
(2,'000000',2,'女','1','sys_user_sex','','','N',103,1,'2024-11-02 15:00:21',NULL,NULL,'性别女'),
(3,'000000',3,'未知','2','sys_user_sex','','','N',103,1,'2024-11-02 15:00:21',NULL,NULL,'性别未知'),
(4,'000000',1,'显示','0','sys_show_hide','','primary','Y',103,1,'2024-11-02 15:00:21',NULL,NULL,'显示菜单'),
(5,'000000',2,'隐藏','1','sys_show_hide','','danger','N',103,1,'2024-11-02 15:00:21',NULL,NULL,'隐藏菜单'),
(6,'000000',1,'正常','0','sys_normal_disable','','primary','Y',103,1,'2024-11-02 15:00:21',NULL,NULL,'正常状态'),
(7,'000000',2,'停用','1','sys_normal_disable','','danger','N',103,1,'2024-11-02 15:00:21',NULL,NULL,'停用状态'),
(12,'000000',1,'是','Y','sys_yes_no','','primary','Y',103,1,'2024-11-02 15:00:21',NULL,NULL,'系统默认是'),
(13,'000000',2,'否','N','sys_yes_no','','danger','N',103,1,'2024-11-02 15:00:21',NULL,NULL,'系统默认否'),
(14,'000000',1,'通知','1','sys_notice_type','','warning','Y',103,1,'2024-11-02 15:00:21',NULL,NULL,'通知'),
(15,'000000',2,'公告','2','sys_notice_type','','success','N',103,1,'2024-11-02 15:00:21',NULL,NULL,'公告'),
(16,'000000',1,'正常','0','sys_notice_status','','primary','Y',103,1,'2024-11-02 15:00:21',NULL,NULL,'正常状态'),
(17,'000000',2,'关闭','1','sys_notice_status','','danger','N',103,1,'2024-11-02 15:00:21',NULL,NULL,'关闭状态'),
(18,'000000',1,'新增','1','sys_oper_type','','info','N',103,1,'2024-11-02 15:00:21',NULL,NULL,'新增操作'),
(19,'000000',2,'修改','2','sys_oper_type','','info','N',103,1,'2024-11-02 15:00:21',NULL,NULL,'修改操作'),
(20,'000000',3,'删除','3','sys_oper_type','','danger','N',103,1,'2024-11-02 15:00:21',NULL,NULL,'删除操作'),
(21,'000000',4,'授权','4','sys_oper_type','','primary','N',103,1,'2024-11-02 15:00:21',NULL,NULL,'授权操作'),
(22,'000000',5,'导出','5','sys_oper_type','','warning','N',103,1,'2024-11-02 15:00:21',NULL,NULL,'导出操作'),
(23,'000000',6,'导入','6','sys_oper_type','','warning','N',103,1,'2024-11-02 15:00:21',NULL,NULL,'导入操作'),
(24,'000000',7,'强退','7','sys_oper_type','','danger','N',103,1,'2024-11-02 15:00:21',NULL,NULL,'强退操作'),
(25,'000000',8,'生成代码','8','sys_oper_type','','warning','N',103,1,'2024-11-02 15:00:21',NULL,NULL,'生成操作'),
(26,'000000',9,'清空数据','9','sys_oper_type','','danger','N',103,1,'2024-11-02 15:00:21',NULL,NULL,'清空操作'),
(27,'000000',1,'成功','0','sys_common_status','','primary','N',103,1,'2024-11-02 15:00:21',NULL,NULL,'正常状态'),
(28,'000000',2,'失败','1','sys_common_status','','danger','N',103,1,'2024-11-02 15:00:21',NULL,NULL,'停用状态'),
(29,'000000',99,'其他','0','sys_oper_type','','info','N',103,1,'2024-11-02 15:00:21',NULL,NULL,'其他操作'),
(30,'000000',0,'密码认证','password','sys_grant_type','el-check-tag','default','N',103,1,'2024-11-02 15:00:21',NULL,NULL,'密码认证'),
(31,'000000',0,'短信认证','sms','sys_grant_type','el-check-tag','default','N',103,1,'2024-11-02 15:00:21',NULL,NULL,'短信认证'),
(32,'000000',0,'邮件认证','email','sys_grant_type','el-check-tag','default','N',103,1,'2024-11-02 15:00:21',NULL,NULL,'邮件认证'),
(33,'000000',0,'小程序认证','xcx','sys_grant_type','el-check-tag','default','N',103,1,'2024-11-02 15:00:21',NULL,NULL,'小程序认证'),
(34,'000000',0,'三方登录认证','social','sys_grant_type','el-check-tag','default','N',103,1,'2024-11-02 15:00:21',NULL,NULL,'三方登录认证'),
(35,'000000',0,'PC','pc','sys_device_type','','default','N',103,1,'2024-11-02 15:00:21',NULL,NULL,'PC'),
(36,'000000',0,'安卓','android','sys_device_type','','default','N',103,1,'2024-11-02 15:00:21',NULL,NULL,'安卓'),
(37,'000000',0,'iOS','ios','sys_device_type','','default','N',103,1,'2024-11-02 15:00:21',NULL,NULL,'iOS'),
(38,'000000',0,'小程序','xcx','sys_device_type','','default','N',103,1,'2024-11-02 15:00:21',NULL,NULL,'小程序'),
(39,'000000',1,'已撤销','cancel','wf_business_status','','danger','N',103,1,'2024-11-02 15:00:21',NULL,NULL,'已撤销'),
(40,'000000',2,'草稿','draft','wf_business_status','','info','N',103,1,'2024-11-02 15:00:21',NULL,NULL,'草稿'),
(41,'000000',3,'待审核','waiting','wf_business_status','','primary','N',103,1,'2024-11-02 15:00:21',NULL,NULL,'待审核'),
(42,'000000',4,'已完成','finish','wf_business_status','','success','N',103,1,'2024-11-02 15:00:21',NULL,NULL,'已完成'),
(43,'000000',5,'已作废','invalid','wf_business_status','','danger','N',103,1,'2024-11-02 15:00:21',NULL,NULL,'已作废'),
(44,'000000',6,'已退回','back','wf_business_status','','danger','N',103,1,'2024-11-02 15:00:21',NULL,NULL,'已退回'),
(45,'000000',7,'已终止','termination','wf_business_status','','danger','N',103,1,'2024-11-02 15:00:21',NULL,NULL,'已终止'),
(46,'000000',1,'自定义表单','static','wf_form_type','','success','N',103,1,'2024-11-02 15:00:21',NULL,NULL,'自定义表单'),
(47,'000000',2,'动态表单','dynamic','wf_form_type','','primary','N',103,1,'2024-11-02 15:00:21',NULL,NULL,'动态表单');

/*Table structure for table `sys_dict_type` */

DROP TABLE IF EXISTS `sys_dict_type`;

CREATE TABLE `sys_dict_type` (
  `dict_id` bigint NOT NULL COMMENT '字典主键',
  `tenant_id` varchar(20) COLLATE utf8mb4_general_ci DEFAULT '000000' COMMENT '租户编号',
  `dict_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典类型',
  `create_dept` bigint DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `tenant_id` (`tenant_id`,`dict_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='字典类型表';

/*Data for the table `sys_dict_type` */

insert  into `sys_dict_type`(`dict_id`,`tenant_id`,`dict_name`,`dict_type`,`create_dept`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values 
(1,'000000','用户性别','sys_user_sex',103,1,'2024-11-02 15:00:20',NULL,NULL,'用户性别列表'),
(2,'000000','菜单状态','sys_show_hide',103,1,'2024-11-02 15:00:20',NULL,NULL,'菜单状态列表'),
(3,'000000','系统开关','sys_normal_disable',103,1,'2024-11-02 15:00:20',NULL,NULL,'系统开关列表'),
(6,'000000','系统是否','sys_yes_no',103,1,'2024-11-02 15:00:20',NULL,NULL,'系统是否列表'),
(7,'000000','通知类型','sys_notice_type',103,1,'2024-11-02 15:00:20',NULL,NULL,'通知类型列表'),
(8,'000000','通知状态','sys_notice_status',103,1,'2024-11-02 15:00:20',NULL,NULL,'通知状态列表'),
(9,'000000','操作类型','sys_oper_type',103,1,'2024-11-02 15:00:20',NULL,NULL,'操作类型列表'),
(10,'000000','系统状态','sys_common_status',103,1,'2024-11-02 15:00:20',NULL,NULL,'登录状态列表'),
(11,'000000','授权类型','sys_grant_type',103,1,'2024-11-02 15:00:20',NULL,NULL,'认证授权类型'),
(12,'000000','设备类型','sys_device_type',103,1,'2024-11-02 15:00:20',NULL,NULL,'客户端设备类型'),
(13,'000000','业务状态','wf_business_status',103,1,'2024-11-02 15:00:20',NULL,NULL,'业务状态列表'),
(14,'000000','表单类型','wf_form_type',103,1,'2024-11-02 15:00:20',NULL,NULL,'表单类型列表');

/*Table structure for table `sys_logininfor` */

DROP TABLE IF EXISTS `sys_logininfor`;

CREATE TABLE `sys_logininfor` (
  `info_id` bigint NOT NULL COMMENT '访问ID',
  `tenant_id` varchar(20) COLLATE utf8mb4_general_ci DEFAULT '000000' COMMENT '租户编号',
  `user_name` varchar(50) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '用户账号',
  `client_key` varchar(32) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '客户端',
  `device_type` varchar(32) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '设备类型',
  `ipaddr` varchar(128) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '操作系统',
  `status` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`),
  KEY `idx_sys_logininfor_s` (`status`),
  KEY `idx_sys_logininfor_lt` (`login_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='系统访问记录';

/*Data for the table `sys_logininfor` */

insert  into `sys_logininfor`(`info_id`,`tenant_id`,`user_name`,`client_key`,`device_type`,`ipaddr`,`login_location`,`browser`,`os`,`status`,`msg`,`login_time`) values 
(1852623338891644929,'000000','admin','pc','pc','0:0:0:0:0:0:0:1','内网IP','MSEdge','Windows 10 or Windows Server 2016','0','登录成功','2024-11-02 16:06:39'),
(1852627314760560642,'000000','admin','pc','pc','0:0:0:0:0:0:0:1','内网IP','MSEdge','Windows 10 or Windows Server 2016','0','登录成功','2024-11-02 16:22:27'),
(1852646553512931329,'000000','admin','pc','pc','0:0:0:0:0:0:0:1','内网IP','MSEdge','Windows 10 or Windows Server 2016','0','登录成功','2024-11-02 17:38:54'),
(1852672029266550785,'000000','admin','pc','pc','0:0:0:0:0:0:0:1','内网IP','MSEdge','Windows 10 or Windows Server 2016','0','登录成功','2024-11-02 19:20:07'),
(1852700403804434433,'000000','admin','pc','pc','0:0:0:0:0:0:0:1','内网IP','MSEdge','Windows 10 or Windows Server 2016','0','登录成功','2024-11-02 21:12:52');

/*Table structure for table `sys_menu` */

DROP TABLE IF EXISTS `sys_menu`;

CREATE TABLE `sys_menu` (
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  `menu_name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `path` varchar(200) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '组件路径',
  `query_param` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '路由参数',
  `is_frame` int DEFAULT '1' COMMENT '是否为外链（0是 1否）',
  `is_cache` int DEFAULT '0' COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '显示状态（0显示 1隐藏）',
  `status` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) COLLATE utf8mb4_general_ci DEFAULT '#' COMMENT '菜单图标',
  `create_dept` bigint DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='菜单权限表';

/*Data for the table `sys_menu` */

insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query_param`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_dept`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values 
(1,'系统管理',0,1,'system',NULL,'',1,0,'M','0','0','','system',103,1,'2024-11-02 15:00:13',NULL,NULL,'系统管理目录'),
(2,'系统监控',0,3,'monitor',NULL,'',1,0,'M','0','0','','monitor',103,1,'2024-11-02 15:00:13',NULL,NULL,'系统监控目录'),
(3,'系统工具',0,4,'tool',NULL,'',1,0,'M','0','0','','tool',103,1,'2024-11-02 15:00:13',NULL,NULL,'系统工具目录'),
(4,'PLUS官网',0,5,'https://gitee.com/dromara/RuoYi-Cloud-Plus',NULL,'',0,0,'M','0','0','','guide',103,1,'2024-11-02 15:00:13',NULL,NULL,'RuoYi-Cloud-Plus官网地址'),
(5,'测试菜单',0,5,'demo',NULL,'',1,0,'M','0','0','','star',103,1,'2024-11-02 15:00:13',NULL,NULL,'测试菜单'),
(6,'租户管理',0,2,'tenant',NULL,'',1,0,'M','0','0','','chart',103,1,'2024-11-02 15:00:13',NULL,NULL,'租户管理目录'),
(100,'用户管理',1,1,'user','system/user/index','',1,0,'C','0','0','system:user:list','user',103,1,'2024-11-02 15:00:13',NULL,NULL,'用户管理菜单'),
(101,'角色管理',1,2,'role','system/role/index','',1,0,'C','0','0','system:role:list','peoples',103,1,'2024-11-02 15:00:13',NULL,NULL,'角色管理菜单'),
(102,'菜单管理',1,3,'menu','system/menu/index','',1,0,'C','0','0','system:menu:list','tree-table',103,1,'2024-11-02 15:00:13',NULL,NULL,'菜单管理菜单'),
(103,'部门管理',1,4,'dept','system/dept/index','',1,0,'C','0','0','system:dept:list','tree',103,1,'2024-11-02 15:00:13',NULL,NULL,'部门管理菜单'),
(104,'岗位管理',1,5,'post','system/post/index','',1,0,'C','0','0','system:post:list','post',103,1,'2024-11-02 15:00:13',NULL,NULL,'岗位管理菜单'),
(105,'字典管理',1,6,'dict','system/dict/index','',1,0,'C','0','0','system:dict:list','dict',103,1,'2024-11-02 15:00:13',NULL,NULL,'字典管理菜单'),
(106,'参数设置',1,7,'config','system/config/index','',1,0,'C','0','0','system:config:list','edit',103,1,'2024-11-02 15:00:13',NULL,NULL,'参数设置菜单'),
(107,'通知公告',1,8,'notice','system/notice/index','',1,0,'C','0','0','system:notice:list','message',103,1,'2024-11-02 15:00:13',NULL,NULL,'通知公告菜单'),
(108,'日志管理',1,9,'log','','',1,0,'M','0','0','','log',103,1,'2024-11-02 15:00:13',NULL,NULL,'日志管理菜单'),
(109,'在线用户',2,1,'online','monitor/online/index','',1,0,'C','0','0','monitor:online:list','online',103,1,'2024-11-02 15:00:13',NULL,NULL,'在线用户菜单'),
(110,'SnailJob控制台',2,2,'http://localhost:8800/snail-job','','',0,0,'C','0','0','monitor:job:list','job',103,1,'2024-11-02 15:00:13',NULL,NULL,'SJ定时任务菜单'),
(111,'Sentinel控制台',2,3,'http://localhost:8718','','',0,0,'C','0','0','monitor:sentinel:list','sentinel',103,1,'2024-11-02 15:00:13',NULL,NULL,'流量控制菜单'),
(112,'Nacos控制台',2,4,'http://localhost:8848/nacos','','',0,0,'C','0','0','monitor:nacos:list','nacos',103,1,'2024-11-02 15:00:13',NULL,NULL,'服务治理菜单'),
(113,'Admin控制台',2,5,'http://localhost:9100/login','','',0,0,'C','0','0','monitor:server:list','server',103,1,'2024-11-02 15:00:13',NULL,NULL,'服务监控菜单'),
(115,'代码生成',3,2,'gen','tool/gen/index','',1,0,'C','0','0','tool:gen:list','code',103,1,'2024-11-02 15:00:13',NULL,NULL,'代码生成菜单'),
(118,'文件管理',1,10,'oss','system/oss/index','',1,0,'C','0','0','system:oss:list','upload',103,1,'2024-11-02 15:00:13',NULL,NULL,'文件管理菜单'),
(121,'租户管理',6,1,'tenant','system/tenant/index','',1,0,'C','0','0','system:tenant:list','list',103,1,'2024-11-02 15:00:13',NULL,NULL,'租户管理菜单'),
(122,'租户套餐管理',6,2,'tenantPackage','system/tenantPackage/index','',1,0,'C','0','0','system:tenantPackage:list','form',103,1,'2024-11-02 15:00:13',NULL,NULL,'租户套餐管理菜单'),
(123,'客户端管理',1,11,'client','system/client/index','',1,0,'C','0','0','system:client:list','international',103,1,'2024-11-02 15:00:13',NULL,NULL,'客户端管理菜单'),
(124,'缓存监控',2,1,'cache','monitor/cache/index','',1,0,'C','0','0','monitor:cache:list','redis',103,1,'2024-11-02 15:00:13',NULL,NULL,'缓存监控'),
(500,'操作日志',108,1,'operlog','monitor/operlog/index','',1,0,'C','0','0','monitor:operlog:list','form',103,1,'2024-11-02 15:00:13',NULL,NULL,'操作日志菜单'),
(501,'登录日志',108,2,'logininfor','monitor/logininfor/index','',1,0,'C','0','0','monitor:logininfor:list','logininfor',103,1,'2024-11-02 15:00:13',NULL,NULL,'登录日志菜单'),
(1001,'用户查询',100,1,'','','',1,0,'F','0','0','system:user:query','#',103,1,'2024-11-02 15:00:13',NULL,NULL,''),
(1002,'用户新增',100,2,'','','',1,0,'F','0','0','system:user:add','#',103,1,'2024-11-02 15:00:13',NULL,NULL,''),
(1003,'用户修改',100,3,'','','',1,0,'F','0','0','system:user:edit','#',103,1,'2024-11-02 15:00:13',NULL,NULL,''),
(1004,'用户删除',100,4,'','','',1,0,'F','0','0','system:user:remove','#',103,1,'2024-11-02 15:00:13',NULL,NULL,''),
(1005,'用户导出',100,5,'','','',1,0,'F','0','0','system:user:export','#',103,1,'2024-11-02 15:00:13',NULL,NULL,''),
(1006,'用户导入',100,6,'','','',1,0,'F','0','0','system:user:import','#',103,1,'2024-11-02 15:00:13',NULL,NULL,''),
(1007,'重置密码',100,7,'','','',1,0,'F','0','0','system:user:resetPwd','#',103,1,'2024-11-02 15:00:13',NULL,NULL,''),
(1008,'角色查询',101,1,'','','',1,0,'F','0','0','system:role:query','#',103,1,'2024-11-02 15:00:13',NULL,NULL,''),
(1009,'角色新增',101,2,'','','',1,0,'F','0','0','system:role:add','#',103,1,'2024-11-02 15:00:13',NULL,NULL,''),
(1010,'角色修改',101,3,'','','',1,0,'F','0','0','system:role:edit','#',103,1,'2024-11-02 15:00:13',NULL,NULL,''),
(1011,'角色删除',101,4,'','','',1,0,'F','0','0','system:role:remove','#',103,1,'2024-11-02 15:00:13',NULL,NULL,''),
(1012,'角色导出',101,5,'','','',1,0,'F','0','0','system:role:export','#',103,1,'2024-11-02 15:00:13',NULL,NULL,''),
(1013,'菜单查询',102,1,'','','',1,0,'F','0','0','system:menu:query','#',103,1,'2024-11-02 15:00:13',NULL,NULL,''),
(1014,'菜单新增',102,2,'','','',1,0,'F','0','0','system:menu:add','#',103,1,'2024-11-02 15:00:13',NULL,NULL,''),
(1015,'菜单修改',102,3,'','','',1,0,'F','0','0','system:menu:edit','#',103,1,'2024-11-02 15:00:13',NULL,NULL,''),
(1016,'菜单删除',102,4,'','','',1,0,'F','0','0','system:menu:remove','#',103,1,'2024-11-02 15:00:13',NULL,NULL,''),
(1017,'部门查询',103,1,'','','',1,0,'F','0','0','system:dept:query','#',103,1,'2024-11-02 15:00:13',NULL,NULL,''),
(1018,'部门新增',103,2,'','','',1,0,'F','0','0','system:dept:add','#',103,1,'2024-11-02 15:00:13',NULL,NULL,''),
(1019,'部门修改',103,3,'','','',1,0,'F','0','0','system:dept:edit','#',103,1,'2024-11-02 15:00:13',NULL,NULL,''),
(1020,'部门删除',103,4,'','','',1,0,'F','0','0','system:dept:remove','#',103,1,'2024-11-02 15:00:13',NULL,NULL,''),
(1021,'岗位查询',104,1,'','','',1,0,'F','0','0','system:post:query','#',103,1,'2024-11-02 15:00:13',NULL,NULL,''),
(1022,'岗位新增',104,2,'','','',1,0,'F','0','0','system:post:add','#',103,1,'2024-11-02 15:00:13',NULL,NULL,''),
(1023,'岗位修改',104,3,'','','',1,0,'F','0','0','system:post:edit','#',103,1,'2024-11-02 15:00:13',NULL,NULL,''),
(1024,'岗位删除',104,4,'','','',1,0,'F','0','0','system:post:remove','#',103,1,'2024-11-02 15:00:13',NULL,NULL,''),
(1025,'岗位导出',104,5,'','','',1,0,'F','0','0','system:post:export','#',103,1,'2024-11-02 15:00:13',NULL,NULL,''),
(1026,'字典查询',105,1,'#','','',1,0,'F','0','0','system:dict:query','#',103,1,'2024-11-02 15:00:13',NULL,NULL,''),
(1027,'字典新增',105,2,'#','','',1,0,'F','0','0','system:dict:add','#',103,1,'2024-11-02 15:00:13',NULL,NULL,''),
(1028,'字典修改',105,3,'#','','',1,0,'F','0','0','system:dict:edit','#',103,1,'2024-11-02 15:00:13',NULL,NULL,''),
(1029,'字典删除',105,4,'#','','',1,0,'F','0','0','system:dict:remove','#',103,1,'2024-11-02 15:00:13',NULL,NULL,''),
(1030,'字典导出',105,5,'#','','',1,0,'F','0','0','system:dict:export','#',103,1,'2024-11-02 15:00:13',NULL,NULL,''),
(1031,'参数查询',106,1,'#','','',1,0,'F','0','0','system:config:query','#',103,1,'2024-11-02 15:00:13',NULL,NULL,''),
(1032,'参数新增',106,2,'#','','',1,0,'F','0','0','system:config:add','#',103,1,'2024-11-02 15:00:13',NULL,NULL,''),
(1033,'参数修改',106,3,'#','','',1,0,'F','0','0','system:config:edit','#',103,1,'2024-11-02 15:00:13',NULL,NULL,''),
(1034,'参数删除',106,4,'#','','',1,0,'F','0','0','system:config:remove','#',103,1,'2024-11-02 15:00:13',NULL,NULL,''),
(1035,'参数导出',106,5,'#','','',1,0,'F','0','0','system:config:export','#',103,1,'2024-11-02 15:00:13',NULL,NULL,''),
(1036,'公告查询',107,1,'#','','',1,0,'F','0','0','system:notice:query','#',103,1,'2024-11-02 15:00:14',NULL,NULL,''),
(1037,'公告新增',107,2,'#','','',1,0,'F','0','0','system:notice:add','#',103,1,'2024-11-02 15:00:14',NULL,NULL,''),
(1038,'公告修改',107,3,'#','','',1,0,'F','0','0','system:notice:edit','#',103,1,'2024-11-02 15:00:14',NULL,NULL,''),
(1039,'公告删除',107,4,'#','','',1,0,'F','0','0','system:notice:remove','#',103,1,'2024-11-02 15:00:14',NULL,NULL,''),
(1040,'操作查询',500,1,'#','','',1,0,'F','0','0','monitor:operlog:query','#',103,1,'2024-11-02 15:00:14',NULL,NULL,''),
(1041,'操作删除',500,2,'#','','',1,0,'F','0','0','monitor:operlog:remove','#',103,1,'2024-11-02 15:00:14',NULL,NULL,''),
(1042,'日志导出',500,4,'#','','',1,0,'F','0','0','monitor:operlog:export','#',103,1,'2024-11-02 15:00:14',NULL,NULL,''),
(1043,'登录查询',501,1,'#','','',1,0,'F','0','0','monitor:logininfor:query','#',103,1,'2024-11-02 15:00:14',NULL,NULL,''),
(1044,'登录删除',501,2,'#','','',1,0,'F','0','0','monitor:logininfor:remove','#',103,1,'2024-11-02 15:00:14',NULL,NULL,''),
(1045,'日志导出',501,3,'#','','',1,0,'F','0','0','monitor:logininfor:export','#',103,1,'2024-11-02 15:00:14',NULL,NULL,''),
(1046,'在线查询',109,1,'#','','',1,0,'F','0','0','monitor:online:query','#',103,1,'2024-11-02 15:00:14',NULL,NULL,''),
(1047,'批量强退',109,2,'#','','',1,0,'F','0','0','monitor:online:batchLogout','#',103,1,'2024-11-02 15:00:14',NULL,NULL,''),
(1048,'单条强退',109,3,'#','','',1,0,'F','0','0','monitor:online:forceLogout','#',103,1,'2024-11-02 15:00:14',NULL,NULL,''),
(1050,'账户解锁',501,4,'#','','',1,0,'F','0','0','monitor:logininfor:unlock','#',103,1,'2024-11-02 15:00:14',NULL,NULL,''),
(1055,'生成查询',115,1,'#','','',1,0,'F','0','0','tool:gen:query','#',103,1,'2024-11-02 15:00:14',NULL,NULL,''),
(1056,'生成修改',115,2,'#','','',1,0,'F','0','0','tool:gen:edit','#',103,1,'2024-11-02 15:00:14',NULL,NULL,''),
(1057,'生成删除',115,3,'#','','',1,0,'F','0','0','tool:gen:remove','#',103,1,'2024-11-02 15:00:14',NULL,NULL,''),
(1058,'导入代码',115,2,'#','','',1,0,'F','0','0','tool:gen:import','#',103,1,'2024-11-02 15:00:14',NULL,NULL,''),
(1059,'预览代码',115,4,'#','','',1,0,'F','0','0','tool:gen:preview','#',103,1,'2024-11-02 15:00:14',NULL,NULL,''),
(1060,'生成代码',115,5,'#','','',1,0,'F','0','0','tool:gen:code','#',103,1,'2024-11-02 15:00:14',NULL,NULL,''),
(1061,'客户端管理查询',123,1,'#','','',1,0,'F','0','0','system:client:query','#',103,1,'2024-11-02 15:00:14',NULL,NULL,''),
(1062,'客户端管理新增',123,2,'#','','',1,0,'F','0','0','system:client:add','#',103,1,'2024-11-02 15:00:14',NULL,NULL,''),
(1063,'客户端管理修改',123,3,'#','','',1,0,'F','0','0','system:client:edit','#',103,1,'2024-11-02 15:00:14',NULL,NULL,''),
(1064,'客户端管理删除',123,4,'#','','',1,0,'F','0','0','system:client:remove','#',103,1,'2024-11-02 15:00:14',NULL,NULL,''),
(1065,'客户端管理导出',123,5,'#','','',1,0,'F','0','0','system:client:export','#',103,1,'2024-11-02 15:00:14',NULL,NULL,''),
(1500,'测试单表',5,1,'demo','demo/demo/index','',1,0,'C','0','0','demo:demo:list','#',103,1,'2024-11-02 15:00:14',NULL,NULL,'测试单表菜单'),
(1501,'测试单表查询',1500,1,'#','','',1,0,'F','0','0','demo:demo:query','#',103,1,'2024-11-02 15:00:14',NULL,NULL,''),
(1502,'测试单表新增',1500,2,'#','','',1,0,'F','0','0','demo:demo:add','#',103,1,'2024-11-02 15:00:14',NULL,NULL,''),
(1503,'测试单表修改',1500,3,'#','','',1,0,'F','0','0','demo:demo:edit','#',103,1,'2024-11-02 15:00:14',NULL,NULL,''),
(1504,'测试单表删除',1500,4,'#','','',1,0,'F','0','0','demo:demo:remove','#',103,1,'2024-11-02 15:00:14',NULL,NULL,''),
(1505,'测试单表导出',1500,5,'#','','',1,0,'F','0','0','demo:demo:export','#',103,1,'2024-11-02 15:00:14',NULL,NULL,''),
(1506,'测试树表',5,1,'tree','demo/tree/index','',1,0,'C','0','0','demo:tree:list','#',103,1,'2024-11-02 15:00:14',NULL,NULL,'测试树表菜单'),
(1507,'测试树表查询',1506,1,'#','','',1,0,'F','0','0','demo:tree:query','#',103,1,'2024-11-02 15:00:14',NULL,NULL,''),
(1508,'测试树表新增',1506,2,'#','','',1,0,'F','0','0','demo:tree:add','#',103,1,'2024-11-02 15:00:14',NULL,NULL,''),
(1509,'测试树表修改',1506,3,'#','','',1,0,'F','0','0','demo:tree:edit','#',103,1,'2024-11-02 15:00:14',NULL,NULL,''),
(1510,'测试树表删除',1506,4,'#','','',1,0,'F','0','0','demo:tree:remove','#',103,1,'2024-11-02 15:00:14',NULL,NULL,''),
(1511,'测试树表导出',1506,5,'#','','',1,0,'F','0','0','demo:tree:export','#',103,1,'2024-11-02 15:00:14',NULL,NULL,''),
(1600,'文件查询',118,1,'#','','',1,0,'F','0','0','system:oss:query','#',103,1,'2024-11-02 15:00:14',NULL,NULL,''),
(1601,'文件上传',118,2,'#','','',1,0,'F','0','0','system:oss:upload','#',103,1,'2024-11-02 15:00:14',NULL,NULL,''),
(1602,'文件下载',118,3,'#','','',1,0,'F','0','0','system:oss:download','#',103,1,'2024-11-02 15:00:14',NULL,NULL,''),
(1603,'文件删除',118,4,'#','','',1,0,'F','0','0','system:oss:remove','#',103,1,'2024-11-02 15:00:14',NULL,NULL,''),
(1606,'租户查询',121,1,'#','','',1,0,'F','0','0','system:tenant:query','#',103,1,'2024-11-02 15:00:14',NULL,NULL,''),
(1607,'租户新增',121,2,'#','','',1,0,'F','0','0','system:tenant:add','#',103,1,'2024-11-02 15:00:14',NULL,NULL,''),
(1608,'租户修改',121,3,'#','','',1,0,'F','0','0','system:tenant:edit','#',103,1,'2024-11-02 15:00:14',NULL,NULL,''),
(1609,'租户删除',121,4,'#','','',1,0,'F','0','0','system:tenant:remove','#',103,1,'2024-11-02 15:00:14',NULL,NULL,''),
(1610,'租户导出',121,5,'#','','',1,0,'F','0','0','system:tenant:export','#',103,1,'2024-11-02 15:00:14',NULL,NULL,''),
(1611,'租户套餐查询',122,1,'#','','',1,0,'F','0','0','system:tenantPackage:query','#',103,1,'2024-11-02 15:00:14',NULL,NULL,''),
(1612,'租户套餐新增',122,2,'#','','',1,0,'F','0','0','system:tenantPackage:add','#',103,1,'2024-11-02 15:00:14',NULL,NULL,''),
(1613,'租户套餐修改',122,3,'#','','',1,0,'F','0','0','system:tenantPackage:edit','#',103,1,'2024-11-02 15:00:14',NULL,NULL,''),
(1614,'租户套餐删除',122,4,'#','','',1,0,'F','0','0','system:tenantPackage:remove','#',103,1,'2024-11-02 15:00:14',NULL,NULL,''),
(1615,'租户套餐导出',122,5,'#','','',1,0,'F','0','0','system:tenantPackage:export','#',103,1,'2024-11-02 15:00:14',NULL,NULL,''),
(1620,'配置列表',118,5,'#','','',1,0,'F','0','0','system:ossConfig:list','#',103,1,'2024-11-02 15:00:14',NULL,NULL,''),
(1621,'配置添加',118,6,'#','','',1,0,'F','0','0','system:ossConfig:add','#',103,1,'2024-11-02 15:00:14',NULL,NULL,''),
(1622,'配置编辑',118,6,'#','','',1,0,'F','0','0','system:ossConfig:edit','#',103,1,'2024-11-02 15:00:14',NULL,NULL,''),
(1623,'配置删除',118,6,'#','','',1,0,'F','0','0','system:ossConfig:remove','#',103,1,'2024-11-02 15:00:14',NULL,NULL,''),
(11616,'工作流',0,6,'workflow','','',1,0,'M','0','0','','workflow',103,1,'2024-11-02 15:00:14',NULL,NULL,''),
(11617,'模型管理',11616,2,'model','workflow/model/index','',1,1,'C','0','0','workflow:model:list','model',103,1,'2024-11-02 15:00:14',NULL,NULL,''),
(11618,'我的任务',0,7,'task','','',1,0,'M','0','0','','my-task',103,1,'2024-11-02 15:00:14',NULL,NULL,''),
(11619,'我的待办',11618,2,'taskWaiting','workflow/task/taskWaiting','',1,1,'C','0','0','','waiting',103,1,'2024-11-02 15:00:14',NULL,NULL,''),
(11620,'流程定义',11616,3,'processDefinition','workflow/processDefinition/index','',1,1,'C','0','0','','process-definition',103,1,'2024-11-02 15:00:14',NULL,NULL,''),
(11621,'流程实例',11630,1,'processInstance','workflow/processInstance/index','',1,1,'C','0','0','','tree-table',103,1,'2024-11-02 15:00:14',NULL,NULL,''),
(11622,'流程分类',11616,1,'category','workflow/category/index','',1,0,'C','0','0','workflow:category:list','category',103,1,'2024-11-02 15:00:14',NULL,NULL,''),
(11623,'流程分类查询',11622,1,'#','','',1,0,'F','0','0','workflow:category:query','#',103,1,'2024-11-02 15:00:14',NULL,NULL,''),
(11624,'流程分类新增',11622,2,'#','','',1,0,'F','0','0','workflow:category:add','#',103,1,'2024-11-02 15:00:14',NULL,NULL,''),
(11625,'流程分类修改',11622,3,'#','','',1,0,'F','0','0','workflow:category:edit','#',103,1,'2024-11-02 15:00:14',NULL,NULL,''),
(11626,'流程分类删除',11622,4,'#','','',1,0,'F','0','0','workflow:category:remove','#',103,1,'2024-11-02 15:00:14',NULL,NULL,''),
(11627,'流程分类导出',11622,5,'#','','',1,0,'F','0','0','workflow:category:export','#',103,1,'2024-11-02 15:00:14',NULL,NULL,''),
(11628,'表单管理',11616,5,'formManage','workflow/formManage/index','',1,0,'C','0','0','workflow:formManage:list','tree-table',103,1,'2024-11-02 15:00:14',NULL,NULL,'表单管理菜单'),
(11629,'我发起的',11618,1,'myDocument','workflow/task/myDocument','',1,1,'C','0','0','','guide',103,1,'2024-11-02 15:00:14',NULL,NULL,''),
(11630,'流程监控',11616,4,'monitor','','',1,0,'M','0','0','','monitor',103,1,'2024-11-02 15:00:14',NULL,NULL,''),
(11631,'待办任务',11630,2,'allTaskWaiting','workflow/task/allTaskWaiting','',1,1,'C','0','0','','waiting',103,1,'2024-11-02 15:00:14',NULL,NULL,''),
(11632,'我的已办',11618,3,'taskFinish','workflow/task/taskFinish','',1,1,'C','0','0','','finish',103,1,'2024-11-02 15:00:14',NULL,NULL,''),
(11633,'我的抄送',11618,4,'taskCopyList','workflow/task/taskCopyList','',1,1,'C','0','0','','my-copy',103,1,'2024-11-02 15:00:14',NULL,NULL,''),
(11638,'请假申请',5,1,'leave','workflow/leave/index','',1,0,'C','0','0','workflow:leave:list','#',103,1,'2024-11-02 15:00:14',NULL,NULL,'请假申请菜单'),
(11639,'请假申请查询',11638,1,'#','','',1,0,'F','0','0','workflow:leave:query','#',103,1,'2024-11-02 15:00:14',NULL,NULL,''),
(11640,'请假申请新增',11638,2,'#','','',1,0,'F','0','0','workflow:leave:add','#',103,1,'2024-11-02 15:00:14',NULL,NULL,''),
(11641,'请假申请修改',11638,3,'#','','',1,0,'F','0','0','workflow:leave:edit','#',103,1,'2024-11-02 15:00:14',NULL,NULL,''),
(11642,'请假申请删除',11638,4,'#','','',1,0,'F','0','0','workflow:leave:remove','#',103,1,'2024-11-02 15:00:14',NULL,NULL,''),
(11643,'请假申请导出',11638,5,'#','','',1,0,'F','0','0','workflow:leave:export','#',103,1,'2024-11-02 15:00:14',NULL,NULL,''),
(11644,'表单管理查询',11628,1,'#','','',1,0,'F','0','0','workflow:formManage:query','',103,1,'2024-11-02 15:00:14',NULL,NULL,''),
(11645,'表单管理新增',11628,2,'#','','',1,0,'F','0','0','workflow:formManage:add','',103,1,'2024-11-02 15:00:14',NULL,NULL,''),
(11646,'表单管理修改',11628,3,'#','','',1,0,'F','0','0','workflow:formManage:edit','',103,1,'2024-11-02 15:00:14',NULL,NULL,''),
(11647,'表单管理删除',11628,4,'#','','',1,0,'F','0','0','workflow:formManage:remove','',103,1,'2024-11-02 15:00:14',NULL,NULL,''),
(11648,'表单管理导出',11628,5,'#','','',1,0,'F','0','0','workflow:formManage:export','tree-table',103,1,'2024-11-02 15:00:14',NULL,NULL,'');

/*Table structure for table `sys_notice` */

DROP TABLE IF EXISTS `sys_notice`;

CREATE TABLE `sys_notice` (
  `notice_id` bigint NOT NULL COMMENT '公告ID',
  `tenant_id` varchar(20) COLLATE utf8mb4_general_ci DEFAULT '000000' COMMENT '租户编号',
  `notice_title` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob COMMENT '公告内容',
  `status` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_dept` bigint DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='通知公告表';

/*Data for the table `sys_notice` */

insert  into `sys_notice`(`notice_id`,`tenant_id`,`notice_title`,`notice_type`,`notice_content`,`status`,`create_dept`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values 
(1,'000000','温馨提醒：2018-07-01 新版本发布啦','2','新版本内容','0',103,1,'2024-11-02 15:00:24',NULL,NULL,'管理员'),
(2,'000000','维护通知：2018-07-01 系统凌晨维护','1','维护内容','0',103,1,'2024-11-02 15:00:24',NULL,NULL,'管理员');

/*Table structure for table `sys_oper_log` */

DROP TABLE IF EXISTS `sys_oper_log`;

CREATE TABLE `sys_oper_log` (
  `oper_id` bigint NOT NULL COMMENT '日志主键',
  `tenant_id` varchar(20) COLLATE utf8mb4_general_ci DEFAULT '000000' COMMENT '租户编号',
  `title` varchar(50) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '模块标题',
  `business_type` int DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '请求方式',
  `operator_type` int DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '返回参数',
  `status` int DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint DEFAULT '0' COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`),
  KEY `idx_sys_oper_log_bt` (`business_type`),
  KEY `idx_sys_oper_log_s` (`status`),
  KEY `idx_sys_oper_log_ot` (`oper_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='操作日志记录';

/*Data for the table `sys_oper_log` */

/*Table structure for table `sys_oss` */

DROP TABLE IF EXISTS `sys_oss`;

CREATE TABLE `sys_oss` (
  `oss_id` bigint NOT NULL COMMENT '对象存储主键',
  `tenant_id` varchar(20) COLLATE utf8mb4_general_ci DEFAULT '000000' COMMENT '租户编号',
  `file_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '文件名',
  `original_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '原名',
  `file_suffix` varchar(10) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '文件后缀名',
  `url` varchar(500) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'URL地址',
  `create_dept` bigint DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint DEFAULT NULL COMMENT '上传人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新人',
  `service` varchar(20) COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'minio' COMMENT '服务商',
  PRIMARY KEY (`oss_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='OSS对象存储表';

/*Data for the table `sys_oss` */

/*Table structure for table `sys_oss_config` */

DROP TABLE IF EXISTS `sys_oss_config`;

CREATE TABLE `sys_oss_config` (
  `oss_config_id` bigint NOT NULL COMMENT '主键',
  `tenant_id` varchar(20) COLLATE utf8mb4_general_ci DEFAULT '000000' COMMENT '租户编号',
  `config_key` varchar(20) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '配置key',
  `access_key` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'accessKey',
  `secret_key` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '秘钥',
  `bucket_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '桶名称',
  `prefix` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '前缀',
  `endpoint` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '访问站点',
  `domain` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '自定义域名',
  `is_https` char(1) COLLATE utf8mb4_general_ci DEFAULT 'N' COMMENT '是否https（Y=是,N=否）',
  `region` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '域',
  `access_policy` char(1) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '1' COMMENT '桶权限类型(0=private 1=public 2=custom)',
  `status` char(1) COLLATE utf8mb4_general_ci DEFAULT '1' COMMENT '是否默认（0=是,1=否）',
  `ext1` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '扩展字段',
  `create_dept` bigint DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`oss_config_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='对象存储配置表';

/*Data for the table `sys_oss_config` */

insert  into `sys_oss_config`(`oss_config_id`,`tenant_id`,`config_key`,`access_key`,`secret_key`,`bucket_name`,`prefix`,`endpoint`,`domain`,`is_https`,`region`,`access_policy`,`status`,`ext1`,`create_dept`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values 
(1,'000000','minio','ruoyi','ruoyi123','ruoyi','','127.0.0.1:9000','','N','','1','0','',103,1,'2024-11-02 15:00:27',1,'2024-11-02 15:00:27',NULL),
(2,'000000','qiniu','XXXXXXXXXXXXXXX','XXXXXXXXXXXXXXX','ruoyi','','s3-cn-north-1.qiniucs.com','','N','','1','1','',103,1,'2024-11-02 15:00:27',1,'2024-11-02 15:00:27',NULL),
(3,'000000','aliyun','XXXXXXXXXXXXXXX','XXXXXXXXXXXXXXX','ruoyi','','oss-cn-beijing.aliyuncs.com','','N','','1','1','',103,1,'2024-11-02 15:00:27',1,'2024-11-02 15:00:27',NULL),
(4,'000000','qcloud','XXXXXXXXXXXXXXX','XXXXXXXXXXXXXXX','ruoyi-1250000000','','cos.ap-beijing.myqcloud.com','','N','ap-beijing','1','1','',103,1,'2024-11-02 15:00:27',1,'2024-11-02 15:00:27',NULL),
(5,'000000','image','ruoyi','ruoyi123','ruoyi','image','127.0.0.1:9000','','N','','1','1','',103,1,'2024-11-02 15:00:27',1,'2024-11-02 15:00:27',NULL);

/*Table structure for table `sys_post` */

DROP TABLE IF EXISTS `sys_post`;

CREATE TABLE `sys_post` (
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  `tenant_id` varchar(20) COLLATE utf8mb4_general_ci DEFAULT '000000' COMMENT '租户编号',
  `dept_id` bigint NOT NULL COMMENT '部门id',
  `post_code` varchar(64) COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位编码',
  `post_category` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '岗位类别编码',
  `post_name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_dept` bigint DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='岗位信息表';

/*Data for the table `sys_post` */

insert  into `sys_post`(`post_id`,`tenant_id`,`dept_id`,`post_code`,`post_category`,`post_name`,`post_sort`,`status`,`create_dept`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values 
(1,'000000',103,'ceo',NULL,'董事长',1,'0',103,1,'2024-11-02 15:00:11',NULL,NULL,''),
(2,'000000',100,'se',NULL,'项目经理',2,'0',103,1,'2024-11-02 15:00:11',NULL,NULL,''),
(3,'000000',100,'hr',NULL,'人力资源',3,'0',103,1,'2024-11-02 15:00:11',NULL,NULL,''),
(4,'000000',100,'user',NULL,'普通员工',4,'0',103,1,'2024-11-02 15:00:11',NULL,NULL,'');

/*Table structure for table `sys_role` */

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `tenant_id` varchar(20) COLLATE utf8mb4_general_ci DEFAULT '000000' COMMENT '租户编号',
  `role_name` varchar(30) COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) COLLATE utf8mb4_general_ci DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) DEFAULT '1' COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) DEFAULT '1' COMMENT '部门树选择项是否关联显示',
  `status` char(1) COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_dept` bigint DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='角色信息表';

/*Data for the table `sys_role` */

insert  into `sys_role`(`role_id`,`tenant_id`,`role_name`,`role_key`,`role_sort`,`data_scope`,`menu_check_strictly`,`dept_check_strictly`,`status`,`del_flag`,`create_dept`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values 
(1,'000000','超级管理员','superadmin',1,'1',1,1,'0','0',103,1,'2024-11-02 15:00:12',NULL,NULL,'超级管理员'),
(3,'000000','本部门及以下','test1',3,'4',1,1,'0','0',103,1,'2024-11-02 15:00:12',NULL,NULL,''),
(4,'000000','仅本人','test2',4,'5',1,1,'0','0',103,1,'2024-11-02 15:00:12',NULL,NULL,'');

/*Table structure for table `sys_role_dept` */

DROP TABLE IF EXISTS `sys_role_dept`;

CREATE TABLE `sys_role_dept` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='角色和部门关联表';

/*Data for the table `sys_role_dept` */

/*Table structure for table `sys_role_menu` */

DROP TABLE IF EXISTS `sys_role_menu`;

CREATE TABLE `sys_role_menu` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='角色和菜单关联表';

/*Data for the table `sys_role_menu` */

insert  into `sys_role_menu`(`role_id`,`menu_id`) values 
(3,1),
(3,5),
(3,100),
(3,101),
(3,102),
(3,103),
(3,104),
(3,105),
(3,106),
(3,107),
(3,108),
(3,500),
(3,501),
(3,1001),
(3,1002),
(3,1003),
(3,1004),
(3,1005),
(3,1006),
(3,1007),
(3,1008),
(3,1009),
(3,1010),
(3,1011),
(3,1012),
(3,1013),
(3,1014),
(3,1015),
(3,1016),
(3,1017),
(3,1018),
(3,1019),
(3,1020),
(3,1021),
(3,1022),
(3,1023),
(3,1024),
(3,1025),
(3,1026),
(3,1027),
(3,1028),
(3,1029),
(3,1030),
(3,1031),
(3,1032),
(3,1033),
(3,1034),
(3,1035),
(3,1036),
(3,1037),
(3,1038),
(3,1039),
(3,1040),
(3,1041),
(3,1042),
(3,1043),
(3,1044),
(3,1045),
(3,1500),
(3,1501),
(3,1502),
(3,1503),
(3,1504),
(3,1505),
(3,1506),
(3,1507),
(3,1508),
(3,1509),
(3,1510),
(3,1511),
(4,5),
(4,1500),
(4,1501),
(4,1502),
(4,1503),
(4,1504),
(4,1505),
(4,1506),
(4,1507),
(4,1508),
(4,1509),
(4,1510),
(4,1511);

/*Table structure for table `sys_social` */

DROP TABLE IF EXISTS `sys_social`;

CREATE TABLE `sys_social` (
  `id` bigint NOT NULL COMMENT '主键',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `tenant_id` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '租户id',
  `auth_id` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT '平台+平台唯一id',
  `source` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户来源',
  `open_id` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '平台编号唯一id',
  `user_name` varchar(30) COLLATE utf8mb4_general_ci NOT NULL COMMENT '登录账号',
  `nick_name` varchar(30) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '用户昵称',
  `email` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '用户邮箱',
  `avatar` varchar(500) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '头像地址',
  `access_token` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户的授权令牌',
  `expire_in` int DEFAULT NULL COMMENT '用户的授权令牌的有效期，部分平台可能没有',
  `refresh_token` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '刷新令牌，部分平台可能没有',
  `access_code` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '平台的授权信息，部分平台可能没有',
  `union_id` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户的 unionid',
  `scope` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '授予的权限，部分平台可能没有',
  `token_type` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '个别平台的授权信息，部分平台可能没有',
  `id_token` varchar(2000) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'id token，部分平台可能没有',
  `mac_algorithm` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '小米平台用户的附带属性，部分平台可能没有',
  `mac_key` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '小米平台用户的附带属性，部分平台可能没有',
  `code` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户的授权code，部分平台可能没有',
  `oauth_token` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Twitter平台用户的附带属性，部分平台可能没有',
  `oauth_token_secret` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Twitter平台用户的附带属性，部分平台可能没有',
  `create_dept` bigint DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `del_flag` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='社会化关系表';

/*Data for the table `sys_social` */

/*Table structure for table `sys_tenant` */

DROP TABLE IF EXISTS `sys_tenant`;

CREATE TABLE `sys_tenant` (
  `id` bigint NOT NULL COMMENT 'id',
  `tenant_id` varchar(20) COLLATE utf8mb4_general_ci NOT NULL COMMENT '租户编号',
  `contact_user_name` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '联系人',
  `contact_phone` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '联系电话',
  `company_name` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '企业名称',
  `license_number` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '统一社会信用代码',
  `address` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '地址',
  `intro` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '企业简介',
  `domain` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '域名',
  `remark` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `package_id` bigint DEFAULT NULL COMMENT '租户套餐编号',
  `expire_time` datetime DEFAULT NULL COMMENT '过期时间',
  `account_count` int DEFAULT '-1' COMMENT '用户数量（-1不限制）',
  `status` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '租户状态（0正常 1停用）',
  `del_flag` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_dept` bigint DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='租户表';

/*Data for the table `sys_tenant` */

insert  into `sys_tenant`(`id`,`tenant_id`,`contact_user_name`,`contact_phone`,`company_name`,`license_number`,`address`,`intro`,`domain`,`remark`,`package_id`,`expire_time`,`account_count`,`status`,`del_flag`,`create_dept`,`create_by`,`create_time`,`update_by`,`update_time`) values 
(1,'000000','管理组','15888888888','XXX有限公司',NULL,NULL,'多租户通用后台管理管理系统',NULL,NULL,NULL,NULL,-1,'0','0',103,1,'2024-11-02 15:00:07',NULL,NULL);

/*Table structure for table `sys_tenant_package` */

DROP TABLE IF EXISTS `sys_tenant_package`;

CREATE TABLE `sys_tenant_package` (
  `package_id` bigint NOT NULL COMMENT '租户套餐id',
  `package_name` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '套餐名称',
  `menu_ids` varchar(3000) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '关联菜单id',
  `remark` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `menu_check_strictly` tinyint(1) DEFAULT '1' COMMENT '菜单树选择项是否关联显示',
  `status` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `del_flag` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_dept` bigint DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`package_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='租户套餐表';

/*Data for the table `sys_tenant_package` */

/*Table structure for table `sys_user` */

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `tenant_id` varchar(20) COLLATE utf8mb4_general_ci DEFAULT '000000' COMMENT '租户编号',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(10) COLLATE utf8mb4_general_ci DEFAULT 'sys_user' COMMENT '用户类型（sys_user系统用户）',
  `email` varchar(50) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '手机号码',
  `sex` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` bigint DEFAULT NULL COMMENT '头像地址',
  `password` varchar(100) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '密码',
  `status` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `create_dept` bigint DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='用户信息表';

/*Data for the table `sys_user` */

insert  into `sys_user`(`user_id`,`tenant_id`,`dept_id`,`user_name`,`nick_name`,`user_type`,`email`,`phonenumber`,`sex`,`avatar`,`password`,`status`,`del_flag`,`login_ip`,`login_date`,`create_dept`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values 
(1,'000000',103,'admin','疯狂的狮子Li','sys_user','crazyLionLi@163.com','15888888888','1',NULL,'$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','0:0:0:0:0:0:0:1','2024-11-02 21:12:52',103,1,'2024-11-02 15:00:10',1,'2024-11-02 21:12:52','管理员'),
(3,'000000',108,'test','本部门及以下 密码666666','sys_user','','','0',NULL,'$2a$10$b8yUzN0C71sbz.PhNOCgJe.Tu1yWC3RNrTyjSQ8p1W0.aaUXUJ.Ne','0','0','127.0.0.1','2024-11-02 15:00:10',103,1,'2024-11-02 15:00:10',NULL,NULL,''),
(4,'000000',102,'test1','仅本人 密码666666','sys_user','','','0',NULL,'$2a$10$b8yUzN0C71sbz.PhNOCgJe.Tu1yWC3RNrTyjSQ8p1W0.aaUXUJ.Ne','0','0','127.0.0.1','2024-11-02 15:00:10',103,1,'2024-11-02 15:00:10',NULL,NULL,'');

/*Table structure for table `sys_user_post` */

DROP TABLE IF EXISTS `sys_user_post`;

CREATE TABLE `sys_user_post` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='用户与岗位关联表';

/*Data for the table `sys_user_post` */

insert  into `sys_user_post`(`user_id`,`post_id`) values 
(1,1);

/*Table structure for table `sys_user_role` */

DROP TABLE IF EXISTS `sys_user_role`;

CREATE TABLE `sys_user_role` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='用户和角色关联表';

/*Data for the table `sys_user_role` */

insert  into `sys_user_role`(`user_id`,`role_id`) values 
(1,1),
(3,3),
(4,4);

/*Table structure for table `test_demo` */

DROP TABLE IF EXISTS `test_demo`;

CREATE TABLE `test_demo` (
  `id` bigint NOT NULL COMMENT '主键',
  `tenant_id` varchar(20) COLLATE utf8mb4_general_ci DEFAULT '000000' COMMENT '租户编号',
  `dept_id` bigint DEFAULT NULL COMMENT '部门id',
  `user_id` bigint DEFAULT NULL COMMENT '用户id',
  `order_num` int DEFAULT '0' COMMENT '排序号',
  `test_key` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'key键',
  `value` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '值',
  `version` int DEFAULT '0' COMMENT '版本',
  `create_dept` bigint DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新人',
  `del_flag` int DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='测试单表';

/*Data for the table `test_demo` */

insert  into `test_demo`(`id`,`tenant_id`,`dept_id`,`user_id`,`order_num`,`test_key`,`value`,`version`,`create_dept`,`create_time`,`create_by`,`update_time`,`update_by`,`del_flag`) values 
(1,'000000',102,4,1,'测试数据权限','测试',0,103,'2024-11-02 15:00:30',1,NULL,NULL,0),
(2,'000000',102,3,2,'子节点1','111',0,103,'2024-11-02 15:00:30',1,NULL,NULL,0),
(3,'000000',102,3,3,'子节点2','222',0,103,'2024-11-02 15:00:30',1,NULL,NULL,0),
(4,'000000',108,4,4,'测试数据','demo',0,103,'2024-11-02 15:00:30',1,NULL,NULL,0),
(5,'000000',108,3,13,'子节点11','1111',0,103,'2024-11-02 15:00:30',1,NULL,NULL,0),
(6,'000000',108,3,12,'子节点22','2222',0,103,'2024-11-02 15:00:30',1,NULL,NULL,0),
(7,'000000',108,3,11,'子节点33','3333',0,103,'2024-11-02 15:00:30',1,NULL,NULL,0),
(8,'000000',108,3,10,'子节点44','4444',0,103,'2024-11-02 15:00:30',1,NULL,NULL,0),
(9,'000000',108,3,9,'子节点55','5555',0,103,'2024-11-02 15:00:30',1,NULL,NULL,0),
(10,'000000',108,3,8,'子节点66','6666',0,103,'2024-11-02 15:00:30',1,NULL,NULL,0),
(11,'000000',108,3,7,'子节点77','7777',0,103,'2024-11-02 15:00:30',1,NULL,NULL,0),
(12,'000000',108,3,6,'子节点88','8888',0,103,'2024-11-02 15:00:30',1,NULL,NULL,0),
(13,'000000',108,3,5,'子节点99','9999',0,103,'2024-11-02 15:00:30',1,NULL,NULL,0);

/*Table structure for table `test_tree` */

DROP TABLE IF EXISTS `test_tree`;

CREATE TABLE `test_tree` (
  `id` bigint NOT NULL COMMENT '主键',
  `tenant_id` varchar(20) COLLATE utf8mb4_general_ci DEFAULT '000000' COMMENT '租户编号',
  `parent_id` bigint DEFAULT '0' COMMENT '父id',
  `dept_id` bigint DEFAULT NULL COMMENT '部门id',
  `user_id` bigint DEFAULT NULL COMMENT '用户id',
  `tree_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '值',
  `version` int DEFAULT '0' COMMENT '版本',
  `create_dept` bigint DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新人',
  `del_flag` int DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='测试树表';

/*Data for the table `test_tree` */

insert  into `test_tree`(`id`,`tenant_id`,`parent_id`,`dept_id`,`user_id`,`tree_name`,`version`,`create_dept`,`create_time`,`create_by`,`update_time`,`update_by`,`del_flag`) values 
(1,'000000',0,102,4,'测试数据权限',0,103,'2024-11-02 15:00:30',1,NULL,NULL,0),
(2,'000000',1,102,3,'子节点1',0,103,'2024-11-02 15:00:30',1,NULL,NULL,0),
(3,'000000',2,102,3,'子节点2',0,103,'2024-11-02 15:00:30',1,NULL,NULL,0),
(4,'000000',0,108,4,'测试树1',0,103,'2024-11-02 15:00:30',1,NULL,NULL,0),
(5,'000000',4,108,3,'子节点11',0,103,'2024-11-02 15:00:30',1,NULL,NULL,0),
(6,'000000',4,108,3,'子节点22',0,103,'2024-11-02 15:00:30',1,NULL,NULL,0),
(7,'000000',4,108,3,'子节点33',0,103,'2024-11-02 15:00:30',1,NULL,NULL,0),
(8,'000000',5,108,3,'子节点44',0,103,'2024-11-02 15:00:30',1,NULL,NULL,0),
(9,'000000',6,108,3,'子节点55',0,103,'2024-11-02 15:00:30',1,NULL,NULL,0),
(10,'000000',7,108,3,'子节点66',0,103,'2024-11-02 15:00:30',1,NULL,NULL,0),
(11,'000000',7,108,3,'子节点77',0,103,'2024-11-02 15:00:30',1,NULL,NULL,0),
(12,'000000',10,108,3,'子节点88',0,103,'2024-11-02 15:00:30',1,NULL,NULL,0),
(13,'000000',10,108,3,'子节点99',0,103,'2024-11-02 15:00:30',1,NULL,NULL,0);

/*Table structure for table `undo_log` */

DROP TABLE IF EXISTS `undo_log`;

CREATE TABLE `undo_log` (
  `branch_id` bigint NOT NULL COMMENT 'branch transaction id',
  `xid` varchar(100) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'global transaction id',
  `context` varchar(128) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'undo_log context,such as serialization',
  `rollback_info` longblob NOT NULL COMMENT 'rollback info',
  `log_status` int NOT NULL COMMENT '0:normal status,1:defense status',
  `log_created` datetime(6) NOT NULL COMMENT 'create datetime',
  `log_modified` datetime(6) NOT NULL COMMENT 'modify datetime',
  UNIQUE KEY `ux_undo_log` (`xid`,`branch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='AT transaction mode undo table';

/*Data for the table `undo_log` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
