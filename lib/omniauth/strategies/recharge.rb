require 'omniauth/strategies/oauth2'

module OmniAuth
  module Strategies
    class Recharge < OmniAuth::Strategies::OAuth2

      option :client_options, {
          :site          => 'https://shopifysubscriptions.com',
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
        @raw_info ||= access_token.get('https://api.rechargeapps.com/').parsed
      end
    end
  end
end
