ubuntu:
	install_python_3.7
	sudo apt install -y python3 python3-psutil ansible python3-pip
	ansible-playbook \
		--ask-become-pass \
		-l localhost \
		-u "$(USER)" \
		-i local ubuntu.yml
