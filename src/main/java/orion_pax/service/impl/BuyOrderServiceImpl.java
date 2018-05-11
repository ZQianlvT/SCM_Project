package orion_pax.service.impl;

import java.util.UUID;

import org.springframework.stereotype.Service;

import orion_pax.entity.AccountRecords;
import orion_pax.entity.BuyOrder;
import orion_pax.entity.BuyOrderDetail;
import orion_pax.service.BuyOrderService;

@Service("buyOrderService")
public class BuyOrderServiceImpl extends BaseServiceImpl<BuyOrder> implements
		BuyOrderService {

	@Override
	public int insertBuyOrder(BuyOrder buyOrder) {
		System.out.println("-----------------service:" + buyOrder);
		int i = 0;
		// 1.采购入库信息表 2.入库明细表3.账务表 4.库存表
		// 生成主键，一般业务都会有类型定义 例如：bo表示进货 业务， ct表示退货业务
		String boId = "bo" + UUID.randomUUID().toString().replace("-", "");
		buyOrder.setBoId(boId);

		i = buyOrderMapper.insert(buyOrder);

		for (BuyOrderDetail buyOrderDetail : buyOrder.getBuyOrderDetailList()) {
			buyOrderDetail.setBodId(UUID.randomUUID().toString()
					.replace("-", ""));
			buyOrderDetail.setBoId(boId);
		}

		buyOrderDetailMapper.insertList(buyOrder.getBuyOrderDetailList());

		AccountRecords accountRecords = new AccountRecords();
		// 生成并设置怅务记录的主键
		accountRecords.setArId(String.valueOf("ar"
				+ UUID.randomUUID().toString().replace("-", "")));
		accountRecords.setArAttn(buyOrder.getBoAttn());
		accountRecords.setArArrears(buyOrder.getBoArrears());
		// bo表示商品采购，可以在参数表中加入相关内容
		accountRecords.setArBusType("bo");
		accountRecords.setArDate(buyOrder.getBoDate());
		// 优惠金额：用应付金额减去实付金额再减去欠款
		accountRecords.setArDiscount(buyOrder.getBoPayable()
				.subtract(buyOrder.getBoPaid())
				.subtract(buyOrder.getBoArrears()));
		accountRecords.setArOperator(buyOrder.getBoOperator());
		// 采购单号
		accountRecords.setArOrderId(buyOrder.getBoId());
		accountRecords.setArPaid(buyOrder.getBoPaid());
		accountRecords.setArPayable(buyOrder.getBoPayable());
		accountRecords.setArRemark(buyOrder.getBoRemark());
		accountRecords.setSupId(buyOrder.getSupId());
		accountRecordsMapper.insert(accountRecords);
		// 库存表
		return i;
	}

}
