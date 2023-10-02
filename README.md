# OS tools

Custom tools I made for the course at my university (for now unnamed)

To add this repository to the course repository use

`$ git submodule add https://github.com/Loupers/OS-tools.git tools`

This creates a folder tools with content of this repository

## Content 

### merge\_upstream

Fetches upstream and merges it into current state of the repository.

### bashrc 

Contains alias, that combines pulling your repository, fetching upstream and updating this sub module on each call. 
Just add content of that file into your ~/.bashrc file, call `$ source ~/.bashrc` and you can use `$ pull` in the root directory.

### zshrc

Same as bashrc, but for your `~/.zshrc` file (if you are using zsh). Command to call this time is `$ gpull`

### book.sh

Script that downloads all parts of the book and unites them into one .pdf file.  
It takes a while, just let it run for a bit, so all the data can be downloaded.
