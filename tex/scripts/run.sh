# exit when any command fails
set -e

DIR=`dirname "$1"`
TEX=`basename "$1"`

docker exec -it latex_daemon lualatex --interaction=nonstopmode --output-directory=$DIR $TEX
