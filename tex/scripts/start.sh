#!/bin/sh
IMAGE=texlive/texlive:TL2024-historic
exec docker run -d --rm --name latex_daemon -i --net=none -t -v $PWD:/usr/src/app -w /usr/src/app "$IMAGE" /bin/sh -c "sleep infinity"
