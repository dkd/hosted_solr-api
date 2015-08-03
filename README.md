# HostedSolr::Api

This Rubygem allows convient access to [Hosted Solr](https://www.hosted-solr.com/) API. You can create new Solr Cores, check the status of your Solr Cores and destroy them as well.


## Installation

Add this line to your application's Gemfile:

```Ruby
gem 'hosted_solr-api', '~> 0.1'
```

And then execute:

```Shell
$ bundle
```

Or install it yourself as:

```Shell
$ gem install hosted_solr-api
```


## Usage

### Configuration

You need to configure your API and Secret Tokens, which you find in your [Hosted Solr profile](https://www.hosted-solr.com/account/api_credentials). There are two ways to accomplish this:

1. Either set enviromental variables like this (e.g. Ubuntu):

```Shell
export HOSTED_SOLR_API_TOKEN=your-api-token
export HOSTED_SOLR_SECRET_TOKEN=your-secret-token
```

2. Set your tokens Rails-like in an included config file (`config/initializers/hosted_solr_api.rb`):

```Ruby
require 'hosted_solr/api'

HostedSolr::API.configure do |config|
  config.api_token = 'your-api-token'
  config.secret_token = 'your-secret-token'
end
```


### API calls

#### Create new Solr Cores

Let's create a new Solr Core:

```Ruby
require 'hosted_solr/api'

client = HostedSolr::API::Client.new

solr_core = HostedSolr::API::SolrCore.new name: 'my-new-solr-core',
                                          system: 'sunspot',
                                          solr_version: '3.5',
                                          schema: 'standard'

solr_core.valid? # => true, client will only accept valid Solr Core objects

client.create_solr_core solr_core
```

#### Checking status

To check the status and configuration of your Cores use the following:
 
```Ruby
all_cores = client.all_solr_cores

first_core = all_cores.first
first_core.name # => 'my-new-solr-core'; assuming, we create the Core above
first_core.id   # => 675 
```

#### Destroying Cores

Existing Cores can be destroyed as well:

```Ruby
client.destroy_solr_core solr_core # either SolrCore object or id
```

### Available Core Configuration

TODO

## Contributing

Bug reports and pull requests are welcome on [GitHub](https://github.com/dkd/hosted_solr-api).


## License

The Rubygem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

