package orion_pax.service;

import orion_pax.entity.Account;

public interface AccountService extends BaseService<Account> {
	
	/**
	 * 根据登录名和密码查询Account
	 * 
	 * @param account
	 *            封装登录名和密码的Account对象
	 * @return 查询到的Account
	 */
	public Account login(Account account);
}
