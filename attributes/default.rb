
default['dhcp-client']['resolv_conf_update'] = true

default['dhcp-client']['request']['default_options'] = %w(
    subnet-mask broadcast-address time-offset routers
    host-name netbios-name-servers netbios-scope
    interface-mtu rfc3442-classless-static-routes ntp-servers
    domain-name domain-name-servers domain-search
    dhcp6.domain-search dhcp6.fqdn dhcp6.name-servers dhcp6.sntp-servers 
  )

default['dhcp-client']['request']['resolv_options'] = %w(
    domain-name domain-name-servers domain-search
    dhcp6.domain-search dhcp6.fqdn dhcp6.name-servers
  )

default['dhcp-client']['request']['dhcp6_options'] = %w(
  dhcp6.domain-search dhcp6.fqdn dhcp6.name-servers dhcp6.sntp-servers
  )

case node.platform
when "ubuntu"
  if node.platform_version.to_f > 10.04
    default['dhcp-client']['dhcp6_enabled'] = true
    default['dhcp-client']['package'] = 'isc-dhcp-client' 
    default['dhcp-client']['dhcpdir'] = '/etc/dhcp'
  else
    default['dhcp-client']['dhcp6_enabled'] = false
    default['dhcp-client']['package'] = 'dhcp3-client'
    default['dhcp-client']['dhcpdir'] = '/etc/dhcp3'
  end
else
  default['dhcp-client']['dhcp6_enabled'] = true
  default['dhcp-client']['package'] = 'isc-dhcp-client'
  default['dhcp-client']['dhcpdir'] = '/etc/dhcp'
end

default['dhcp-client']['request']['options'] = []
