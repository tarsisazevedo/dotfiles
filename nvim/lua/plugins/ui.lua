return {
  -- Theme: zenwritten (neutral grey, no warm tint)
  {
    "mcchrish/zenbones.nvim",
    dependencies = { "rktjmp/lush.nvim" },
    priority = 1000,
    config = function()
      vim.g.zenwritten_lightness = "bright"
      vim.cmd("colorscheme zenwritten")
    end,
  },

  -- Status line
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        theme                = "auto",
        section_separators   = "",
        component_separators = "|",
        globalstatus         = true,
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { { "filename", path = 1 } },
        lualine_x = { "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
    },
  },

  -- Markdown in-place rendering
  -- Note: nvim-treesitter intentionally NOT listed as a dependency here.
  -- render-markdown.nvim works with nvim's built-in treesitter (0.10+).
  -- Adding nvim-treesitter caused a crash on nvim 0.12.2 via the
  -- set-lang-from-info-string! directive in nvim-treesitter/query_predicates.lua.
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    ft = { "markdown" },
    opts = {
      heading  = { enabled = true },
      code     = { enabled = true, style = "full" },
      bullet   = { enabled = true },
      checkbox = { enabled = true },
    },
  },

  -- File tree
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      view = { width = 30 },
      renderer = {
        group_empty = true,
        icons = { show = { git = true, folder = true, file = true } },
      },
      filters = { dotfiles = false },
    },
  },
}
