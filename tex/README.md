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

### II (done)

- wrap100
- copy and rename
- percent
- footnotes
- join
- fix whitespace
- red
- fraction
- math-2
- math-1

## notes on II
poznacjhky u zagolovkax
rozraydka
splitfrac

Task load:
 
 load i - _0189_0190_0191_0192.tex
 add task id order on load
 restore i/_0290 i/_0291 i/_0292 i/_0293 i/_0293

Fix footnotes on:
	text/i/0290.txt
	text/i/0291.txt
	text/i/0292.txt
	text/i/0293.txt
	text/i/0294.txt 

	text/ii/0007.txt
	text/ii/0008.txt
	text/ii/0009.txt
	text/ii/0010.txt
	text/ii/0011.txt 

	text/ii/0012.txt
	text/ii/0013.txt
	text/ii/0014.txt
	text/ii/0015.txt
	text/ii/0016.txt 
