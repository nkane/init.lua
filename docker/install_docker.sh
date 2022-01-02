if [[ "$OSTYPE" == "darwin"* ]]; then
	sudo kill $(pgrep docker)
	wget https://desktop.docker.com/mac/main/amd64/Docker.dmg
	hdiutil attach Docker.dmg
	cd /Volumes/Docker/
	cp -rfv Docker.app Applications
	cd -
	hdiutil detach /Volumes/Docker/
	open -a Docker
	rm Docker.dmg
fi