package orion_pax.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import orion_pax.entity.AccountRecords;
import orion_pax.service.AccountRecordsService;

@Service("accountRecordsService")
public class AccountRecordsServiceImpl extends BaseServiceImpl<AccountRecords>
		implements AccountRecordsService {

	@Override
	public List<Map<String, Object>> selectSupplier(Map<String, String> paramMap) {
		// TODO Auto-generated method stub
		return accountRecordsMapper.selectSupplier(paramMap);
	}

}
