package com.ysq.hebtrain.setting.service.impl;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import com.ysq.hebtrain.basic.impl.BasicServiceSupportImpl;
import com.ysq.hebtrain.common.util.CommonUtil;
import com.ysq.hebtrain.setting.service.IUserFunctionService;

@Service("userFunctionService")
public class UserFunctionServiceImpl extends BasicServiceSupportImpl implements IUserFunctionService {
	Logger logger = CommonUtil.getLogger(this.getClass());
	
}
