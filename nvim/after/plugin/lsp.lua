local lsp = require('lsp-zero')

lsp.preset("recommended")

lsp.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp.default_keymaps({buffer = bufnr})
end)

-- (Optional) Configure lua language server for neovim
-- require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

local cmp = require('cmp')

cmp.setup({
  sources = {
    {name = 'nvim_lsp'}
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-Space>'] = cmp.mapping.complete(),
  }),
})


lsp.ensure_installed({
'tsserver',
'eslint',
'lua_ls',
'clangd',
'cssls',
'marksman',
'rust_analyzer',
'pyright'
})

lsp.setup()
