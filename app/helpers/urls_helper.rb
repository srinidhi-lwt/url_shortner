module UrlsHelper
  def url_prefix
    %w[http:// www. https://]
  end

  def remove_url_prefix(params)
    given_url = params[:url][:original_url]
    strip_prefix(given_url)
  end

  def strip_prefix(url)
  	url_prefix.each { |x| url.gsub!(x, '') }
  	url
  end
end
