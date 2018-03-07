class IGDB
  class << self

    def find(game_id)

      # HTTParty setup ------------
      base_url = "https://api-endpoint.igdb.com/games/"
      url = base_url + game_id.to_s
      headers = {
        "user-key" => ENV["user_key"],
        "Accept" => "application/json"
      }
      response = HTTParty.get(url, headers: headers)[0]
      # ------------ HTTParty setup

      # Raise 404 error if not found
      unless response
        not_found
      end

      # Put response in the right format
      api_response = Cloudinary::Uploader.upload("https:" + response["cover"]["url"].gsub(/thumb/, "cover_big"))
      results = {
        game_id: response["id"],
        name: response["name"],
        summary: response["summary"],
        release_date: response["release_dates"] ? response["release_dates"][0]["human"] : nil,
        suggestions: response["games"] ? response["games"].join(";") : nil,
        platforms: response["platforms"] ? find_platform(response["platforms"]).join(";") : nil,
        photo: api_response["public_id"],
        genres: response["genres"] ? find_genre(response["genres"]).join(";") : nil,
        publishers: response["publishers"] ? find_companies(response["publishers"]).join(";") : nil,
        developers: response["developers"] ? find_companies(response["developers"]).join(";") : nil,
      }

      # Storing Game in DB
      game = Game.create!(results)
    end

    private

    def find_platform(platforms_id)
      output = []
      platforms_id.each do |platform|

        # HTTParty setup ------------
        base_url = "https://api-endpoint.igdb.com/platforms/"
        url = base_url + platform.to_s
        headers = {
          "user-key" => ENV["user_key"],
          "Accept" => "application/json"
        }
        # ------------ HTTParty setup

        output << response = HTTParty.get(url, headers: headers)[0]["name"]
      end
      return output
    end

    def find_genre(genres_id)
      output = []

      genres_id.each do |genre|

        # HTTParty setup ------------
        base_url = "https://api-endpoint.igdb.com/genres/"
        url = base_url + genre.to_s
        headers = {
          "user-key" => ENV["user_key"],
          "Accept" => "application/json"
        }
        # ------------ HTTParty setup

        output << response = HTTParty.get(url, headers: headers)[0]["name"]
      end
      return output
    end

    def find_companies(companies_id)
      output = []
      companies_id.each do |companie|

        # HTTParty setup ------------
        base_url = "https://api-endpoint.igdb.com/companies/"
        url = base_url + companie.to_s
        headers = {
          "user-key" => ENV["user_key"],
          "Accept" => "application/json"
        }
        # ------------ HTTParty setup

        output << response = HTTParty.get(url, headers: headers)[0]["name"]
      end
      return output
    end

    def not_found
      raise ActionController::RoutingError.new('Not Found')
    end
  end
end
