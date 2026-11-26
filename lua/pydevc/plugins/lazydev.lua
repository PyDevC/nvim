return {
    {
        "folke/lazydev.nvim",
        event = "VimEnter",
        ft = "lua",
        opts = {
            library = {
                { path = "${3rd}/luv/library", words = { "vim%.uv" } }
            }
        }
    }
}
