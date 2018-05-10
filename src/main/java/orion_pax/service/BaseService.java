package orion_pax.service;

import java.util.List;

import orion_pax.entity.Page;

public interface BaseService<T> {
	// 添加一条记录
	public int insert(T entity);

	// 根据主键修改记录
	public int updateByPK(T entity);

	// 根据主键删除一条记录
	public int deleteByPk(T entity);

	// 根据主键数组删除多条条记录
	public int deleteArr(String[] ids);

	// 查询多条记录
	public List<T> select(T entity);

	// 带条件分页查询
	public Page<T> getPage(Page<T> page);

}
