
create database hebHelp;
use hebHelp;

/** 客户表 **/
DROP TABLE IF EXISTS `heb_customer`;
CREATE TABLE `heb_customer` (
  `cusId` int(11) NOT NULL AUTO_INCREMENT,
  `cusName` varchar(64) NOT NULL,
  `act` varchar(64) NOT NULL,
  `status` tinyint(4) DEFAULT '1',
  sort int(11) DEFAULT 10,
  PRIMARY KEY (`cusId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/** 用户表 **/
DROP TABLE IF EXISTS `heb_user`;
CREATE TABLE `heb_user` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(512) DEFAULT NULL,
  `password` varchar(512) DEFAULT NULL,
  `cusId` int(11) DEFAULT NULL,
  `status` tinyint,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



insert into heb_customer (cusId, cusName, act, status, sort) values (1, '管理员', 'admin', 1, 1);
insert into heb_customer (cusId, cusName, act, status, sort) values (2, '会员', 'member', 1, 2);

insert into heb_user (userId, userName, password, cusId, status) values (1, 'admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', 1, 1);

-- ===================

/** action 拦截配置 **/
DROP TABLE IF EXISTS `heb_function_action`;
CREATE TABLE `heb_function_action` (
  `actionId` int(11) AUTO_INCREMENT primary key,
  `actionValue` varchar(512) DEFAULT NULL,
  `remarks` varchar(512) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert into heb_function_action (actionId, actionValue, remarks) values (1, 'fun', '拦截');
insert into heb_function_action (actionId, actionValue, remarks) values (2, 'opfun', '不拦截');

DROP TABLE IF EXISTS `heb_function_info`;
CREATE TABLE `heb_function_info` (
  `functionId` int(11) auto_increment primary key,
  `actionId` varchar(512) DEFAULT NULL,
  `k` varchar(16) not null UNIQUE,
  `functionName` varchar(512) DEFAULT NULL,
  `functionUrl` varchar(512) DEFAULT NULL,
  `index` int(11) DEFAULT 10
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/** 用户功能表 */
drop table if exists `heb_user_function`;
create table `heb_user_function` (
  `userId` int(11) not null ,
  `functionId` int(11) not null,
  primary key (`userId`, `functionId`)
) engine=innodb default charset=utf8;

INSERT INTO `heb_function_info` VALUES ('1', '1', 'funcfg', '功能配置', 'page/setting/function/functionConfig.jsp', '9');
INSERT INTO `heb_function_info` VALUES ('2', '1', 'usercfg', '用户管理', 'page/setting/function/userConfig.jsp', '10');
INSERT INTO `heb_function_info` VALUES ('3', '2', 'btnicon', '按钮图标列表', 'page/common/util/btnIconTool.jsp', '40');
INSERT INTO `heb_function_info` VALUES ('4', '1', 'trhe', '教师远程培训辅助', 'page/webview/help/teacherHelp.jsp', '10');
INSERT INTO `heb_function_info` VALUES ('5', '2', 'editpsd', '修改密码', 'page/common/basic/updatePassword.jsp', '10');
INSERT INTO `heb_function_info` VALUES ('6', '1', 'test', '功能菜单测试', 'page/test/success.jsp', '10');

insert into heb_user_function (userId, functionId) values (1, 1);
insert into heb_user_function (userId, functionId) values (1, 1);

-- 测试
insert into heb_function_info (functionId, actionId, k, functionName, functionUrl, `index`) values (2, 1, 'test', '功能菜单测试', 'page/test/success.jsp', 10);
insert into heb_user (userId, userName, password, cusId, status) values (2, 'user', 'd033e22ae348aeb5660fc2140aec35850c4da997', 2, 1);







