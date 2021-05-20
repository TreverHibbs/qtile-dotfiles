" wpgtk.vim -- Vim color scheme.
" Author:       Dylan Araps, modified by Matthew Krohn and DeviantFero
" Webpage:      https://github.com/dylanaraps/wal
" Description:  A colorscheme that uses your terminal colors, made to work with 'wpgtk'.

hi clear
set background=dark

if exists('syntax_on')
    syntax reset
endif

" Colorscheme name
let g:colors_name = 'vimgui-theme'

source $HOME/.cache/wal/colors-wal.vim

function!  Coloring(group,guibg,guifg,gui,ctermbg,ctermfg)
  let highlightstr = 'highlight ' . a:group . ' '
  let highlightstr .= 'guibg=' . a:guibg . ' '
  let highlightstr .= 'guifg=' . a:guifg . ' '
  let highlightstr .= 'gui=' . a:gui . ' '
  let highlightstr .= 'ctermbg=' . a:ctermbg . ' '
  let highlightstr .= 'ctermfg=' . a:ctermfg . ' '
  let highlightstr .= 'cterm=' . a:gui . ' '

  execute highlightstr
endfunction

" highlight groups {{{

" set t_Co=16
call Coloring("Normal", "NONE", color15, "NONE", "NONE", "15")
call Coloring("EndOfBuffer", "NONE", color15, "NONE", "NONE", "15")
call Coloring("NonText", "NONE", color0, "NONE", "NONE", "0")
call Coloring("Comment", "NONE", color7, "italic", "NONE", "7")
call Coloring("Constant", "NONE", color11, "NONE", "NONE", "11")
call Coloring("Error", color11, color15, "NONE", "11", "15")
call Coloring("Identifier", "NONE", color9, "BOLD", "NONE", "9")
call Coloring("Ignore", color8, color0, "NONE", "8", "0")
call Coloring("PreProc", "NONE", color11, "NONE", "NONE", "11")
call Coloring("Special", "NONE", color14, "NONE", "NONE", "14")
call Coloring("Statement", "NONE", color9, "NONE", "NONE", "9")
call Coloring("String", "NONE", color14, "NONE", "NONE", "19")
call Coloring("Number", "NONE", color11, "NONE", "NONE", "11")
call Coloring("Todo", color10, color0, "NONE", "10", "0")
call Coloring("Type", "NONE", color10, "NONE", "NONE", "11")
call Coloring("Underlined", "NONE", color9, "underline", "NONE", "9")
call Coloring("StatusLine", color0, color0, "NONE", "15", "0")
call Coloring("StatusLineNC", color0, color0, "NONE", "8", "0")
call Coloring("TabLine", "NONE", color8, "NONE", "NONE", "8")
call Coloring("TabLineFill", "NONE", color8, "NONE", "NONE", "8")
call Coloring("TabLineSel", color12, color0, "NONE", "12", "0")
call Coloring("Conceal", color0, color0, "NONE", "0", "0")
call Coloring("TermCursorNC", color11, color0, "NONE", "11", "0")
call Coloring("VertSplit", color0, color0, "NONE", "0", "0")
call Coloring("Title", "NONE", color12, "NONE", "NONE", "12")
call Coloring("CursorLine", color8, "NONE", "NONE", "8", "NONE")
call Coloring("LineNr", "NONE", color8, "NONE", "NONE", "8")
call Coloring("CursorLineNr", "NONE", color8, "NONE", "NONE", "8")
call Coloring("helpLeadBlank", "NONE", color15, "NONE", "NONE", "15")
call Coloring("helpNormal", "NONE", color15, "NONE", "NONE", "15")
" TODO check this out later
hi Visual term=reverse
call Coloring("Visual", color0, color15, "reverse", "0", "15")
call Coloring("VisualNOS", "NONE", color9, "reverse", "NONE", "9")
call Coloring("Pmenu", color4, color15, "NONE", "4", "15")
call Coloring("PmenuSbar", color14, color15, "NONE", "14", "15")
call Coloring("PmenuSel", color12, color0, "NONE", "12", "0")
call Coloring("PmenuThumb", color8, color8, "NONE", "8", "8")
call Coloring("FoldColumn", "NONE", color15, "NONE", "NONE", "15")
call Coloring("Folded", color8, color7, "NONE", "8", "7")
call Coloring("WildMenu", color10, color0, "NONE", "10", "0")
call Coloring("SpecialKey", "NONE", color8, "NONE", "NONE", "8")
call Coloring("DiffAdd", "NONE", color10, "NONE", "NONE", "10")
call Coloring("DiffChange", "NONE", color8, "NONE", "NONE", "8")
call Coloring("DiffDelete", "NONE", color9, "NONE", "NONE", "9")
call Coloring("DiffText", "NONE", color12, "NONE", "NONE", "12")
call Coloring("IncSearch", color11, color0, "NONE", "11", "0")
call Coloring("Search", color11, color0, "NONE", "11", "0")

