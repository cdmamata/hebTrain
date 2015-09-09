package com.ysq.hebtrain.common.interceptor;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import com.ysq.hebtrain.common.config.ConfigInfo;
import com.ysq.hebtrain.common.entity.LoginUser;
import com.ysq.hebtrain.common.util.CommonUtil;

/**
 * 拦截器
 * @author Administrator
 *
 */
public class LoginInterceptor extends AbstractInterceptor {
	private static final long serialVersionUID = 1L;

	private static final String LOGIN = "login";
	
	@Override
	public String intercept(ActionInvocation invocation) throws Exception {

		// 取得请求相关的ActionContext实例
		ActionContext ctx = invocation.getInvocationContext();
		LoginUser user = (LoginUser) CommonUtil.getSessionAttribute(ConfigInfo.SESSION_USER);

		//如果没有登陆
		if (user != null) {
			return invocation.invoke();
		}else{
			System.out.println("没有权限...");
			ctx.put("tip", "你还没有登录");
			return LOGIN;
		}
	}

}
