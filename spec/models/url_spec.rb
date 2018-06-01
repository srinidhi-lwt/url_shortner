require 'rails_helper'

RSpec.describe Url, type: :model do
  describe "" do
    let(:url1) {FactoryGirl.build(:short_url)}
    let!(:dup_url) {FactoryGirl.create(:short_url)}

    it "is valid with without original_url" do
        url1.original_url = nil
        expect(url1).to_not be_valid
    end

    it "is valid with valid original_url" do
        expect(url1).to be_valid
    end

    it "should generate short url" do
        url1.save
        expect(url1.short_url).to be_present
    end


    it "should fetch duplicate url" do
        dup_url_obj = url1.find_duplicate
        expect(url1).to be_present
    end

    it "should fetch duplicate url" do
        url1.url_content = "goomo.com"
        url_obj = url1.new_url
        expect(url_obj).to eq(true)
    end

    it "should fetch duplicate url" do
        url_obj = dup_url.new_url
        expect(url_obj).to eq(false)
    end
  end

end