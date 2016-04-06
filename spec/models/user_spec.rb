require 'rails_helper'

describe User do
  describe 'passwords' do
    it 'needs a passwors and confirmation to save' do
      u = User.new(name: 'steve')

      u.save
      expect(u).to_not be_valid

      u.password = 'password'
      u.password_confirmation = ''
      u.save
      expect(u).to_not be_valid

      u.password_confirmation = 'password'
      u.save
      expect(u).to be_valid
    end

    it "needs password and confirmation to match" do
      u = User.create(
          name: 'steve',
          password: 'hunter2',
          password_confirmation: 'hunter'
      )
      expect(u).to_not be_valid
    end
  end

  describe "authentication" do
    let(:user) { User.create(
          name: 'steve',
          password: 'hunter2',
          password_confirmation: 'hunter2'
      ) }

    it "authentication with a correct password" do
      expect(user.authentication("hunter2")).to be
    end

    it "does not authenticate with an incorrect password" do
      expect(user.authenticate("hunter1")).to_not be
    end

    it "requires an email" do
      u = User.new(name: "steve",
                  password: "hunter2",
                  password_confirmation: "hunter2")
      u.save
      expect(u).to_not be_valid

      
    end
  end
end
