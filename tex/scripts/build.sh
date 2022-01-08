# exit when any command fails
set -e

FULL=$1
DIR=`dirname "$FULL"`/
TEX=`basename "$FULL"`
BASE=$DIR"${TEX%.*}"

# currevt tag or commit id
if [[ $(git tag --points-at HEAD) ]]; then
  VERSION_ID=$(git tag --points-at HEAD)
else
  VERSION_ID=$(git rev-parse --short HEAD)
fi

echo $VERSION_ID > 'common/version.tex'

echo $DIR
echo $TEX
echo $BASE
# Exit if there are uncommited changes
# git diff --exit-code --name-status

# build pdf
docker exec -it latex_daemon latexmk -lualatex -outdir=$DIR $FULL

# copy pdf to version file
PDF=$BASE".pdf"
VERSIONPDF=$BASE"."$VERSION_ID".pdf"
echo $VERSIONPDF
rm -f $VERSIONPDF
cp $PDF $VERSIONPDF

echo "Saved "$VERSIONPDF
