require 'rails_helper'

RSpec.describe Customer, type: :model do
  it 'is valid with name' do
    customer = create(:customer)
    expect(customer).to be_valid
  end

  it 'is invalid without name' do
    customer = build(:customer, name: nil)
    customer.valid?
    expect(customer.errors[:name]).to include("can't be blank")
  end

  it 'is valid with phone' do
    customer = create(:customer)
    expect(customer).to be_valid
  end

  it 'is invalid without phone' do
    customer = build(:customer, phone: nil)
    customer.valid?
    expect(customer.errors[:phone]).to include("can't be blank")
  end


  it 'is valid with email' do
    customer = create(:customer)
    expect(customer).to be_valid
  end

  it 'is invalid without email' do
    customer = build(:customer, email: nil)
    customer.valid?
    expect(customer.errors[:email]).to include("can't be blank")
  end
end
