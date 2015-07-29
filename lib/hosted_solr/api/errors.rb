module HostedSolr
  module API
    class Error < RuntimeError
    end

    class APITokenMissingError < Error
      def message
        'Please provide/configure Hosted Solr API token or set HOSTED_SOLR_API_TOKEN environment variable.'
      end
    end

    class SecretTokenMissingError < Error
      def message
        'Please provide/configure Hosted Solr Secret token or set HOSTED_SOLR_SECRET_TOKEN environment variable.'
      end
    end
  end
end
