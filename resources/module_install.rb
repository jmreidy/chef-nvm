actions :install

attribute :module, :kind_of => String, :name_attribute => true
attribute :user, :kind_of => String
attribute :version, :kind_of => String
attribute :node_version, :kind_of => String

def initialize(*args)
  super
  @action = :install
end
