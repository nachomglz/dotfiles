local status, ts = pcall(require, 'nvim-treesitter.configs')
if (not status) then return end

local vim = vim


--[[
ts.setup {
  highlight = {
    enable = true,
    disable = {}
  },
  indent = {
    enable = true,
    disable = {}
  },
  ensure_installed = {
    'tsx',
    'typescript',
    'javascript',
    'lua',
    'json',
    'css',
    'python',
    'html'
  },
  autotag = { enable = true }
}
]] --
