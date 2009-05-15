require 'test_helper'

class ColumbusTest < Test::Unit::TestCase
  should "be able to get the ip" do
    assert_equal Columbus::Server.map_ip_to_interface.class, Hash
  end
  %w(mac vmware).each do |n|
    should "be able to parse data on #{n}" do
      data = open(::File.dirname(__FILE__) + "/fixtures/ifconfig-#{n}").read
      assert_equal Columbus::Server.map_ip_to_interface(data)["vmnet1"], "172.16.66.1"
    end
  end
  should "have an text_record" do
    assert_equal Columbus::Server.text_record.class, DNSSD::TextRecord
  end
end
