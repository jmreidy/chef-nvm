include_recipe 'git'

git node['nvm']['directory'] do
  repository node['nvm']['repository']
  reference node['nvm']['reference']
  user node['nvm']['user']
  group node['nvm']['group']
  action :sync
end

template '/etc/profile.d/nvm.sh' do
  source 'nvm.sh.erb'
  mode 0755
end

Array(node['nvm']['nodes']).each do |n|
  user = node['nvm']['user']
  version = n['version']

  nvm_install "#{version}" do
    user user
  end

  nvm_alias "#{version}" do
    node_alias n['alias']
    user user
  end

  Array(n['modules']).each do |mod|

    nvm_module_install "#{mod['name']}" do
      user user
      node_version version
      version mod['version']
    end
  end
end
