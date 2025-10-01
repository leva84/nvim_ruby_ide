-- ============================================================================
-- ПОЛНЫЙ КОНФИГ NEOVIM С НАВИГАЦИЕЙ, ПОИСКОМ И ЗАМЕНОЙ
-- ============================================================================

-- В САМОМ НАЧАЛЕ init.lua (строка 1-5)
vim.notify = function(msg, level, opts)
  if msg:match("lspconfig") or msg:match("deprecated") then
    return  -- Игнорировать предупреждения lspconfig
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

-- ============================================================================
-- ПЛАГИНЫ
-- ============================================================================
require("lazy").setup({
  -- LSP конфиг и менеджер
  { "neovim/nvim-lspconfig" },
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },
  
  -- Treesitter для подсветки синтаксиса
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  
  -- Автодополнение
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  
  -- Сниппеты
  { "L3MON4D3/LuaSnip" },
  { "saadparwaiz1/cmp_luasnip" },
  
  -- Telescope (поиск файлов/grep)
  { 
    "nvim-telescope/telescope.nvim", 
    branch = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require('telescope').setup({
        defaults = {
          initial_mode = "insert",
          mappings = {
            n = {
              ["<Esc>"] = require('telescope.actions').close,  -- Одно нажатие Esc для закрытия
            },
            i = {
              ["<Esc>"] = require('telescope.actions').close,
            },
          },
        },
      })
    end,
  },

  -- Spectre (поиск и замена по проекту)
  {
    'nvim-pack/nvim-spectre',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },
  
  -- Файловый менеджер
  { "nvim-tree/nvim-tree.lua" },
  { "nvim-tree/nvim-web-devicons" },
  
  -- Git-интеграция
  { "lewis6991/gitsigns.nvim" },
  { "tpope/vim-fugitive" },
  
  -- Навигация между файлами (harpoon)
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" }
  },
  
  -- Улучшенная навигация (leap)
  { "ggandor/leap.nvim" },
  
  -- Комментирование кода
  { "numToStr/Comment.nvim" },
  
  -- Парные скобки/кавычки
  { "windwp/nvim-autopairs" },
  
  -- Статусная строка
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }
  },
  
  -- Which-key (показывает доступные шорткаты)
  { "folke/which-key.nvim" },
  
  -- Темы
  { "xiantang/darcula-dark.nvim", dependencies = { "nvim-treesitter/nvim-treesitter" } },
  { "xiyaowong/transparent.nvim" },
})

-- ============================================================================
-- БАЗОВЫЕ НАСТРОЙКИ
-- ============================================================================
vim.opt.number = true              -- Номера строк
vim.opt.relativenumber = true      -- Относительные номера
vim.opt.tabstop = 2                -- Размер табуляции
vim.opt.shiftwidth = 2             -- Размер отступа
vim.opt.expandtab = true           -- Пробелы вместо табов
vim.opt.smartindent = true         -- Умные отступы
vim.opt.wrap = false               -- Не переносить длинные строки
vim.opt.swapfile = false           -- Отключить swap-файлы
vim.opt.backup = false             -- Отключить бэкапы
vim.opt.hlsearch = true            -- Подсветка поиска
vim.opt.incsearch = true           -- Инкрементальный поиск
vim.opt.ignorecase = true          -- Игнорировать регистр при поиске
vim.opt.smartcase = true           -- Учитывать регистр если есть заглавные
vim.opt.scrolloff = 8              -- Отступ от края экрана при скролле
vim.opt.signcolumn = "yes"         -- Всегда показывать колонку знаков
vim.opt.updatetime = 50            -- Быстрее обновление
vim.opt.colorcolumn = "120"        -- Колонка-ограничитель
vim.opt.termguicolors = true       -- True color поддержка
vim.opt.clipboard = "unnamedplus"  -- Общий буфер обмена с системой

-- ============================================================================
-- ЦВЕТОВАЯ СХЕМА
-- ============================================================================
require("darcula").setup({})
vim.cmd.colorscheme("darcula-dark")
require("transparent").setup({})

-- Кастомная Ruby тема (если есть файл)
pcall(require, "jetbrains_ruby_theme")

-- ============================================================================
-- LEADER KEY
-- ============================================================================
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- ============================================================================
-- НАСТРОЙКА ПЛАГИНОВ
-- ============================================================================

-- Treesitter
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "ruby", "javascript", "typescript", "json", "lua", "vim", "yaml", "html", "css" },
  highlight = { enable = true },
  indent = { enable = true },
}

-- Автодополнение (nvim-cmp)
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

-- ============================================================================
-- LSP НАСТРОЙКА
-- ============================================================================

require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "ruby_lsp", "lua_ls" }
})

-- Настройка LSP (без предупреждений)
local ok, lspconfig = pcall(require, 'lspconfig')
if ok then
  -- Ruby LSP
  lspconfig.ruby_lsp.setup({})

  -- Lua LSP
  lspconfig.lua_ls.setup({
    settings = {
      Lua = {
        diagnostics = {
          globals = { 'vim' }
        }
      }
    }
  })
end

-- nvim-tree
require("nvim-tree").setup({
  view = {
    width = 35,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = false,
  },
})

-- Gitsigns
require('gitsigns').setup()

-- Lualine (статусная строка)
require('lualine').setup {
  options = {
    theme = 'auto',
    section_separators = '',
    component_separators = '|'
  }
}

-- Comment.nvim (комментирование)
require('Comment').setup()

-- nvim-autopairs (автопарные скобки)
require('nvim-autopairs').setup()

-- Leap (быстрая навигация)
require('leap').create_default_mappings()

-- Which-key (подсказки шорткатов)
require("which-key").setup()

-- Harpoon (быстрая навигация между файлами)
local harpoon = require("harpoon")
harpoon:setup()

-- ============================================================================
-- ШОРТКАТЫ (KEYMAPS)
-- ============================================================================
require('keymaps')

