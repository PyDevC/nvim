local M = {}

M.palette = {
  bg           = "#031c1f", -- editor.background
  bg_dark      = "#042327", -- tabsBackground / dropdown.listBackground
  bg_deep      = "#0c141f", -- peekViewEditor.background
  bg_alt       = "#093136", -- tab.activeBackground / sideBarSectionHeader.background
  bg_border    = "#052c31", -- tab.border / editorGroup.border
  bg_input     = "#2A343E", -- input.background / dropdown.background
  selection_bg = "#0000FF", -- editor.selectionBackground
  selection_hl = "#63878a", -- editor.selectionHighlightBackground

  fg           = "#bdb395", -- Primary yellowish-brown text (editor.foreground)
  fg_bright    = "#FFFFFF", -- tab.activeForeground
  fg_light     = "#e0dede", -- editor.selectionForeground
  fg_muted     = "#CCCCCC", -- keyword.control / sideBar.foreground
  fg_dim       = "#bbbbbb", -- sideBarTitle.foreground

  accent       = "#B59E7A", -- statusBar.background / editorLineNumber.activeForeground
  accent_dim   = "#63878a",
  cursor       = "#86E08F", -- editorCursor.foreground
  cursor_bg    = "#000000", -- editorCursor.background

  comment      = "#31B72C", -- comment
  string       = "#2ca198", -- string
  mint         = "#9DE3C0", -- storage.type / keyword.type / class / struct
  ice          = "#b7cadd", -- numbers / parameters / type names / builtins
  var_decl     = "#A5B5BC", -- variable.name
  constant     = "#70c5bf", -- constant.language (true, false, null)
  error        = "#FF0000", -- invalid.illegal

  none         = "NONE",
}

M.config = {
  styles = {
    bold = true,
    italic = true,
    transparency = false,
  },
  highlight_groups = {},
}

function M.setup(opts)
  M.config = vim.tbl_deep_extend("force", M.config, opts or {})
end

