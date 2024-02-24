# Puppet manifest to install Flask using pip3 in a virtual environment
package { 'flask':
  ensure   => '2.1.0',
  provider => 'pip3'
}
