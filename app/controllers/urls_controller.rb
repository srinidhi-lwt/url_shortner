require 'csv'

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
    input_url = remove_url_prefix(params)
    url = Url.where(original_url: input_url).first_or_create
    redirect_to url_path(url.id)
  end

  def destroy
    @url.destroy
    redirect_to root_path
  end

  def create_url_csv
    return redirect_to root_path if params[:url_in_file].blank?
    file = params[:url_in_file].path

    CSV.foreach(file).each_with_index do |row, index|
      next if index == 0 # skip the headers
      input_url = strip_prefix(row[0])
      Url.where(original_url: input_url).first_or_create
    end
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
