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
? ~ in K. Marx

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
- dots, ndash
? ~ in K. Marx

## notes on II
poznacjhky u zagolovkax
rozraydka
splitfrac
numbers in button headers
tracking in microtype

Task load:
 
 load i - _0189_0190_0191_0192.tex
 restore Task #3028 ii/_0010_0011_0012
 restore Task #3029 ii/_0013
 restore Task #3030 ii/_0014
 restore Task #3032 ii/_0016
 restore Task id: 2768 i/_0290
 restore Task id: 2769 i/_0291
 restore Task id: 2770 i/_0292
 restore Task id: 2771 i/_0293
 restore Task id: 2772 i/_0294

Fix footnotes on:
	text/i/0290.txt
	text/i/0291.txt
	text/i/0292.txt
	text/i/0293.txt
	text/i/0294.txt 

	text/ii/0010.txt
	text/ii/0011.txt 
	text/ii/0013.txt
	text/ii/0014.txt
	text/ii/0016.txt 

Аfter 
	!0090, !0101- fix link to pages in footnote
	small font size in peredmova dates
	footnotes on i/0532
	find where the col space set to 0