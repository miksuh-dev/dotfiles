local formatters = {
  lua = function(_, text_var)
    return string.format('print([[%s = ]] .. %s)', text_var, text_var)
  end,

  python = function(_, text_var)
    return string.format('print("%s =", %s)', text_var, text_var)
  end,

  javascript = function(_, text_var)
    return string.format('console.log("%s = ", %s)', text_var, text_var)
  end,

  javascriptreact = function(_, text_var)
    return string.format('console.log("%s: ", %s);', text_var, text_var)
  end,

  typescript = function(_, text_var)
    return string.format('console.log("%s = ", %s)', text_var, text_var)
  end,

  typescriptreact = function(_, text_var)
    return string.format('console.log("%s: ", %s);', text_var, text_var)
  end,

  go = function(_, text_var)
    return string.format('fmt.Println("%s = ", %s)', text_var, text_var)
  end,

  vim = function(_, text_var)
    return string.format('echo "%s = ".%s', text_var, text_var)
  end,

  rust = function(_, text_var)
    return string.format([[println!("%s = {:#?}", %s);]], text_var, text_var)
  end,

  zsh = function(_, text_var)
    return string.format('echo "%s = $%s"', text_var, text_var)
  end,

  bash = function(_, text_var)
    return string.format('echo "%s = $%s"', text_var, text_var)
  end,

  sh = function(_, text_var)
    return string.format('echo "%s = $%s"', text_var, text_var)
  end,
}

return formatters
