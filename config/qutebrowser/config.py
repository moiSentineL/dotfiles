import catppuccin

# keybinds
config.bind('n', 'scroll left', mode='normal')
config.bind('e', 'scroll down', mode='normal')
config.bind('u', 'scroll up', mode='normal')
config.bind('i', 'scroll right', mode='normal')


config.bind('N', 'back', mode='normal')
config.bind('I', 'forward', mode='normal')
config.bind('U', 'tab-prev', mode='normal')
config.bind('E', 'tab-next', mode='normal')

config.bind('K', 'search-prev', mode='normal')
config.bind('k', 'search-next', mode='normal')
config.bind('l', 'undo', mode='normal')
# config.bind('u', 'mode-enter insert', mode='normal')

# caret mode
config.bind('n', 'move-to-prev-char', mode='caret')
config.bind('e', 'move-to-next-line', mode='caret')
config.bind('u', 'move-to-prev-line', mode='caret')
config.bind('i', 'move-to-next-char', mode='caret')

config.bind('N', 'scroll left', mode='caret')
config.bind('E', 'scroll down', mode='caret')
config.bind('U', 'scroll up', mode='caret')
config.bind('I', 'scroll right', mode='caret')

config.bind('f', 'move-to-end-of-word', mode='caret')

c.hints.chars = 'arstneui'



config.load_autoconfig()


# theme

c.fonts.default_family = "Pragmasevka Nerd Font"
c.fonts.default_size = '14pt'
catppuccin.setup(c, 'mocha', True)
