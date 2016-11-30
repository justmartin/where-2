require "flickraw"
require "json"

class Flickr
  def self.get_country_photos(code)
    flickr_authorization
    
    flickr.photos.search(tags: Countries.for_code(code))
  end

  private

  def self.flickr_authorization
    FlickRaw.api_key="7110b87e2cb7abdc17315f622b7ea40f"
    FlickRaw.shared_secret="b4d62d8e9b92ea4d"
  end
end
