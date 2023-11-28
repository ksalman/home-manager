require'lspconfig'.rnix.setup{}
require'lspconfig'.pyright.setup{}
require'lspconfig'.terraformls.setup{}

require'lspconfig'.lua_ls.setup {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
}

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- nvim-cmp setup
local cmp = require 'cmp'
local luasnip = require 'luasnip'

luasnip.config.setup {}

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<c-space>'] = cmp.mapping.complete {},
    -- ['<CR>'] = cmp.mapping.confirm {
    ['<c-y>'] = cmp.mapping.confirm {
      -- behavior = cmp.ConfirmBehavior.Replace,
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    },
  },
  sources = {
    { name = 'nvim_lua' },
    { name = 'nvim_lsp' },
    { name = 'path' },
    { name = 'luasnip' },
    { name = 'buffer', keyword_length = 5 },
  },
}

vim.keymap.set({"i", "s"}, "<c-j>", function()
    if luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
    end
end, { silent = true} )
vim.keymap.set({"i", "s"}, "<c-k>", function()
    if luasnip.jumpable(-1) then
        luasnip.jump(-1)
    end
end, { silent = true} )
vim.keymap.set("i", "<c-l>", function()
    if luasnip.choice_active() then
        luasnip.change_choice(1)
    end
end, { silent = true} )

-- from friendly-snippets
-- trying it out for Python
require("luasnip.loaders.from_vscode").lazy_load()
