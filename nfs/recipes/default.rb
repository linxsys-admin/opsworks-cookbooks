directory node[:nfs][:mount_point] do
    recursive true
    action :create
    mode "0755"
end

mount node[:nfs][:mount_point] do
    action [:mount, :enable]
    device node[:nfs][:resource]
    fstype node[:nfs][:fstype]
    pass 0
end
