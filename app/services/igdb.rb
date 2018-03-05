class IGDB
  class << self

    def find(game_id)
      @base_url = "https://api-endpoint.igdb.com/games/"
      url = @base_url + game_id.to_s
      headers = {
        "user-key" => ENV["user_key"],
        "Accept" => "application/json"
      }
      response = HTTParty.get(url, headers: headers)[0]
      results = {
        game_id: response["id"],
        name: response["name"],
        summary: response["summary"],
        release_date: response["release_dates"][0]["human"],
        suggestions: response["games"],
        rating: response["popularity"],
        platform: response["platforms"],
        photo_url: response["cover"]["url"].gsub(/thumb/, "cover_big"),
      }
      # game = Game.create!(results)
      # return game
    end
  end
end
