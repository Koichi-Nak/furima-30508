class Order < ApplicationRecord
  has_one :owner, foreign_key: "order_id", class_name: "Transaction"
  belongs_to :user
  belongs_to :item
end
