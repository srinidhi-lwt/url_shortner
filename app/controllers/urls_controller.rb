class UrlsController < ApplicationController
  include UrlsHelper

  def index
    @urls = Url.all
  end

  def new
    @url = Url.new
  end

  def show
    @url = Url.find(params[:id])
  end

  def create
    url = given_url_exists?
    if url.present?
      redirect_to url_path(url.id)
    else
      new_url = Url.new(url_params)
      if new_url.save
        redirect_to root_path
      end
    end
  end

  private

  def url_params
  	params.require(:url).permit(:original_url)
  end

  def given_url_exists?
    given_url = params[:url][:original_url]
    url_prefix.each { |x| given_url.gsub!(x, '') }
    url = Url.where(original_url: given_url).first
  end
end
