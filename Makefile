ubuntu:
	sudo apt install -y python3 python3-psutil ansible
	ansible-playbook \
		--ask-become-pass \
		-l localhost \
		-u "$(USER)" \
		-i local ubuntu.yml
