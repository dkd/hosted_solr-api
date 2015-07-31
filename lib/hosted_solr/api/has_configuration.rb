require 'active_support/concern'
require 'hosted_solr/api/configuration_sugar'

module HostedSolr
  module API
    module HasConfiguration
      extend ActiveSupport::Concern

      included do
        def self.configuration
          HostedSolr::API.configuration
        end

        def configuration
          self.class.configuration
        end
      end
    end
  end
end
