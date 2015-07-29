require 'spec_helper'

describe HostedSolr::API::SolrCore do
  [:id, :solr_version, :system, :name, :internal_name, :password, :is_activated, :created_at, :updated_at].each do |attribute_name|
    it "has an attribute #{attribute_name}" do
      expect(HostedSolr::API::SolrCore.new).to respond_to(attribute_name)
    end
  end
end
