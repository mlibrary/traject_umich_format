begin
  require 'bundler'
rescue LoadError => e
  warn e.message
  warn "Run `gem install bundler` to install Bundler."
  exit e.status_code
end

begin
  Bundler.setup(:default, :development, :test)
rescue Bundler::BundlerError => e
  warn e.message
  warn "Run `bundle install` to install missing gems."
  exit e.status_code
end

def support_file_path(relative_path)
  return File.expand_path(File.join("spec_support", relative_path), File.dirname(__FILE__))
end


require "minitest/autorun"
# require 'minitest/hell' # parallelize testing
