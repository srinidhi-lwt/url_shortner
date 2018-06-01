module UrlsHelper
  def url_prefix
    %w[http:// www. https://]
  end

  def remove_url_prefix(params)
    given_url = params[:url][:original_url]
    url_prefix.each { |x| given_url.gsub!(x, '') }
    given_url
  end
end
