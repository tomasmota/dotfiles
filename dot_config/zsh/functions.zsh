# delete a tag from local and origin
function delete_tag(){
    git tag -d $1
    git push --delete origin $1
}

# push dotfiles
function cmpush(){
    chezmoi git add .
    chezmoi git -- commit -m "auto"
    chezmoi git push
}
