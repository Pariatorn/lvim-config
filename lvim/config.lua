-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Example configs: https://github.com/LunarVim/starter.lvim
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

-- line fixes and indentation
vim.opt.relativenumber = true
vim.opt.wrap = true
vim.opt.showbreak = "  "
vim.opt.linebreak = true
vim.opt.breakindent = true

-- getting own snippets setup
lvim.builtin.luasnip.sources.friendly_snippets = false

-- vimtex
lvim.plugins = {
  {
    "lervag/vimtex",
    init = function()
      vim.g["vimtex_view_method"] = "zathura_simple"
      vim.g["vimtex_quickfix_mode"] = 0
      vim.g["vimtex_mappings_enabled"] = 0
      vim.g["vimtex_indent_enabled"] = 0
      vim.g["tex_flavor"] = "latex"
      vim.g["tex_indent_items"] = 0
      vim.g["tex_indent_brace"] = 0
      vim.g["vimtex_context_pdf_viewer"] = "okular"
      vim.g["vimtex_log_ignore"] = {
        "Underfull",
        "Overfull",
        "specifier changed to",
        "Token not allowed in a PDF string",
      }
    end,
  }
}

-- Keymap to navigate through soft wrapped lines
vim.api.nvim_set_keymap("n", "j", "gj", { noremap = true })
vim.api.nvim_set_keymap("n", "k", "gk", { noremap = true })

-- Function to toggle navigation through soft wrapped lines
function toggle_soft_wrap()
  local toggle_status = vim.g.toggle_soft_wrap
  if toggle_status == nil or toggle_status == false then
    vim.g.toggle_soft_wrap = true
    vim.api.nvim_set_keymap("n", "j", "j", { noremap = true })
    vim.api.nvim_set_keymap("n", "k", "k", { noremap = true })
  else
    vim.g.toggle_soft_wrap = false
    vim.api.nvim_set_keymap("n", "j", "gj", { noremap = true })
    vim.api.nvim_set_keymap("n", "k", "gk", { noremap = true })
  end
end

lvim.builtin.which_key.mappings["t"] = {
  name = "+toggle",
  s = { "<cmd>lua toggle_soft_wrap()<CR>", "Toggle soft wrapping" },
}

-- WhickKey spell options
lvim.builtin.which_key.mappings["S"] = {
  name = "Spell checking",
  d = { "<cmd>set nospell<CR>", "Deactivate" },
  e = { "<cmd>set spell<CR>", "Activate" },
}

-- WhickKey VimTex options
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
