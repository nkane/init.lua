require('dapui').setup({});

vim.keymap.set('n', '<F8>', require 'dapui'.toggle)
vim.keymap.set('i', '<F8>', require 'dapui'.toggle)
