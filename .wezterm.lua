-- Pull in the wezterm API
local wezterm = require 'wezterm'
local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.

-- For example, changing the initial geometry for new windows:
config.initial_cols = 120
config.initial_rows = 40

-- or, changing the font size and color scheme.
config.font = wezterm.font('JetBrainsMono Nerd Font')
config.font_size = 10
config.color_scheme = 'Tokyo Night'

-- 144hz: disable vsync throttling and allow full refresh rate
config.animation_fps = 144
config.max_fps = 144

config.window_close_confirmation = 'AlwaysPrompt'

config.window_padding ={ left = 18, right = 18, top = 14, bottom = 14 }
config.default_cursor_style = 'SteadyBar'
config.line_height = 1.1
config.window_background_opacity = 0.95
config.window_decorations = 'RESIZE'
config.show_new_tab_button_in_tab_bar = true
config.ssh_domains = {
  {
    name = 'beach-server',
    remote_address = 'beach-server',
    username = 'oreo',
  },
}

config.launch_menu = {
  {
    label = 'SSH: beach-server',
    domain = { DomainName = 'beach-server' },
  },
}

config.keys = {
  {
    key = 'w',
    mods = 'CTRL|SHIFT|ALT',
    action = wezterm.action.CloseCurrentPane { confirm = false },
  },
  {
    key = 't',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.SpawnTab 'CurrentPaneDomain',
  },
  {
    key = 't',
    mods = 'CTRL|ALT|SHIFT',
    action = wezterm.action.ShowLauncher,
  },
}

-- Tabline
tabline.setup({
  options = {
    icons_enabled = true,
    theme = 'Tokyo Night',
  },
  sections = {
    tabline_a = { 'mode' },
    tabline_b = { 'workspace' },
    tabline_c = { ' ' },
    tab_active = { 'index', { 'parent', padding = 0 }, '/', { 'cwd', padding = { left = 0, right = 1 } } },
    tab_inactive = { 'index', { 'process', padding = { left = 0, right = 1 } } },
    tabline_x = { 'ram', 'cpu' },
    tabline_y = { 'datetime' },
    tabline_z = { 'domain' },
  },
})
tabline.apply_to_config(config)

-- Finally, return the configuration to wezterm:
return config
