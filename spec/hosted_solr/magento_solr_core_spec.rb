require 'spec_helper'

describe HostedSolr::API::MagentoSolrCore do
  subject { HostedSolr::API::MagentoSolrCore.new 'core_name', '3.6', 'german' }

  it 'is a SolrCore object' do
    expect(subject).to be_a(HostedSolr::API::SolrCore)
  end

  it 'has a preconfigured system of magento' do
    expect(subject.system).to eq 'magento'
  end
end
