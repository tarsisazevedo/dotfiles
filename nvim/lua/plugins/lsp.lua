return {
  -- LSP server installer
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    opts  = {},
  },

  -- Bridge: mason -> lspconfig
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    opts = {
      ensure_installed    = { "pyright", "sqls", "marksman", "yamlls" },
      automatic_installation = true,
    },
  },

  -- LSP configs + keymaps
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local servers      = { "pyright", "sqls", "marksman", "yamlls" }

      -- Native LSP API (Neovim 0.11+); replaces the deprecated lspconfig framework
      for _, server in ipairs(servers) do
        vim.lsp.config(server, { capabilities = capabilities })
      end
      vim.lsp.enable(servers)

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(ev)
          local map = function(keys, func, desc)
            vim.keymap.set("n", keys, func, { buffer = ev.buf, desc = desc })
          end
          local tb = require("telescope.builtin")
          map("gd",          tb.lsp_definitions,      "Go to definition")
          map("gr",          tb.lsp_references,        "References")
          map("K",           vim.lsp.buf.hover,         "Hover docs")
          map("<leader>rn",  vim.lsp.buf.rename,        "Rename symbol")
          map("<leader>ca",  vim.lsp.buf.code_action,   "Code action")
          map("<leader>d",   vim.diagnostic.open_float, "Show diagnostic")
          map("[d",          vim.diagnostic.goto_prev,  "Prev diagnostic")
          map("]d",          vim.diagnostic.goto_next,  "Next diagnostic")
        end,
      })
    end,
  },

  -- Completion
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
    },
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        mapping = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"]      = cmp.mapping.confirm({ select = true }),
          ["<Tab>"]     = cmp.mapping.select_next_item(),
          ["<S-Tab>"]   = cmp.mapping.select_prev_item(),
          ["<C-e>"]     = cmp.mapping.abort(),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "buffer" },
          { name = "path" },
        }),
        window = {
          completion    = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
      })
    end,
  },
}
