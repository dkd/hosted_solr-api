require 'hosted_solr/api/solr_core'

module HostedSolr
  module API
    class DrupalSolrCore < SolrCore
      def initialize(name)
        super(name: name, system: 'drupal', solr_version: '4.8', schema: 'standard')
      end
    end
  end
end
