require "spec_helper"

module Organicat
  describe DSL do
    describe "Organization" do
      let(:orgfile) do
        OrgFile.create do
          <<-EOS
organization "Developer" do
  members %w(hoge fuga piyo)
end
          EOS
        end
      end

      subject do
        dsl = described_class.parse(orgfile)
        dsl.organizations.first
      end

      its(:name) { is_expected.to eq "Developer" }
      its(:members) { is_expected.to eql %w(hoge fuga piyo) }
    end
  end
end
