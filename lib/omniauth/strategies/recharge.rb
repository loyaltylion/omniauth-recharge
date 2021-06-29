require 'omniauth/strategies/oauth2'

module OmniAuth
  module Strategies
    class Recharge < OmniAuth::Strategies::OAuth2

      option :provider_ignores_state, false

      option :client_options, {
          :site          => 'https://admin.rechargeapps.com/partners/app',
          :authorize_url => '/oauth/authorize',
          :token_url     => '/oauth/token'
      }

      uid{ raw_info['store']['store_id'] }

      info do
        {
            :email => raw_info['store']['email'],
        }
      end

      extra do
        {
            'raw_info' => raw_info['store']
        }
      end

      def raw_info
        api_url = ENV['RECHARGE_API_URL'] || 'https://api.rechargeapps.com/'
        puts "OmniAuth::Strategies parsed access token: #{access_token.get(api_url).parsed.inspect}"
        @raw_info ||= access_token.get(api_url).parsed
      end

       def callback_url
        # make sure the query string doesnt get added to the redirect_uri
        # https://github.com/intridea/omniauth-oauth2/issues/93
        puts "OmniAuth::Strategies callback_url: #{full_host + script_name + callback_path}"
        full_host + script_name + callback_path
      end
    end
  end
end
