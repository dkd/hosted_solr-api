require 'hosted_solr/api/configuration'

module HostedSolr
  module API
    class << self
      attr_accessor :configuration

      def configuration
        @configuration ||= Configuration.new
      end

      def configure
        yield configuration
      end
    end
  end
end
