package orion_pax.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import orion_pax.entity.Account;
import orion_pax.service.AccountService;

@Controller
@RequestMapping("/account")
public class AccountController extends BaseController {
	@Resource
	private AccountService accountService;

	@RequestMapping("/login")
	public String insert(HttpServletRequest request, HttpSession session,
			Account account) {
		try {
			Account currAccount = accountService.login(account);
			if (currAccount != null) { // 登录成功将当前用户存储到Session域中
				session.setAttribute("currAccount", currAccount);
			} else { // 登录失败回显并显示错误信息
				request.setAttribute("account", account);
				request.setAttribute("errMsg", "用户名或密码有误！");
				return "forward:/jsp/login.jsp";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "forward:/WEB-INF/jsp/main.jsp";
	}

}
