require 'spec_helper'
require 'uri'

describe HostedSolr::API::SolrCore do
  subject { HostedSolr::API::SolrCore.new }

  %i[id solr_version system schema name internal_name password host is_activated created_at updated_at].each do |attribute_name|
    it "has an attribute #{attribute_name}" do
      expect(subject).to respond_to(attribute_name)
    end
  end

  %i[solr_version system name].each do |attribute_name|
    it "requires presence of #{attribute_name}" do
      expect(subject).to validate_presence_of(attribute_name)
    end
  end

  %i[id solr_version system schema name internal_name password host is_activated created_at updated_at].each do |attribute_name|
    it "accepts an attribute #{attribute_name} when initialize from a hash" do
      core = HostedSolr::API::SolrCore.from_hash(attribute_name.to_s => 'some value')
      expect(core.send(attribute_name)).to eq 'some value'
    end
  end

  it 'has a port value of 443' do
    expect(subject.port).to eq 443
  end

  it 'has a protocol value of https' do
    expect(subject.protocol).to eq 'https'
  end

  it 'generates a connection URI from given parts' do
    subject.host = 'nodename.hosted-solr.com'
    subject.internal_name = 'abcd1234-my-index-name'
    subject.password = 'p4ssw0rd'
    expect(subject.connection_uri).to eq URI('https://abcd1234-my-index-name:p4ssw0rd@nodename.hosted-solr.com/abcd1234-my-index-name/core')
  end
end
