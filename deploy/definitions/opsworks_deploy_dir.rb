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
  direcotry "#{params[:path]}/shared/uploads" do
    group params[:group]
    owner "www-data"
    mode 0775
    action :create
    recursive true
  end

end
