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

## notes on II
poznacjhky u zagolovkax
rozryadka
_ sub
frac standa_0189_0190_0191_0192.texlione

Г г Т т Р Зп П апостроф дельта
... - = 

c v m 
/+=digits

Task load:
 
 load i - _0189_0190_0191_0192.tex
 add task id order on load