call Coloring("ColorColumn", color12, color0, "NONE", "12", "0")
call Coloring("signColumn", "NONE", color12, "NONE", "NONE", "12")
call Coloring("ErrorMsg", "NONE", color8, "NONE", "NONE", "8")
call Coloring("ModeMsg", "NONE", color10, "NONE", "NONE", "10")
call Coloring("MoreMsg", "NONE", color10, "NONE", "NONE", "10")
call Coloring("Question", "NONE", color12, "NONE", "NONE", "12")
call Coloring("WarningMsg", color9, color0, "NONE", "9", "0")
call Coloring("Cursor", "NONE", color8, "NONE", "NONE", "8")
call Coloring("Structure", "NONE", color13, "NONE", "NONE", "13")
call Coloring("CursorColumn", color8, color15, "NONE", "8", "15")
call Coloring("ModeMsg", "NONE", color15, "NONE", "NONE", "15") 
call Coloring("SpellBad", "NONE", color9, "underline", "NONE", "9")
call Coloring("SpellCap", "NONE", color12, "underline", "NONE", "12")
call Coloring("SpellLocal", "NONE", color13, "underline", "NONE", "13")
call Coloring("SpellRare", "NONE", color14, "underline", "NONE", "14")
call Coloring("Boolean", "NONE", color13, "NONE", "NONE", "13")
call Coloring("Character", "NONE", color9, "NONE", "NONE", "9")
call Coloring("Conditional", "NONE", color13, "NONE", "NONE", "13")
call Coloring("Define", "NONE", color13, "NONE", "NONE", "13")
call Coloring("Delimiter", "NONE", color13, "NONE", "NONE", "13")
call Coloring("Float", "NONE", color13, "NONE", "NONE", "13")
call Coloring("Include", "NONE", color12, "NONE", "NONE", "12")
call Coloring("Keyword", "NONE", color13, "NONE", "NONE", "13")
call Coloring("Label", "NONE", color11, "NONE", "NONE", "11")
call Coloring("Operator", "NONE", color15, "NONE", "NONE", "15")
call Coloring("Repeat", "NONE", color11, "NONE", "NONE", "11")
call Coloring("SpecialChar", "NONE", color13, "NONE", "NONE", "13")
call Coloring("Tag", "NONE", color11, "NONE", "NONE", "11")
call Coloring("Typedef", "NONE", color11, "NONE", "NONE", "11")
call Coloring("vimUserCommand", "NONE", color9, "BOLD", "NONE", "9")
    hi link vimMap vimUserCommand
    hi link vimLet vimUserCommand
    hi link vimCommand vimUserCommand
    hi link vimFTCmd vimUserCommand
    hi link vimAutoCmd vimUserCommand
    hi link vimNotFunc vimUserCommand
    hi link vimSynType Type
call Coloring("vimNotation", "NONE", color12, "NONE", "NONE", "12")
call Coloring("vimMapModKey", "NONE", color12, "NONE", "NONE", "12")
call Coloring("vimBracket", "NONE", color15, "NONE", "NONE", "15")
call Coloring("vimCommentString", "NONE", color7, "NONE", "NONE", "7")
call Coloring("htmlLink", "NONE", color9, "underline", "NONE", "9")
call Coloring("htmlBold", "NONE", color11, "BOLD", "NONE", "11")
call Coloring("htmlItalic", "NONE", color13, "NONE", "NONE", "13")
call Coloring("htmlEndTag", "NONE", color15, "NONE", "NONE", "15")
call Coloring("htmlTag", "NONE", color15, "NONE", "NONE", "15")
call Coloring("htmlTagName", "NONE", color9, "BOLD", "NONE", "9")
call Coloring("htmlH1", "NONE", color15, "NONE", "NONE", "15")
    hi link htmlH2 htmlH1
    hi link htmlH3 htmlH1
    hi link htmlH4 htmlH1
    hi link htmlH5 htmlH1
    hi link htmlH6 htmlH1
call Coloring("cssMultiColumnAttr", "NONE", color10, "NONE", "NONE", "10")
    hi link cssFontAttr cssMultiColumnAttr
    hi link cssFlexibleBoxAttr cssMultiColumnAttr
call Coloring("cssBraces", "NONE", color15, "NONE", "NONE", "15")
    hi link cssAttrComma cssBraces
call Coloring("cssValueLength", "NONE", color15, "NONE", "NONE", "15")
call Coloring("cssUnitDecorators", "NONE", color15, "NONE", "NONE", "15")
call Coloring("cssValueNumber", "NONE", color15, "NONE", "NONE", "15")
    hi link cssValueLength cssValueNumber
call Coloring("cssNoise", "NONE", color8, "NONE", "NONE", "8")
call Coloring("cssTagName", "NONE", color9, "NONE", "NONE", "9")
call Coloring("cssFunctionName", "NONE", color12, "NONE", "NONE", "12")
call Coloring("scssSelectorChar", "NONE", color15, "NONE", "NONE", "15")
call Coloring("scssAttribute", "NONE", color15, "NONE", "NONE", "15")
    hi link scssDefinition cssNoise
