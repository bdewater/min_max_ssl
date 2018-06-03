# MinMaxSSL

This gem backports `Net::HTTP#min_version=` and `#max_version=` from Ruby 2.5. These are more flexible than `#ssl_version=` which locks the connection to allow only one specific version, and close the door on future versions down the road (TLS 1.3).

The motivation for this gem is guaranteeing client side compliance with the PCI Data Security Standard (PCI DSS) [June 30 2018 deadline](https://blog.pcisecuritystandards.org/are-you-ready-for-30-june-2018-sayin-goodbye-to-ssl-early-tls) for phasing out TLS 1.0 connections for safeguarding credit card payment data.

The heavy lifting is [done by](https://github.com/ruby/openssl/pull/142) OpenSSL gem 2.1+, which is only compatible with Ruby 2.3 and 2.4.

## Installation

Add the following line to your application's Gemfile:

```ruby
gem 'min_max_ssl'
```

If you have a gem that uses feature detection of `#min_version=`, you might need to add this line before that gem definition.

## Usage

```ruby
uri = URI("https://tls-1-1-and-higher-only.example.com/")
http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true
http.min_version = :TLS1_1
http.get("/") # everything works

```

```ruby
uri = URI("https://tls-1-1-and-higher-only.example.com/")
http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true
http.max_version = :TLS1_0
http.get("/") # raises OpenSSL::SSL::SSLError: SSL_connect returned=1 errno=0 state=SSLv2/v3 read server hello A: unsupported protocol
```

## License

The gem is available as open source under the terms of the [Ruby License](https://www.ruby-lang.org/en/about/license.txt), like the original work by @nurse in https://github.com/ruby/ruby/commit/dcea9198a9d80bdf4eeacd9d9e9d883850a4a8d2 
