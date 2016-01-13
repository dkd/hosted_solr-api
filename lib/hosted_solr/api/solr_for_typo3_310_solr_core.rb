require 'hosted_solr/api/solr_core'

module HostedSolr
  module API
    class SolrForTypo3310SolrCore < SolrCore
      def initialize(name, schema)
        super(name: name, system: 'typo3', solr_version: '4.10', schema: schema)
      end
    end
  end
end
