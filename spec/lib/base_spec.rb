require 'spec_helper'
module EasyTable
  describe Base do
    subject { Base.new([]) }

    context "tds" do
      before { subject.tds :id, :name, :age}

      it { should have(3).columns}

    end

  end
end
