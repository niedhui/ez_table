require "spec_helper"

module EasyTable
  describe ActionViewExtension do
    subject { ActionView::Base.new}

    it { should respond_to :easy_table_for }

    it " can render a table" do
      subject.easy_table_for([]).should have_tag('table')
    end
  end

end
