local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
   PACKER_BOOTSTRAP = fn.system {
      "git",
      "clone",
      "--depth",
      "1",
      "https://github.com/wbthomason/packer.nvim",
      install_path,
   }
   print "Installing packer close and reopen Neovim..."
   vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
   return
end

-- Have packer use a popup window
packer.init {
   display = {
      open_fn = function()
         return require("packer.util").float { border = "rounded" }
      end,
   },
}

-- Install your plugins here
return packer.startup(function(use)
   -- My plugins here
   use "wbthomason/packer.nvim" -- Have packer manage itself
   use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
   use "nvim-lua/plenary.nvim" -- Useful lua functions used by lots of plugins
   use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
   use "numToStr/Comment.nvim" -- Easily comment stuff
   use "kyazdani42/nvim-web-devicons" --Icons for tree
   -- use {
   --    "kyazdani42/nvim-tree.lua",
   --    commit = "ce463a5"
   -- }
   use "kyazdani42/nvim-tree.lua"
   use "akinsho/bufferline.nvim"
   use "moll/vim-bbye"
   use "akinsho/toggleterm.nvim"
   use "ahmedkhalf/project.nvim"
   use "lewis6991/impatient.nvim"
   -- use "lukas-reineke/indent-blankline.nvim"
   use "goolord/alpha-nvim"
   use "antoinemadec/FixCursorHold.nvim" -- This is needed to fix lsp doc highlight
   use "folke/which-key.nvim"

   --Airline
   use "nvim-lualine/lualine.nvim"

   -- Colorschemes
   use "lunarvim/darkplus.nvim"
   use "Mofiqul/dracula.nvim"
   use "sainnhe/sonokai"
   use 'marko-cerovac/material.nvim'
   -- If you are using Packer
   -- cmp plugins
   use "hrsh7th/nvim-cmp" -- The completion plugin
   use "hrsh7th/cmp-buffer" -- buffer completions
   use "hrsh7th/cmp-path" -- path completions
   use "hrsh7th/cmp-cmdline" -- cmdline completions
   use "saadparwaiz1/cmp_luasnip" -- snippet completions
   use "hrsh7th/cmp-nvim-lsp" -- lsp completions
   use "hrsh7th/cmp-nvim-lua" -- lua completions

   -- snippets
   use "L3MON4D3/LuaSnip" --snippet engine
   use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

   use "tpope/vim-surround"

   -- LSP
   use "neovim/nvim-lspconfig" -- enable LSP
   use "williamboman/nvim-lsp-installer" -- simple to use language server installer
   use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for
   use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters
   use "jose-elias-alvarez/nvim-lsp-ts-utils"

   -- Telescope
   use "nvim-telescope/telescope.nvim"
   use "nvim-telescope/telescope-file-browser.nvim"
   --Treesitter
   use {
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
   }
   use "p00f/nvim-ts-rainbow"
   use "JoosepAlviste/nvim-ts-context-commentstring"

   --root directory when using telescope
   use {
      "airblade/vim-rooter",
      setup = function ()
         vim.g.rooter_patterns = { '.git', '.svn', 'package.json', '!node_modules' }
      end
   }

   -- Git
   --Live Console.Log
   use "metakirby5/codi.vim"

   --Debuger
   -- use "mfussenegger/nvim-dap"


   --Markdown Preview
   use { 'iamcco/markdown-preview.nvim', run = 'cd app && npm install' }
   -- use "davidgranstrom/nvim-markdown-preview"
   --HTML & CSS
   --Color picker alt-c
   use 'KabbAmine/vCoolor.vim'
   use {
      "mattn/emmet-vim",
      setup = function() -- load stuff before the plugin is loaded
         vim.g.user_emmet_leader_key = ','

         vim.g.user_emmet_settings = {
            indent_blockelement = 1,
         }
      end
   }

   -- Automatically set up your configuration after cloning packer.nvim
   -- Put this at the end after all plugins
   if PACKER_BOOTSTRAP then
      require("packer").sync()
   end
end)
