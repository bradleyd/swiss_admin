require 'sinatra'
require "json"
module SwissAdmin
  class HostInfo < Sinatra::Base
    get '/test' do
      "hello world"
    end

    get "/info" do
      #fetch swiss_admin
      @memory       = SwissAdmin::Hardware.memory.inject({}) { |a,d| a[d[0]] = d[1]; a }
      @host_name    = SwissAdmin::Host.name
      @load_average = SwissAdmin::Host.loadavg
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

  end
end
