-- plugins definition
vim.pack.add({
    { src = "https://github.com/tpope/vim-fugitive" },
    { src = "https://github.com/tpope/vim-surround" },
    { src = "https://github.com/mhinz/vim-signify" },
    { src = "https://github.com/mbbill/undotree" },
    { src = "https://github.com/rose-pine/neovim", name = "rose-pine" },
    { src = "https://github.com/junegunn/fzf" },
    { src = "https://github.com/junegunn/fzf.vim" },
})

-- custom fzf
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
vim.keymap.set("n", "<Space>u", vim.cmd.UndotreeToggle)

-- use 24-bit RGB color
require("rose-pine").setup({ dark_variant = "moon", styles = { italic = false } })
vim.cmd.colorscheme("rose-pine")
vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "NONE" })
