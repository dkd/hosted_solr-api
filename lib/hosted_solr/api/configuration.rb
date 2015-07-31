module HostedSolr
  module API
    class Configuration
      attr_accessor :base_url, :api_token, :secret_token

      def initialize
        @base_url = 'https://www.hosted-solr.com/api'
      end

      def api_token
        @api_token = find_api_token
      end

      def secret_token
        @secret_token = find_secret_token
      end

      private

      def find_api_token
        @api_token || ENV['HOSTED_SOLR_API_TOKEN']
      end

      def find_secret_token
        @secret_token || ENV['HOSTED_SOLR_SECRET_TOKEN']
      end
    end
  end
end
