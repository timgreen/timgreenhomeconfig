" vim: set ft=vim foldmethod=marker shiftwidth=2 st=2 ts=2:

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

let s:onPlugLoadCallbacks = []
function! OnPlugLoad(name, exec)
  function! PlugOnLoadInner() closure
    if has_key(g:plugs, a:name) && isdirectory(expand($HOME . '/.vim/plugged/' . a:name))
      if (has_key(g:plugs[a:name], 'on') || has_key(g:plugs[a:name], 'for'))
        execute 'autocmd! User' a:name a:exec
      else
        " `execute 'autocmd VimEnter *' a:exec` doesn't work with colorscheme <x>.
        execute a:exec
      endif
    endif
  endfunction
  call add(s:onPlugLoadCallbacks, funcref('PlugOnLoadInner'))
endfunction

call plug#begin('~/.vim/plugged')
for rc in split(glob('~/.vim/rc_*.vim'), '\n')
  exec 'source' rc
endfor
call plug#end()

for Callback in s:onPlugLoadCallbacks
  call Callback()
endfor
