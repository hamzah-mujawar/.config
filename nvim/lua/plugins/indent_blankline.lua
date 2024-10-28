return {
    { "HiPhish/rainbow-delimiters.nvim" },
    {
        "lukas-reineke/indent-blankline.nvim",
        opts = {
            indent = {
                highlight = {
                    "TokyoRed",
                    "TokyoRedder",
                    "TokyoOrange",
                    "TokyoGreen",
                    "TokyoPurple",
                    "TokyoCyan",
                    "TokyoBlue",
                },
            },
        },
        config = function(_, opts)
            local hooks = require("ibl.hooks")

            hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
                vim.api.nvim_set_hl(0, "TokyoRed", { fg = "#ff007c" })
                vim.api.nvim_set_hl(0, "TokyoRedder", { fg = "#c53b53" })
                vim.api.nvim_set_hl(0, "TokyoOrange", { fg = "#ff757f" })
                vim.api.nvim_set_hl(0, "TokyoGreen", { fg = "#41a6b5" })
                vim.api.nvim_set_hl(0, "TokyoPurple", { fg = "#9d7cd8" })
                vim.api.nvim_set_hl(0, "TokyoCyan", { fg = "#7aa2f7" })
                vim.api.nvim_set_hl(0, "TokyoBlue", { fg = "#3d59a1" })
            end)

            require("ibl").setup(opts)
        end,
    },
}
