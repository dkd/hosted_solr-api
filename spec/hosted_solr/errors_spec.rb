require 'spec_helper'

describe HostedSolr::API::Error do
  it 'should be a subclass of RuntimeError' do
    expect(subject).to be_a RuntimeError
  end
end

describe HostedSolr::API::APITokenMissingError do
  it 'should be a subclass of HostedSolr::API::Error' do
    expect(subject).to be_a HostedSolr::API::Error
  end

  it 'has a message about missing API token' do
    expect(subject.message).to eq 'Please configure Hosted Solr API token or set HOSTED_SOLR_API_TOKEN environment variable.'
  end
end

describe HostedSolr::API::SecretTokenMissingError do
  it 'should be a subclass of HostedSolr::API::Error' do
    expect(subject).to be_a HostedSolr::API::Error
  end

  it 'has a message about missing Secret token' do
    expect(subject.message).to eq 'Please configure Hosted Solr Secret token or set HOSTED_SOLR_SECRET_TOKEN environment variable.'
  end
end
