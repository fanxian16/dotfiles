return {
  {
    "morhetz/gruvbox",
    lazy = false,
    priority = 1000,
    config = function()
      vim.opt.termguicolors = false -- 关闭真彩
      vim.cmd([[colorscheme gruvbox]])
    end,
  },
}
