local M = {}

function M.setup()
  -- Indicate first time installation
  local packer_bootstrap = false

  -- packer.nvim configuration
  local conf = {
    display = {
      open_fn = function()
        return require("packer.util").float { border = "rounded" }
      end,
    },
  }

  -- Check if packer.nvim is installed
  -- Run PackerCompile if there are changes in this file
  local function packer_init()
    local fn = vim.fn
    local install_path = fn.stdpath "data" .. "/site/pack/packer/opt/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
      packer_bootstrap = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
      }
      vim.cmd [[packadd packer.nvim]]
    end
    vim.cmd "autocmd BufWritePost plugins.lua source <afile> | PackerCompile"
  end

  -- Plugins
  local function plugins(use)
    use { "wbthomason/packer.nvim" }

    -- Colorscheme
    use {
      "morhetz/gruvbox",
      config = function()
        vim.cmd "autocmd vimenter * ++nested colorscheme gruvbox"
      end,
    }

    -- Startup screen
    use {
      "startup-nvim/startup.nvim",
      config = function()
        require("startup").setup { theme = "evil" }
      end,
    }

    -- Git
    use {
      "TimUntersberger/neogit",
      requires = "nvim-lua/plenary.nvim",
      config = function()
        require("config.neogit").setup()
      end,
    }

    -- Better diff experience
    use { "sindrets/diffview.nvim" }

    -- Show commit messages
    use { "rhysd/git-messenger.vim" }

    if packer_bootstrap then
      print "Restart Neovim required after installation!"
      require("packer").sync()
    end
    -- WhichKey
    use {
       "folke/which-key.nvim",
        config = function()
            require("config.whichkey").setup()
        end,
    }   
  end

  packer_init()

  local packer = require "packer"
  packer.init(conf)
  packer.startup(plugins)
end

return M
