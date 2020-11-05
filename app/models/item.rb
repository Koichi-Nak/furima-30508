class Item < ApplicationRecord

  with_options presence: true do
    validates :item_name
    validates :description
    validates :category_id
    validates :item_status_id
    validates :delivery_charge_id
    validates :shipping_from_id
    validates :shipping_preparation_id
    validates :price, format: { :greater_than_or_equal_to => 300,
                                :less_than_or_equal_to => 9999999,
                                :message => 'Out of setting range' }
    #validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'Full-width katakana characters' }
  end

end
