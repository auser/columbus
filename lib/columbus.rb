$:.unshift(File.dirname(__FILE__) + "/columbus")
require "rubygems"
require "dnssd"

$:.unshift(File.dirname(__FILE__) + "/../vendor/gems")
begin
  require "git-style-binaries/lib/git-style-binary"
rescue Exception => e
  require "git-style-binary"
end

require "server"
require "client"

module Columbus
end