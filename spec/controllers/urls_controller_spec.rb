require 'rails_helper'

RSpec.describe UrlsController, type: :controller do

    describe "create" do
        let!(:url1) {FactoryGirl.create(:url1, :original_url => "yatra.com")}
        it "positive case" do
            url_params = {url1: { original_url: "google.com"} }
            expect do
                post :create, params: url_params
            end.to change(Url, :count).by(1)
        end

        it "negative case" do
            expect do
                url_params = {url1: { original_url: "yatra.com"} }
                post :create, params: url_params
            end.to change(Url, :count).by(0)
        end
    end

    describe "index" do
        let!(:url_1) {FactoryGirl.create(:url1, :original_url => "yatra.com")}
        let!(:url_2) {FactoryGirl.create(:url1, :original_url => "goomo.com")}
        it "positive" do
            get :index
            expect(assigns(:url1)).to eq([url_1, url_2])
        end
        it "negative" do
            get :index
            expect(assigns(:urls)).to eq(nil)
        end
    end

    describe "destroy" do
        let!(:url) {FactoryGirl.create(:url1, :original_url => "yatra.com")}
        it "positive" do
            expect do
                delete :destroy, params:{id: url.id}
            end.to change(Url, :count).by(-1)
        end

        it "negative" do
            expect do
                delete :destroy, params:{id: "asdasd"}
            end.to change(Url, :count).by(0)
        end
    end

end