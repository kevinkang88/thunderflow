class Imgur
  include HTTParty
  headers 'Content-Type' => 'application/json', "Authorization" => "Client-ID 691c16a3ed9cf63"
  base_uri 'https://api.imgur.com'

  def initialize(image)
    @options = { body: {image: image}.to_json }
  end

  def upload
    self.class.post("/3/image", @options)
  end
end
