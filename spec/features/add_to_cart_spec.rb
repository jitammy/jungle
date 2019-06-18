require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do

# SETUP
before :each do
  @category = Category.create! name: 'Apparel'

  10.times do |n|
    @category.products.create!(
      name:  Faker::Hipster.sentence(3),
      description: Faker::Hipster.paragraph(4),
      image: open_asset('apparel1.jpg'),
      quantity: 10,
      price: 64.99
    )
    end
end

  scenario "cart updated by clicking add button" do
    # ACT
    visit root_path
    sleep 2
    first('article.product').click_button 'Add'
    sleep 2
    
    # DEBUG / VERIFY
    save_screenshot


    within('nav') { expect(page).to have_content('My Cart (1)') }


  end

end