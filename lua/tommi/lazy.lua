local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- Fuzzy finding
  {
    "nvim-telescope/telescope.nvim",
    version = "*",
    dependencies = {
      "nvim-lua/plenary.nvim"
    }
  },

  -- Theme
  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      vim.cmd("colorscheme rose-pine")
    end
  },

  -- Highlight, edit, and navigate code
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    config = function()
      pcall(require("nvim-treesitter.install").update { with_sync = true })
    end
  },

  "nvim-treesitter/playground",

  "nvim-neotest/nvim-nio",

  "nvim-java/nvim-java",

  {
    "theprimeagen/harpoon",
    dependencies = {
      "nvim-lua/plenary.nvim" }
  },

  "mbbill/undotree",

  -- Git plugin
  "tpope/vim-fugitive",

  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v2.x",
    dependencies = {
      -- LSP Support
      { "neovim/nvim-lspconfig" }, -- Required
      {                            -- Optional
        "williamboman/mason.nvim",
        build = function()
          pcall(vim.cmd, "MasonUpdate")
        end,
      },
      { "williamboman/mason-lspconfig.nvim" }, -- Optional

      -- Autocompletion
      { "hrsh7th/nvim-cmp" },     -- Required
      { "hrsh7th/cmp-nvim-lsp" }, -- Required
      { "L3MON4D3/LuaSnip" },     -- Required
    }
  },

  -- For handling bracket / braces closing
  "windwp/nvim-autopairs",

  -- Debugging
  "mfussenegger/nvim-dap",
  "rcarriga/nvim-dap-ui",
  "theHamsta/nvim-dap-virtual-text",

  {
    "vuki656/package-info.nvim",
    dependencies = {
      { "MunifTanjim/nui.nvim" }
    }
  },

  {
    "andythigpen/nvim-coverage",
    dependencies = {
      { "nvim-lua/plenary.nvim" }
    }
  },

  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  },

  -- Flutter
  {
    "akinsho/flutter-tools.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim", -- optional for vim.ui.select
    },
  },

  -- Plugin to display references, definitions, and implementations of document symbols
  {
    'Wansmer/symbol-usage.nvim',
    event = 'BufReadPre', -- need run before LspAttach if you use nvim 0.9. On 0.10 use 'LspAttach'
    config = function()
      require('symbol-usage').setup()
    end
  },

  -- Python
  "mfussenegger/nvim-dap-python",

})
