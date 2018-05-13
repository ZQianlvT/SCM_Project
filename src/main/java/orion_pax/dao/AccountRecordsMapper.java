package orion_pax.dao;

import java.util.List;
import java.util.Map;

import orion_pax.entity.AccountRecords;

public interface AccountRecordsMapper extends BaseMapper<AccountRecords> {
	List<Map<String, Object>> selectSupplier(Map<String, String> paramMap);
}