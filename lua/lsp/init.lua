local cmp_nvim_lsp = require('cmp_nvim_lsp')
local lspconfig = require('lspconfig')
require('mason').setup()
require('mason-lspconfig').setup()


-- general lsp keybindings
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(a)
        local client = vim.lsp.get_client_by_id(a.data.client_id)

        if client.name == 'tsserver' then
            vim.keymap.set("n", "<A-F>", ":Format<CR>")
            client.server_capabilities.documentFormattingProvider = false
        else
            vim.keymap.set("n", "<A-F>", function() vim.lsp.buf.format({ async = true }) end, opts)
        end

        vim.keymap.set("n", "gd", function()
            vim.lsp.buf.definition()
        end, opts)
        vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, opts)
        vim.keymap.set("n", "gr", require('telescope.builtin').lsp_references, opts)
        vim.keymap.set("n", "gt", function() vim.lsp.buf.type_definition() end, opts)
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
        vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
        vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
            vim.lsp.diagnostic.on_publish_diagnostics, {
                signs = true,
                underline = true,
                virtual_text = {
                    spacing = 5,
                    severity_limit = "Hint",
                },
                -- display diagnostics when in insert mode
                update_in_insert = false,
            })
    end
})
--

-- AUTOCOMPLETE
local cmp = require('cmp')
local luasnip = require('luasnip')
local select_opts = { behavior = cmp.SelectBehavior.Select }
local cmp_autopairs = require('nvim-autopairs.completion.cmp')

cmp.event:on(
    'confirm_done',
    cmp_autopairs.on_confirm_done()
)

cmp.setup({
    completion = {
        completeopt = 'menu,menuone,noinsert'
    },
    window = {
        documentation = cmp.config.window.bordered()
    },
    sources = {
        { name = 'path' },
        { name = 'nvim_lsp', keyword_length = 1 },
        { name = 'buffer',   keyword_length = 3 },
        { name = 'luasnip' }
    },
    mapping = {
        ['<C-k>'] = cmp.mapping.select_prev_item(select_opts),
        ['<C-j>'] = cmp.mapping.select_next_item(select_opts),
        ['<cr>'] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),
    },
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end
    },
})
--

-- border for shift+K lsp hover
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
})
vim.cmd(':set winhighlight=' .. cmp.config.window.bordered().winhighlight)
--

-- TREESITTER syntax hightlighting
require 'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true,
        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
    },
}
--


-- FORMATTER
require("formatter").setup {
    filetype = {
        typescript = {
            require("formatter.filetypes.typescript").prettierd,
        },
    }
}
--


lspconfig.tsserver.setup({
    -- capabilites = cmp_nvim_lsp.default_capabilities(),
    settings = {
        completions = {
            completeFunctionCalls = true
        }
    }
})
lspconfig.gopls.setup({
    capabilites = cmp_nvim_lsp.default_capabilities()
})
lspconfig.lua_ls.setup({
    capabilites = cmp_nvim_lsp.default_capabilities()
})
