-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Example configs: https://github.com/LunarVim/starter.lvim
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

-- getting own snippets setup
lvim.builtin.luasnip.sources.friendly_snippets = false

-- vimtex
lvim.plugins = {
  {
    "lervag/vimtex",
    init = function()
      vim.g["vimtex_view_method"] = "zathura_simple" -- for variant without xdotool to avoid errors in wayland
      vim.g["vimtex_quickfix_mode"] = 0              -- suppress error reporting on save and build
      vim.g["vimtex_mappings_enabled"] = 0           -- Ignore mappings
      vim.g["vimtex_indent_enabled"] = 0             -- Auto Indent
      vim.g["tex_flavor"] = "latex"                  -- how to read tex files
      vim.g["tex_indent_items"] = 0                  -- turn off enumerate indent
      vim.g["tex_indent_brace"] = 0                  -- turn off brace indent
      vim.g["vimtex_context_pdf_viewer"] = "okular"  -- external PDF viewer run from vimtex menu command
      vim.g["vimtex_log_ignore"] = {                 -- Error suppression:
        "Underfull",
        "Overfull",
        "specifier changed to",
        "Token not allowed in a PDF string",
      }
    end,
  }
}

lvim.builtin.which_key.mappings["v"] = {
  name = "Vimtex",
  b = { "<cmd>VimtexCompileSS<CR>", "Build Document" },
  c = { "<cmd>:VimtexClearCache All<CR>", "Clear VimTex" },
  e = { "<cmd>VimtexErrors<CR>", "VimTex errors" },
  i = { "<cmd>VimtexTocOpen<CR>", "Index" },
  k = { "<cmd>VimtexClean<CR>", "Kill aux" },
  M = { "<plug>(vimtex-context-menu)", "VimTex menu" },
  v = { "<cmd>VimtexView<CR>", "View Document" },
  w = { "<cmd>VimtexCountWords!<CR>", "Word count" },
}
