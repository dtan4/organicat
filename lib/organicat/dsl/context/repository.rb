module Organicat
  class DSL::Context::Repository
    attr_reader :result

    def initialize(name, &block)
      @result = OpenStruct.new({
        name: name,
        members: [],
        teams: []
      })

      instance_eval(&block)
    end

    private

    def members(repository_members)
      @result.members = repository_members
    end

    def teams(repository_teams)
      @result.teams = repository_teams
    end
  end
end
