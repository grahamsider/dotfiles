# Load autoconfig.yml
config.load_autoconfig()

# Start/default pages
c.url.start_pages = ["file:///home/gs/.config/qutebrowser/index.html"]
c.url.default_page = "file:///home/gs/.config/qutebrowser/index.html"

# Search engines
c.url.searchengines = {
                       "DEFAULT": "https://www.google.com/search?hl=en&q={}",
                       "ddg": "https://duckduckgo.com/?q={}",
                       "aw": "https://wiki.archlinux.org/?search={}",
                       "yt": "https://www.youtube.com/results?search_query={}",
                       "sc": "https://www.soundcloud.com/search?q={}",
                       "r": "https://old.reddit.com/r/{}"
                      }

# Padding/width
c.completion.scrollbar.padding = 4
c.completion.scrollbar.width = 16
c.statusbar.padding = {"bottom": 1, "left": 0, "right": 0, "top": 1}
c.tabs.indicator.padding = {"bottom": 2, "left": 0, "right": 4, "top": 2}
c.tabs.padding = {"bottom": 6, "left": 5, "right": 5, "top": 5}
c.tabs.max_width = 200
c.tabs.min_width = -1
c.tabs.show = "always"
c.tabs.title.alignment = "left"
#c.tabs.indicator.width = 0

# Fonts
# Deprecated ?
# c.fonts.monospace = "Ubuntu Mono"
c.fonts.tabs = "10pt Ubuntu"

# Allow pdf.js to view PDF files in browser
c.content.pdfjs = True

# Always restore open sites when qutebrowser is reopened
c.auto_save.session = True

# Scaling
c.qt.highdpi = True
c.zoom.default = "100%"

# Bindings
config.bind(';j', 'hint links spawn mpv {hint-url}')

# Colorscheme
config.source('qutebrowser-colors.py')
