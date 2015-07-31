require 'active_support'
require 'hosted_solr/api/errors'
require 'hosted_solr/api/has_configuration'
require 'hosted_solr/api/solr_core'
require 'hosted_solr/api/solr_cores_api_client'

module HostedSolr
  module API
    class Client
      include HostedSolr::API::HasConfiguration

      def initialize
        fail APITokenMissingError if configuration.api_token.nil?
        fail SecretTokenMissingError if configuration.secret_token.nil?
        @api_client = SolrCoresAPIClient.new
      end

      def all_solr_cores
      end

      def create_solr_core(solr_core)
        fail ArgumentError, 'Error: SolrCore expected!' unless solr_core.is_a? SolrCore
        @api_client.create solr_core
      end

      def destroy_solr_core(solr_core)
        case solr_core
        when Integer, String
          id = solr_core
        when SolrCore
          id = solr_core.id
        else
          fail ArgumentError, 'Error: SolrCore or SolrCore id expected!'
        end
        @api_client.destroy String(id)
      end
    end
  end
end
