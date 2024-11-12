return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    },
    config = function()
        --require("mason").setup()
        --require("mason-lspconfig").setup({
          --      esnure_installed = {
            --        "lua_ls",
              --      "rust_analyzer",
                --    "tsserver",
               -- },
           -- })

        local lspconfig = require("lspconfig")

        lspconfig.rust_analyzer.setup({})
    end
}
