-- plugins definition
vim.pack.add({
    { src = "https://github.com/tpope/vim-fugitive" },
    { src = "https://github.com/tpope/vim-surround" },
    { src = "https://github.com/mhinz/vim-signify" },
    { src = "https://github.com/junegunn/fzf" },
    { src = "https://github.com/junegunn/fzf.vim" },
    { src = "https://github.com/mfussenegger/nvim-jdtls" },
})

-- plugin specific config
require("plugins.fuzzy")
