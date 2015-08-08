module Organicat
  class DSL::Context::Team
    attr_reader :result

    def initialize(name, &block)
      @result = OpenStruct.new({
        name: name,
      })

      instance_eval(&block)
    end

    private

    def members(team_members)
      @result.members = team_members
    end
  end
end
