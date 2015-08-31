require 'hosted_solr/api/solr_core'

module HostedSolr
  module API
    class SunspotSolrCore < SolrCore
      def initialize(name)
        super(name: name, system: 'sunspot', solr_version: '3.5', schema: 'standard')
      end
    end
  end
end
