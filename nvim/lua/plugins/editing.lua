return {
  -- Fuzzy finder
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      defaults = {
        layout_strategy  = "horizontal",
        sorting_strategy = "ascending",
        layout_config    = { prompt_position = "top" },
      },
    },
  },

  -- Syntax / treesitter
  -- Pinned to master branch; the new main branch dropped nvim-treesitter.configs.
  -- markdown highlight disabled: render-markdown.nvim owns it, and
  -- nvim-treesitter's set-lang-from-info-string! directive crashes on nvim 0.12.2.
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    build = ":TSUpdate",
    opts = {
      ensure_installed = { "python", "lua", "sql", "markdown", "yaml", "bash", "json" },
      highlight        = { enable = true, disable = { "markdown" } },
      indent           = { enable = true },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },

  -- Auto-pairs
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts  = {},
  },

  -- tmux <-> nvim seamless pane navigation (Ctrl-h/j/k/l)
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft", "TmuxNavigateDown",
      "TmuxNavigateUp",   "TmuxNavigateRight",
    },
    keys = {
      { "<c-h>", "<cmd>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd>TmuxNavigateRight<cr>" },
    },
  },

  -- Comment toggling (gcc = line, gc = visual)
  {
    "numToStr/Comment.nvim",
    opts = {},
  },
}
