require 'spec_helper'

describe WelcomeController, type: :controller do
  let(:user) { create(:user) }

  describe 'GET index' do
    before do
      signin_as(user)
    end

    subject do
      get :index
    end

    include_context :user_should_be_signed_in

    it 'should be successful' do
      subject
      expect(response).to have_http_status(:successful)
      expect(response).to render_template :index
    end
  end
end
