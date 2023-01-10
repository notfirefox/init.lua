local ensure_packer = function()
  local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    local packer_repo = "https://github.com/wbthomason/packer.nvim"
    vim.fn.system({ "git", "clone", "--depth", "1", packer_repo, install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

require("packer").startup(function(use)
  use "wbthomason/packer.nvim"
  use "ellisonleao/gruvbox.nvim"
  use "windwp/nvim-autopairs"
  use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
  use {
    "nvim-telescope/telescope.nvim", tag = "0.1.0",
    requires = { { "nvim-lua/plenary.nvim" } },
  }
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
  if packer_bootstrap then
    require("packer").sync()
  end
end)
