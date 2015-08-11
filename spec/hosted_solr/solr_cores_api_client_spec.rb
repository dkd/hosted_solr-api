require 'spec_helper'

describe HostedSolr::API::SolrCoresAPIClient do
  it 'generate a authentication params hash from configuration' do
    HostedSolr::API.configure do |config|
      config.api_token = 'api'
      config.secret_token = 'secret'
    end

    expect(HostedSolr::API::SolrCoresAPIClient.configured_authentication_params).to eq(api_token: 'api', secret_token: 'secret')
  end
end
