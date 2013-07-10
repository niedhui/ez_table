# encoding: utf-8
require 'spec_helper'
module EasyTable
  describe Column do
    let(:table) { Base.new([]) }
    context "header" do
      it "should ok if model_class is not exist" do
        table = Base.new([])
        column = Column.new(:name)
        column.header(table, nil).should == 'name'
      end

      it "should using human attribute name" do
        table = Base.new([], model_class: DummyUser)
        column = Column.new(:name)
        column.header(table, nil).should == '名称'
      end

      it "should using options header first" do
        column = Column.new(:name, header: 'Name')
        column.header(table, nil).should == 'Name'
      end

    end
  end

end
