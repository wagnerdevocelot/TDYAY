require 'rails_helper'

feature "Customers", type: :feature do
  scenario 'Verify Listing Custumers page' do
    visit(root_path)
    click_on('Customers Base')
    expect(page).to have_content('Listing Customers')
  end

  scenario 'click on New customer page' do
    visit(customers_path)
    expect(page).to have_link('Register new Customer')
    click_on('Register new Customer')
    expect(page).to have_content('Register new Customer')
  end

  scenario 'Register a new customer' do
    visit(new_customer_path)
    customer_name = Faker::Name.name

    fill_in('Name', with: customer_name)
    fill_in('E-mail', with: Faker::Internet.email)
    fill_in('Phone', with: Faker::PhoneNumber.phone_number)
    attach_file('Avatar', "#{Rails.root}/spec/fixtures/avatar.png")
    choose(option: ['Yes','No'].sample)
    click_on('Register Customer')

    expect(page).to have_content('Customer successfully registered!')
    expect(Customer.last.name).to eq(customer_name)
  end

  scenario 'Show Customers' do
    customer = Customer.create!(
      name: Faker::Name.name,
      email: Faker::Internet.email,
      phone: Faker::PhoneNumber.phone_number,
      smoker: ['Yes','No'].sample,
      avatar: "#{Rails.root}/spec/fixtures/avatar.png"
    )

    visit(customer_path(customer.id))
    expect(page).to have_content(customer.name)
    expect(page).to have_content(customer.email)
    expect(page).to have_content(customer.phone)
  end

  scenario 'list from Customers from index' do 
    customer1 = Customer.create!(
      name: Faker::Name.name,
      email: Faker::Internet.email,
      phone: Faker::PhoneNumber.phone_number,
      smoker: ['Yes','No'].sample,
      avatar: "#{Rails.root}/spec/fixtures/avatar.png"
    )

    customer2 = Customer.create!(
      name: Faker::Name.name,
      email: Faker::Internet.email,
      phone: Faker::PhoneNumber.phone_number,
      smoker: ['Yes','No'].sample,
      avatar: "#{Rails.root}/spec/fixtures/avatar.png"
    )

    visit(customers_path)
    expect(page).to have_content(customer1.name).and have_content(customer2.name)

  end

end
