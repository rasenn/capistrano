# required user, local_home_dir, role :chef


task :chef_prepare, :roles => [:chef] do
  run "#{sudo} apt-get update"
  run "#{sudo} sh -c \"echo '#{user} ALL=(ALL) NOPASSWD:ALL' >>  /etc/sudoers\"" 
  upload("#{local_home_dir}/.ssh/id_rsa.pub", "id_rsa.pub",{ :via => :sftp , :mkdir => true })
  run "cat ~/id_rsa.pub >> ~/.ssh/authorized_keys"
  run "rm ~/id_rsa.pub"
end
