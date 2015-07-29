require 'hosted_solr/api/version'
require 'hosted_solr/api/errors'
require 'hosted_solr/api/configuration'
require 'hosted_solr/api/client'

module HostedSolr
  module API
    class << self
      attr_accessor :configuration

      def configuration
        @configuration ||= Configuration.new
      end

      def configure
        yield(configuration)
      end
    end
  end
end
