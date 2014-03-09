require 'sinatra'
require "json"
require_relative "../hardware"
require_relative "../host"
require_relative "../network"

module SwissAdmin
  class HostInfo < Sinatra::Base
    get '/test' do
      "hello world"
    end

    get "/host_info" do
      @memory       = SwissAdmin::Hardware.memory.inject({}) { |a,d| a[d[0]] = d[1]; a }
      @host_name    = SwissAdmin::Host.name
      @load_average = SwissAdmin::Host.loadavg
      @cpus         = SwissAdmin::Hardware.cpus
      @ip_addresses = SwissAdmin::Network.ip_addresses
      erb :info
    end

    #### api
    ## host
    get "/api/host/name" do
      JSON.generate(host_name: SwissAdmin::Host.name)
    end

    get "/api/host/loadavg" do
      JSON.generate(load_average: SwissAdmin::Host.loadavg)
    end

    ## hardware
    get "/api/hardware/memory" do
      JSON.generate(SwissAdmin::Hardware.memory.inject({}) { |a,d| a[d[0]] = d[1]; a })
    end

    get "/api/hardware/cpus" do
      JSON.generate(cpus: SwissAdmin::Hardware.cpus)
    end


  end
end
