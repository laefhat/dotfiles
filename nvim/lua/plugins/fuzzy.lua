vim.g.fzf_layout = { down = "41%" }
vim.g.fzf_vim = { preview_window = { "right,41%,<70(up,41%)" } }

vim.api.nvim_create_autocmd("FileType", {
    pattern = "fzf",
    callback = function()
        vim.opt.laststatus = 0
        vim.opt.showmode = false
        vim.opt.ruler = false

        vim.api.nvim_create_autocmd("BufLeave", {
            buffer = 0,
            once = true,
            callback = function()
                vim.opt.laststatus = 2
                vim.opt.showmode = true
                vim.opt.ruler = true
            end
        })
    end
})

vim.keymap.set("n", "<Space>f", vim.cmd.Files)
vim.keymap.set("n", "<Space>F", [[:let @+=expand('<cword>') \| Files<CR>]])
vim.keymap.set("n", "<Space>b", vim.cmd.Buffers)
vim.keymap.set("n", "<Space>u", vim.cmd.UndotreeToggle)
