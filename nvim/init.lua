--clipboard

vim.opt.clipboard = "unnamedplus"

-- Code Editor Lines
vim.wo.number = true

-- Vim Tab Feature
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

-- Vim Terminal Features
-- vim.opt.shell = "/bin/bash"
local os = vim.uv.os_uname().sysname

if os == "Windows_NT" then
    vim.opt.shell = "powershell.exe"
else
    vim.opt.shell = "/bin/bash"
end
-- Splitting
vim.opt.splitbelow = true
vim.opt.splitright = true


--Binding for currentpath current path Terminal 
vim.api.nvim_create_user_command("Tv", function()
  vim.cmd("cd %:p:h")
  vim.cmd("vsplit")
  vim.cmd("terminal")
  vim.cmd("startinsert")
end, {})

vim.api.nvim_create_user_command("Th", function()
  vim.cmd("cd %:p:h")
  vim.cmd("split")
  vim.cmd("terminal")
  vim.cmd("startinsert")
end, {})

--misc
icons = false

--require("config.options")
--require("config.keymaps")
require("plugins.theme")
require("plugins.telescope")
require("plugins.dashboard")
require("plugins.treeview")
require("plugins.lsp")
-- require("plugins.neogit")
require("plugins.lualine")

