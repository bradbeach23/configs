return {
  -- Python
  { import = "lazyvim.plugins.extras.lang.python" },
  -- JS/TS
  { import = "lazyvim.plugins.extras.lang.typescript" },
  -- Docker
  { import = "lazyvim.plugins.extras.lang.docker" },
  -- Git
  { import = "lazyvim.plugins.extras.lang.git" },
}
```

**2. Neo-tree, lualine, gitsigns** are already included in LazyVim by default:
- `\e` toggles the file explorer
- Statusbar is on by default
- Git signs show automatically in the gutter

**3. Terminal** — LazyVim includes `toggleterm`, open it with:
```
Ctrl+`y
