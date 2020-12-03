.deps:
	sudo apt install -y ansible python3-psutil && touch .deps

.python37: .deps
	sudo apt install -y build-essential libssl-dev libreadline-dev \
		liblzma-dev libbz2-dev libsqlite3-dev libffi-dev zlib1g-dev && \
		tar xf Python-3.7.9.tgz && \
		cd Python-3.7.9 && \
		./configure --prefix /opt/python37 && \
		make -j4 && \
		sudo make install && touch .python37

clean:
	rm -rfv .deps .python37 Python-3.7.9/

ubuntu: .python37
	ansible-playbook --ask-become-pass -l localhost -i local ubuntu.yml
