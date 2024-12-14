class ApiUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    # Deviseを使用している場合
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :validatable
  end