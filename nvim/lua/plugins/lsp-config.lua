return{
    "VonHeikemen/lsp-zero.nvim",
        dependencies = {
            "neovim/nvim-lspconfig",
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-nvim-lua",
            "L3MON4D3/LuaSnip",
            "rafamadriz/friendly-snippets"
        },
        config = function()
            local lsp_zero = require("lsp-zero")
            lsp_zero.preset("recommended")
            lsp_zero.on_attach(function(client, bufnr)
            local opts = {buffer = bufnr, remap = false}
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
            vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
            vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
            vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
            vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
            vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
            vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
            vim.keymap.set({ 'n', 'v' }, '<leader>e', function() vim.diagnostic.open_float() end, opts)
            end)

        lsp_zero.set_sign_icons({
            error = '✘',
            warn = '▲',
            hint = '⚑',
            info = '»'
        })

    vim.filetype.add({ extension = { templ = "templ" } })

    require('mason').setup({})
    require('mason-lspconfig').setup({
            ensure_installed = {'pyright', 'clangd','lua_ls', 'tsserver', 'rust_analyzer', 'gopls','templ'},
            handlers = {
                lsp_zero.default_setup,
                lua_ls = function()
                    local lua_opts = lsp_zero.nvim_lua_ls()
                    require('lspconfig').lua_ls.setup(lua_opts)
                end,
            html = function()
                        require("lspconfig").html.setup({
                            filetypes = {"html", "templ"},
                        })
                end
            }
        })
        local cmp = require('cmp')
        local cmp_select = {behavior = cmp.SelectBehavior.Select}
        cmp.setup({
            sources = {
                {name = 'path'},
                {name = 'nvim_lsp'},
                {name = 'nvim_lua'},
                {name = 'luasnip', keyword_length = 2},
                {name = 'buffer', keyword_length = 3},
            },
            formatting = lsp_zero.cmp_format(),
            mapping = cmp.mapping.preset.insert({
                ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                ['<CR>'] = cmp.mapping.confirm({ select = true }),
                ['<C-Space>'] = cmp.mapping.complete(),
            }),
        })
    end
}

