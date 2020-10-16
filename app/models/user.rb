class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,         presence: true

  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ } do
    validates :last_name_kan,   presence: true
    validates :first_name_kan,    presence: true
  end

  with_options presence: true, format: { with: /\A[ぁ-んァ-ン]+\z/ } do
    validates :last_name_kana,  presence: true
    validates :first_name_kana,   presence: true
  end

  validates :birth_date,       presence: true

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX

end
