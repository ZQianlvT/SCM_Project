package orion_pax.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import orion_pax.entity.Page;
import orion_pax.entity.Supplier;
import orion_pax.service.SupplierService;

@Controller
@RequestMapping("/supplier")
public class SupplierController extends BaseController {
	@Resource
	private SupplierService supplierService;
	
	@RequestMapping("/selectPage")
	@ResponseBody //如果返回json格式，需要这个注解，这里用来测试环境
	public Object selectPage(Page<Supplier> page){
		return supplierService.getPage(page).getPageMap();
	}
	
	@RequestMapping("/deleteArr")
	@ResponseBody //如果返回json格式，需要这个注解，这里用来测试环境
	public Object deleteArr(String[] ids){
		return supplierService.deleteArr(ids);
	}
	
	@RequestMapping("/addSupplier")
	@ResponseBody //如果返回json格式，需要这个注解，这里用来测试环境
	public Object addSupplier(Supplier supplier){
		return supplierService.insert(supplier);
	}
	
	@RequestMapping("/updateSupplier")
	@ResponseBody //如果返回json格式，需要这个注解，这里用来测试环境
	public Object updateSupplier(Supplier supplier){
		return supplierService.updateByPK(supplier);
	}
}
