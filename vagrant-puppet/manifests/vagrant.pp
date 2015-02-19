package { 'puppetmaster-passenger':
  ensure => 'installed',
} ->

class { 'puppetdb':
} ->

class { 'puppetdb::master::config':
  puppet_service_name => 'apache2',
}
