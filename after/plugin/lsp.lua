local lsp = require("lsp-zero")

require "lsp_signature".setup({
    hint_enable = false
})

lsp.preset("recommended")

lsp.ensure_installed({
    'tsserver',
    -- 'eslint'
    --'gopls',
})

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
})

lsp.set_preferences({
    sign_icons = {}
})

lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    if client.name == "tsserver" then
        client.server_capabilities.documentFormattingProvider = false
        -- client.preferences.importModuleSpecifier = "importModuleSpecifierPreference"
    end

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
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
    vim.keymap.set("n", "<A-F>", function() vim.lsp.buf.format() end, opts)
    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
        signs = true,
        underline = true,
        virtual_text = {
            spacing = 5,
            severity_limit = "Hint",
        },
        -- display diagnostics when in insert mode
        update_in_insert = false,
    })
end)

lsp.setup()

local null_ls = require('null-ls')
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local actions = null_ls.builtins.code_actions
null_ls.setup({
    sources = {
        formatting.prettierd,
        diagnostics.eslint_d,
        actions.eslint_d,
    }
})

-- require("lspconfig").tsserver.setup({
--     capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
--     on_attach = function(client)
--         client.resolved_capabilities.document_formatting = false
--     end,
-- })
-- null_ls.setup {
--     debug = false,
--     sources = {
--         -- formatting.gofmt,
--         -- formatting.black.with { extra_args = { "--fast" } },
--         -- formatting.yapf,
--         -- formatting.stylua,
--         -- diagnostics.flake8,
--     },
-- }
