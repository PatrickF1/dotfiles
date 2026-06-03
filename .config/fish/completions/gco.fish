# Complete gco with local branch names (no file completion).
complete -c gco -f -a "(git branch --format='%(refname:short)' 2>/dev/null)"
