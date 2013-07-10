EasyTable
===============

This project rocks and uses MIT-LICENSE.

Installation
===============

```ruby
  gem 'nie_easy_table',  require: 'easy_table'
```

Usage
===============

Run the generator:

```console
rails g easy_table:install
```

this will create a initializer file named **easy_table.rb**, which you can
config some html option for your table

To Start using **easy_table**, you just have to use the easy_table_for helper

```slim
  = easy_table_for(@users) do |t|
    - t.td :id
    - t.td :name,  header: 'user name'
    - t.action do |user|
      = link_to "View User", user_path(user)
```

You can custom the td(column) output with a block,

```slim
  - t.td(:name) { |user| "Hello #{user.name}"}
```

You can provide a model_class option for `easy_table_for` helper,

```
  = easy_table_for(@users , model_class: User)
```

then the table header will using User.human_attribute_name(attr) for
output

if the current controller is UsersController, the model_class can be
omitted.


TODO
===============

  - [ ] I18n header
  - [ ] custom header using options
  - [x] guess model_class from current controller
  - [x] guess model_class from current controller, with namespace
  - [x] custom column using block
  - [ ] custom column using class
  - [x] add action column
  - [x] specify multiple columns using :tds
  - [x] config for action_column

