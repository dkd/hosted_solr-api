require 'spec_helper'

describe HostedSolr::API::Configuration do
  subject { HostedSolr::API::Configuration.new }

  it 'has a default base_url pointing to hosted-solr.com' do
    expect(subject.base_url).to eq 'https://www.hosted-solr.com/api'
  end

  it 'allows to set an API token' do
    expect(subject).to respond_to(:api_token=)
  end

  it 'allows to set an Secret token' do
    expect(subject).to respond_to(:secret_token=)
  end

  it 'allows to read the API token' do
    subject.api_token = 'my API token'
    expect(subject.api_token).to eq 'my API token'
  end

  it 'allows to read the Secret token' do
    subject.secret_token = 'my Secret token'
    expect(subject.secret_token).to eq 'my Secret token'
  end

  it 'falls back to env variable HOSTED_SOLR_API_TOKEN when reading the API token' do
    ENV['HOSTED_SOLR_API_TOKEN'] = 'my API token via env'
    expect(subject.api_token).to eq 'my API token via env'
    ENV['HOSTED_SOLR_API_TOKEN'] = nil # don't let ENV setting leak into other specs
  end

  it 'falls back to env variable HOSTED_SOLR_SECRET_TOKEN when reading the Secret token' do
    ENV['HOSTED_SOLR_SECRET_TOKEN'] = 'my Secret token via env'
    expect(subject.secret_token).to eq 'my Secret token via env'
    ENV['HOSTED_SOLR_SECRET_TOKEN'] = nil # don't let ENV setting leak into other specs
  end
end
