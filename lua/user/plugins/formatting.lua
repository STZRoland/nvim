return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },

  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        lua = { "stylua" },

        -- isort (import) first, black second
        python = { "isort", "black" },

        cpp = { "clang-format" },
        cmake = { "cmakelang" },

        markdown = { "mdformat" },
        yaml = { "yamlfmt" },
      },
    })

    -- formatting in v is range format for the selected lines
    vim.keymap.set({ "n", "v" }, "<leader>lf", function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 500,
      })
    end, { desc = "Format file or range (in visual mode)" })
  end,
}
