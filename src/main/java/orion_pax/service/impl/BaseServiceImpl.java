package orion_pax.service.impl;

import java.lang.reflect.Field;
import java.lang.reflect.ParameterizedType;
import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;

import orion_pax.dao.AccountMapper;
import orion_pax.dao.AccountRecordsMapper;
import orion_pax.dao.BaseMapper;
import orion_pax.dao.BuyOrderDetailMapper;
import orion_pax.dao.BuyOrderMapper;
import orion_pax.dao.GoodsMapper;
import orion_pax.dao.SupplierMapper;
import orion_pax.dao.SysParamMapper;
import orion_pax.entity.Page;
import orion_pax.service.BaseService;

public class BaseServiceImpl<T> implements BaseService<T> {

	protected BaseMapper<T> baseMapper;

	@Autowired
	protected SupplierMapper supplierMapper;

	@Autowired
	protected AccountMapper accountMapper;
	
	@Autowired
	protected GoodsMapper goodsMapper;
	
	@Autowired
	protected BuyOrderMapper buyOrderMapper;
	
	@Autowired
	protected BuyOrderDetailMapper buyOrderDetailMapper;
	
	@Autowired
	protected AccountRecordsMapper accountRecordsMapper;
	
	@Autowired
	protected SysParamMapper sysParamMapper;

	@PostConstruct
	// 在构造方法后，初化前执行
	protected void initBaseMapper() throws Exception {
		// 完成以下逻辑，需要对研发本身进行命名与使用规范
		// this关键字指对象本身，这里指的是调用此方法的实现类（子类）
		ParameterizedType type = (ParameterizedType) this.getClass()
				.getGenericSuperclass();
		// getActualTypeArguments获得泛型参数的实际类型数组,[0]获取第一个参数的class
		Class<?> clazz = (Class<?>) type.getActualTypeArguments()[0];
		// 转化为属性名（相关的Mapper子类的引用名）Supplier supplierMapper
		String localField = clazz.getSimpleName().substring(0, 1).toLowerCase()
				+ clazz.getSimpleName().substring(1) + "Mapper";
		// getDeclaredField:可以使用于包括私有、默认、受保护、公共字段，但不包括继承的字段
		Field field = this.getClass().getSuperclass()
				.getDeclaredField(localField);
		Field baseField = this.getClass().getSuperclass()
				.getDeclaredField("baseMapper");
		// field.get(this)获取当前this的field字段的值。例如：Supplier对象中，baseMapper所指向的对象为其子类型SupplierMapper对象，子类型对象已被spring实例化于容器中
		baseField.set(this, field.get(this));
	}

	@Override
	public int insert(T entity) {
		// TODO Auto-generated method stub
		return baseMapper.insert(entity);
	}

	@Override
	public int updateByPK(T entity) {
		// TODO Auto-generated method stub
		return baseMapper.updateByPK(entity);
	}

	@Override
	public int deleteByPk(T entity) {
		// TODO Auto-generated method stub
		return baseMapper.deleteByPk(entity);
	}

	@Override
	public int deleteArr(String[] ids) {
		// TODO Auto-generated method stub
		return baseMapper.deleteArr(ids);
	}

	@Override
	public List<T> select(T entity) {
		// TODO Auto-generated method stub
		return baseMapper.select(entity);
	}

	@Override
	public Page<T> getPage(Page<T> page) {
		// TODO Auto-generated method stub
		page.setList(baseMapper.getPage(page));
		page.setTotalRecords(baseMapper.getPageCounts(page));
		return page;
	}

}
