class UrlsController < ApplicationController
  include UrlsHelper

  before_action :find_url, only: [:show, :destroy]

  def index
    @urls = Url.all
  end

  def new
    @url = Url.new
  end

  def show
  end

  def create
    url = given_url_exists?(params)
    if url.present?
      redirect_to url_path(url.id)
    else
      new_url = Url.new(url_params)
      if new_url.save
        redirect_to root_path
      end
    end
  end

  def destroy
    @url.destroy
    redirect_to root_path
  end

  private

  def url_params
  	params.require(:url).permit(:original_url)
  end

  def find_url
    @url = Url.find(params[:id])
  end
end
