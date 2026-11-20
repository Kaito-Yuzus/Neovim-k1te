vim.pack.add({
"https://github.com/sindrets/diffview.nvim",
})

require("diffview").setup({
  enhanced_diff_hl = true,
  use_icons = true,

  view = {
    default = {
      layout = "diff2_horizontal",
    },
  },

  git = {
    ignore_untracked = true,
  },
})


-- Makes sure to add neo git
