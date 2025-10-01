-- Полная конвертация JetBrains RubyMine Dark theme в Neovim
local h = vim.api.nvim_set_hl

-- ============ COLORS (системные/базовые элементы) ============
h(0, "Normal", { fg = "#bcbec4", bg = "NONE" })
h(0, "NormalFloat", { fg = "#bcbec4", bg = "#2b2d30" })
h(0, "Cursor", { fg = "#1e1f22", bg = "#ced0d6" })
h(0, "CursorLine", { bg = "#26282e" })
h(0, "CursorLineNr", { fg = "#a1a3ab" })
h(0, "LineNr", { fg = "#4b5059" })
h(0, "Visual", { bg = "#393b40" })
h(0, "VisualNOS", { bg = "#393b40" })
h(0, "Search", { bg = "#2d543f" })
h(0, "IncSearch", { bg = "#114957" })
h(0, "Folded", { fg = "#868991", bg = "#393b40" })
h(0, "FoldColumn", { fg = "#868991", bg = "#393b40" })
h(0, "IndentGuide", { fg = "#313438" })
h(0, "IndentGuidesOdd", { bg = "#2b2d30" })
h(0, "IndentGuidesEven", { bg = "#2b2d30" })
h(0, "NonText", { fg = "#6f737a" })
h(0, "Whitespace", { fg = "#6f737a" })
h(0, "SpecialKey", { fg = "#6f737a" })
h(0, "ColorColumn", { bg = "#393b40" })
h(0, "SignColumn", { bg = "NONE" })
h(0, "Pmenu", { fg = "#bcbec4", bg = "#2b2d30" })
h(0, "PmenuSel", { fg = "#dfe1e5", bg = "#43454a" })
h(0, "PmenuSbar", { bg = "#393b40" })
h(0, "PmenuThumb", { bg = "#666870" })
h(0, "StatusLine", { fg = "#bcbec4", bg = "#2b2d30" })
h(0, "StatusLineNC", { fg = "#868a91", bg = "#2b2d30" })
h(0, "TabLine", { fg = "#868a91", bg = "#2b2d30" })
h(0, "TabLineSel", { fg = "#dfe1e5", bg = "#393b40" })
h(0, "TabLineFill", { bg = "#2b2d30" })
h(0, "VertSplit", { fg = "#43454a" })
h(0, "WinSeparator", { fg = "#43454a" })
h(0, "MatchParen", { bg = "#43454a", bold = true })

-- Diff colors
h(0, "DiffAdd", { bg = "#1a3b2d" })
h(0, "DiffChange", { bg = "#2d3552" })
h(0, "DiffDelete", { fg = "#868a91" })
h(0, "DiffText", { bg = "#375fad" })

-- Git signs
h(0, "GitSignsAdd", { fg = "#549159" })
h(0, "GitSignsChange", { fg = "#375fad" })
h(0, "GitSignsDelete", { fg = "#868a91" })

-- ============ ATTRIBUTES (синтаксис) ============

-- Comments
h(0, "Comment", { fg = "#7a7e85" })
h(0, "@comment", { fg = "#7a7e85" })
h(0, "@comment.documentation", { fg = "#5f826b", italic = true })
h(0, "@comment.documentation.tag", { fg = "#67a37c", underline = true })
h(0, "@comment.documentation.tag.value", { fg = "#abadb3" })

-- Keywords
h(0, "Keyword", { fg = "#cf8e6d" })
h(0, "@keyword", { fg = "#cf8e6d" })
h(0, "@keyword.function", { fg = "#cf8e6d" })
h(0, "@keyword.operator", { fg = "#cf8e6d" })
h(0, "@keyword.return", { fg = "#cf8e6d" })
h(0, "@keyword.import", { fg = "#cf8e6d" })

-- Strings
h(0, "String", { fg = "#6aab73" })
h(0, "@string", { fg = "#6aab73" })
h(0, "@string.regex", { fg = "#42c3d4" })
h(0, "@string.escape", { fg = "#cf8e6d" })
h(0, "@string.special", { fg = "#cf8e6d" })

-- Numbers
h(0, "Number", { fg = "#2aacb8" })
h(0, "@number", { fg = "#2aacb8" })

-- Functions
h(0, "Function", { fg = "#56a8f5" })
h(0, "@function", { fg = "#56a8f5" })
h(0, "@function.call", { fg = "#57aaf7" })
h(0, "@function.method", { fg = "#57aaf7" })
h(0, "@function.method.call", { fg = "#57aaf7" })

-- Types/Classes
h(0, "Type", { fg = "#bcbec4" })
h(0, "@type", { fg = "#bcbec4" })
h(0, "@type.builtin", { fg = "#bcbec4" })
h(0, "@type.definition", { fg = "#bcbec4" })

