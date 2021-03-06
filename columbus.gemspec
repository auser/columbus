# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{columbus}
  s.version = "0.0.6"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Ari Lerner"]
  s.date = %q{2009-06-02}
  s.email = %q{arilerner@mac.com}
  s.executables = ["columbus", "columbus-client", "columbus-server"]
  s.extra_rdoc_files = ["README.rdoc", "LICENSE"]
  s.files = ["README.rdoc", "VERSION.yml", "bin/columbus", "bin/columbus-client", "bin/columbus-server", "lib/columbus", "lib/columbus/client.rb", "lib/columbus/server.rb", "lib/columbus.rb", "test/columbus_client_test.rb", "test/columbus_server_test.rb", "test/fixtures", "test/fixtures/ifconfig-mac", "test/fixtures/ifconfig-vmware", "test/test_helper.rb", "LICENSE"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/auser/columbus}
  s.rdoc_options = ["--inline-source", "--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.2}
  s.summary = %q{TODO}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
