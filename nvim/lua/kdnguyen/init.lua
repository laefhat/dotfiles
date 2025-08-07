-- load modules
require("kdnguyen.options")
require("kdnguyen.keymaps")
require("kdnguyen.lsp")
require("kdnguyen.plugins")

-- close some windows quicker using `q` instead of typing :q<cr>
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "help", "qf", "checkhealth", "fugitive", "fugitiveblame" },
    callback = function(e) vim.keymap.set("n", "q", vim.cmd.quit, { buffer = 0 }) end
})

-- open the quickfix window whenever a qf command is executed
vim.api.nvim_create_autocmd("QuickFixCmdPost", {
    pattern = "[^l]*",
    callback = function(e) vim.cmd.cwindow() end
})

-- know what has been yanked
vim.api.nvim_create_autocmd("TextYankPost", {
    pattern = "*",
    callback = function(e) vim.hl.on_yank({ higroup = "IncSearch", timeout = 150, silent = true }) end
})