-- Constants
h(0, "Constant", { fg = "#c77dbb", italic = true })
h(0, "@constant", { fg = "#c77dbb", italic = true })
h(0, "@constant.builtin", { fg = "#c77dbb", italic = true })

-- Variables
h(0, "Identifier", { fg = "#bcbec4" })
h(0, "@variable", { fg = "#bcbec4" })
h(0, "@variable.builtin", { fg = "#c77dba", italic = true })
h(0, "@variable.parameter", { fg = "#bcbec4" })
h(0, "@variable.member", { fg = "#c77dbb" })

-- Operators
h(0, "Operator", { fg = "#bcbec4" })
h(0, "@operator", { fg = "#bcbec4" })

-- Punctuation
h(0, "@punctuation.delimiter", { fg = "#bcbec4" })
h(0, "@punctuation.bracket", { fg = "#bcbec4" })
h(0, "@punctuation.special", { fg = "#bcbec4" })

-- Properties/Attributes
h(0, "@property", { fg = "#c77dbb" })
h(0, "@attribute", { fg = "#b3ae60" })

-- Tags (HTML/XML)
h(0, "Tag", { fg = "#d5b778" })
h(0, "@tag", { fg = "#d5b778" })
h(0, "@tag.attribute", { fg = "#bcbec4" })
h(0, "@tag.delimiter", { fg = "#d5b778" })

-- Special
h(0, "Special", { fg = "#cf8e6d" })
h(0, "SpecialChar", { fg = "#cf8e6d" })
h(0, "@character.special", { fg = "#cf8e6d" })

-- Errors & Warnings
h(0, "Error", { fg = "#f75464", undercurl = true, sp = "#fa6675" })
h(0, "ErrorMsg", { fg = "#f75464" })
h(0, "WarningMsg", { fg = "#f2c55c" })
h(0, "DiagnosticError", { fg = "#f75464" })
h(0, "DiagnosticWarn", { fg = "#f2c55c" })
h(0, "DiagnosticInfo", { fg = "#857042" })
h(0, "DiagnosticHint", { fg = "#857042" })
h(0, "DiagnosticUnderlineError", { undercurl = true, sp = "#fa6675" })
h(0, "DiagnosticUnderlineWarn", { undercurl = true, sp = "#f2c55c" })
h(0, "DiagnosticUnderlineInfo", { undercurl = true, sp = "#857042" })
h(0, "DiagnosticUnderlineHint", { undercurl = true, sp = "#857042" })

-- Spell
h(0, "SpellBad", { undercurl = true, sp = "#7ec482" })
h(0, "SpellCap", { undercurl = true, sp = "#7ec482" })
h(0, "SpellLocal", { undercurl = true, sp = "#7ec482" })
h(0, "SpellRare", { undercurl = true, sp = "#7ec482" })

-- Deprecated/Strikethrough
h(0, "@text.strike", { fg = "#bcbec4", strikethrough = true })
h(0, "@deprecated", { fg = "#bcbec4", strikethrough = true })

-- Markup (Markdown, etc.)
h(0, "@markup.strong", { fg = "#bcbec4", bold = true })
h(0, "@markup.italic", { fg = "#bcbec4", italic = true })
h(0, "@markup.underline", { underline = true })
h(0, "@markup.link", { fg = "#548af7", underline = true })
h(0, "@markup.link.url", { fg = "#548af7", underline = true })
h(0, "@markup.raw", { fg = "#ced0d6", bg = "#26292c" })
h(0, "@markup.raw.block", { fg = "#ced0d6", bg = "#26292c" })

-- LSP Semantic Tokens
h(0, "@lsp.type.class", { fg = "#bcbec4" })
h(0, "@lsp.type.decorator", { fg = "#b3ae60" })
h(0, "@lsp.type.enum", { fg = "#bcbec4" })
h(0, "@lsp.type.enumMember", { fg = "#c77dbb", italic = true })
h(0, "@lsp.type.function", { fg = "#56a8f5" })
h(0, "@lsp.type.interface", { fg = "#bcbec4" })
h(0, "@lsp.type.macro", { fg = "#b3ae60" })
h(0, "@lsp.type.method", { fg = "#57aaf7" })
h(0, "@lsp.type.namespace", { fg = "#bcbec4" })
h(0, "@lsp.type.parameter", { fg = "#bcbec4" })
h(0, "@lsp.type.property", { fg = "#c77dbb" })
h(0, "@lsp.type.struct", { fg = "#bcbec4" })
h(0, "@lsp.type.type", { fg = "#bcbec4" })
h(0, "@lsp.type.typeParameter", { fg = "#16baac" })
h(0, "@lsp.type.variable", { fg = "#bcbec4" })

