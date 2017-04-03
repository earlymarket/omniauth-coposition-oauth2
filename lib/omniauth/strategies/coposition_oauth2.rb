require "omniauth-oauth2"

module OmniAuth  
  module Strategies
    class CopositionOauth2 < OmniAuth::Strategies::OAuth2
      include OmniAuth::Strategy

      option :client_options, {
               site: "http://coposition.dev:5000",
               authorize_url: 
                 "http://coposition.dev:5000/oauth/authorize",
               token_url: "http://coposition.dev:5000/oauth/token"
             }

      def request_phase
        super
      end

      info do
        raw_info.merge("token" => access_token.token)
      end

      uid { raw_info["id"] }

      def raw_info
        @raw_info ||= 
          access_token.get("/api/users/me").parsed
      end
    end
  end
end  
