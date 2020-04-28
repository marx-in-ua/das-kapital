# exit when any command fails
set -e

FULL=$1
DIR=`dirname "$FULL"`/
TEX=`basename "$FULL"`
BASE=$DIR"${TEX%.*}"

echo $DIR
echo $TEX
echo $BASE
# Exit if there are uncommited changes
# git diff --exit-code --name-status

# build pdf
docker exec -it latex_daemon latexmk -lualatex -outdir=$DIR $FULL

# copy pdf to version file
PDF=$BASE".pdf"
COMMIT_ID=$(git rev-parse --short HEAD)
VERSIONPDF=$BASE"."$COMMIT_ID".pdf"
echo $VERSIONPDF
rm -f $VERSIONPDF
cp $PDF $VERSIONPDF

echo "Saved "$VERSIONPDF
