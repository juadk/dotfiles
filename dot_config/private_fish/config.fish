if status is-interactive
    # Commands to run in interactive sessions can go here
end

export PATH="$PATH /opt/homebrew/bin" 
source /opt/homebrew/opt/asdf/libexec/asdf.fish
/opt/homebrew/bin/fzf --fish | source
/opt/homebrew/bin/starship init fish | source

eval "$(/opt/homebrew/bin/brew shellenv)"
alias ssh="/Applications/kitty.app/Contents/MacOS/kitty +kitten ssh" 
