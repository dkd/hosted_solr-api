require 'active_model'

module HostedSolr
  module API
    class SolrCore
      include ActiveModel::Model

      attr_accessor :id, :solr_version, :system,
                    :name, :internal_name, :password,
                    :is_activated, :created_at, :updated_at

      def self.from_hash(attributes_hash = {})
        new(attributes_hash.slice(*%w(id solr_version system name internal_name password is_activated created_at updated_at)))
      end
    end
  end
end
