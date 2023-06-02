# delete a tag from local and origin
function delete_tag(){
    git tag -d $1
    git push --delete origin $1
}

# sync dotfiles
function cmsync(){
    chezmoi git pull
    chezmoi apply
}

# push dotfiles
function cmpush(){
    chezmoi git add .
    chezmoi git -- commit -m "${1:-auto}"
    chezmoi git push
}

# open files based on ripgrep search
function nvg(){
    file=$(rg $1 -l | fzf --preview "bat --color=always {}")
    if [[ -n $file ]]; then
        nv $file -c "/$1"
    fi
}

function nvf2(){
    file=$(fzf --preview "bat --color=always {}")
    if [[ -n $file ]]; then
        nv $file
    fi
}

