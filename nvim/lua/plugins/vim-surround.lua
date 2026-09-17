return {
  -- 1. Disable the default LazyVim mini.surround plugin
  { "echasnovski/mini.surround", enabled = false },

  -- 2. Install and configure the classic nvim-surround plugin
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use main branch
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here if needed, but defaults provide the classic `c/d/y` s mappings
      })
    end,
  },
}
