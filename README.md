# vim-scilla

Basic syntax highlighting for [Scilla](https://scilla-lang.org/), a safe-by-design smart contract language. 

## Installation
### Pathogen
```
git clone https://github.com/edisonljh/vim-scilla.git ~/.vim/bundle/vim-scilla
```
### Vundle

Add the following line to your `~/.vimrc`:
```
Plugin 'edisonljh/vim-scilla'
```

### Syntax checker with ALE

If you are using [ALE](https://github.com/w0rp/ale), you can enable [scilla-checker](https://scilla.readthedocs.io/en/latest/scilla-checker.html) to show errors right inside vim.

Here is how to enable it:

1. Install [ALE](https://github.com/w0rp/ale) vim plugin
2. Make `scilla-checker` executable available
3. Set STDLIB dir in vimrc: `let g:ale_scilla_checker_libdir = '<path>/scilla/src/stdlib'`
4. Enable the linter in vimrc: `autocmd FileType scilla let b:ale_linters = ['checker']`
5. Open any scilla file and ensure checker is working: `:ALEInfo`

## License

See [LICENSE](./LICENSE)
