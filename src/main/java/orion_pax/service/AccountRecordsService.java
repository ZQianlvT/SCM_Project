package orion_pax.service;

import java.util.List;
import java.util.Map;

import orion_pax.entity.AccountRecords;

public interface AccountRecordsService extends BaseService<AccountRecords> {
	List<Map<String, Object>> selectSupplier(Map<String, String> paramMap);
}
