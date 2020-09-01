class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true, length: { maximum: 40 }
  validates :birthday, presence: true

  
  validates :password_confirmation, presence: true

  with_options presence: true do
  validates :password, format: { with: /\A[a-zA-Z0-9]+\z/, message: "半角英数で入力してください" }
  validates :email, format: { with:/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze}
  validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/.freeze, message: "は全角で入力してください。"} 
  validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/.freeze, message: "は全角で入力してください。"} 
  end

  with_options presence: true do
   validates :kana_first_name, format: { with: /\A[ァ-ヶー－]+\z/, message: "は全角カタカナで入力して下さい。"}
   validates :kana_last_name, format: { with: /\A[ァ-ヶー－]+\z/, message: "は全角カタカナで入力して下さい。"}
   end
  
 end
