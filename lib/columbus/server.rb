=begin rdoc
  Columbus Dns-sd lookup
  
  Server
=end
module Columbus
  class Server
    class << self
      
      attr_accessor :name, :description
      
      def announce(interface="vmnet8", t="_presence", proto="tcp", port=9419)
        @interface = interface
        while true do
          DNSSD.register(name, "#{t}._#{proto}", 'local', port, text_record.encode) do |rr|
            vprint "."
          end
          sleep(90)
        end
      end
      
      def text_record
        @text_record = DNSSD::TextRecord.new
        @text_record['description'] = @description || map_ip_to_interface[@interface]
        @text_record
      end
      
      def map_ip_to_interface(str=ifconfig)
        out = {}
        @current_interface = nil
        str.split("\n").collect do |line|          
          iface = line.match(/^([a-zA-Z]+(\d)+)(:)?/)
          @current_interface = iface.captures.first.to_s if iface

          ip = line.match(/inet (addr:)?(\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})/i)
          if ip && @current_interface
            ip = ip.captures.compact.to_s.gsub(/addr:/, '')
            out.merge!({@current_interface => ip})
          end    
        end
        out
      end
      
      def ifconfig
        %x{ifconfig}
      end
      
    end
  end
end