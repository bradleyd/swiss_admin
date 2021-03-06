ENV['RACK_ENV'] = 'test'
require "socket"
require "minitest"
require "minitest/autorun"
require "minitest/pride"
require "swiss_admin"
require 'rack/test'
require File.expand_path '../../lib/swiss_admin/web/app.rb', __FILE__

module SwissAdmin
  module TestHelpers
    def self.hostname
      Socket.gethostname
    end

    def self.first_ipv4
      Socket.ip_address_list.detect{|intf| intf.ipv4_private?}.ip_address
    end

    def self.current_user
      `whoami`.strip
    end

    def self.home
      ENV["HOME"]
    end
  end
end
