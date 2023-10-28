# SwissAdmin

[![Gem Version](https://badge.fury.io/rb/swiss_admin.svg)](http://badge.fury.io/rb/swiss_admin)

[![Build Status](https://travis-ci.org/bradleyd/swiss_admin.svg)](https://travis-ci.org/bradleyd/swiss_admin)

A generous, but not too bloated, system/host helpers for any self respecting system administrator ;)

SwissAdmin can either be included in your project or can used from the CLI.

I find it best to install swissadmin in your global gemset.

### This only works on Linux

## Things that make swissadmin cool.

1. It offers just the right amount of information about the system/host your are running it on.
2. Provides a web server that you can query over the network.
3. Easy to add new commands.

There are tons of tools that do similar stuff, but I find them to contain way too much information.

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

With formatting.
```ruby 
swissadmin hardware cpus -f json 
{\"cpus\":10}
```

Table output

```ruby 
swissadmin hardware cpus -f table
  +------+
  | cpus |
  +------+
  | 10   |
  +------+
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
swissadmin network ip_addresses
name=localhost,address=127.0.0.1
name=9dc94f18162e,address=172.17.0.2
```

Table view

```ruby
swissadmin network ip_addresses -f table
  +------------+--------------+
  | ip_address | name         |
  +------------+--------------+
  | 127.0.0.1  | localhost    |
  +------------+--------------+
  | 172.17.0.2 | 9dc94f18162e |
  +------------+--------------
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

### TODO

* create DRB server
* Lock down web server with basic auth or token
* Show all commands available in CLI
* Show all commands available in Web
* Write pid, port file path to `~/.swissadmin/.web.conf

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request


