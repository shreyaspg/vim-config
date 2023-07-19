-- general
lvim.log.level = "warn"
lvim.format_on_save.enabled = false
lvim.colorscheme = "tokyonight-night"
lvim.builtin.lualine.style="lvim"

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enable = true
vim.g.gitblame_enabled = 0

-- set gruvbox theme to contrast dark
vim.g.gruvbox_contrast_dark = 'hard'

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
}

local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<c-s>", "<cmd>lua require('copilot.suggestion').toggle_auto_trigger()<CR>", opts)
lvim.plugins = {
    {'morhetz/gruvbox', config = function() vim.cmd.colorscheme("gruvbox") end },
    {'ThePrimeagen/harpoon'},
    {'gennaro-tedesco/nvim-peekup'},
    {
        'f-person/git-blame.nvim',
        init = function ()
            vim.cmd "highlight default link gitblame SpecialComment"
        end,
    },
    {
        'github/copilot.vim',
        config = function ()
           vim.g.copilot_assume_mapped=true
           vim.g.copilot_no_tab_map=true
        end,
    },
}

vim.opt.relativenumber=true
vim.opt.timeoutlen=300
vim.opt.shiftwidth=4
vim.opt.tabstop=4
vim.opt.list=true
vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "tab:→ "
vim.opt.listchars:append "eol:↴"


vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
