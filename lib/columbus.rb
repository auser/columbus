$:.unshift(File.dirname(__FILE__) + "/columbus")
require "rubygems"
require "dnssd"

$:.unshift(File.dirname(__FILE__) + "/../vendor/gems")
require "git-style-binaries/lib/git-style-binary"

require "server"
require "client"

module Columbus
end