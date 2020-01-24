require 'rails_helper'


feature "Invalid Custumer Register", type: :feature do
    scenario 'Must fill all text fields' do
        visit(new_custumer_path)

        click_on('Register Custumer')
        expect(page).to have_content("Name can't be blank")
        expect(page).to have_content("Email can't be blank")
        expect(page).to have_content("Phone can't be blank")
    end

end


