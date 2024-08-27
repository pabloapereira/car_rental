require 'rails_helper'

RSpec.describe UsersController, :type => :controller do
  context 'POST #create' do
    let!(:params) {
      {
        name: Faker::FunnyName.name,
        age: Faker::Number.binary(digits: 2),
        cpf: Faker::Number.binary(digits: 4),
        driver_license: 'B',
        card: 111,
      }
    }

    it 'create new user' do
      post :create, params: { users: params}
      expect(response).to have_http_status(:created)
    end
  end

  context 'DELETE #destroy' do
    let(:user) {create(:user)}

    it 'should delete post' do
      create_list(:user, 2)
      expect(User.count).to eq(2)

      delete :destroy, params: { id: user.id}
      expect(response).to have_http_status(:no_content)
      expect(User.count).to eq(2)
    end

  end
end