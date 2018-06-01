class Url < ApplicationRecord
  include UrlsHelper

  SHORT_URL_LENGTH = 6

  validates :original_url, presence: true
  before_create :process_url

  def process_url
    self.short_url = ([*('a'...'z'), *('0'...'9')]).sample(SHORT_URL_LENGTH).join
    url_prefix.each { |x| self.original_url.gsub!(x, '') }
  end
end
