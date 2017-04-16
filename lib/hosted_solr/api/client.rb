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
        raise APITokenMissingError if configuration.api_token.nil?
        raise SecretTokenMissingError if configuration.secret_token.nil?
        @api_client = SolrCoresAPIClient.new
      end

      def all_solr_cores
        @api_client.all.map do |response_entry|
          SolrCore.from_hash response_entry.to_hash
        end
      end

      def create_solr_core(solr_core)
        raise ArgumentError, 'Error: SolrCore expected!' unless solr_core.is_a? SolrCore
        return false unless solr_core.valid?
        @api_client.name = solr_core.name
        @api_client.solr_version = solr_core.solr_version
        @api_client.schema = solr_core.schema
        @api_client.system = solr_core.system
        @api_client.create
      end

      def destroy_solr_core(solr_core)
        case solr_core
        when Integer, String
          id = solr_core
        when SolrCore
          id = solr_core.id
        else
          raise ArgumentError, 'Error: SolrCore or SolrCore id expected!'
        end
        @api_client.destroy String(id)
      end
    end
  end
end
