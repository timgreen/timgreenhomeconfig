" vim: set ft=vim foldmethod=marker shiftwidth=2 st=2 ts=2:

au BufWritePost *
      \	if &filetype == "" |
      \   filetype detect
      \	endif

Plug 'sheerun/vim-polyglot' "A collection of language packs for Vim.
" vim-polyglot {{{
  "" markdown
  let g:vim_markdown_frontmatter = 1
  let g:vim_markdown_math = 1
" }}}
Plug 'SidOfc/mkdx'
Plug 'editorconfig/editorconfig-vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'tomtom/tcomment_vim'