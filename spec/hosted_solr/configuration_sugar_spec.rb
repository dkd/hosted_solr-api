require 'spec_helper'

describe HostedSolr::API do
  it 'defines an accessor for configuration' do
    expect(subject).to respond_to(:configuration)
  end

  specify '.configure yields to a configuration' do
    configuration = nil
    subject.configure do |config|
      configuration = config
    end
    expect(configuration).to be_a(HostedSolr::API::Configuration)
  end
end
