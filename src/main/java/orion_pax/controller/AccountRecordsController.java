package orion_pax.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import orion_pax.entity.Account;
import orion_pax.service.AccountRecordsService;
import orion_pax.service.AccountService;

@Controller
@RequestMapping("/accountRecords")
public class AccountRecordsController extends BaseController {
	@Resource
	private AccountRecordsService accountRecordsService;

	// 用户登陆
	@RequestMapping(value = "/statisticsSupplier")
	@ResponseBody
	public Object selectSupplier(String start, String end) {
		Map<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("start", start);
		paramMap.put("end", end);
		return accountRecordsService.selectSupplier(paramMap);

	}

}
