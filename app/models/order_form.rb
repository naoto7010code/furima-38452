class OrderForm
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :area_id, :city, :address, :building, :phone_number, :token

  with_options presence: true do
    # orderモデルのバリデーション
    validates :user_id
    validates :item_id
    # paymentモデルのバリデーション
    validates :post_code,    format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :area_id,      numericality: { other_than: 0, message: "can't be blank" }
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A[0-9]{10,11}\z/, message: 'is invalid' }
    # トークンのバリデーション
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Payment.create(order_id: order.id, post_code: post_code, area_id: area_id, city: city, address: address, building: building, phone_number: phone_number)
  end
end