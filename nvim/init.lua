-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Leader before plugins
vim.g.mapleader      = " "
vim.g.maplocalleader = " "

-- Options
vim.opt.number         = true
vim.opt.relativenumber = true
vim.opt.tabstop        = 4
vim.opt.shiftwidth     = 4
vim.opt.expandtab      = true
vim.opt.wrap           = false
vim.opt.signcolumn     = "yes"
vim.opt.termguicolors  = true
vim.opt.cursorline     = true
vim.opt.scrolloff      = 8
vim.opt.updatetime     = 250
vim.opt.splitright     = true
vim.opt.splitbelow     = true
vim.opt.ignorecase     = true
vim.opt.smartcase      = true
vim.opt.clipboard      = "unnamedplus"

-- Plugins
require("lazy").setup("plugins", {
  change_detection = { notify = false },
})

-- Keymaps
local map = vim.keymap.set

-- Telescope
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>",  { desc = "Find files" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>",   { desc = "Live grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>",     { desc = "Buffers" })
map("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>",    { desc = "Recent files" })

-- File tree
map("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", { desc = "Toggle file tree" })

-- Buffer navigation
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
map("n", "<S-l>", "<cmd>bnext<cr>",     { desc = "Next buffer" })

-- Window splits
map("n", "<leader>sv", "<cmd>vsplit<cr>", { desc = "Split vertical" })
map("n", "<leader>sh", "<cmd>split<cr>",  { desc = "Split horizontal" })

-- Clear search highlight
map("n", "<Esc>", "<cmd>nohlsearch<cr>")

-- Markdown: soft-wrap long lines at word boundaries
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.opt_local.wrap        = true
    vim.opt_local.linebreak   = true
    vim.opt_local.breakindent = true
    vim.opt_local.textwidth   = 0

    local buf = { buffer = 0, silent = true }
    vim.keymap.set("n", "j",  "gj", buf)
    vim.keymap.set("n", "k",  "gk", buf)
    vim.keymap.set("n", "0",  "g0", buf)
    vim.keymap.set("n", "$",  "g$", buf)
    vim.keymap.set("v", "j",  "gj", buf)
    vim.keymap.set("v", "k",  "gk", buf)
  end,
})

-- Save
map({ "n", "i" }, "<C-s>", "<cmd>w<cr><Esc>", { desc = "Save file" })
