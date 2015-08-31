require 'spec_helper'

describe HostedSolr::API::MagentoSolrBridgeSearchSolrCore do
  subject { HostedSolr::API::MagentoSolrBridgeSearchSolrCore.new 'core_name' }

  it 'is a SolrCore object' do
    expect(subject).to be_a(HostedSolr::API::SolrCore)
  end

  it 'has a preconfigured system of solrbridge' do
    expect(subject.system).to eq 'solrbridge'
  end

  it 'has a preconfigured schema of german' do
    expect(subject.schema).to eq 'german'
  end

  it 'has a preconfigured Solr version of 4.9' do
    expect(subject.solr_version).to eq '4.9'
  end
end
