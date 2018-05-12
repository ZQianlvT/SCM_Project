package orion_pax.controller;

import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import orion_pax.entity.BuyOrder;
import orion_pax.entity.BuyOrderDetail;
import orion_pax.service.BuyOrderService;

@Controller
@RequestMapping("/buyOrder")
public class BuyOrderController extends BaseController {
	@InitBinder
	protected void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) throws Exception {
	    binder.registerCustomEditor(
	            Date.class,
	            new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"),true));
	}
	
	@Resource
	private BuyOrderService buyOrderService;

	@RequestMapping("/insert")
	@ResponseBody
	public Object insert(BuyOrder buyOrder, String rows) {
		ObjectMapper objectMapper = new ObjectMapper();
		try {
			BuyOrderDetail[] buyOrderDetails = objectMapper.readValue(rows,
					BuyOrderDetail[].class);
			buyOrder.setBuyOrderDetailList(Arrays.asList(buyOrderDetails));
			return buyOrderService.insertBuyOrder(buyOrder);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

}
