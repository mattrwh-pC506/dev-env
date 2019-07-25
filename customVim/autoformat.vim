" Autoformat
Plugin 'Chiel92/vim-autoformat'

" Custom Formatter Defs
let g:formatdef_my_custom_html = '"html-beautify --wrap-attributes=force-aligned --indent-size=2"'
let g:formatdef_my_custom_json = '"prettier --write --parser=json"' 
let g:formatdef_clang = '"clang-format -style=Google"'
let g:formatdef_prettier_less = '"prettier --write --parser=less"'
let g:formatdef_prettier_typescript = '"prettier --write --parser=typescript --print-width=100 --tab-width=2 --trailing-comma=all --single-quote"'
let g:formatdef_prettier_javascript = '"prettier --write --parser=typescript --print-width=100 --tab-width=2 --trailing-comma=all --single-quote"'
let g:formatdef_prettier_vue = '"prettier --write --parser=vue --print-width=140 --tab-width=2 --trailing-comma=all --single-quote"'

au BufWrite *.ts,*.tsx :call ToggleTypescriptFormatter()
au BufWrite *.js,*.jsx :call ToggleJavascriptFormatter()
au BufWrite *.json :call ToggleJsonFormatter()
au BufWrite *.scss :call ToggleSCSSFormatter()
au BufWrite *.less :call ToggleLessFormatter()
au BufWrite *.html :call ToggleHTMLFormatter()
au BufWrite *.vue :call ToggleVueFormatter()
au BufWrite *.xml :call ToggleXMLFormatter()


let g:formatters_html = []
let g:formatters_python = []
let g:formatters_python = []
let g:formatters_cs = []
let g:formatters_c = []
let g:formatters_cpp = []
let g:formatters_java = []
let g:formatters_javascript = []
let g:formatters_json = []
let g:formatters_xml = []
let g:formatters_xhtml = []
let g:formatters_ruby = []
let g:formatters_css = []
let g:formatters_scss = []
let g:formatters_typescript = []
let g:formatters_go = []
let g:formatters_rust = []
let g:formatters_dart = []
let g:formatters_perl = []
let g:formatters_haskell = []
let g:formatters_markdown = []
let g:formatters_fortran = []
let g:formatters_vue = []

let g:formatter_on = 1 

function! FormatOff()
    let g:formatter_on = 0
endfunction

function! FormatOn()
    let g:formatter_on = 1
endfunction

function! ToggleFormatter()
    if g:formatter_on
        :call FormatOff()
    else
        :call FormatOn()
    endif
endfunction

function! ToggleVueFormatter()
    if g:formatter_on
        let g:formatters_vue = ['prettier_vue']
        :Autoformat
    endif
endfunction


function! ToggleTypescriptFormatter()
    if g:formatter_on
        let g:formatters_typescript = ['prettier_typescript']
        :Autoformat
    endif
endfunction

function! TogglePythonFormatter()
    if g:formatter_on
        let g:formatters_python = ['autopep8','yapf']
        :Autoformat
    endif
endfunction

function! ToggleCsFormatter()
    if g:formatter_on
        let g:formatters_cs = ['astyle_cs']
        :Autoformat
    endif
endfunction

function! ToggleCFormatter()
    if g:formatter_on
        let g:formatters_c = ['clangformat', 'astyle_c']
        :Autoformat
    endif
endfunction

function! ToggleCppFormatter()
    if g:formatter_on
        let g:formatters_cpp = ['clangformat', 'astyle_cpp']
        :Autoformat
    endif
endfunction

function! ToggleJavaFormatter()
    if g:formatter_on
        let g:formatters_java = ['astyle_java']
        :Autoformat
    endif
endfunction

function! ToggleJavascriptFormatter()
    if g:formatter_on
        let g:formatters_javascript = ['prettier_typescript']
        :Autoformat
    endif
endfunction

function! ToggleJsonFormatter()
    if g:formatter_on
        let g:formatters_json = ['my_custom_json']
        :Autoformat
    endif
endfunction

function! ToggleHTMLFormatter()
    if g:formatter_on
        let g:formatters_html = ['my_custom_html']
        :Autoformat
    endif
endfunction

function! ToggleXMLFormatter()
    if g:formatter_on
        let g:formatters_xml = ['tidy_xml']
        :Autoformat
    endif
endfunction

function! ToggleXHTMLFormatter()
    if g:formatter_on
        let g:formatters_xhtml = ['tidy_xhtml']
        :Autoformat
    endif
endfunction

function! ToggleRubyFormatter()
    if g:formatter_on
        let g:formatters_ruby = ['rbeautify', 'rubocop']
        :Autoformat
    endif
endfunction

function! ToggleCSSFormatter()
    if g:formatter_on
        let g:formatters_css = ['cssbeautify']
        :Autoformat
    endif
endfunction

function! ToggleSCSSFormatter()
    if g:formatter_on
        let g:formatters_scss = ['sassconvert']
        :Autoformat
    endif
endfunction

function! ToggleLessFormatter()
    if g:formatter_on
        let g:formatters_less = ['prettier_less']
        :Autoformat
    endif
endfunction

function! ToggleGoFormatter()
    if g:formatter_on
        let g:formatters_go = ['gofmt_1', 'goimports', 'gofmt_2']
        :Autoformat
    endif
endfunction

function! ToggleRustFormatter()
    if g:formatter_on
        let g:formatters_rust = ['rustfmt']
        :Autoformat
    endif
endfunction

function! ToggleDartFormatter()
    if g:formatter_on
        let g:formatters_dart = ['dartfmt']
        :Autoformat
    endif
endfunction

function! TogglePerlFormatter()
    if g:formatter_on
        let g:formatters_perl = ['perltidy']
        :Autoformat
    endif
endfunction

function! ToggleHaskellFormatter()
    if g:formatter_on
        let g:formatters_haskell = ['stylish_haskell']
        :Autoformat
    endif
endfunction

function! ToggleMarkdownFormatter()
    if g:formatter_on
        let g:formatters_markdown = ['remark_markdown']
        :Autoformat
    endif
endfunction

function! ToggleFortranFormatter()
    if g:formatter_on
        let g:formatters_fortran = ['fprettify']
        :Autoformat
    endif
endfunction

function! Formatonsave()
    let l:formatdiff = 1
    pyf /usr/local/Cellar/llvm/5.0.0/share/clang/clang-format.py
    :silent %s/\(import.*\)\@<={/{ /ge
    :silent %s/\(import.*\)\@<=}/ }/ge
    :silent %s/\(import.*\)\@<=  / /ge
endfunction

