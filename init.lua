-- ============================================================================
-- ПОЛНЫЙ КОНФИГ NEOVIM С НАВИГАЦИЕЙ, ПОИСКОМ И ЗАМЕНОЙ
-- ============================================================================

-- В САМОМ НАЧАЛЕ init.lua (строка 1-5)
vim.notify = function(msg, level, opts)
  if msg:match("lspconfig") or msg:match("deprecated") then
    return
  end
  return vim.notify_original(msg, level, opts)
end
vim.notify_original = vim.notify

-- Менеджер плагинов (lazy.nvim)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git", lazypath
  })
end

vim.opt.rtp:prepend(lazypath)

-- ПЛАГИНЫ
require("lazy").setup({
  { "neovim/nvim-lspconfig" },
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  { "L3MON4D3/LuaSnip" },
  { "saadparwaiz1/cmp_luasnip" },
  { "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require('telescope').setup({
        defaults = {
          initial_mode = "insert",
          mappings = {
            n = { ["<Esc>"] = require('telescope.actions').close },
            i = { ["<Esc>"] = require('telescope.actions').close },
          },
        },
      })
    end,
  },
  { 'nvim-pack/nvim-spectre', dependencies = { 'nvim-lua/plenary.nvim' }},
  { "nvim-tree/nvim-tree.lua" },
  { "nvim-tree/nvim-web-devicons" },
  { "lewis6991/gitsigns.nvim" },
  { "tpope/vim-fugitive" },
  { "ThePrimeagen/harpoon", branch = "harpoon2", dependencies = { "nvim-lua/plenary.nvim" }},
  { "ggandor/leap.nvim" },
  { "numToStr/Comment.nvim" },
  { "windwp/nvim-autopairs" },
  { 'nvim-lualine/lualine.nvim', dependencies = { 'nvim-tree/nvim-web-devicons' }},
  { "folke/which-key.nvim" },
  { "xiantang/darcula-dark.nvim", dependencies = { "nvim-treesitter/nvim-treesitter" }},
  { "xiyaowong/transparent.nvim" },
  { "MeanderingProgrammer/render-markdown.nvim", dependencies = { 'nvim-treesitter/nvim-treesitter' }, ft = { "markdown" }, opts = {}},
  { 'psliwka/vim-smoothie' },
})

-- БАЗОВЫЕ НАСТРОЙКИ
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 50
vim.opt.colorcolumn = "120"
vim.opt.termguicolors = true
vim.opt.clipboard = "unnamedplus"
vim.opt.mouse = "a"

-- ЦВЕТОВАЯ СХЕМА
require("darcula").setup({})
vim.cmd.colorscheme("darcula-dark")
require("transparent").setup({})

-- LEADER KEY
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- TREESITTER
require('nvim-treesitter.configs').setup {
  ensure_installed = { "ruby", "javascript", "typescript", "json", "lua", "vim", "yaml", "html", "css" },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = { "ruby" },  -- Включить vim regex для Ruby
  },
  indent = { enable = true },
}

-- АВТОДОПОЛНЕНИЕ
local cmp = require'cmp'
local luasnip = require'luasnip'

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
  }),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'buffer' },
    { name = 'path' },
  },
})

-- LSP
require("mason").setup()
require("mason-lspconfig").setup({ ensure_installed = { "ruby_lsp", "lua_ls" }})

local ok, lspconfig = pcall(require, 'lspconfig')
if ok then
  lspconfig.ruby_lsp.setup({})
  lspconfig.lua_ls.setup({
    settings = {
      Lua = {
        diagnostics = { globals = { 'vim' }}
      }
    }
  })
end

-- ПЛАГИНЫ
require("nvim-tree").setup({ view = { width = 35 }, renderer = { group_empty = true }, filters = { dotfiles = false }})
require('gitsigns').setup()
require('lualine').setup { options = { theme = 'auto', section_separators = '', component_separators = '|' }}
require('Comment').setup()
require('nvim-autopairs').setup()
require('leap').create_default_mappings()
require("which-key").setup()
require("harpoon"):setup()

-- ШОРТКАТЫ
require('keymaps')

-- КАСТОМНАЯ RUBY ПОДСВЕТКА (ЗАГРУЖАЕТСЯ В КОНЦЕ)
pcall(require, "jetbrains_my_ruby")

