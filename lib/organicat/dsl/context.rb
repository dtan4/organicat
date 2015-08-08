module Organicat
  class DSL::Context
    def self.eval(path)
      self.new(path)
    end

    attr_reader :result

    def initialize(path)
      @result = OpenStruct.new(
        teams: [],
        repositories: [],
      )
      contents = open(path).read
      instance_eval(contents)
    end

    private

    def team(name, &block)
      @result.teams << Team.new(name, &block).result
    end

    def repository(name, &block)
      @result.repositories << Repository.new(name, &block).result
    end
  end
end
