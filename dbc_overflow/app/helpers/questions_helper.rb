module QuestionsHelper
class Proverb
    include HTTParty

    def get_proverb
      headers = {"Authorization" => "token #{ENV['SECRET_KEY']}", "User-Agent" => "DBCOverFlowApp"}
      response = self.class.get("https://api.github.com/zen", {headers: headers})

      return response.parsed_response
    end
  end
end
