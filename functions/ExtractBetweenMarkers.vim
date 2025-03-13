function! ExtractBetweenMarkers(input, output, start_marker, end_marker)
    " Open the input file
    execute 'edit ' . a:input

    " Search for lines between the given start and end markers
    let start_line = search('^' . a:start_marker . '$', 'n')
    let end_line = search('^' . a:end_marker . '$', 'n')

    " Check if both markers exist and if the start marker comes before the end marker
    if start_line == 0 || end_line == 0 || start_line > end_line
        echo "Could not find valid markers"
        return
    endif

    " Extract lines between start and end markers (inclusive)
    execute start_line . ',' . end_line . 'w! ' . a:output
    echo "Lines extracted to " . a:output
endfunction
