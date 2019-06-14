class UserMailer < ApplicationMailer
  default from: "no-reply@jungle.com"

  def confirmation_email(order)
    @order = order
    @order_items = order.line_items
    mail(to: @order.email, subject: "Order #" + @order.id.to_s + " - thank you for shopping at Jungle!")
  end

end
