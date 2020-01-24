require 'rails_helper'


feature "Invalid Customer Register", type: :feature do
    scenario 'Must fill all text fields' do
        visit(new_customer_path)

        click_on('Register Customer')
        expect(page).to have_content("Name can't be blank")
        expect(page).to have_content("Email can't be blank")
        expect(page).to have_content("Phone can't be blank")
    end

end


