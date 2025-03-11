function! FindUniqueLines(file1, file2, output)
    " Read file1 into a Vim list
    let lines1 = readfile(a:file1)

    " Read file2 into a Vim list
    let lines2 = readfile(a:file2)

    " Create a dictionary from file2 lines for fast lookup
    let dict2 = {}
    for line in lines2
        let dict2[line] = 1
    endfor

    " Open output file for writing
    let out = []

    " Check each line in file1, write to output if not in file2
    for line in lines1
        if !has_key(dict2, line)
            call add(out, line)
        endif
    endfor

    " Write unique lines to output file
    call writefile(out, a:output)
    
    echo "Unique lines written to " . a:output
endfunction
