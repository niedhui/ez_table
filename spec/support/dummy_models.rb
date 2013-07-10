DummyUser = Struct.new(:id, :name) do

  def self.human_attribute_name(attr)
    {id: 'ID', name: '名称' }[attr]
  end

end
