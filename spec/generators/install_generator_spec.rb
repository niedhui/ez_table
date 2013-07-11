require 'spec_helper'
require 'rails/version'
require 'generators/easy_table/install_generator'
require 'ammeter/init'
describe EasyTable::Generators::InstallGenerator do

  before { run_generator }

  it "generate config/initializers/easy_table.rb" do
    File.read(file('config/initializers/easy_table.rb')).should =~ /EasyTable::Config.configure/
  end

  it "create index.html.slim on lib" do
    File.read(file('lib/templates/slim/scaffold/index.html.slim')).should =~ /easy_table_for/
  end

end
