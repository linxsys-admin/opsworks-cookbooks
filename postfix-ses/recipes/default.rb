#
# cookbook name:: postfix-ses
# recipe:: default
#

package "postfix" do
  action :install
end

service 'postfix' do
  service_name 'postfix'
  action :enable
end

script "update_main.cf_file" do
  interpreter "bash"
  user "root"
  code <<-EOH
    sed -i "s/^default_transport.*/default_transport = smtp/" /etc/postfix/main.cf
    sed -i "s/^relay_transport.*/relay_transport = relay/" /etc/postfix/main.cf
    sed -i "s/^relayhost.*/#relayhost = /" /etc/postfix/main.cf
    cat<<_EOF>>/etc/postfix/main.cf
    relayhost = #{node[:postfix_ses][:relayhost]}:25
    smtp_sasl_auth_enable = yes
    smtp_sasl_security_options = noanonymous
    smtp_sasl_password_maps = hash:/etc/postfix/sasl_passwd
    smtp_use_tls = yes
    smtp_tls_security_level = encrypt
    smtp_tls_note_starttls_offer = yes
    smtp_tls_CAfile = /etc/ssl/certs/ca-certificates.crt
    _EOF_
  EOH
end

script "sasl_passwd_smtp_credentials" do
  interpreter "bash"
  user "root"
  code <<-EOH
    echo "#{node[:postfix_ses][:relayhost]}:25 #{node[:postfix_ses][:username]}:#{node[:postfix_ses][:password]}" > /etc/postfix/sasl_passwd
    postmap /etc/postfix/sasl_passwd
    rm -f /etc/postfix/sasl_passwd
  EOH
end

service "postfix" do
  action :restart
end