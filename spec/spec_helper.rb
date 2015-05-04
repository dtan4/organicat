require "codeclimate-test-reporter"
CodeClimate::TestReporter.start

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'organicat'

require "rspec/its"
require "tempfile"

class OrgFile
  class << self
    def create
      Tempfile.open("orgfile") do |f|
        f.puts(yield)
        f.path
      end
    end
  end
end
