name             'dhcp-client'
maintainer       'Twiket LTD'
maintainer_email 'dennybaa@gmail.com'
license          'Apache 2.0'
description      'Installs/Configures chef-dhcp-client'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

%w(debian ubuntu).each {|os| supports os}

recommends 'resolvconf'
