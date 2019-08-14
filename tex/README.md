# Tex

## Docker

Image from https://github.com/blang/latex-docker

	# Start a daemon container on this path
	$ ./latexdockerdaemon.sh

	# Execute the command in the daemon container (or --interaction=errorstopmode)
	$ docker exec -it latex_daemon lualatex --interaction=nonstopmode --output-directory=test/ 0001.tex

	# Final build
	$ ./build.sh i/ book.i

	# Stop the daemon
	docker stop latex_daemon

Commands

	rename 's/\.txt$/\.tex/' *.txt

## Fix in I and II
 ? minus and ndash (\sfrac - ndash)
 ? ~ in K. Marx
  и т.ʼд.
  replace " with proper quote

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
? minus and ndash

### III (done)

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
? minus and ndash
iii.1 Red ukr per, Prym red nim vud F.E.
iii.2 Prym red.

Аfter 
	page ref 392 on iii.1.423
