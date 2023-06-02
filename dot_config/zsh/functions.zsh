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
    nv $(rg $1 -l | fzf --preview "bat --color=always {}")  -c "/$1"
}

function nvga(){
    if [ $# -eq 0 ]; then
        echo "no args"       
    fi
}
