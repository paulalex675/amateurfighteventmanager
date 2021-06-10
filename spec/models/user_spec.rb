require 'rails_helper'

RSpec.describe User, type: :model do
  it 'returns the full_name for a user' do
    user = User.create(first_name: 'Dave', last_name: 'Smith', username: 'amazingdave', email: 'dave@email.com', encrypted_password: 'password', bio: 'I love tacos')

    expect(user.full_name).to eq 'Dave Smith'
  end
end
