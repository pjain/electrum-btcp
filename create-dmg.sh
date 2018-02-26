#!/bin/sh

echo "Cleaning..."
sudo sh ./clean.sh

VERSION=$(cat lib/version.py \
  | grep ELECTRUM_VERSION \
  | sed "s/[',]//g" \
  | tr -d '[[:space:]]')
VERSION=${VERSION//ELECTRUM_VERSION=/}

echo "Creating package $VERSION"

echo "Running brew install"
brew bundle

echo "Running pip3 install"
pip3 install -r requirements.txt

echo "Building icons"
pyrcc5 icons.qrc -o gui/qt/icons_rc.py

echo "Compiling the protobuf description file"
protoc --proto_path=lib/ --python_out=lib/ lib/paymentrequest.proto

echo "Compiling translations"
./contrib/make_locale

echo "Creating package $VERSION"
sudo python3 setup.py sdist

echo "Creating .app from python using py2app"
sudo ARCHFLAGS="-arch i386 -arch x86_64" sudo python3 setup-release.py py2app --includes sip

sudo mkdir dist/installer-mac/
sudo mv "dist/Electrum BTCP.app" "dist/installer-mac/"
sudo touch "dist/installer-mac/To install, copy it into Applications"

echo "Creating .dmg"
sudo hdiutil create -fs HFS+ -volname "Electrum BTCP - Installer" -srcfolder "dist/installer-mac" dist/electrum-$VERSION-macosx.dmg

echo "Done! .dmg and .app are in dist/"

