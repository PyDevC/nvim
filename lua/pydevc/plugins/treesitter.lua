return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local treesitter = 	require("nvim-treesitter.configs")
        treesitter.setup({
            ensure_installed = {  "markdown", "lua", "python", "c", "cpp", "bash" },
            indent = {
                enable = true,
            },
            highlight = {
                enable = true
            },
        })
    end,
}
