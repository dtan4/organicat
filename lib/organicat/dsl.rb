module Organicat
  class DSL
    def self.parse(path)
      Context.eval(path).result
    end
  end
end
