let s:pwd = '/'.join(split(expand("<sfile>"),'/')[0:-2],'/')
let s:cmd = s:pwd."/bin/anchored|"."asciidoctor -s -S secure -|cat ".'/'.join(split(expand('<sfile>'),'/')[0:-2],'/').'/github.css /dev/stdin'
let s:port_filename = getpid().'.'.'data.port'
let s:port = substitute(readfile(s:port_filename)[0], ":", "", "")

let s:socketsend = 'bin/socketsend -k body'
let s:send_output_to_port = s:pwd.'/'.s:socketsend.' '.s:port
execute 'w !'.s:cmd.'|'.s:send_output_to_port

let s:socketsend = 'bin/socketsend -k move'
let s:send_output_to_port = s:pwd.'/'.s:socketsend.' '.s:port
execute '!echo '.'['.line('.').','.line('$').']'.'|'.s:send_output_to_port
