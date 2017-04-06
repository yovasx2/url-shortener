require 'rails_helper'

RSpec.describe Address, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:short) }
    it { should validate_length_of(:short).is_at_most(255) }
    it { should validate_presence_of(:url) }
    it { should validate_length_of(:url).is_at_most(65_535) }
  end

  it 'valid factory' do
    address = FactoryGirl.build(:address)
    expect(address).to be_valid
  end

  describe 'shorten method' do
    before(:each) do
      @address = FactoryGirl.create(:address)
    end

    it 'should assign a string of length 6 by default' do
      @address.shorten
      expect(@address.short.length).to eq(6)
    end

    it 'should assign a string of specific length' do
      length = Random.rand(20)
      @address.shorten(length)
      expect(@address.short.length).to eq(length)
    end

    it 'should call Digest::SHA256.hexdigest' do
      expect(Digest::SHA256).to receive(:hexdigest)
        .with(@address.url).and_return('S3cr37')
      @address.shorten
    end
  end

  describe 'url_well_formed' do
    before(:each) do
      @address = FactoryGirl.create(:address)
    end

    it 'should accept url' do
      @address.send(:url_well_formed)
      expect(@address.valid?).to eq(true)
    end

    it 'should reject url' do
      @address.url = 'google.com'
      @address.send(:url_well_formed)
      expect(@address.valid?).to eq(false)
      expect(@address.errors.full_messages).to eq(['Url not valid'])
    end
  end
end
