# Install Flask version 2.1.0
package { 'flask==2.1.0' :
    ensure   => 'installed',
    provider => 'pip3',
    }
