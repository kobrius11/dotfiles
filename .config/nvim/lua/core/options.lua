
local opt = vim.opt

opt.cursorline = true
opt.scrolloff = 15
opt.list = true

opt.signcolumn = "number"
opt.mouse = 'a'

-- Relative and absolute line numbers combined
opt.number = true
opt.relativenumber = true

-- Keep signcolumn on by default
opt.signcolumn = 'yes'

-- Cursorline
opt.cursorline = true

-- Show whitespace characters
opt.list = true
opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false
opt.incsearch = true

-- Preview substitutions
opt.inccommand = 'split'

-- Text wrapping
opt.wrap = true
opt.breakindent = true

-- Tabstops
opt.expandtab = true
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2

-- Window splitting
opt.splitright = true
opt.splitbelow = true

-- Save undo history
opt.undofile = true

opt.updatetime = 50
opt.colorcolumn = "120"

opt.autoread = true

