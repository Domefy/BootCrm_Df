package com.itheima.core.dao;

import java.util.List;

import com.itheima.core.po.BaseDict;

/**
 * �����ֵ�
 */
public interface BaseDictDao {
	// �����������ѯ�����ֵ�
	public List<BaseDict> selectBaseDictByTypeCode(String typecode);
}
