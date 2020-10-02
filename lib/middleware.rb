# frozen_string_literal: true

module SimpleRackApp
  module Middleware
    HTTP_HOST         = 'HTTP_HOST'
    HTTP_PORT         = 'HTTP_PORT'
    HTTPS             = 'HTTPS'
    PATH_INFO         = 'PATH_INFO'
    REQUEST_METHOD    = 'REQUEST_METHOD'
    REQUEST_PATH      = 'REQUEST_PATH'
    SCRIPT_NAME       = 'SCRIPT_NAME'
    QUERY_STRING      = 'QUERY_STRING'
    SERVER_PROTOCOL   = 'SERVER_PROTOCOL'
    SERVER_NAME       = 'SERVER_NAME'
    SERVER_PORT       = 'SERVER_PORT'
    CACHE_CONTROL     = 'Cache-Control'
    EXPIRES           = 'Expires'
    CONTENT_LENGTH    = 'Content-Length'
    CONTENT_TYPE      = 'Content-Type'
    SET_COOKIE        = 'Set-Cookie'
    TRANSFER_ENCODING = 'Transfer-Encoding'
    HTTP_COOKIE       = 'HTTP_COOKIE'
    ETAG              = 'ETag'

    RACK_ERRORS       = 'rack.errors'
  end
end
