function ChangeColorScheme(colorScheme)
  -- set default color scheme
  colorScheme = colorScheme or "rose-pine"
  vim.cmd("colorscheme " .. colorScheme)
end

