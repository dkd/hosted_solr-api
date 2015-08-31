require 'hosted_solr/api/solr_core'

module HostedSolr
  module API
    class MagentoSolrCore < SolrCore
      def initialize(name, solr_version, schema)
        super(name: name, system: 'magento', solr_version: solr_version, schema: schema)
      end
    end
  end
end
