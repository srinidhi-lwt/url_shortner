module Api
  module V1
    class UrlsController < ApiController
      include UrlsHelper

      def index
        render json: { collection: serializer(collection) }
      end

      def create
        input_url = remove_url_prefix(params)
        url = Url.where(original_url: input_url).first_or_create
        render json: { "result" => url }
      rescue => e
        render json: { error: e }
      end

      def destroy
        @url = Url.find_by(short_url: params[:id])
        @url.destroy
      rescue => e
        render json: { error: e }
      end

      private

      def url_params
      	params.require(:url).permit(:original_url)
      end

      def collection
        params[:search] ? Url.where(short_url: params[:search]) : Url.all
      end

      def serializer(collection)
        collection.map do |x|
          {
            original_url: x.original_url,
            short_url: x.short_url
          }
        end
      end
    end
  end
end
