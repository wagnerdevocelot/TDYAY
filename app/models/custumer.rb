class Custumer < ApplicationRecord
    validates :name, presence: true
    validates :email, presence: true
    validates :phone, presence: true
end
