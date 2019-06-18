require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    before do
      @user = User.new
      @user.first_name = "someone"
      @user.last_name = "someone"
      @user.email = "someone@gmail.com"
      @user.password = "someone"
      @user.password_confirmation = "someone"
      @user.valid?
    end

    it "should create a user" do
      expect(@user).to be_valid
    end

     it 'shouldnt have an empty first name' do
      @user.first_name = nil
      @user.save
      expect(@user.errors.full_messages[0]).to include(@user.errors[:first_name][0])

    end

     it 'shouldnt have an empty last name' do
      @user.last_name = nil
      @user.save
      expect(@user.errors.full_messages[0]).to include(@user.errors[:last_name][0])


    end

     it 'shouldnt have an empty email' do
      @user.email = nil
      @user.save
      expect(@user.errors.full_messages[0]).to include(@user.errors[:email][0])


    end

     it 'shouldnt have an empty password' do
      @user.password = nil
      @user.save
      expect(@user.errors.full_messages[0]).to include(@user.errors[:password][0])
      

    end

    it 'shouldnt have a non-valid password' do
      @user.password = "some"
      @user.password_confirmation = "some"
      @user.save
      expect(@user.errors.full_messages[0]).to include(@user.errors[:password][0])
     

    end

    it 'shouldnt have a empty password confirmation' do
      @user.password_confirmation = nil
      @user.save
      expect(@user.errors.full_messages[0]).to include(@user.errors[:password_confirmation][0])
      puts @user.errors.full_messages
      puts @user.errors[:password_confirmation]

    end

  end

  describe '.authenticate_with_credentials' do

    before do
      @user = User.new
      @user.first_name = "someone"
      @user.last_name = "someone"
      @user.email = "someone@gmail.com"
      @user.password = "someone"
      @user.password_confirmation = "someone"
    end

    it 'should get right user if password match' do

      # aspirational_user = User.authenticate_with_credentials("someone@gmail.com", "someone")
      # puts aspirational_user
      # puts @user
      # expect(aspirational_user).to eq(@user)

    end

  end

end





 