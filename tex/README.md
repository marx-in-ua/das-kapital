# Tex

## Docker

Image from https://hub.docker.com/r/texlive/texlive

	# Start a daemon container on this path
	$ ./scripts/start.sh

	# Execute latex (or --interaction=errorstopmode)
	$ ./scripts/run.sh sample/check.tex 

	# Clean up
	$ ./scripts/clean.sh

	# Final build
	$ ./scripts/build.sh book.i.tex

	# Stop the daemon
	$ ./scripts/stop.sh
