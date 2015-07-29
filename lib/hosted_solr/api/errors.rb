module HostedSolr
  module API
    class Error < RuntimeError
    end

    class APITokenMissingError < Error
    end

    class SecretTokenMissingError < Error
    end
  end
end
