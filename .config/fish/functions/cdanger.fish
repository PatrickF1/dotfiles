function cdanger --wraps claude --description "claude --dangerously-skip-permissions"
    command claude --dangerously-skip-permissions $argv
end
