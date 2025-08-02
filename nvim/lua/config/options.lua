-- :help options
-- :help <option>

local options = {
  cmdheight = 2,                           -- More space in the neovim command line for displaying messages
  completeopt = { "menuone", "noselect" }, -- Mostly just for cmp
  conceallevel = 0,                        -- So that `` is visible in markdown files
  fileencoding = "utf-8",                  -- The encoding written to a file
  hlsearch = true,                         -- Highlight all matches on previous search pattern
  ignorecase = true,                       -- Ignore case in search patterns
  pumheight = 10,                          -- Pop up menu height
  showmode = false,                        -- If in Insert, Replace or Visual mode put a message on the last line.
  showtabline = 1,                         -- hide tabs
  smartcase = true,                        -- Smart case
  smartindent = true,                      -- Make indenting smarter again
  splitbelow = true,                       -- Force all horizontal splits to go below current window
  splitright = true,                       -- Force all vertical splits to go to the right of current window
  swapfile = false,                        -- Creates a swapfile
  timeoutlen = 1000,                       -- Time to wait for a mapped sequence to complete (in milliseconds)
  undofile = true,                         -- Enable persistent undo
  updatetime = 300,                        -- Faster completion (4000ms default)
  writebackup = false,                     -- If a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  expandtab = true,                        -- Convert tabs to spaces
  shiftwidth = 2,                          -- The number of spaces inserted for each indentation
  tabstop = 2,                             -- Insert 2 spaces for a tab
  cursorline = true,                       -- Highlight the current line
  number = true,                           -- Set numbered lines
  relativenumber = true,                   -- Set relative numbered lines
  numberwidth = 4,                         -- Set number column width to 2 {default 4}
  signcolumn = "yes",                      -- Always show the sign column, otherwise it would shift the text each time
  wrap = true,                             -- Display lines as one long line
  scrolloff = 8,                           -- Minimal number of screen lines to keep above and below the cursor.
  sidescrolloff = 8,                       -- side scroll characters
  shortmess = "c",                         -- don't give |ins-completion-menu| messages to avoid the hit enter messages
  mouse = "",                              -- Disable mouse support
  foldmethod = "expr",                     -- Use treesitter for folding
  foldexpr = "nvim_treesitter#foldexpr()", -- Use treesitter for folding
  foldlevelstart = 99,                     -- Using treesitter for folding, so we want to start with all folds open
}


for k, v in pairs(options) do
  vim.opt[k] = v
end
