require 'spec_helper'
module EasyTable
  describe Builder do
    let(:view) { ActionView::Base.new }
    let(:users) { [Hashie::Mash.new({id: 1, name: 'jack'})]}
    subject do
      view.easy_table_for(users) do |table|
        table.td :id
        table.td :name
      end
    end
    context "table header" do
      it { should have_xpath("//table/tr/th[text()='id']")}
      it { should have_xpath("//table/tr/th[text()='name']")}
    end

    context "table body" do
      it { should have(2).trs}
      it { should have_xpath("//table/tr/td[text()='1']")}
      it { should have_xpath("//table/tr/td[text()='jack']")}

    end

  end
end
