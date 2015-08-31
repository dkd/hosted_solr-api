require 'hosted_solr/api/solr_core'

module HostedSolr
  module API
    class SolrForTypo320xSolrCore < SolrCore
      def initialize(name, schema)
        super(name: name, system: 'typo3', solr_version: '3.6', schema: schema)
      end
    end
  end
end
