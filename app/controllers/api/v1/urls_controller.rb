module Api
  module V1
    class UrlsController < ApiController
      include UrlsHelper

      def index
        render json: { collection: serializer(collection) }
      end

      def create
        url = given_url_exists?(params)
        if url.present?
          render json: { url.original_url => url.short_url }
        else
          new_url = Url.new(url_params)
          new_url.save
          render json: { new_url.original_url => short_url }
        end
      rescue => e
        render json: { error: e }
      end

      def destroy
      end

      private

      def url_params
      	params.require(:url).permit(:original_url)
      end

      def collection
        params[:search] ? Url.where(short_url: params[:search]) : Url.all
      end
    end
  end
end
