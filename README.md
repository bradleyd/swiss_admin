# SwissAdmin

[![Gem Version](https://badge.fury.io/rb/swiss_admin.svg)](http://badge.fury.io/rb/swiss_admin)

A generous, but not too bloated, system/host helpers for any self respecting system administrator ;)

SwissAdmin can either be included in your project or can used from the CLI.

I find it best to install swissadmin in your global gemset.

### This only works on Linux

## Things that make swissadmin cool.

1. It offers just the right amount of information about the system/host your are running it on.
2. Provides a web server for REST calls.
3. Provides a DRb server to query host for information. (see todo)
4. Everytime you use it puppies and rainbows shoot into the sky.

There a tons of tools that do similar stuff, but I find them to contain way to much information.
I do not have the brain capacity to remember all those arguments and parsing features. 


## Installation

Add this line to your application's Gemfile:

    gem 'swiss_admin'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install swiss_admin

## Usage

* only commands listed below are funcitonal currenlty

```bash
Commands:
  swissadmin hardware SUBCOMMAND  # Returns information about host hardware
  swissadmin help [COMMAND]       # Describe available commands or one specific command
  swissadmin host SUBCOMMAND      # Returns information about the host
  swissadmin network SUBCOMMAND   # Returns information about host network
  swissadmin user SUBCOMMAND      # Returns information about user(s) on host
```

### Hardware 
List information about the host's hardware

```bash
Commands:
  swissadmin hardware cpus            # Number of cpu's
  swissadmin hardware help [COMMAND]  # Describe subcommands or one specific subcommand
  swissadmin hardware memory          # memory for host
```

```ruby 
swissadmin hardware cpus #=> 4
```

```ruby 
swissadmin hardware memory #=> 
MemTotal           7873568
MemFree            3731188
Buffers            164064
.....
```

### Host

Returns information about the host

```bash
commands:
  swissadmin host help [COMMAND]  # Describe subcommands or one specific subcommand
  swissadmin host name            # Hostname
  swissadmin host loadavg         # Current system load 
```

```ruby
swissadmin host name #=> foo.local
```

```ruby
# 1,5,15,number of currently running processes/total number of processes, pid
swissadmin host loadavg #=> 0.10 0.19 0.23 1/742 24553
```

### Network

Return information about the host's network 

```bash
Commands:
  swissadmin network first_ipv4      # First ipv4 interface
  swissadmin network help [COMMAND]  # Describe subcommands or one specific subcommand
  swissadmin network ip_addresses    # All the ip addresses on this host
```

```ruby 
swissadmin host ip_addresses #=> {:ip_address=>"127.0.0.1", :name=>["localhost", "0"]}
{:ip_address=>"192.168.4.34", :name=>["bradleyd-900X4C.local", "0"]}
{:ip_address=>"::1", :name=>["ip6-localhost", "0"]}
{:ip_address=>"fe80::c685:8ff:fe72:beab%wlan0", :name=>["fe80::c685:8ff:fe72:beab%wlan0", "0"]}
```

```ruby 
swissadmin host first_ipv4 #=> 192.168.0.5
```

### User

Return information about user(s)

```bash
Commands:
  swissadmin user active          # All active users
  swissadmin user current         # Current user
  swissadmin user help [COMMAND]  # Describe subcommands or one specific subcommand
  swissadmin user home            # Current user's home directory
```

```ruby
swissadmin user active #=>
bradleyd tty7     :0                2days init --user
bradleyd pts/0    :0               57:24  bash
bradleyd pts/3    :0                1:06m bash
bradleyd pts/8    :0.0              4.00s w -s -h
```

```ruby
swissadmin user current #=> bradleyd
```

```ruby
swissadmin user home #=> /home/bradleyd
```

### Web
```bash
Commands:
  swissadmin web help [COMMAND]  # Describe subcommands or one specific subcommand
  swissadmin web start           # Start web server
  Usage:
  swissadmin start
Options:
  -p, [--port=PORT]  # Set port for web companion
                     # Default: 8080

  swissadmin web stop            # Stop web server
  swissadmin web status          # Status of the web server
```

```ruby
swissadmin web start
```
This also gives you an API which you can query

Every CLI command can be accessed via the REST API

```ruby
curl localhost:8080/api/host/loadavg #=> {"load_average":"0.29 0.29 0.28 2/972 27659\n"}
```
## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Add a new command
### This is a work in progress and might not be worth a dam

To add a new command you must understand the directory structures of ```lib/``` and ```cli/```

### lib/

```bash
lib/swiss_admin/
├── hardware
│   ├── cpus.rb
│   └── memory.rb
├── host
│   └── host.rb
├── network
│   └── network.rb
├── user
│   └── user.rb
```

### cli/
```bash
lib/swiss_admin/cli/
├── cli.rb
├── hardware_cli.rb
├── host_cli.rb
├── network_cli.rb
└── user_cli.rb
```

Let's say you have a need for a command called--you guessed it--```foo```

```foo``` will give you the ultimate answer.

* I will assume you have written tests for ```foo``` you know who you are!

If ```foo``` does not fit in any category from ```lib/``` then you would create a new one.  

Create a file and directory called foo and adjust to your liking.

```ruby
# foo/foo.rb
module SwissAdmin
  class Foo
    def self.answer
      "42"
    end
  end
end
```

Run your tests...green I presume.

Create another file under ```cli/``` cleverly called ```foo_cli.rb```

```ruby 
module SwissAdmin
  module Commands
    class Foo < Thor
      namespace :foo

      desc "answer", "ultimate answer"
      def answer
        $stdout.puts SwissAdmin::Foo.answer
      end

    end
  end
end
```

* Note, we are calling ```Foo``` class from ```lib/``` instead of just creating it here
* This is so we can use ```swissadmin``` as library in another project and forgo the CLI


Next, we need to tell ```CLI``` about this new command.

```ruby
#lib/cli/cli.rb

module SwissAdmin
  class CLI < Thor
    #....snippet....
    desc "foo SUBCOMMAND", "Returns the ultimate answer"
    subcommand "foo", SwissAdmin::Commands::Foo
  end
end
```

This will give ```swissadmin``` the ultimate power and bestow it upon you ;)

```ruby
swissadmin foo answer #=> 42
```

### TODO

* create DRB server
* Lock down web server with basic auth or token
* Show all commands available in CLI
* Show all commands available in Web
* Write pid, port file path to `~/.swissadmin/.web.conf
