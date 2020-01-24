require 'rails_helper'

feature "Custumers", type: :feature do
  scenario 'Verify Listing Custumers page' do
    visit(root_path)
    click_on('Custumers Base')
    expect(page).to have_content('Listing Custumers')
  end

  scenario 'click on New custumer page' do
    visit(custumers_path)
    expect(page).to have_link('Register new Custumer')
    click_on('Register new Custumer')
    expect(page).to have_content('Register new Custumer')
  end

  scenario 'Register a new custumer' do
    visit(new_custumer_path)
    custumer_name = Faker::Name.name

    fill_in('Name', with: custumer_name)
    fill_in('E-mail', with: Faker::Internet.email)
    fill_in('Phone', with: Faker::PhoneNumber.phone_number)
    attach_file('Avatar', "#{Rails.root}/spec/fixtures/avatar.png")
    choose(option: ['Yes','No'].sample)
    click_on('Register Custumer')

    expect(page).to have_content('Customer successfully registered!')
    expect(Custumer.last.name).to eq(custumer_name)
  end
end
