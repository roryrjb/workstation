ubuntu:
	ansible-playbook --ask-become-pass -l localhost -i local ubuntu.yml
