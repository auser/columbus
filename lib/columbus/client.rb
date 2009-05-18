=begin rdoc
  Columbus Dns-sd lookup
  
  Client
=end
require "set"

module Columbus
  class FoundService
    attr_accessor :name, :host, :port, :description
    def initialize(name, host, port, description)
      @name = name
      @host = host
      @port = port
      @description = description
    end
  end
  class Client
    class << self
      
      attr_accessor :discover_type
      
      def discover_type
        @discover_type ||= "_presence._tcp"
      end
      
      def discover(timeout=5)
        waiting_thread = Thread.current

        dns = DNSSD.browse discover_type do |reply|
          DNSSD.resolve reply.name, reply.type, reply.domain do |resolve_reply|
            service = FoundService.new(reply.name,
                                      resolve_reply.target,
                                      resolve_reply.port,
                                      (resolve_reply.text_record['description'].to_s rescue ""))
            begin
              yield service
            rescue Done
              waiting_thread.run
            end
          end
        end
        puts "Gathering for up to #{timeout} seconds for #{discover_type}..."
        sleep timeout
        dns.stop
      end

      def service_list
        list = Set.new
        discover { |obj| list << obj }
        return list
      end

      def list
        service_list.each do |service|
          puts "=== #{service.name} on #{service.host}:#{service.port} ==="
          puts " found #{service.name}"
          puts "    #{service.description}"
        end
      end
      
    end
  end
end