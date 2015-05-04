module Organicat
  class DSL::Context::Repository
    attr_reader :result

    def initialize(name, &block)
      @result = OpenStruct.new({
        name: name,
        members: [],
        organizations: []
      })

      instance_eval(&block)
    end

    private

    def members(repository_members)
      @result.members = repository_members
    end

    def organizations(repository_organizations)
      @result.organizations = repository_organizations
    end
  end
end
