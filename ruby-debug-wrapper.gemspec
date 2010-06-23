# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{ruby-debug-wrapper}
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Pavel Chipiga"]
  s.date = %q{2010-06-23}
  s.description = %q{Just wrapper which simplify debugging with ruby-debug over Bundler + RVM with different Ruby versions}
  s.email = %q{pavel.chipiga@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    ".document",
     ".gitignore",
     "LICENSE",
     "README.rdoc",
     "Rakefile",
     "VERSION",
     "lib/ruby-debug-wrapper.rb",
     "ruby-debug-wrapper.gemspec",
     "test/helper.rb",
     "test/test_ruby-debug-wrapper.rb"
  ]
  s.homepage = %q{http://github.com/chipiga/ruby-debug-wrapper}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Wrapper which simplify debugging across different Ruby versions}
  s.test_files = [
    "test/helper.rb",
     "test/test_ruby-debug-wrapper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end

