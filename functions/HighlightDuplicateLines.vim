function! HighlightDuplicates()
    " Clear previous highlights
    silent! call matchdelete(999)
    
    " Use a dictionary to track occurrences
    let seen = {}
    let duplicates = []

    " Iterate over all lines
    for i in range(1, line('$'))
        let text = getline(i)
        if has_key(seen, text)
            " If already seen, highlight it
            call add(duplicates, i)
        else
            " Otherwise, mark it as seen
            let seen[text] = 1
        endif
    endfor

    " Apply highlighting to duplicate lines
    for lnum in duplicates
        execute lnum . 'match Search'
    endfor

    echo "Highlighted all duplicate lines."
endfunction
