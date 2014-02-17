# SwissAdmin

A generous, but not too bloated, system/host helpers for any self respecting system administrator ;)

SwissAdmin can either be included in your project or can used from the CLI.

I find it best to install swissadmin in your global gemset.

### This only works on Linux

## Things that make swissadmin cool.

1. It offers just the right amount of information about the system/host your are running it on.
2. Provides a TCP server for network testing. 
3. Provides a DRb server to query host for information.
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
```

```ruby
swissadmin host name #=> foo.local
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
  swissadmin user current         # Current user
  swissadmin user help [COMMAND]  # Describe subcommands or one specific subcommand
  swissadmin user home            # Current user's home directory
```

``ruby
swissadmin user current #=> bradleyd
```

```ruby
swissadmin user home #=> /home/bradleyd
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
