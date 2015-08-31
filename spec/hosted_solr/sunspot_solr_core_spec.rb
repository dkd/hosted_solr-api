require 'spec_helper'

describe HostedSolr::API::SunspotSolrCore do
  subject { HostedSolr::API::SunspotSolrCore.new 'core_name' }

  it 'is a SolrCore object' do
    expect(subject).to be_a(HostedSolr::API::SolrCore)
  end

  it 'has a preconfigured system of sunspot' do
    expect(subject.system).to eq 'sunspot'
  end

  it 'has a preconfigured schema of standard' do
    expect(subject.schema).to eq 'standard'
  end

  it 'has a Solr version of 3.5' do
    expect(subject.solr_version).to eq '3.5'
  end
end
