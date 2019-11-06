export VAGRANT_GIT_EMAIL=$(shell git config --get user.email)
export VAGRANT_GIT_NAME=$(shell git config --get user.name)

spinup:
	echo "192.168.50.47  greenkey.local" | sudo tee -a /etc/hosts
	cp ~/.ssh/id_rsa git_ssh_key
	vagrant up
	sleep 5s
	open -a "Google Chrome" http://greenkey.local
update:
	vagrant ssh -c "sudo sudo -u greenkey git -C /webapps/greenkey/src/greenkey pull"
	vagrant ssh -c "sudo sudo -u greenkey HOME=/home/greenkey /webapps/greenkey/bin/pip install -r /webapps/greenkey/src/greenkey/requirements.pip --upgrade"
	vagrant ssh -c "sudo sudo -u greenkey /webapps/greenkey/bin/python /webapps/greenkey/bin/manage.py migrate"