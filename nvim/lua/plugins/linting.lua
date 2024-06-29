return {
    "nvimtools/none-ls.nvim",
    dependencies = {
      "nvimtools/none-ls-extras.nvim",
    },
    config = function()
        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {
                --null_ls.builtins.formatting.stylua,
                --null_ls.builtins.formatting.typescript,
                --require("none-ls.diagnostics.eslint_d"), -- https://stackoverflow.com/questions/78108133/issue-with-none-ls-configuration-error-with-eslint-d
            }
        })

        vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, {})
    end
}
