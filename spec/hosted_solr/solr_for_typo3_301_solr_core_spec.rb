require 'spec_helper'

describe HostedSolr::API::SolrForTypo3301SolrCore do
  subject { HostedSolr::API::SolrForTypo3301SolrCore.new 'core_name', 'german' }

  it 'is a SolrCore object' do
    expect(subject).to be_a(HostedSolr::API::SolrCore)
  end

  it 'has a preconfigured system of typo3' do
    expect(subject.system).to eq 'typo3'
  end

  it 'has a Solr version of 4.8' do
    expect(subject.solr_version).to eq '4.8'
  end
end
