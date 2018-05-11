package orion_pax.service;

import orion_pax.entity.BuyOrder;

public interface BuyOrderService extends BaseService<BuyOrder> {
	public int insertBuyOrder(BuyOrder buyOrder);
}
