class Chatwork

  class << self
    def send_message orders
      room_id = Settings.room_id
      message_head = "#{I18n.t "orders.order_details.list"}: \n" +
      "#{I18n.t "username"}:  #{orders.user.name} \n" +
      "#{I18n.t "address"}:  #{orders.address} \n"
      orders.order_details.each do |item|
        message_body= "#{I18n.t "orders.order_details.category"}:  #{item.product.category.name} \n" +
        "#{I18n.t "orders.order_details.name"}:  #{item.product.name} \n" +
        "#{I18n.t "orders.order_details.quantity"}: #{item.quantity} \n" +
        "#{I18n.t "orders.order_details.price"}: #{item.total_price}#{I18n.t "currency"} \n"
        ChatWork::Message.create room_id: room_id, head: message_head, body: message_body
      end
    end
  end
end