function M.colorscheme()
  vim.cmd("hi clear")
  if vim.fn.exists("syntax_on") == 1 then
    vim.cmd("syntax reset")
  end

  vim.o.termguicolors = true
  vim.g.colors_name = "jblow"

  local p = M.palette
  local styles = M.config.styles

  local groups = {
    -- Basic UI
    Normal       = { fg = p.fg, bg = styles.transparency and p.none or p.bg },
    NormalNC     = { fg = p.fg, bg = styles.transparency and p.none or p.bg_deep },
    NormalFloat  = { fg = p.fg, bg = styles.transparency and p.none or p.bg_dark },
    FloatBorder  = { fg = p.accent, bg = styles.transparency and p.none or p.bg_dark },
    Cursor       = { fg = p.cursor_bg, bg = p.cursor },
    lCursor      = { fg = p.cursor_bg, bg = p.cursor },
    CursorIM     = { fg = p.cursor_bg, bg = p.cursor },
    CursorLine   = { bg = p.none },
    CursorColumn = { bg = p.none },
    ColorColumn  = { bg = p.bg_dark },
    FoldColumn   = { fg = p.accent_dim, bg = styles.transparency and p.none or p.bg },
    SignColumn   = { fg = p.accent_dim, bg = styles.transparency and p.none or p.bg },
    LineNr       = { fg = p.accent_dim, bg = styles.transparency and p.none or p.bg },
    CursorLineNr = { fg = p.accent, bold = styles.bold },
    VertSplit    = { fg = p.bg_border, bg = styles.transparency and p.none or p.bg },
    WinSeparator = { fg = p.bg_border, bg = styles.transparency and p.none or p.bg },
    MatchParen   = { fg = p.fg_bright, bg = p.bg_alt, underline = true },
    StatusLine   = { fg = p.cursor_bg, bg = p.accent, bold = styles.bold },
    StatusLineNC = { fg = p.fg_muted, bg = p.bg_deep },
    TabLine      = { fg = p.fg_muted, bg = p.bg_dark },
    TabLineFill  = { bg = p.bg_dark },
    TabLineSel   = { fg = p.fg_bright, bg = p.bg_alt, bold = styles.bold },
    Pmenu        = { fg = p.fg_muted, bg = p.bg_dark },
    PmenuSel     = { fg = p.fg_bright, bg = p.bg_alt },
    PmenuSbar    = { bg = p.bg_dark },
    PmenuThumb   = { bg = p.accent },
    IncSearch    = { fg = p.cursor_bg, bg = p.accent, bold = styles.bold },
    Search       = { fg = p.fg_light, bg = p.selection_hl },
    CurSearch    = { fg = p.cursor_bg, bg = p.cursor, bold = styles.bold },
    Visual       = { fg = p.fg_light, bg = p.selection_bg },
    VisualNOS    = { fg = p.fg_light, bg = p.selection_hl },
    Directory    = { fg = p.fg },
    Folded       = { fg = p.fg_dim, bg = p.bg_dark },
    WildMenu     = { fg = p.fg_bright, bg = p.bg_alt },
    NonText      = { fg = p.bg_border },
    SpecialKey   = { fg = p.accent_dim },
    Title        = { fg = p.fg, bold = styles.bold },
    Underlined   = { underline = true },

    -- Messages & Diffs
    ErrorMsg     = { fg = p.error, bg = p.bg_dark, bold = styles.bold },
    WarningMsg   = { fg = p.accent, bg = p.bg_dark, bold = styles.bold },
    MoreMsg      = { fg = p.mint },
    ModeMsg      = { fg = p.fg, bold = styles.bold },
    Question     = { fg = p.ice },
    DiffAdd      = { fg = p.fg_bright, bg = "#123d0f", bold = styles.bold },
    DiffDelete   = { fg = p.error, bg = p.bg_dark },
    DiffChange   = { fg = p.fg_light, bg = "#151b3c" },
    DiffText     = { fg = p.fg_bright, bg = p.error, bold = styles.bold },

    -- Standard Syntax (Yellowish-brown #bdb395 as default text)
    Boolean      = { fg = p.constant },
    Character    = { fg = p.string },
    Comment      = { fg = p.comment, italic = styles.italic },
    Conditional  = { fg = p.fg_muted },
    Constant     = { fg = p.fg },
    Define       = { fg = p.mint },
    Float        = { fg = p.ice },
    Function     = { fg = p.fg },
    Identifier   = { fg = p.fg },
    Keyword      = { fg = p.fg_muted },
    Label        = { fg = p.fg },
    Number       = { fg = p.ice },
    Operator     = { fg = p.fg_muted },
    PreProc      = { fg = p.mint },
    Special      = { fg = p.fg },
    Statement    = { fg = p.fg_muted },
    StorageClass = { fg = p.mint },
    String       = { fg = p.string },
    Tag          = { fg = p.mint },
    Todo         = { fg = p.cursor_bg, bg = p.accent, bold = styles.bold },
    Type         = { fg = p.mint },

    -- Diagnostics
    DiagnosticError = { fg = p.error },
    DiagnosticWarn  = { fg = p.accent },
    DiagnosticInfo  = { fg = p.ice },
    DiagnosticHint  = { fg = p.constant },

    -- Treesitter (Matching VS Code j_blow scopes)
    ["@variable"]                    = { fg = p.fg },       -- Default identifiers stay yellowish-brown
    ["@variable.builtin"]            = { fg = p.ice },      -- this, self
    ["@variable.parameter"]          = { fg = p.ice },      -- function parameters
    ["@variable.parameter.builtin"]  = { fg = p.ice },
    ["@variable.member"]             = { fg = p.fg },       -- struct/object fields stay yellowish-brown
    ["@constant"]                    = { fg = p.fg },
    ["@constant.builtin"]            = { fg = p.constant }, -- true, false, null, nil
    ["@constant.macro"]              = { fg = p.fg },
    ["@module"]                      = { fg = p.fg },
    ["@module.builtin"]              = { fg = p.fg },
    ["@label"]                       = { fg = p.fg },
    ["@string"]                      = { fg = p.string },
    ["@string.regexp"]               = { fg = p.string },
    ["@string.escape"]               = { fg = p.constant },
    ["@string.special"]              = { fg = p.string },
    ["@string.special.symbol"]       = { fg = p.fg },
    ["@character"]                   = { fg = p.string },
    ["@character.special"]           = { fg = p.string },
    ["@boolean"]                     = { fg = p.constant },
    ["@number"]                      = { fg = p.ice },
    ["@number.float"]                = { fg = p.ice },
    ["@float"]                       = { fg = p.ice },
    ["@type"]                        = { fg = p.ice },      -- Type annotations
    ["@type.builtin"]                = { fg = p.mint },     -- int, float, void, char
    ["@type.definition"]             = { fg = p.mint },     -- struct/class names
    ["@attribute"]                   = { fg = p.mint },
    ["@attribute.builtin"]           = { fg = p.mint },
    ["@property"]                    = { fg = p.fg },
    ["@function"]                    = { fg = p.fg },       -- Function definitions & calls
    ["@function.builtin"]            = { fg = p.ice },
    ["@function.macro"]              = { fg = p.fg },
    ["@function.method"]             = { fg = p.fg },
    ["@function.method.call"]        = { fg = p.fg },
    ["@constructor"]                 = { fg = p.mint },
    ["@operator"]                    = { fg = p.fg_muted },
    ["@keyword"]                     = { fg = p.fg_muted },
    ["@keyword.operator"]            = { fg = p.fg_muted },
    ["@keyword.import"]              = { fg = p.mint },
    ["@keyword.storage"]             = { fg = p.mint },
    ["@keyword.repeat"]              = { fg = p.fg_muted },
    ["@keyword.return"]              = { fg = p.fg_muted },
    ["@keyword.debug"]               = { fg = p.fg_muted },
    ["@keyword.exception"]           = { fg = p.fg_muted },
    ["@keyword.conditional"]         = { fg = p.fg_muted },
    ["@keyword.conditional.ternary"] = { fg = p.fg_muted },
    ["@keyword.directive"]           = { fg = p.mint },
    ["@keyword.directive.define"]    = { fg = p.mint },
    ["@comment"]                     = { link = "Comment" },
    ["@comment.todo"]                = { link = "Todo" },
    ["@tag"]                         = { fg = p.mint },
    ["@tag.attribute"]               = { fg = p.ice },
    ["@tag.delimiter"]               = { fg = p.fg_muted },

    -- LSP Semantic Tokens (prevents LSP from overriding yellowish-brown text with ice blue)
    ["@lsp.type.variable"]           = { fg = p.fg },
    ["@lsp.type.property"]           = { fg = p.fg },
    ["@lsp.type.function"]           = { fg = p.fg },
    ["@lsp.type.method"]             = { fg = p.fg },
    ["@lsp.type.parameter"]          = { fg = p.ice },
    ["@lsp.type.type"]               = { fg = p.ice },
    ["@lsp.type.struct"]             = { fg = p.mint },
    ["@lsp.type.class"]              = { fg = p.mint },
    ["@lsp.type.enum"]               = { fg = p.mint },
    ["@lsp.type.enumMember"]         = { fg = p.constant },
    ["@lsp.type.namespace"]          = { fg = p.fg },
    ["@lsp.type.macro"]              = { fg = p.fg },
  }

  -- Merge user highlight_groups overrides
  for group, highlight in pairs(M.config.highlight_groups) do
    if groups[group] then
      groups[group] = vim.tbl_extend("force", groups[group], highlight)
    else
      groups[group] = highlight
    end
  end

  -- Apply all highlights
  for group, highlight in pairs(groups) do
    vim.api.nvim_set_hl(0, group, highlight)
  end

  -- Neovim Terminal Mode Colors
  vim.g.terminal_color_0  = p.bg
  vim.g.terminal_color_1  = p.error
  vim.g.terminal_color_2  = p.comment
  vim.g.terminal_color_3  = p.accent
  vim.g.terminal_color_4  = p.ice
  vim.g.terminal_color_5  = p.mint
  vim.g.terminal_color_6  = p.string
  vim.g.terminal_color_7  = p.fg
  vim.g.terminal_color_8  = p.bg_input
  vim.g.terminal_color_9  = p.error
  vim.g.terminal_color_10 = p.cursor
  vim.g.terminal_color_11 = p.accent
  vim.g.terminal_color_12 = p.ice
  vim.g.terminal_color_13 = p.mint
  vim.g.terminal_color_14 = p.constant
  vim.g.terminal_color_15 = p.fg_bright
end

-- Automatically apply when loaded via :colorscheme jblow
M.colorscheme()

return M
