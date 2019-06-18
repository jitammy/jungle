require 'rails_helper'

RSpec.feature "Visitor navigates to product page", type: :feature, js: true do

# SETUP
before :each do
  @category = Category.create! name: 'Apparel'

  10.times do |n|
    @category.products.create!(
      name:  Faker::Hipster.sentence(3),
      description: Faker::Hipster.paragraph(4),
      image: open_asset('apparel1.jpg'),
      quantity: 0,
      price: 64.99
    )
    end
end

  scenario "and Click details button" do
    # ACT
    visit root_path

    sleep 2
    first('article.product').find_link('Details »').click
    sleep 2

    # DEBUG / VERIFY
    save_screenshot

    expect(page).to have_css 'article.product-detail'
    
    # puts page.html 
  end

end
