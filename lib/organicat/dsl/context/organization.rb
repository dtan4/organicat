module Organicat
  class DSL::Context::Organization
    attr_reader :result

    def initialize(name, &block)
      @result = OpenStruct.new({
        name: name,
      })

      instance_eval(&block)
    end

    private

    def members(organization_members)
      @result.members = organization_members
    end
  end
end
