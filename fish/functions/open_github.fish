# Forked from https://gist.github.com/snatchev/34e793af8ab1114d9e42
function open_github --description 'Open the webpage for the current GitHub repository\'s branch'
  set -l fetch_url (command git remote --verbose show -n origin ^/dev/null | command grep Fetch | cut -c 14- )

  if [ $status -gt 0 ]
    echo 'Not a git repo.'
    return 1
  end

  if [ -z $fetch_url ]
    echo 'Not a git repo.'
    return 1
  end

  if [ -z (echo $fetch_url | grep github ) ]
    echo 'No GitHub upstream.'
    return 3
  end

  set -l branch (command git rev-parse --abbrev-ref HEAD)

  if [ $branch = 'HEAD' ]
    # we couldn't find a branch or tag, so let's get a SHA
    set branch (command git rev-parse HEAD)
  end

  set url (echo "$fetch_url/tree/$branch" | sed 's|git@github.com:\(.*\)\.git|https://github.com/\1|')

  open "$url/$argv"
end