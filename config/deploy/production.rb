
set :branch,  'master'
set :domain, "108.61.168.181"
set :rails_env, "production"
set :current_deploy_path, "/snake/unlimited/current"
# Extended Server Syntax
# ======================
# This can be used to drop a more detailed server
# definition into the server list. The second argument
# something that quacks like a hash can be used to set
# extended properties on the server.
server '108.61.168.181', user: 'root', roles: %w{web app db}, primary: true#, my_property: :my_value



set :deploy_to, '/snake/unlimited'
 set :ssh_options, {
     user: 'root', # overrides user setting above
#     keys: %w(/home/user_name/.ssh/id_rsa),
     forward_agent: false,
     #auth_methods: %w(publickey password),
     auth_methods: %w(password),
      password: '1wldnjs2'
   }


