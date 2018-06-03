require "min_max_ssl/version"
require "net/http"

module MinMaxSSL
  NEW_SSL_IVNAMES = ::Net::HTTP::SSL_IVNAMES + [:@min_version, :@max_version]
  ::Net::HTTP.send(:remove_const, "SSL_IVNAMES")
  ::Net::HTTP.const_set("SSL_IVNAMES", NEW_SSL_IVNAMES)

  NEW_SSL_ATTRIBUTES = ::Net::HTTP::SSL_ATTRIBUTES + [:min_version, :max_version]
  ::Net::HTTP.send(:remove_const, "SSL_ATTRIBUTES")
  ::Net::HTTP.const_set("SSL_ATTRIBUTES", NEW_SSL_ATTRIBUTES)

  ::Net::HTTP.send(:attr_accessor, :min_version)
  ::Net::HTTP.send(:attr_accessor, :max_version)
end
