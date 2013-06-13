include Chef::Rbenv::ScriptHelpers

action :install do
  bash "Installing node.js #{new_resource.version}..." do
    user new_resource.user
    code <<-EOH
      source #{node['nvm']['directory']}/nvm.sh
      nvm install #{new_resource.version}
    EOH
  end
  new_resource.updated_by_last_action(true)
end
