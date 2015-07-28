require 'spec_helper'

describe HostedSolr::API do
  it 'has a version number' do
    expect(HostedSolr::API::VERSION).not_to be nil
  end
end
