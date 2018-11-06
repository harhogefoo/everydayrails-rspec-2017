require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validate user' do
    before do
      @user = User.new(
        first_name: 'Aaron',
        last_name: 'Summer',
        email: 'tester@example.com',
        password: 'dottle-nouveau-pavilion-tights-furze'
      )
    end

    context 'when user is valid' do
      it 'is valid with a first name, last name, email, and password' do
        expect(@user).to be_valid
      end
    end

    context 'when user is invalid' do
      it 'is invalid without a first name' do
        user = User.new(first_name: nil)
        user.valid?
        expect(user.errors[:first_name]).to include("can't be blank")
      end
      it 'is invalid without a last name' do
        user = User.new(last_name: nil)
        user.valid?
        expect(user.errors[:last_name]).to include("can't be blank")
      end
      it 'is invalid without an email address' do
        user = User.new(email: nil)
        user.valid?
        expect(user.errors[:email]).to include("can't be blank")
      end
      it 'is invalid with a duplicate email address' do
        User.create(
          first_name: 'Joe',
          last_name: 'Tester',
          email: 'tester@example.com',
          password: 'dottle-nouveau-pavilion-tights-furze'
        )
        @user.valid?
        expect(@user.errors[:email]).to include('has already been taken')
      end
    end
  end

  it "return a user's full name as a string" do
    user = User.new(
      first_name: 'John',
      last_name: 'Doe',
      email: 'johndoe@example.con'
    )
    expect(user.name).to eq 'John Doe'
  end
end
