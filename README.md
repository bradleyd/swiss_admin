# SwissAdmin

A generous, but not too bloated, system/host helpers for any self respecting system administrator ;)

SwissAdmin can either be included in your project or can used from the CLI.

I find it best to install swissadmin in your global gemset.

## Things that make swissadmin cool.

1. It offers just the right amount of information about the system/host your are running it on.
2. Provides a TCP server for network testing. 
3. Provides a DRb server to send commands to the host.
4. Everytime you use it puppies and rainbows shoot into the sky

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

### Host
```ruby
swissadmin host name #=> foo.local
```

```ruby 
swissadmin host ip_addresses #> []
```

```ruby 
swissadmin host cpus #=> 4
```

```ruby 
swissadmin host first_ipv4 #=> 192.168.0.5
```


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
