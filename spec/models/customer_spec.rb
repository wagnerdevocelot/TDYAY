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

  it 'phone must have just eleven numbers' do
      customer = build(:customer, phone: '119545604033')
      customer.valid?
      expect(customer.errors[:phone]).to include('is too long (maximum is 11 characters)')
  end

  it 'phone must have at leat eleven numbers' do
    customer = build(:customer, phone: '1195456040')
    customer.valid?
    expect(customer.errors[:phone]).to include('is too short (minimum is 11 characters)')
  end
end
