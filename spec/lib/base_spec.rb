require 'spec_helper'
module EasyTable
  describe Base do
    subject { Base.new([]) }

    context "tds" do
      before { subject.tds :id, :name, :age}

      it { should have(3).columns}

    end

    context "td" do
      it "using custom Column class" do
        IdColumn = Class.new(Column)
        subject.td :id, using:IdColumn
        subject.columns.first.should be_kind_of(IdColumn)
      end
    end

  end
end
