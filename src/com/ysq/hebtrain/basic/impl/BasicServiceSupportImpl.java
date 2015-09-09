package com.ysq.hebtrain.basic.impl;

import javax.annotation.Resource;
import org.apache.log4j.Logger;

import com.ysq.hebtrain.basic.IBasicDaoSupport;
import com.ysq.hebtrain.basic.IBasicServiceSupport;
import com.ysq.hebtrain.common.util.CommonUtil;

public class BasicServiceSupportImpl implements IBasicServiceSupport {
	protected Logger logger = CommonUtil.getLogger(this.getClass());
	
	@Resource(name = "basicDaoSupport")
	protected IBasicDaoSupport basicDao;
	
}
