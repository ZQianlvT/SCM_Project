package orion_pax.service;

import java.util.Map;

import orion_pax.entity.SysParam;

public interface SysParamService extends BaseService<SysParam> {
	// 加载系统参数
	public Map<String, Object> sysParamLoad();
}
