package orion_pax.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import orion_pax.entity.Goods;
import orion_pax.entity.Page;
import orion_pax.service.GoodsService;

@Controller
@RequestMapping("/goods")
public class GoodsController extends BaseController {
	@Resource
	private GoodsService goodsService;

	@RequestMapping("/selectPage")
	@ResponseBody
	// 如果返回json格式，需要这个注解，这里用来测试环境
	public Object selectPage(Page<Goods> page) {
		return goodsService.getPage(page).getPageMap();
	}
}
