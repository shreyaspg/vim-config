M = {}

-- Set the leader for all mappings
lvim.leader = "space"

-- write current buffer
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"

-- scroll down and centre the cursor
lvim.keys.normal_mode["<C-d>"] = "<C-d>zz"

-- move between buffers
lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"


lvim.builtin.which_key.mappings[";"] = {
    name = "+Harpoon",
    a = { "<cmd>lua require('harpoon.mark').add_file()<cr>", "Add file"},
    l = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", "List menu "},
    n = { "<cmd>lua require('harpoon.ui').nav_next()<cr>", "Next file"},
    p = { "<cmd>lua require('harpoon.ui').nav_prev()<cr>", "Prev file"},
}
local keymap = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }

-- move block  +/-
keymap("v", "J", ":m '>+1<CR>gv=gv", default_opts)
keymap("v", "K", ":m '<-2<CR>gv=gv", default_opts)

-- use jk to escape
keymap("i", "jk", "<ESC>", default_opts)
keymap("t", "jk", "<C-\\><C-n>", default_opts)

-- open fuzzy finder
keymap("n", "ff", ":Telescope find_files<CR>", default_opts)




return M
