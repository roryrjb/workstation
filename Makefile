default:
	:

Python-3.7.9.tgz:
	curl -LO https://www.python.org/ftp/python/3.7.9/Python-3.7.9.tgz

.deps:
	sudo apt install -y ansible curl python3-psutil && touch .deps

.python37: .deps Python-3.7.9.tgz
	sudo apt install -y build-essential libssl-dev libreadline-dev \
		liblzma-dev libbz2-dev libsqlite3-dev libffi-dev zlib1g-dev && \
		tar xf Python-3.7.9.tgz && \
		cd Python-3.7.9 && \
		./configure --prefix /opt/python37 && \
		make -j4 && \
		sudo make install && \
		touch ../.python37

clean:
	sudo rm -rf Python-3.7.9/
	rm -rfv .deps .python37 Python-3.7.9.tgz

ubuntu: .python37
	PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/X11R6/bin:/usr/local/bin:/usr/local/sbin \
		ansible-playbook --ask-become-pass -l localhost -i local ubuntu.yml
