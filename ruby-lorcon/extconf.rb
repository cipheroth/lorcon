#!/usr/bin/env ruby
require 'mkmf'


$CFLAGS += " -I/usr/include/lorcon2"

if ( RUBY_VERSION =~ /^(1\.8)/ )
	$CFLAGS += " -DRUBY_18"
end

if ( RUBY_VERSION =~ /^(1\.9|2\.0)/ )
	$CFLAGS += " -DRUBY_19"
end

if find_library("orcon2", "lorcon_list_drivers", "lorcon2/lorcon.h") and find_library("pcap","pcap_dispatch","pcap/phap.h")
    create_makefile("Lorcon2")
else
	puts "Error: the lorcon2 library was not found, please see the README"
end

