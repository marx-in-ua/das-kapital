# Tex

## Docker

Image from https://github.com/blang/latex-docker

	# Start a daemon container on this path, it accepts commands from latexdockerdaemoncmd.sh
	latexdockerdaemon.sh

	# Execute the command in the daemon container, only the daemon container is running
	latexdockerdaemoncmd.sh pdflatex main.tex

	# Stop the daemon
	docker stop latex_daemon
