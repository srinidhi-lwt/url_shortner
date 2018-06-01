class ApiController < ApplicationController
  protect_from_forgery with: :null_session

  private

  def serializer(collection)
    collection.map do |x|
      {
      	original_url: x.original_url,
      	short_url: x.short_url
      }
    end
  end
end