module Organicat
  class DSL::Context
    def self.eval(path)
      self.new(path)
    end

    attr_reader :result

    def initialize(path)
      @result = OpenStruct.new(
        organizations: [],
      )
      contents = open(path).read
      instance_eval(contents)
    end

    private

    def organization(name, &block)
      @result.organizations << Organization.new(name, &block).result
    end
  end
end
