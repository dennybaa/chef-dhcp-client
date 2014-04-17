# dhcp-client cookbook

This simple cookbook handles basic configuration of ISC dhcp-client.

# Requirements

The cookbook is supposed to work on debian flavors including ubuntu.

# Usage

Include `recipe[dhcp-client]` and you are in. Set the options and you are ready to use. 

Configuration options are not so broad and allow you only simple request functionality. Use **dhcp6_enabled** and **resolv_conf_update** to enable/disable specific request options.
The main reason of this cookbook to exist is disabling *resolv.conf changing* which might undesirable on a server, but to fully achieve this goal the usage of the [resolvconf cookbook](https://github.com/chr4-cookbooks/resolvconf) is **highly recommended**.

# Attributes

Here's the supported list of attributes, **dhcp-client** base attribute is omitted.

  * **dhcp6_enabled** enables/disables requesting dhcp6 options. By default is set to `true` except for *ubuntu 10.04* for which it's disabled.
  * **resolv_conf_update** enables/disables requesting options which update resolv.conf nameserver and search options. Default is `true`.
  * **request/default_options** sets the list of default request options of isc dhcp-client. Defined in the attribute file.
  * **request/resolv_options** sets the list of request options which change resolv.conf search, nameserver values. Defined in the attribute file.
  * **request/dhcp6_options** sets the list of request options which are specific for dhcp6 mode. Defined in the attribute file.

Request options are evaluated in the cookbook and assigned to the *default level attribute* **request/options**.

# Author

Author:: Denis Baryshev (<dennybaa@gmail.com>)
