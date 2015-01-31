#!/bin/sh

PATH="/bin:/usr/bin:/sbin:/usr/sbin:/usr/local/bin"
VAGRANT_ROOT=$1

# Work around sudo removing this env variable by default
SOCKET=$(ls -1 --sort t /tmp/ssh-*/agent.* | head -1)
export SSH_AUTH_SOCK="${SOCKET}"

if ! which puppet >/dev/null; then
  echo Installing Puppet repositories...
  wget https://apt.puppetlabs.com/puppetlabs-release-wheezy.deb -O /tmp/puppetlabs-release-wheezy.de
  dpkg -i /tmp/puppetlabs-release-wheezy.deb
  apt-get update
  apt-get install puppet -y
fi

# Install librarian
if ! which librarian-puppet >/dev/null; then
  echo "Installing librarian-puppet..."
  gem install --no-ri --no-rdoc librarian-puppet
fi

# Install puppet modules
echo "Installing puppet modules..."
cd $VAGRANT_ROOT/.puppet
librarian-puppet install

echo "Updating APT repositories..."
