# delete a tag from local and origin
function delete_tag(){
    git tag -d $1
    git push --delete origin $1
}
