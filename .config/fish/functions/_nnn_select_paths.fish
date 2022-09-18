# insert paths into the command line using nnn
# meant to be triggered by key binding
function _nnn_select_paths
    set --function paths (nnn -p -)
    if test (count $paths) -gt 0
        commandline --insert -- (string escape -- $paths | string join ' ')
    end
    commandline --function repaint
end
