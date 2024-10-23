return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    {
        "williamboman/mason-lspconfig",
        config = function()
            require("mason-lspconfig").setup({
                lazy = false,
                opts = {
                    auto_install = true
                },
                ensure_installed = {
                    "lua_ls",
                    "ts_ls",
                    "angularls",
                    "omnisharp",
                    "pylsp"
                }
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
        },
        config = function()
            local config = require("lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            -- https://github.com/neovim/nvim-lspconfig/pull/3232#issuecomment-2331025714
            -- automatically install ensure_installed servers
			require("mason-lspconfig").setup_handlers({
				function(server_name) 
                    if server_name ~= "omnisharp" then
                        require("lspconfig")[server_name].setup({
                            capabilities = capabilities,
                        })
                    end
				end
			})

            --config.lua_ls.setup({
            --    capabilities = capabilities
            --})

            --config.tsserver.setup({
            --    capabilities = capabilities,
            --})

            --config.angularls.setup({
            --    capabilities = capabilities,
            --}) -- TODO

            config.omnisharp.setup({
                capabilities = capabilities,
                cmd = { "dotnet", vim.fn.stdpath "data" .. "/mason/packages/omnisharp/libexec/OmniSharp.dll" },
                enable_import_completion = true,
                organization_imports_on_format = true,
                enable_roslyn_analyzers = true,
                root_dir = function()
                    return vim.loop.cwd()
                end,
            })

            --config.pylsp.setup({
            --    plugins = {
            --        autopep8 = { enabled = false },
            --    }
            --})

            vim.keymap.set("n", "<F12>", function() vim.lsp.buf.definition() end, {})
            --vim.keymap.set("n", "<S-F12>", function() vim.lsp.buf.go_to_implementation() end, {})
            --vim.keymap.set("n", "<leader>e", function() vim.diagnostic.open_float() end, {})
            vim.keymap.set("n", "<C-l>", vim.cmd.LspInfo)
            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})

            -- TODO: clean this up
            local function organize_imports()
                local params = {
                    command = '_typescript.organizeImports',
                    arguments = { vim.api.nvim_buf_get_name(0) }
                }
                vim.lsp.buf.execute_command(params)
            end

            vim.keymap.set("n", "<leader>f", function()
                organize_imports()
            end, {})
        end
    }
}
