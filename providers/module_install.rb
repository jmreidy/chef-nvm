action :install do
  bash "Installing module #{new_resource.module}..." do
    user new_resource.user
    cwd user_home
    code <<-EOH
      export HOME=#{user_home}
      source #{node['nvm']['directory']}/nvm.sh
      nvm use #{new_resource.node_version}
      npm install #{module_name}
    EOH
  end
  new_resource.updated_by_last_action(true)
end

def user_home
  return nil unless new_resource.user
  Etc.getpwnam(new_resource.user).dir
end

def module_name
  name = new_resource.module
  name += "@#{new_resource.version}" if new_resource.version
  name
end
