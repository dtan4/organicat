require "spec_helper"

module Organicat
  describe DSL do
    describe "Repository" do
      let(:orgfile) do
        OrgFile.create do
          <<-EOS
repository "dtan4/organicat" do
  members %w(hoge fuga piyo)
  teams %w(dtan4/Developer)
end
          EOS
        end
      end

      subject do
        dsl = described_class.parse(orgfile)
        dsl.repositories.first
      end

      its(:name) { is_expected.to eq "dtan4/organicat" }
      its(:members) { is_expected.to eql %w(hoge fuga piyo) }
      its(:teams) { is_expected.to eql %w(dtan4/Developer) }
    end
  end
end
