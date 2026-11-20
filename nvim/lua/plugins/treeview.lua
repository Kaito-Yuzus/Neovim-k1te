vim.pack.add({
  {
    src = 'https://github.com/nvim-neo-tree/neo-tree.nvim',
    version = vim.version.range('3')
  },
  -- dependencies
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/MunifTanjim/nui.nvim",
  -- optional, but recommended
  -- "https://github.com/nvim-tree/nvim-web-devicons",
})



-- require("nvim-web-devicons").setup({
--   default = true,
-- })
--
require("neo-tree").setup({
    default_component_configs = {
        icon = {
            folder_closed = "",
            folder_open = "",
            folder_empty = "",
            default = "",
        },
        git_status = {
            symbols = {
                -- Change type
                added = "+",
                modified = "MOD",
                deleted = "DEL",
                renamed = "RN",
                -- Status type
                untracked = "UTR",
                ignored = "I",
                unstaged = "UNST",
                staged = "",
                conflict = "C",
            },
        },

  },

    filesystem = {
      use_libuv_file_watcher = true,   
      follow_current_file = true,
      filtered_items = {
        visible = true,
        hide_dotfiles = false,
        hide_gitignored = false,
        hide_hidden = false,
      },
    },
})
