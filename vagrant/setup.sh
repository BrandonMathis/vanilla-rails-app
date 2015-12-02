#!/bin/bash
sudo apt-get update
sudo apt-get upgrade -y

#INSTALL BASE
chmod +x "/vagrant/scripts/base.sh"
$include "/vagrant/scripts/base.sh"

#COMMENT OUT OR IN LINES AS APPROPRIATE
INCLUDED_TECH=()
INCLUDED_TECH+=("nginx")
#INCLUDED_TECH+=("postgres")
INCLUDED_TECH+=("rails")

SCRIPT_LOCATION="/vagrant/scripts/setup-"

for i in ${INCLUDED_TECH[@]}; do
	chmod +x "${SCRIPT_LOCATION}${i}.sh"
	$include "${SCRIPT_LOCATION}${i}.sh"
done

#because postgres is special
sudo /vagrant/scripts/setup-postgres.sh

chmod +x "/vagrant/custom.sh"
/vagrant/custom.sh $1 $2

echo "All Done!"
echo "Run vagrant ssh to get started."
echo "Your Local files are in the following dir, within the vagrant home:"
ls
