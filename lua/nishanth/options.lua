o = vim.opt

local options = {
    number = true,
    mouse = 'a',
    ignorecase = true,
    smartcase = true,
    hlsearch = true,
    wrap = true, 
    breakindent = true, -- Preserve the indentation of a virtual line. These "virtual lines" are the ones only visible when wrap is enabled.

   tabstop = 4,
   shiftwidth = 4,
   expandtab = true,
  
   fileencoding = "utf-8", -- encoding written to file
   encoding = "utf-8", -- encoding displayed
  
   backup = false,
   swapfile = false,
  
  
   showmode = false,  -- dont show mode like INSERT
  
  
   termguicolors = true,
  
   scrolloff = 8, -- Minimal number of screen lines to keep above and below the cursor. This will make some context visible around where you are working.
   sidescrolloff = 8,
  
   showcmd = off, -- show command in the last line of the screen (partial)
   splitright = true,
   splitbelow = true,
  
   pumheight = 10,
  
   laststatus=2,    
}

for k, v in pairs(options) do
    o[k]=v
end

o.shortmess:append "c"
o.iskeyword:append "-"  -- hyphenated words recognized by searches

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

