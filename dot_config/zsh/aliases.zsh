# Quick file edit
alias editrc="chezmoi edit $XDG_CONFIG_HOME/zsh/.zshrc"
alias loadrc="source $XDG_CONFIG_HOME/zsh/.zshrc"

# Git
alias gc='git commit --signoff -m'
alias gpt='git push --tags'

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
alias cdf='cd $(fd --type directory | fzf)' # Fuzzy find tree and cd into folder
alias nvf='nv $(fzf)'                       # Fuzzy find tree and open file in neovim
alias nvd='nv $(fd --type directory | fzf)' # Fuzzy find tree and open folder in neovim

# Chezmoi
alias cm='chezmoi'
alias cme='chezmoi edit --apply'
alias cmgst='chezmoi git status'
alias cmgd='chezmoi git diff'

# Generic
alias tree='tree -I node_modules'
alias t='tree -I node_modules'
alias nv='nvim'
alias k='kubectl'
