call ale#Set('scilla_checker_executable', 'scilla-checker')
call ale#Set('scilla_checker_libdir', '.')

function! HandleScillaChecker(buffer, lines) abort
    try
        let l:data = json_decode(join(a:lines, "\n"))
    catch
        return []
    endtry
    if !has_key(l:data, 'errors')
        return []
    endif

    let l:errors = l:data['errors']

    let l:output = []
    for l:error in l:errors
        let l:start_location = l:error['start_location']
        let l:message = l:error['error_message']
        let l:last_symbol = l:message[len(message) - 1]
        if l:last_symbol != ':'
            call add(l:output, {
                  \   'lnum': start_location['line'],
                  \   'col': start_location['column'],
                  \   'text': message,
                  \   'type': 'E',
                  \})
        endif
    endfor

    return l:output
endfunction

call ale#linter#Define('scilla', {
\   'name': 'checker',
\   'executable': {b -> ale#Var(b, 'scilla_checker_executable')},
\   'command': {b -> '%e  -jsonerrors -libdir '.ale#Var(b, 'scilla_checker_libdir').' %t'},
\   'output_stream': 'both',
\   'callback': {b, l -> HandleScillaChecker(b, l)},
\})
