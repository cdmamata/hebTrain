package com.ysq.hebtrain.basic.impl;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ysq.hebtrain.basic.IBasicDaoSupport;

/**
 * 主要的 dao 类
 * @author Administrator
 *
 */
@Repository("basicDaoSupport")
public class BasicDaoSupportImpl extends SqlSessionDaoSupport implements IBasicDaoSupport {

	/**
	 * mybatis-spring-1.2.x.jar 版本的 sqlSessionTemplate 注入有所改动，必须重写次方法
	 */
	@Autowired
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		super.setSqlSessionTemplate(sqlSessionTemplate);
	}
	protected <S> S getMapper(Class<S> clazz) {
		return getSqlSession().getMapper(clazz);
	}
	
	@Override
	public Object delete(String sql, Object obj) throws Exception {
		SqlSession session = null;
		Object object = null;
		try {
			session = this.getSqlSession();
			object = session.delete(sql, obj);
		} catch (Exception e) {
			throw e;
		}
		return object;
	}

	@Override
	public Object deleteBatch(String sql, Object[] obj) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Object deleteBatch(String sql, List<Object> list) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Object findForList(String sql, Object obj) throws Exception {
		SqlSession session = null;
		Object object = null;
		try {
			session = this.getSqlSession();
			object = session.selectList(sql, obj);
		} catch (Exception e) {
			throw e;
		}
		return object;
	}

	@Override
	public Object findForMap(String sql, Object obj, String key, String value)
			throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Object findForObject(String sql, Object obj) throws Exception {
		// TODO Auto-generated method stub
		SqlSession session = null;
		Object object = null;
		try {
			session = this.getSqlSession();
			object = session.selectOne(sql, obj);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			throw e;
		}
		return object;
	}

	@Override
	public long getcount(String sql, Object obj) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Object save(String sql, Object paramObj) throws Exception {
		SqlSession session = null;
		Object object = null;
		try {
			session = this.getSqlSession();
			object = session.insert(sql, paramObj);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return object;
	}

	@Override
	public Object saveBatch(String sql, List<Object> list) throws Exception {
		// TODO Auto-generated method stub
		
		return null;
	}

	@Override
	public Object update(String sql, Object obj) throws Exception {
		// TODO Auto-generated method stub
		SqlSession session = null;
		Object object = null;
		try {
			session = this.getSqlSession();
			object = session.update(sql, obj);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return object;
	}

	@Override
	public Object updateBatch(String sql, List<Object> list) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Object updateBatch(String sql, Object[] obj) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
}