-- Telescope
h(0, "TelescopeBorder", { fg = "#43454a", bg = "NONE" })
h(0, "TelescopePromptBorder", { fg = "#43454a", bg = "NONE" })
h(0, "TelescopeResultsBorder", { fg = "#43454a", bg = "NONE" })
h(0, "TelescopePreviewBorder", { fg = "#43454a", bg = "NONE" })
h(0, "TelescopeSelection", { fg = "#dfe1e5", bg = "#2b2d30" })
h(0, "TelescopeMatching", { fg = "#548af7", bold = true })

-- NvimTree
h(0, "NvimTreeNormal", { fg = "#bcbec4", bg = "NONE" })
h(0, "NvimTreeFolderName", { fg = "#bcbec4" })
h(0, "NvimTreeRootFolder", { fg = "#cf8e6d", bold = true })
h(0, "NvimTreeSymlink", { fg = "#548af7" })
h(0, "NvimTreeGitNew", { fg = "#73bd79" })
h(0, "NvimTreeGitDirty", { fg = "#70aeff" })
h(0, "NvimTreeGitDeleted", { fg = "#6f737a" })

-- GitSigns
h(0, "GitSignsCurrentLineBlame", { fg = "#6f737a", italic = true })

-- Inlay hints
h(0, "LspInlayHint", { fg = "#868a91", bg = "#393b40" })

-- Cmp (completion menu)
h(0, "CmpItemAbbrDeprecated", { fg = "#6f737a", strikethrough = true })
h(0, "CmpItemAbbrMatch", { fg = "#548af7", bold = true })
h(0, "CmpItemAbbrMatchFuzzy", { fg = "#548af7" })
h(0, "CmpItemKindFunction", { fg = "#56a8f5" })
h(0, "CmpItemKindMethod", { fg = "#57aaf7" })
h(0, "CmpItemKindVariable", { fg = "#bcbec4" })
h(0, "CmpItemKindKeyword", { fg = "#cf8e6d" })
h(0, "CmpItemKindConstant", { fg = "#c77dbb" })
h(0, "CmpItemKindClass", { fg = "#bcbec4" })

-- TODO comments
h(0, "@text.todo", { fg = "#8bb33d", italic = true })
h(0, "@text.note", { fg = "#8bb33d", italic = true })
h(0, "@text.warning", { fg = "#f2c55c", italic = true })
h(0, "@text.danger", { fg = "#f75464", italic = true })

-- CSS specific
h(0, "cssImportant", { fg = "#cf8e6d", bold = true })
h(0, "cssColor", { fg = "#56a8f5" })
h(0, "cssURL", { fg = "#5c92ff" })

-- Regex
h(0, "@string.regexp", { fg = "#42c3d4" })
h(0, "rubyRegexpCharClass", { fg = "#b2ae60", bold = true })
h(0, "rubyRegexpEscape", { fg = "#cf8e6d" })

-- Ruby-specific highlights
h(0, "@symbol.ruby", { fg = "#89A6AF" })
h(0, "rubySymbol", { fg = "#89A6AF" })
h(0, "rubyConstant", { fg = "#c77dbb", italic = true })
h(0, "rubyClass", { fg = "#bcbec4" })
h(0, "rubyModule", { fg = "#bcbec4" })
h(0, "rubyDefine", { fg = "#cf8e6d" })
h(0, "rubyStringDelimiter", { fg = "#6aab73" })
h(0, "rubyInterpolation", { fg = "#cf8e6d" })
h(0, "rubyInstanceVariable", { fg = "#c77dbb" })
h(0, "rubyClassVariable", { fg = "#c77dbb" })
h(0, "rubyGlobalVariable", { fg = "#c77dba", italic = true })
h(0, "rubyPseudoVariable", { fg = "#c77dbb" })
h(0, "rubyKeyword", { fg = "#cf8e6d" })
h(0, "rubyControl", { fg = "#cf8e6d" })
h(0, "rubyConditional", { fg = "#cf8e6d" })
h(0, "rubyRepeat", { fg = "#cf8e6d" })
h(0, "rubyException", { fg = "#cf8e6d" })

-- Убрать фон для прозрачности
vim.cmd([[
  highlight Normal guibg=NONE ctermbg=NONE
  highlight NormalNC guibg=NONE ctermbg=NONE
  highlight SignColumn guibg=NONE ctermbg=NONE
  highlight EndOfBuffer guibg=NONE ctermbg=NONE
  highlight NvimTreeNormal guibg=NONE ctermbg=NONE
]])

