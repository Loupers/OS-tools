DIR="path/to/your/repository"
alias "pull"="[ $(pwd) = "$DIR" ] && git pull && git submodule update --recursive --remote && ./tools/merge_upstream.sh"
