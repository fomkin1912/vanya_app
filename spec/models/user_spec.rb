require 'rails_helper'

RSpec.describe User, type: :model do
  
  context "validations" do

  	let (:user) { FactoryGirl.build(:user) }	

	  it "valid with name, last_name, password, email" do
	  	expect(user).to be_valid
	  end
    
    it "creates one record after users save" do
    	user = FactoryGirl.create(:user)
    	expect(User.count).to eq(1)
    end


	  context "invalid without name, last_name, email, password" do
	  	user = User.new(name: "", last_name: "", email: "", password: "")
	  	user.valid?
	  	it { expect(user.errors.count).to eq(4) }
	  	it { expect(user.errors[:name]).to include("can't be blank") }
	  	it { expect(user.errors[:last_name]).to include("can't be blank") }
	  	it { expect(user.errors[:email]).to include("can't be blank") }
	  	it { expect(user.errors[:password]).to include("can't be blank") }
	  end
    
    it "have unique full_name" do
    	user = FactoryGirl.create(:user)
    	other_user = FactoryGirl.build(:user)
    	other_user.valid?
    	expect(other_user.errors[:full_name]).to include("has already been taken")
    end

  end

  context "methods" do
	  it "respond to full_name method" do
	  	user = FactoryGirl.create(:user)
	  	expect(user.full_name).to eq("Иван Лапин")
	  end
  end

end
