# Quick file edit
alias editrc="chezmoi edit $XDG_CONFIG_HOME/zsh/.zshrc"
alias loadrc="source $XDG_CONFIG_HOME/zsh/.zshrc"

# Git
alias gc='git commit --signoff -m'
alias gpt='git push --tags'
alias gld='git log -p --oneline --ext-diff'
alias gD='git diff HEAD~1'
alias gprune='git remote prune origin && git for-each-ref --format "%(refname:short)" refs/heads | grep -v "master\|main" | xargs git branch -D'

# Terraform
alias tfi='terraform init'
alias tfp='terraform plan'
alias tfa='terraform apply'
alias tfd='terraform destroy'
alias tfs='terraform show'

# Yarn
alias yd='yarn dev'
alias yf='yarn prettier --write .'

# Files
# Fuzzy find tree and cd into folder
alias cdf='cd $(fd --type directory | fzf --preview "tree -I \"node_modules|dist|coverage\" -C {}")' 

# Fuzzy find over all repos under ~/dev`
alias cdr='cd $(fd --search-path ~/dev --type directory --hidden "^\.git$" | xargs -I {} dirname {} | fzf --preview "tree -I \"node_modules|dist|coverage\" -C {}")' 

# Fuzzy find tree and open folder in neovim
alias nvd='nv $(fd --type directory | fzf --preview "tree -I \"node_modules|dist|coverage\" -C {}")' 

# Chezmoi
alias cm='chezmoi'
alias cme='chezmoi edit --apply'
alias cmgst='chezmoi git status'
alias cmgd='chezmoi git diff'

# Nix
alias nixsearch='nix search nixpkgs'
alias nixrun='nix run nixpkgs#'

# Generic
alias tree="tree -I 'node_modules|dist|coverage'"
alias nv='nvim'
alias k='kubectl'

