class UserOrder
  include ActiveModel::Model
  attr_accessor :token, :postal_code, :add_pref_id, :add_muni, :add_local, :add_house, :phone_num, :item_id, :user_id

  validates :add_pref_id, numericality: { other_than: 1, message: 'Select' }

  with_options presence: true do
    validates :token
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :add_muni
    validates :add_local
    validates :phone_num, format: { with: /\A[0-9]+\z/, max_length: [11], message: 'Input only number' }
  end

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Transaction.create(postal_code: postal_code, add_pref_id: add_pref_id, add_muni: add_muni, add_local: add_local, add_house: add_house, phone_num: phone_num, order_id: order.id)
  end
end
