local conform_setup, conform = pcall(require, "conform")
if not conform_setup then
  return
end

vim.api.nvim_create_user_command("Format", function(args)
  local range = nil
  if args.count ~= -1 then
    local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
    range = {
      start = { args.line1, 0 },
      ["end"] = { args.line2, end_line:len() },
    }
  end
  conform.format({ async = true, lsp_fallback = true, range = range })
end, { range = true })

conform.setup({
  formatters_by_ft = {
    lua = { "stylua" },
    javascript = { { "prettierd", "prettier" } },
    typescript = { { "prettierd", "prettier" } },
    javascriptreact = { { "prettierd", "prettier" } },
    typescriptreact = { { "prettierd", "prettier" } },
    json = { { "prettierd", "prettier" } },
    graphql = { { "prettierd", "prettier" } },
    markdown = { { "prettierd", "prettier" } },
    eruby = { "htmlbeautifier" },
    ruby = { "rubocop" },
    yaml = { { "prettierd", "prettier" } },
    css = { { "prettierd", "prettier" } },
    scss = { { "prettierd", "prettier" } },
  },
  formatters = {
    htmlbeautifier = {
      prepend_args = { "-b", "1" },
    },
  },
  format_on_save = {
    timeout_ms = 1000,
    lsp_format = "prefer",
  },
})
