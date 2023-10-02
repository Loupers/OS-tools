function gpull () {
	GIT_DIR='/path/to/your/repository'
	if [ $(pwd) = "$GIT_DIR" ]; then
		git pull && git submodule update --recursive --remote && ./tools/merge_upstream.sh;
	else
		echo "WRONG DIR"
	fi
}
