build:
	sudo docker build -t epmweb .

run-interactive:
	sudo docker run -i -P -t epmweb

run:
	sudo docker run -P -t epmweb
