return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  lazy = false,
  opts = {
    -- You can put valid Neo-tree options here (not function calls)
  },
  config = function(_, opts)
    require("neo-tree").setup(opts)

    -- Folder text color customization
    vim.api.nvim_set_hl(0, "NeoTreeDirectoryName", { fg = "#2c7777", bg = "none" })
    vim.api.nvim_set_hl(0, "NeoTreeDirectoryIcon", { fg = "#2c7777", bg = "none" })

    -- Transparent background for Neo-tree
    local transparent_groups = {
      "Normal",
      "NormalNC",
      "NormalFloat",
      "NeoTreeNormal",
      "NeoTreeNormalNC",
      "NeoTreeEndOfBuffer",
      "NeoTreeFloatBorder",
    }

    for _, group in ipairs(transparent_groups) do
      vim.api.nvim_set_hl(0, group, { bg = "none" })
    end

    -- Keymap (this goes here!)
    vim.keymap.set('n', '<C-f>', ':Neotree filesystem reveal left<CR>', {})
  end,
}

