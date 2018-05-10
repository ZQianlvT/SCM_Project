package orion_pax.service.impl;

import org.springframework.stereotype.Service;

import orion_pax.entity.Account;
import orion_pax.service.AccountService;

@Service("accountService")
public class AccountServiceImpl extends BaseServiceImpl<Account> implements
		AccountService {
	@Override
	public Account login(Account account) {
		// TODO Auto-generated method stub
		return accountMapper.login(account);
	}
}
