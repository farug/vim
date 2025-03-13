function! RemoveMatchingLinesInRange(file1, file2, delimiter, start_line, end_line)
    " Convert '$' to the last line number
    let last_line = line('$')
    let end_line = (a:end_line == '$' ? last_line : a:end_line)

    " Read second column values from file2 and store them in a dictionary
    let ref_values = {}
    for line in readfile(a:file2)
        let parts = split(line, a:delimiter)
        if len(parts) >= 2
            let ref_values[parts[1]] = 1
        endif
    endfor

    " Iterate over the specified line range in file1
    let lnum = a:start_line
    while lnum <= end_line && lnum <= last_line
        let parts = split(getline(lnum), a:delimiter)
        if len(parts) >= 2 && has_key(ref_values, parts[1])
            execute lnum . 'delete'
            let end_line -= 1  " Adjust end line since a line is removed
        else
            let lnum += 1
        endif
    endwhile

    echo "Matching lines removed in range " . a:start_line . " to " . end_line . "."
endfunction
