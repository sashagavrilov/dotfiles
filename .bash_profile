# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH";

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Enable some Bash 4 features when possible:
# * `nocaseglob` – case-insensitive globbing (used in pathname expansion)
# * `histappend` – append to the Bash history file, rather than overwriting it
# * `cdspell` – autocorrect typos in path names when using `cd`
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * `globstar` – recursive globbing, e.g. `echo **/*.txt`
for option in nocaseglob histappend cdspell autocd globstar; do
	shopt -s "$option" 2> /dev/null;
done;


# Add tab completion for many Bash commands
if which brew > /dev/null && [ -f "$(brew --prefix)/etc/bash_completion" ]; then
	source "$(brew --prefix)/etc/bash_completion";
fi;

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
