require 'active_support'
require 'hosted_solr/api/solr_core'
require 'hosted_solr/api/errors'
require 'open-uri'
require 'json'

module HostedSolr
  module API
    class Client
      def initialize(api_token: nil, secret_token: nil)
        @api_token = api_token || ENV['HOSTED_SOLR_API_TOKEN']
        @secret_token = secret_token || ENV['HOSTED_SOLR_SECRET_TOKEN']
        fail APITokenMissingError, 'Please provide Hosted Solr API token or set HOSTED_SOLR_API_TOKEN environment variable.' if @api_token.nil?
        fail SecretTokenMissingError, 'Please provide Hosted Solr Secret token or set HOSTED_SOLR_SECRET_TOKEN environment variable.' if @secret_token.nil?
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
    end
  end
end
