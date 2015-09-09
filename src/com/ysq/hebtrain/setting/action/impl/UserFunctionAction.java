package com.ysq.hebtrain.setting.action.impl;

import javax.annotation.Resource;
import org.apache.log4j.Logger;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import com.ysq.hebtrain.basic.impl.BasicActionSupportImpl;
import com.ysq.hebtrain.common.service.IUserLoginService;
import com.ysq.hebtrain.common.util.CommonUtil;
import com.ysq.hebtrain.setting.action.IUserFunctionAction;

/**
 * 登陆action
 * @author Administrator
 *
 */
@Controller("userFunctionAction")
@Scope("prototype")
public class UserFunctionAction extends BasicActionSupportImpl implements IUserFunctionAction{
	Logger logger = CommonUtil.getLogger(this.getClass());
	private static final long serialVersionUID = 1L;

	
	@Resource(name = "userFunctionService")
	protected IUserLoginService userFunctionService;
	
	
	
}
