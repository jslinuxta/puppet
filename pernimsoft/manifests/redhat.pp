class pernimsoft::redhat inherits pernimsoft {
  case $operatingsystemmajrelease {
 '5':   {    	file { '/etc/logrotate.d/syslog':
    	    	ensure  => file,
	    	owner   => 'root',
    		group   => 'root',
    		mode    => 0644,
    		source  => 'puppet:///modules/pernimsoft/syslog.rhel5',
    		notify => Exec['runlogrotate'],  }
  }
 '6':   {  	file { '/etc/logrotate.d/syslog':
   		ensure  => file,
    		owner   => 'root',
    		group   => 'root',
    		mode    => 0644,
    		source  => 'puppet:///modules/pernimsoft/syslog.rhel6',
    		notify => Exec['runlogrotate'], }
  }
  default:   { notify{"This action is not supported, Nothing to do....  : module-pernimsoft-generic-action": } }
}

  exec { 'runlogrotate':
  command => 'logrotate -f /etc/logrotate.conf',
  path    => ['/usr/bin', '/usr/sbin',],
  refreshonly => true,
  }
}
