module UrlsHelper
  def url_prefix
    %w[http:// www. https://]
  end

  def given_url_exists?(params)
    given_url = params[:url][:original_url]
    url_prefix.each { |x| given_url.gsub!(x, '') }
    Url.find_by(original_url: given_url)
  end
end
