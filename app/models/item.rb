class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_status
  belongs_to :delivery_charge
  belongs_to :shipping_from
  belongs_to :shipping_preparation

  with_options presence: true do
    validates :image
    validates :item_name
    validates :description
    validates_numericality_of :price, with: /\A[0-9]+\z/, message: 'Half-width number'
    validates :price, numericality: { greater_than_or_equal_to: 300,
                                      less_than_or_equal_to: 9_999_999,
                                      message: 'Out of setting range' }
  end

  with_options numericality: { other_than: 1, message: 'Select' } do
    validates :category_id
    validates :item_status_id
    validates :delivery_charge_id
    validates :shipping_from_id
    validates :shipping_preparation_id
  end

  belongs_to :user
  has_one_attached :image
end
