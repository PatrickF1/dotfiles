function python --description 'ls with improved defaults'
    # -G Enable colorized output
    # -T When used with the -l option, display complete time information for the file
    # -h When used with the -l option, use unit suffixes: Byte, Kilobyte etc.
    command ls -GTh $argv
end