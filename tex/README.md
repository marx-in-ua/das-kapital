# Tex

## Docker

Image from https://github.com/blang/latex-docker

	# Start a daemon container on this path, it accepts commands from latexdockerdaemoncmd.sh
	# ./latexdockerdaemon.sh

	# Execute the command in the daemon container, only the daemon container is running
	$ ./latexdockerdaemoncmd.sh pdflatex main.tex
	# or
	$ docker exec -it latex_daemon /bin/sh -c "cd sample && lualatex main.tex"
	# or 
	docker exec -it latex_daemon lualatex --interaction=nonstopmode --output-directory=test/ 0001.tex

	# Stop the daemon
	docker stop latex_daemon

Commands

	rename 's/\.txt$/\.tex/' *.txt

## Todo for any book

- wrap100
- copy and rename
- percent
- footnotes
- join
- fix whitespace
- red
- fraction
- math-letters
- math-1
- dots, ndash

### I (fixes)

- \dotfill{}
- add task 0189 and 0190-0192

### II (done)

- wrap100
- copy and rename
- percent
- footnotes
