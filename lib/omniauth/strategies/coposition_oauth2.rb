require "omniauth/strategies/oauth2"

module OmniAuth  
  module Strategies
    class CopositionOauth2 < OmniAuth::Strategies::OAuth2
      include OmniAuth::Strategy

      PROVIDER_URL = "http://coposition-dev.com:5000"

      option :name, "coposition_oauth2"
      # option :skip_friends, true
      # option :skip_image_info, true
      # option :skip_jwt, true
      # option :authorize_options, [
      #   :access_type, :hd, :login_hint, :prompt, :request_visible_actions,
      #   :scope, :state, :redirect_uri, :include_granted_scopes, :openid_realm
      # ]


      option :client_options, {
        site: PROVIDER_URL,
        authorize_url: "#{PROVIDER_URL}/oauth/authorize",
        token_url: "#{PROVIDER_URL}/oauth/token"
      }

      def request_phase
        super
      end

      info do
        raw_info.merge("token" => access_token.token)
      end

      uid { raw_info["id"] }

      def raw_info
        @raw_info ||= access_token.get("/api/users/me").parsed
      end
    end
  end
end  