call Coloring("sassidChar", "NONE", color9, "NONE", "NONE", "9")
call Coloring("sassClassChar", "NONE", color13, "NONE", "NONE", "13")
call Coloring("sassInclude", "NONE", color13, "NONE", "NONE", "13")
call Coloring("sassMixing", "NONE", color13, "NONE", "NONE", "13")
call Coloring("sassMixinName", "NONE", color12, "NONE", "NONE", "12")
call Coloring("javaScript", "NONE", color15, "NONE", "NONE", "15")
call Coloring("javaScriptBraces", "NONE", color15, "NONE", "NONE", "15")
call Coloring("javaScriptNumber", "NONE", color13, "NONE", "NONE", "13")
call Coloring("markdownH1", "NONE", color15, "NONE", "NONE", "15")
    hi link markdownH2 markdownH1
    hi link markdownH3 markdownH1
    hi link markdownH4 markdownH1
    hi link markdownH5 markdownH1
    hi link markdownH6 markdownH1
call Coloring("markdownAutomaticLink", "NONE", color10, "underline", "NONE", "10")
    hi link markdownUrl markdownAutomaticLink
call Coloring("markdownError", "NONE", color15, "NONE", "NONE", "15")
call Coloring("markdownCode", "NONE", color11, "NONE", "NONE", "11")
call Coloring("markdownCodeBlock", "NONE", color11, "NONE", "NONE", "11")
call Coloring("markdownCodeDelimiter", "NONE", color13, "NONE", "NONE", "13")
hi markdownItalic cterm=Italic gui=Italic
hi markdownBold cterm=Bold gui=Bold
call Coloring("xdefaultsValue", "NONE", color15, "NONE", "NONE", "15")
call Coloring("rubyInclude", "NONE", color12, "NONE", "NONE", "12")
call Coloring("rubyDefine", "NONE", color13, "NONE", "NONE", "13")
call Coloring("rubyFunction", "NONE", color12, "NONE", "NONE", "12")
call Coloring("rubyStringDelimiter", "NONE", color10, "NONE", "NONE", "10")
call Coloring("rubyInteger", "NONE", color11, "NONE", "NONE", "11")
call Coloring("rubyAttribute", "NONE", color12, "NONE", "NONE", "12")
call Coloring("rubyConstant", "NONE", color11, "NONE", "NONE", "11")
call Coloring("rubyInterpolation", "NONE", color10, "NONE", "NONE", "10")
call Coloring("rubyInterpolationDelimiter", "NONE", color11, "NONE", "NONE", "11")
call Coloring("rubyRegexp", "NONE", color14, "NONE", "NONE", "14")
call Coloring("rubySymbol", "NONE", color10, "NONE", "NONE", "10")
call Coloring("rubyTodo", "NONE", color8, "NONE", "NONE", "8")
call Coloring("rubyRegexpAnchor", "NONE", color15, "NONE", "NONE", "15")
    hi link rubyRegexpQuantifier rubyRegexpAnchor
call Coloring("pythonOperator", "NONE", color13, "NONE", "NONE", "13")
call Coloring("pythonFunction", "NONE", color12, "NONE", "NONE", "12")
call Coloring("pythonRepeat", "NONE", color13, "NONE", "NONE", "13")
call Coloring("pythonStatement", "NONE", color9, "Bold", "NONE", "9")
call Coloring("pythonBuiltIn", "NONE", color12, "NONE", "NONE", "12")
call Coloring("phpMemberSelector", "NONE", color15, "NONE", "NONE", "15")
call Coloring("phpComparison", "NONE", color15, "NONE", "NONE", "15")
call Coloring("phpParent", "NONE", color15, "NONE", "NONE", "15")
call Coloring("cOperator", "NONE", color14, "NONE", "NONE", "14")
call Coloring("cPreCondit", "NONE", color13, "NONE", "NONE", "13")
call Coloring("SignifySignAdd", "NONE", color10, "NONE", "NONE", "10")
call Coloring("SignifySignChange", "NONE", color12, "NONE", "NONE", "12")
call Coloring("SignifySignDelete", "NONE", color9, "NONE", "NONE", "9")
call Coloring("NERDTreeDirSlash", "NONE", color12, "NONE", "NONE", "12")
call Coloring("NERDTreeExecFile", "NONE", color15, "NONE", "NONE", "15")
call Coloring("ALEErrorSign", "NONE", color9, "NONE", "NONE", "9")
call Coloring("ALEWarningSign", "NONE", color11, "NONE", "NONE", "11")
call Coloring("ALEError", "NONE", color9, "NONE", "NONE", "9")
call Coloring("ALEWarning", "NONE", color11, "NONE", "NONE", "11")

" }}}

" Plugin options {{{

let g:limelight_conceal_ctermfg = 8

" }}}
