#Intalls Puppet-lint using Puppet
package { 'puppet-lint':
    ensure   => '~> 2.5',
    provider => 'gem',
}
