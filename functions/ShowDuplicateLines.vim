function! ShowDuplicates()
    " Create a new buffer for duplicate lines
    execute 'new Duplicates'
    
    " Set buffer to be unmodifiable initially
    setlocal buftype=nofile
    setlocal bufhidden=hide
    setlocal noswapfile

    " Use a dictionary to track occurrences
    let seen = {}
    let duplicates = {}

    " Iterate over all lines
    for i in range(1, line('$'))
        let text = getline(i)
        if has_key(seen, text)
            let duplicates[text] = 1
        else
            let seen[text] = 1
        endif
    endfor

    " Add duplicate lines to the new buffer
    for text in keys(duplicates)
        call append('$', text)
    endfor

    echo "Displayed all duplicate lines in a new buffer."
endfunction
