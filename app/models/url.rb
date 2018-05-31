class Url < ApplicationRecord
  SHORT_URL_LENGTH = 6

  private

  def generate_short_url
   url = ([*('a'...'z'), *('0'...'9')]).sample(SHORT_URL_LENGTH).join
  end
end
