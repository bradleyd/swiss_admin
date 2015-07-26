require 'sinatra'
require "json"
require_relative "../hardware"
require_relative "../host"
require_relative "../network"

module SwissAdmin
  class HostInfo < Sinatra::Base
    helpers do
      def generate_json(message)
        JSON.generate(message)
      end

      def run_plugin(klass, params)
        begin
          generate_json(params[:plugin] =>  klass.send(params[:plugin]))
        rescue NoMethodError => e
          generate_json(error: "Plugin not implemented correctly or does not exist")
        end
      end
    end

    get '/test' do
      "hello world"
    end

    get "/info" do
      @memory       = SwissAdmin::Hardware.memory
      @host_name    = SwissAdmin::Host.name
      @users        = SwissAdmin::User.active
      @load_average = SwissAdmin::Host.loadavg
      @cpus         = SwissAdmin::Hardware.cpus
      @ip_addresses = SwissAdmin::Network.ip_addresses
      erb :info
    end

    #### api

    ## host
    get "/api/host/:plugin" do
      run_plugin(SwissAdmin::Host, params)
    end

    ## hardware
    get "/api/hardware/:plugin" do
      run_plugin(SwissAdmin::Hardware, params)
    end

    ## User
    get "/api/users/:plugin" do
      run_plugin(SwissAdmin::User, params)
    end

    ## Network
    get "/api/network/:plugin" do
      run_plugin(SwissAdmin::Network, params)
    end

  end
end
