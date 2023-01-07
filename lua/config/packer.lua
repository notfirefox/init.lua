require("packer").startup(function(use)
  use "wbthomason/packer.nvim"
  use "ellisonleao/gruvbox.nvim"
  use "windwp/nvim-autopairs"
  use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
  use "neovim/nvim-lspconfig"
  use "lukas-reineke/lsp-format.nvim"
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-nvim-lsp"
  use "saadparwaiz1/cmp_luasnip"
  use "L3MON4D3/LuaSnip"
  use {
    "zbirenbaum/copilot.lua",
    event = "VimEnter",
    config = function()
      vim.defer_fn(function()
        require("copilot").setup({
          panel = {
            enabled = false
          },
          suggestion = {
            enabled = true,
            auto_trigger = true,
          }
        })
      end, 100)
    end,
  }
end)
