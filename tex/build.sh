# exit when any command fails
set -e

DIR=$1
BASE=$2
TEX=$1$2".tex"

# Exit if there are uncommited changes
# git diff --exit-code --name-status

# build pdf
docker exec -it latex_daemon latexmk -lualatex -outdir=$DIR $TEX

# copy pdf to version file
PDF=$1$2".pdf"
COMMIT_ID=$(git rev-parse --short HEAD)
VERSIONPDF=$1$2"."$COMMIT_ID".pdf"
echo $VERSIONPDF
rm -f $VERSIONPDF
cp $PDF $VERSIONPDF

echo "Saved "$VERSIONPDF
