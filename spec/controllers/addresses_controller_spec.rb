require 'rails_helper'

RSpec.describe AddressesController, type: :controller do
  describe 'GET #enlarge' do
    it do
      should route(:get, '/111111')
        .to(controller: :addresses, action: :enlarge, short: '111111')
    end

    it 'returns http redirect' do
      address = FactoryGirl.create(:address)
      get(:enlarge, short: address.short)
      expect(response).to redirect_to(address.url)
      expect(response).to have_http_status(:redirect)
    end

    it 'returns http not_found' do
      get(:enlarge, short: '111111')
      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'POST #enlarge' do
    it do
      should route(:post, '/shorten')
        .to(controller: :addresses, action: :shorten)
    end

    it 'returns http success' do
      get :shorten, url: 'http://google.com'
      expect(response).to have_http_status(:success)
    end

    it 'returns http unprocessable entity' do
      get :shorten, url: "http://#{'a'*65_535}"
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end
