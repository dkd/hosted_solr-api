# HostedSolr::API

[![Gem Version](https://badge.fury.io/rb/hosted_solr-api.svg)](http://badge.fury.io/rb/hosted_solr-api) [![Build Status](https://travis-ci.org/dkd/hosted_solr-api.svg?branch=master)](https://travis-ci.org/dkd/hosted_solr-api) [![Coverage Status](https://coveralls.io/repos/dkd/hosted_solr-api/badge.svg?branch=master&service=github)](https://coveralls.io/github/dkd/hosted_solr-api?branch=master)


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

#### 1. Create new Solr Cores

This Rubygem ships with preconfigured SolrCore objects of all supported systems. See section "Available Core Configurations" for more details. Let's create a first generic Solr Core:

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

#### 2. Checking status of existing Solr Cores

To check the status and configuration of your Cores use the following:

```Ruby
all_cores = client.all_solr_cores

first_core = all_cores.first
first_core.name # => 'my-new-solr-core'; assuming, we created the Core above
first_core.id   # => 675

first_core.connection_uri.to_s # => 'https://b9a3e9c5c85-my-little-solr-index:ec397fb47bf@97a04a.hosted-solr.com/b9a3e9c5c85-my-new-solr-core/core'
```

#### 3. Destroying Solr Cores

Existing Cores can be destroyed as well:

```Ruby
client.destroy_solr_core solr_core # either SolrCore object or id
```

### Available Core Configurations

Only following system configurations are supported:

|System|Class Name|system|schema|solr_version|
|:---|:---|:---|---:|---:|
|[TYPO3](https://typo3.org/extensions/repository/view/solr/)|`SolrForTypo320xSolrCore` or `SolrForTypo3301SolrCore`|`typo3`|`german` or `english`|`3.6` or `4.8`|
|[Sunspot](https://sunspot.github.io/)|`SunspotSolrCore`|`sunspot`|`standard`|`3.5`|
|[Magento](http://magento.com/)|`MagentoSolrCore`|`magento`|`german` or `english`|`3.6` or `4.8`|
|[Magento Solr Bridge Search](http://www.magentocommerce.com/magento-connect/solr-bridge-search.html)|`MagentoSolrBridgeSearchSolrCore`|`solrbridge`|`german`|`4.9`|
|[Drupal](https://www.drupal.org/)|`DrupalSolrCore`|`drupal`|`standard`|`4.8`|

Every given class name is a from SolrCore rerived class, which simplifies creation of new cores. Following constructors are available:

```ruby
# Solr for TYPO3 v2.0.x
core = SolrForTypo320xSolrCore.new 'core_name'

# Solr for TYPO3 v3.0.1
core = SolrForTypo3301SolrCore.new 'core_name'

# Sunspot
core = SunspotSolrCore.new 'core_name'

# Magento
core = MagentoSolrCore.new 'core_name', 'german', '3.6' # see available options above

# Magento Solr Bridge Search
core = MagentoSolrBridgeSearchSolrCore.new 'core_name'

# Drupal
core = DrupalSolrCore.new 'core_name'
```


## Contributing

Bug reports and pull requests are welcome on [GitHub](https://github.com/dkd/hosted_solr-api).


## License

The Rubygem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).


## Credits

[![dkd](assets/images/dkd_logo.png)](https://dkd.de/)

* Nicolai Reuschling
