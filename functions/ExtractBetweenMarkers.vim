function! ExtractBetweenMarkers(input, output, start_marker, end_marker)
    " Open the input file
    execute 'edit ' . a:input

    " Initialize the output file
    call writefile([], a:output)  " Clear the output file before writing

    " Loop to find all occurrences of start_marker and end_marker
    let start_line = 0
    let end_line = 0

    while 1
        " Search for the start_marker
        let start_line = search('^' . a:start_marker . '$', 'n')
        " If no more start markers are found, break the loop
        if start_line == 0
            break
        endif

        " Search for the end_marker after the start_marker
        let end_line = search('^' . a:end_marker . '$', 'n')

        " If no end_marker found after start_marker, break the loop
        if end_line == 0 || start_line > end_line
            break
        endif

        " Extract lines between start_line and end_line and append to output file
        execute start_line . ',' . end_line . 'w >> ' . a:output
    endwhile

    echo "Extracted all occurrences to " . a:output
endfunction
