laptop:
	ansible-playbook --ask-become-pass -l localhost -i local laptop.yml

server:
	ansible-playbook -i remote server.yml
