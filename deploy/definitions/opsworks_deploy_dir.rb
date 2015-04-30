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
  
  201{1..5}/{01..12}
  
  5.times do |i|
    main_dir = 2011 + i
    directory "#{params[:path]}/shared/uploads/#{main_dir}" do
      group node[:apache][:group]
      owner node[:apache][:user]
      mode 0775
      action :create
      recursive true
    end

    12.times do |j|
      sub_dir = "%02d" % (j + 1)
      directory "#{params[:path]}/shared/uploads/#{main_dir}/#{sub_dir}" do
        group node[:apache][:group]
        owner node[:apache][:user]
        mode 0775
        action :create
        recursive true
      end
    end
  end

end
