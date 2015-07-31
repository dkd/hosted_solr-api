require 'spec_helper'

describe HostedSolr::API::SolrCore do
  subject { HostedSolr::API::SolrCore.new }

  [:id, :solr_version, :system, :schema, :name, :internal_name, :password, :is_activated, :created_at, :updated_at].each do |attribute_name|
    it "has an attribute #{attribute_name}" do
      expect(subject).to respond_to(attribute_name)
    end
  end

  [:solr_version, :system, :name].each do |attribute_name|
    it "requires presence of #{attribute_name}" do
      expect(subject).to validate_presence_of(attribute_name)
    end
  end
end
