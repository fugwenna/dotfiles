return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.5",
        dependencies = {
            "nvim-lua/plenary.nvim"
        },
        config = function()
            local telescope = require("telescope")
            local builtin = require("telescope.builtin")

            telescope.setup({
                defaults = {
                    diagnostics = {
                        bufnr = 0
                    },
                    path_display = {
                        "shorten"
                    },
                    layout_config = {
                        horizontal = {
                            height = .95,
                            width = .95
                        },
                        vertical = {
                            height = .95,
                            width = .95
                        }
                    },
                    file_ignore_patterns = {
                        "dist/*",
                        "node_modules/*",
                        ".dll",
                        ".cache",
                        ".pdb",
                        "AssemblyInfo.cs",
                        "FileListAbsolute.txt",
                        "Up2Date",
                        ".g.cs",
                        ".g.props",
                        ".pak",
                        --".so",
                        ".bin",
                        ".dylib",
                        "nuget.info",
                        "restore.info"
                    }
                }
            })

            vim.keymap.set("n", "<C-f>", builtin.find_files, {})
            vim.keymap.set("n", "<C-p>", builtin.git_files, {})
            vim.keymap.set("n", "<leader>pg", builtin.live_grep, {})
            vim.keymap.set("n", "<leader>m", builtin.lsp_document_symbols, {})
            vim.keymap.set("n", "<leader>u", builtin.lsp_references, {})
            vim.keymap.set("n", "<leader>E", builtin.diagnostics)
        end
    },
    {
        "rachartier/tiny-code-action.nvim",
        dependencies = {
            {"nvim-lua/plenary.nvim"},
            {"nvim-telescope/telescope.nvim"},
        },
        event = "LspAttach",
        config = function()
            local codeaction = require("tiny-code-action")
            codeaction.setup()
            vim.keymap.set("n", "<leader>ca", function()
                codeaction.code_action()
            end, { noremap = true, silent = true })
        end
    }
}
