require 'spec_helper'
module EasyTable
  describe Builder do
    ::User = Struct.new(:id, :name)
    let(:view) { ActionView::Base.new }
    let(:users) { [User.new(1,'jack')]}

    before :each do
      User.stub(:human_attribute_name).with(:id).and_return('ID')
      User.stub(:human_attribute_name).with(:name).and_return('名称')
    end

    subject do
      view.easy_table_for(users) do |table|
        table.td :id
        table.td :name
        table.actions { |model| view.link_to("View #{model.name}", "")}
      end
    end

    context "table header" do
      it { should have_xpath("//table/thead/tr/th[text()='id']")}
      it { should have_xpath("//table/thead/tr/th[text()='name']")}
    end

    context "table body" do
      it { should have(2).trs}
      it { should have_xpath("//table/tbody/tr/td[text()='1']")}
      it { should have_xpath("//table/tbody/tr/td[text()='jack']")}
    end

    context "table config" do
      it { should have_tag("table.easy-table")}
      it { should have_tag("th.actions")}
    end

    context "no config for table" do
      it "should have no class" do
        Config.table_html = nil
        Nokogiri::HTML(subject).at_css('table').attr(:class).should be_blank
      end
    end

    context "i18n" do


      context "table header" do
        subject do
          view.easy_table_for(users, model_class: User) do |table|
            table.td :id
            table.td :name
          end
        end
        it { should have_xpath("//table/thead/tr/th[text()='ID']")}
        it { should have_xpath("//table/thead/tr/th[text()='名称']")}
      end

      context " guess model class using controller_name" do
        before { view.stub(:controller_name).and_return('users') }

        it { should have_xpath("//table/thead/tr/th[text()='ID']")}
        it { should have_xpath("//table/thead/tr/th[text()='名称']")}

      end
    end

    context " custom column using block" do
      subject do
        view.easy_table_for(users) do |table|
          table.td(:name) {|model| "Hi #{model.name}"  }
        end
      end
      it { should have_xpath("//table/tbody/tr/td[text()='Hi jack']")}
    end

    context " actions column" do
      it { should have_xpath("//table/tbody/tr/td/a[text()='View jack']")}
    end
  end
end
