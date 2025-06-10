return {
  {
    "shaunsingh/nord.nvim",
    name = "nord",
    lazy = false,
    priority = 1000,
    config = function()
      vim.opt.termguicolors = true
      vim.g.nord_contrast = true
      vim.g.nord_borders = true
      -- Set custom background color
      vim.api.nvim_set_hl(0, "Normal",   { bg = "#212d2d" })
      vim.api.nvim_set_hl(0, "NormalNC", { bg = "#212d2d" })
      vim.api.nvim_set_hl(0, "Float",    { bg = "#212d2d" })
      vim.api.nvim_set_hl(0, "Pmenu",    { bg = "#212d2d" })
      vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "#212d2d" })
    end,
  },
}

