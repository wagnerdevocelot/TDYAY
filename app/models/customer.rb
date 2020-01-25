class Customer < ApplicationRecord
    validates :name, presence: true
    validates :email, presence: true
    validates :phone, presence: true
    validates :phone, length: { maximum: 11, minimum: 11 }
    
end
