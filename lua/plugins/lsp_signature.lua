return {
    opts = function()
        return {
            -- hint_enable = false
        }
    end,
    config = function(_, opts)
        local lspsign = require("lsp_signature")
        lspsign.setup(opts)
    end,
    'ray-x/lsp_signature.nvim'
}
