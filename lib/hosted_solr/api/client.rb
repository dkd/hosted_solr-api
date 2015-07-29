require 'active_support'
require 'hosted_solr/api/solr_core'
require 'hosted_solr/api/errors'
require 'open-uri'
require 'json'

module HostedSolr
  module API
    class Client
      def initialize(api_token: nil, secret_token: nil)
        @api_token = find_api_token(api_token)
        @secret_token = find_secret_token(secret_token)
        fail APITokenMissingError if @api_token.nil?
        fail SecretTokenMissingError if @secret_token.nil?
      end

      def all_solr_cores
        json_response = URI.parse("https://www.hosted-solr.com/api/solr_cores.json?api_token=#{@api_token}&secret_token=#{@secret_token}").read
        solr_cores = JSON.parse(json_response)
        solr_cores.map do |attributes|
          SolrCore.from_hash(attributes)
        end
      end

      def create_solr_core
      end

      def destroy_core
      end

      private

      def configuration
        HostedSolr::API.configuration
      end

      def find_api_token(api_token = nil)
        api_token || configuration.api_token || ENV['HOSTED_SOLR_API_TOKEN']
      end

      def find_secret_token(secret_token = nil)
        secret_token || configuration.secret_token || ENV['HOSTED_SOLR_SECRET_TOKEN']
      end
    end
  end
end
