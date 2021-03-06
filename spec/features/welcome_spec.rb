require 'rails_helper'

feature "Welcome", type: :feature do
  scenario 'Show a welcome message' do
    visit(root_path)
    expect(page).to have_content('Welcome')
  end

  scenario 'Click on link Customers Base' do
    visit(root_path)
    expect(page).to have_link('Customers Base')
  end
end
