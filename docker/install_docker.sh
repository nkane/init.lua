if [[ "$OSTYPE" == "darwin"* ]]; then
	wget https://desktop.docker.com/mac/main/amd64/Docker.dmg
	hdiutil attach Docker.dmg
	cd /Volumes/Docker/
	cp -rfv Docker.app Applications
	cd $basedir
	hdiutil detach /Volumes/Docker/
fi