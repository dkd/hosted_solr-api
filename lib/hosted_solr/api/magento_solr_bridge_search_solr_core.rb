require 'hosted_solr/api/solr_core'

module HostedSolr
  module API
    class MagentoSolrBridgeSearchSolrCore < SolrCore
      def initialize(name)
        super(name: name, system: 'solrbridge', solr_version: '4.9', schema: 'german')
      end
    end
  end
end
