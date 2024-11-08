print("hello from ruby")

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- add your plugins here
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    { "rose-pine/neovim", name = "rose-pine" },
    "nvim-treesitter/nvim-treesitter",
    "ThePrimeagen/harpoon",
    "mbbill/undotree",
    "tpope/vim-fugitive",
    "VonHeikemen/lsp-zero.nvim",
    {'neovim/nvim-lspconfig'},
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    -- auto complete
    {'hrsh7th/cmp-nvim-lsp'},
    "hrsh7th/cmp-buffer",
    {'hrsh7th/nvim-cmp'},
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-nvim-lua",
    "saadparwaiz1/cmp_luasnip",
    -- snippets
    "L3MON4D3/LuaSnip",
    "rafamadriz/friendly-snippets",
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = {},
  -- automatically check for plugin updates
  checker = { enabled = true },
})


require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the listed parsers MUST always be installed)
  ensure_installed = {"rust", "javascript" ,"typescript", "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  -- List of parsers to ignore installing (or "all")

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

-- harpoon config
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end)
vim.keymap.set("n", "<C-t>", function() ui.nav_file(2) end)
vim.keymap.set("n", "<C-n>", function() ui.nav_file(3) end) 
vim.keymap.set("n", "<C-s>", function() ui.nav_file(4) end)

-- undo tree
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- fugitive
vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

-- lsp
local lsp = require("lsp-zero")

lsp.setup()

--lsp.ensure_installed({
  -- "tsserver",
--})

--local cmp = require("cmp")
--local cmp_select = {behavior = cmp.SelectBehavior.Select}
--local cmp_mappings = lsp.defaults.com_mappings({
  -- ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
  -- ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
  -- ["<C-y>"] = cmp.mapping.confirm({ select = true }),
  -- ["<C-Space>"] = cmp.mapping.complete(),
--})

--lsp.set_preferences({
  -- sign_icons = { }
--})

--lsp.setup_nvim_cmp({
  -- mapping = cmp_mappings
--})

--lsp.on_attach(function(client, bufnr)
--		local opts = {buffer = bufnr, remap = false}

--		vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
--		vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
--		vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
--		vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
--		vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
--		vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
--		vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
--		vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
--		vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
--		vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
--	end)

vim.cmd("colorscheme rose-pine")
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none"})

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'Telescope find git files' })
vim.keymap.set('n', '<leader>ps', builtin.live_grep, { desc = 'Telescope live grep' })
