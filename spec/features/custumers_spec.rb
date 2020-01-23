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
end
