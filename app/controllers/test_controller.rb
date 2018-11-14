class TestController < ApplicationController
  def index
    order = Order.accepted.last
    hash_source = {
      order_id: order.id,
      store_name: order.store.name,
      store_address: order.store.address,
      store_image: "img.jpg",
      ship_cost: order.ship_cost,
      distance: 2
    }
    PushNotificationService.new(hash_source, User.find(6)).deliver
  end

  def shippers
    json_response parse_json(Shipper.all)
  end
end
