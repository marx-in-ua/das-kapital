# exit when any command fails
set -e

DIR=`dirname "$1"`
TEX=`basename "$1"`

COMMIT_ID=$(git rev-parse --short HEAD)
echo $COMMIT_ID > 'common/version.tex'

docker exec -it latex_daemon lualatex --interaction=nonstopmode --output-directory=$DIR $TEX
