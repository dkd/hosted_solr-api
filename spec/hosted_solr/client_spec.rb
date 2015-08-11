require 'spec_helper'

describe HostedSolr::API::Client do
  it 'raises an APITokenMissingError exception if API token is missing' do
    HostedSolr::API.configure do |config|
      config.api_token = nil
      config.secret_token = nil
    end

    expect { HostedSolr::API::Client.new }.to raise_error HostedSolr::API::APITokenMissingError
  end

  it 'does not raise an SecretTokenMissingError exception if API token given' do
    HostedSolr::API.configure do |config|
      config.api_token = '12345678'
      config.secret_token = nil
    end

    expect { HostedSolr::API::Client.new }.to_not raise_error HostedSolr::API::APITokenMissingError
  end

  it 'raises an SecretTokenMissingError exception if secret token is missing' do
    HostedSolr::API.configure do |config|
      config.api_token = '12345678'
      config.secret_token = nil
    end

    expect { HostedSolr::API::Client.new }.to raise_error HostedSolr::API::SecretTokenMissingError
  end

  it 'does not raise an SecretTokenMissingError exception if secret token is given' do
    HostedSolr::API.configure do |config|
      config.api_token = '12345678'
      config.secret_token = '87654321'
    end

    expect { HostedSolr::API::Client.new }.to_not raise_error HostedSolr::API::SecretTokenMissingError
  end
end
