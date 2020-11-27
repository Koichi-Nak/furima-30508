class Transaction < ApplicationRecord
  with_options presence: true do
    validates :postal_code
    validates :add_pref_id
    validates :add_muni
    validates :add_local
    validates :phone_num
    validates :order
  end

  belongs_to :order
end
