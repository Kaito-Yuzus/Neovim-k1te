vim.pack.add({
    "https://github.com/mason-org/mason.nvim",
    "https://github.com/mason-org/mason-lspconfig.nvim",
    "https://github.com/neovim/nvim-lspconfig",
    "https://github.com/hrsh7th/nvim-cmp",
    "https://github.com/hrsh7th/cmp-nvim-lsp",
    "https://github.com/hrsh7th/cmp-buffer",
    "https://github.com/hrsh7th/cmp-path",
    "https://github.com/L3MON4D3/LuaSnip",
    "https://github.com/saadparwaiz1/cmp_luasnip",
    "https://github.com/windwp/nvim-autopairs",


  })

-- Lsp Setup  
require("mason").setup()

require("mason-lspconfig").setup({
    ensure_installed = {"pyright", "jinja_lsp", "html"},
})

local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- pyright

-- vim.lsp.config('pyright', {
--   capabilities = require('cmp_nvim_lsp').default_capabilities(),
--   settings = {
--     python = {
--       analysis = {
--         typeCheckingMode = "basic",
--       },
--     },
--   },
-- })
--
-- vim.lsp.enable('pyright')

vim.lsp.config('pyright', {
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "basic",
      },
    },
  },
})

vim.lsp.enable('pyright')

-- jinja_lsp

vim.lsp.config("jinja_lsp", {
    capabilities = capabilities,
    filetypes = { "jinja", "jinja.html", "htmldjango" },
})

vim.lsp.enable("jinja_lsp")

-- html

vim.lsp.config("html", {
    capabilities = capabilities,
})

vim.lsp.enable("html")


-- Auto Complete Setup 

local cmp = require("cmp")
local luasnip = require("luasnip")

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },

  mapping = cmp.mapping.preset.insert({
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),

    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  }),

  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "path" },
--    { name = "buffer" },
  }),
})


-- Auto Complete Pairs
require("nvim-autopairs").setup({
    check_ts = true,
    enable_check_bracket_line = false,
})
local npairs = require("nvim-autopairs")
local Rule = require("nvim-autopairs.rule")

npairs.add_rules({
  Rule("<", ">", {
    "html",
    "xml",
    "xhtml",
    "vue",
    "typescriptreact",
    "javascriptreact",
  }),

    Rule("%", "%", {
    "html",
  }),

})




local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local cmp = require("cmp")

cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

