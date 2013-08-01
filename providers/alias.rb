action :create do
  bash "Aliasing #{new_resource.version} as #{new_resource.node_alias}" do
    user new_resource.user
    code <<-EOH
      source #{node['nvm']['directory']}/nvm.sh
      nvm alias #{new_resource.node_alias} #{new_resource.version}
    EOH
  end
  new_resource.updated_by_last_action(true)
end
