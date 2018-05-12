package orion_pax.controller;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import orion_pax.service.SysParamService;

@Controller
@RequestMapping("/sysParam")
public class SysParamController extends BaseController {
	@Resource
	private SysParamService sysParamService;

	@PostConstruct
	private void sysParamInit() {
		application.setAttribute("sysParam", sysParamService.sysParamLoad());
		System.out
				.println("=================系统参数初始化完成2223333222====================");
	}
}
