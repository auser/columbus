$:.unshift(File.dirname(__FILE__) + "/columbus")
require "rubygems"
require "dnssd"
require "server"

module Columbus  
end

# Columbus::Server.announce("vmnet8")