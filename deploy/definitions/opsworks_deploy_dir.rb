define :opsworks_deploy_dir do

  directory "#{params[:path]}/shared" do
    group params[:group]
    owner params[:user]
    mode 0775
    action :create
    recursive true
  end

  # create shared/ directory structure
  ['log','config','system','pids','scripts','sockets'].each do |dir_name|
    directory "#{params[:path]}/shared/#{dir_name}" do
      group params[:group]
      owner params[:user]
      mode 0770
      action :create
      recursive true
    end
  end

  # shared uploads directory
  directory "#{params[:path]}/shared/uploads" do
    group node[:apache][:group]
    owner node[:apache][:user]
    mode 0775
    action :create
    recursive true
  end

end
