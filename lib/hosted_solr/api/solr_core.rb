require 'active_model'

module HostedSolr
  module API
    class SolrCore
      include ActiveModel::Model

      attr_accessor :id, :solr_version, :system, :schema,
                    :name, :internal_name, :password,
                    :is_activated, :created_at, :updated_at

      validates :name, presence: true,
                       format: { with: /^[a-z0-9\-]+$/, multiline: true, message: 'Name is allowed to contain only lower case characters, numbers and dashes' },
                       length: { maximum: 20 }

      validates :solr_version, presence: true
      validates :schema,       presence: true
      validates :system,       presence: true

      def self.from_hash(attributes_hash = {})
        new(attributes_hash.slice(*%w(id solr_version system name internal_name password is_activated created_at updated_at)))
      end
    end
  end
end
