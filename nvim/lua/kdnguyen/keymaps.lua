vim.keymap.set("c", "<C-a>", "<Home>")
vim.keymap.set("c", "<C-e>", "<End>")
vim.keymap.set("c", "<M-BS>", "<C-w>")
vim.keymap.set("c", "<M-Left>", "<C-Left>")
vim.keymap.set("c", "<M-Right>", "<C-Right>")

if vim.fn.executable("rg") > 0 then
    vim.opt.grepprg = "rg --vimgrep --smart-case --no-heading --column"
    vim.opt.grepformat:prepend("%f:%l:%c:%m")
    vim.keymap.set("n", "<Space>gg", [[:silent grep! --fixed-strings ''<Left>]])
    vim.keymap.set("v", "<Space>gg", [["0y:silent grep! --case-sensitive --fixed-strings '<C-r>0'<Left>]])
    vim.keymap.set("n", "<Space>gw", [[:silent grep! --case-sensitive --fixed-strings '<C-r><C-w>'<CR>]])
    vim.keymap.set("n", "<Space>/", [[:silent grep! --hidden --no-ignore --fixed-strings ''<Left>]])
end

vim.keymap.set("v", "//", [["0y/\V<C-r>=escape(@0,'/\')<CR><CR>]])
vim.keymap.set("n", "<Space>e", ":e %:h<C-z>")
vim.keymap.set("n", "<Space>b", ":b <C-z>")

vim.keymap.set("n", "<Space>r", [[:%s/<C-r><C-w>//gI<Left><Left><Left>]])
vim.keymap.set("v", "<Space>r", [["0y:%s/<C-r>=escape(@0,'/\')<CR>//gI<Left><Left><Left>]])

vim.keymap.set({ "n","v" }, "<Space>y", [["+y]])
vim.keymap.set({ "n","v" }, "<Space>p", [["+p]])
vim.keymap.set("n", "<Space>P", [["+P]])

vim.keymap.set("n", "-", vim.cmd.Explore)
vim.api.nvim_create_autocmd("FileType", {
    pattern = "netrw",
    callback = function(e) vim.keymap.set("n", "<C-c>", vim.cmd.Rexplore, { buffer = 0 }) end
})

local files_cmd = "rg --files --hidden --follow --glob '!.git' | grep -i "
vim.api.nvim_create_user_command("Files", function(opts)
    local pattern = opts.args
    if vim.fn.filereadable(pattern) > 0 then
        vim.cmd.edit(vim.fn.fnameescape(pattern))
        return
    end
    local files = vim.fn.systemlist(files_cmd .. vim.fn.shellescape(pattern))
    if #files > 0 and vim.fn.filereadable(files[1]) > 0 then
        vim.cmd.edit(vim.fn.fnameescape(files[1]))
    else
        vim.notify("no file matches", vim.log.levels.WARN)
    end
end, { nargs = "*", complete = function(arg_lead, _, _)
        return vim.fn.systemlist(files_cmd .. vim.fn.shellescape(arg_lead))
    end })
vim.keymap.set("n", "<Space>ff", [[:Files ]])
vim.keymap.set("n", "<Space>fw", [[:Files <C-r><C-w>]])
