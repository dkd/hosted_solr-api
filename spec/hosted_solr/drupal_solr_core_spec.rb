require 'spec_helper'

describe HostedSolr::API::DrupalSolrCore do
  subject { HostedSolr::API::DrupalSolrCore.new 'core_name' }

  it 'is a SolrCore object' do
    expect(subject).to be_a(HostedSolr::API::SolrCore)
  end

  it 'has a preconfigured system of drupal' do
    expect(subject.system).to eq 'drupal'
  end

  it 'has a preconfigured schema of standard' do
    expect(subject.schema).to eq 'standard'
  end

  it 'has a preconfigured Solr version of 4.8' do
    expect(subject.solr_version).to eq '4.8'
  end
end
