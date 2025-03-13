function! ExtractColumns(input, output, start_col, end_col, delimiter)
    " Read the input file into the buffer
    execute 'edit ' . a:input

    " Escape special characters in delimiter (e.g., dot, plus, etc.)
    let l:delim = escape(a:delimiter, '.\+*?^$[](){}|')

    " Construct regex pattern to match the desired columns
    let l:pattern = '%s/\v^([^' . l:delim . ']+\s*' . l:delim . '\s*){' . (a:start_col - 1) . '}(([^' . l:delim . ']+\s*' . l:delim . '\s*){' . (a:end_col - a:start_col + 1) . '}).*/\2/'

    " Execute the replacement
    execute l:pattern

    " Write to output file
    execute 'write! ' . a:output
    echo "Extracted columns " . a:start_col . " to " . a:end_col . " using delimiter '" . a:delimiter . "' and saved to " . a:output
endfunction
