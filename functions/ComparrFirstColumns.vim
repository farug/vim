function! CompareFiles(file1, file2, output)
    " Read the first file into a list
    let lines1 = readfile(a:file1)
    let dict = {}

    " Store first column of file1 in a dictionary
    for line in lines1
        let parts = split(line)
        if !empty(parts)
            let dict[parts[0]] = line
        endif
    endfor

    " Read the second file and check for matches
    let lines2 = readfile(a:file2)
    let matches = []

    for line in lines2
        let parts = split(line)
        if !empty(parts) && has_key(dict, parts[0])
            call add(matches, dict[parts[0]])
        endif
    endfor

    " Write matching lines to the output file
    call writefile(matches, a:output)
    echo "Matching lines written to " . a:output
endfunction

" Call the function with your file names
call CompareFiles("file1.txt", "file2.txt", "output.txt")
