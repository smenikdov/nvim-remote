-----------------------------------------------------------
-- General Neovim settings and configuration
-----------------------------------------------------------

-- Default options are not included
-- See: https://neovim.io/doc/user/vim_diff.html
-- [2] Defaults - *nvim-defaults*

local g = vim.g -- Global variables
local opt = vim.opt -- Set options (global/buffer/windows-scoped)

g.mapleader = " "
g.maplocalleader = "\\"
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
g.autoformat = false
g.omni_sql_no_default_maps = 1
-----------------------------------------------------------
-- General
-----------------------------------------------------------
opt.mouse = "a" -- Enable mouse support
opt.clipboard = "unnamedplus" -- Copy/paste to system clipboard
opt.swapfile = false -- Don't use swapfile
opt.completeopt = "menuone,noinsert,noselect" -- Autocomplete options
opt.wrap = false
opt.spelloptions = "camel"

-----------------------------------------------------------
-- Neovim UI
-----------------------------------------------------------
opt.fillchars:append { vert = " " }
opt.number = true -- Show line number
opt.relativenumber = true
opt.encoding = "UTF-8"
opt.scrolloff = 10
-- opt.showmatch = true -- Highlight matching parenthesis
-- opt.foldmethod = "marker" -- Enable folding (default 'foldmarker')
-- opt.colorcolumn = "80" -- Line lenght marker at 80 columns
-- opt.splitright = true -- Vertical split to the right
-- opt.splitbelow = true -- Horizontal split to the bottom
-- opt.ignorecase = true -- Ignore case letters when search
-- opt.smartcase = true -- Ignore lowercase for the whole pattern
-- opt.linebreak = true -- Wrap on word boundary
-- opt.termguicolors = true -- Enable 24-bit RGB colors
-- opt.laststatus = 3 -- Set global statusline

-----------------------------------------------------------
-- Tabs, indent
-----------------------------------------------------------
opt.expandtab = true -- Use spaces instead of tabs
opt.shiftwidth = 4 -- Shift 4 spaces when tab
opt.tabstop = 4 -- 1 tab == 4 spaces
opt.smartindent = true -- Autoindent new lines

-----------------------------------------------------------
-- Memory, CPU
-----------------------------------------------------------
opt.hidden = true -- Enable background buffers
opt.history = 100 -- Remember N lines in history
-- opt.lazyredraw = true -- Faster scrolling
opt.synmaxcol = 240 -- Max column for syntax highlight
opt.updatetime = 250 -- ms to wait for trigger an event

vim.filetype.add({
    extension = {
        ['http'] = 'http',
        hbs = "html"
    },
})

-----------------------------------------------------------
-- Startup
-----------------------------------------------------------
-- -- Disable nvim intro
-- opt.shortmess:append "sI"
--
-- -- -- Disable builtin plugins
-- local disabled_built_ins = {
--    "2html_plugin",
--    "getscript",
--    "getscriptPlugin",
--    "gzip",
--    "logipat",
--    "netrw",
--    "netrwPlugin",
--    "netrwSettings",
--    "netrwFileHandlers",
--    "matchit",
--    "tar",
--    "tarPlugin",
--    "rrhelper",
--    "spellfile_plugin",
--    "vimball",
--    "vimballPlugin",
--    "zip",
--    "zipPlugin",
--    "tutor",
--    "rplugin",
--    "synmenu",
--    "optwin",
--    "compiler",
--    "bugreport",
--    "ftplugin",
-- }
--
-- for _, plugin in pairs(disabled_built_ins) do
--    g["loaded_" .. plugin] = 1
-- end
