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
     

    end

  end

  describe '.authenticate_with_credentials' do

    before do
      @user1 = User.new
      @user1.first_name = "someone1"
      @user1.last_name = "someone1"
      @user1.email = "someone1@gmail.com"
      @user1.password = "someone1"
      @user1.password_confirmation = "someone1"
      @user1.save
    end

    it 'should get right user if password match' do
      aspirational_user = User.authenticate_with_credentials("someone1@gmail.com", "someone1")
      expect(aspirational_user).to eq(@user1)
    end
    it 'should get no user if password not match' do
      aspirational_user = User.authenticate_with_credentials("someone1@gmail.com", "someone2")
      expect(aspirational_user).to_not eq(@user1)
    end

    it 'should get no user if email not match' do
      aspirational_user = User.authenticate_with_credentials("someone2@gmail.com", "someone1")
      expect(aspirational_user).to_not eq(@user1)
    end

    it 'should get user if email has space at begining' do
      aspirational_user = User.authenticate_with_credentials(" someone1@gmail.com ", "someone1")
      expect(aspirational_user).to eq(@user1)
    end

    it 'should get user if email has uppsercase' do
      aspirational_user = User.authenticate_with_credentials("SOMEONE1@GMAIL.CoM", "someone1")
      expect(aspirational_user).to eq(@user1)
    end

  end

end





 