require 'active_rest_client'
require 'hosted_solr/api/has_configuration'
require 'hosted_solr/api/solr_core'

module HostedSolr
  module API
    class SolrCoresAPIClient < ActiveRestClient::Base
      include HostedSolr::API::HasConfiguration

      request_body_type :json

      class << self
        def solr_cores_path(suffix = '')
          "/solr_cores#{suffix}"
        end

        def configured_authentication_params
          {
            api_token: configuration.api_token,
            secret_token: configuration.secret_token
          }
        end
      end

      base_url configuration.base_url

      get :all, solr_cores_path
      post :create, solr_cores_path
      delete :destroy, solr_cores_path('/:id')

      before_request do |_, request|
        request.get_params.merge!(configured_authentication_params)
      end
    end
  end
end
