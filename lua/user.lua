vim.keymap.set('n', '<C-q>', '<cmd>qa!<cr>', { noremap = true, silent = false, desc = 'Force quit' })
vim.keymap.set('n', '<leader>ff', function() require('telescope.builtin').find_files() end, { noremap = true, silent = false, desc = 'Telescope find files' })
vim.keymap.set(
  'n',
  '<leader>Ff',
  function() require('telescope.builtin').find_files { hidden = true, no_ignore = true } end,
  { noremap = true, silent = false, desc = 'Telescope find files' }
)
-- vim.keymap.set(
--   'n',
--   '<leader>f3',
--   function() require('telescope.builtin').buffers { hidden = true, no_ignore = true } end,
--   { noremap = true, silent = false, desc = 'Telescope find buffers' }
-- )
vim.keymap.set(
  'n',
  '<leader>f4',
  function() require('telescope.builtin').git_branches { hidden = true, no_ignore = true } end,
  { noremap = true, silent = false, desc = 'Telescope find branches' }
)
vim.keymap.set('n', '<leader>fw', function() require('telescope.builtin').live_grep() end, { noremap = true, silent = false, desc = 'Telescope live grep' })
vim.keymap.set('i', '<C-b>', '<C-w>', { noremap = true, silent = true })
vim.keymap.set('i', '<C-Del>', '<C-o>dw', { noremap = true, silent = true })
vim.keymap.set('i', '<c-z>', '<c-o>u', { desc = 'undo' })
vim.keymap.set('n', '<c-a>', ':%y+<cr><cr>', { noremap = true, silent = false, desc = 'select all in normal mode' })
vim.keymap.set('n', '<c-]>', function() require('telescope.builtin').buffers() end, { noremap = true, silent = false, desc = 'Open list of buffers' })
vim.keymap.set('i', '<c-s>', '<c-o>:w<cr>', { noremap = true, silent = false, desc = 'save buffer' })
vim.keymap.set('n', '<c-s>', '<cmd>w<cr>', { noremap = true, silent = false, desc = 'save buffer' })
vim.keymap.set('n', '|', '<cmd>vsplit<cr>', { noremap = true, silent = false, desc = 'Vertical split' })
vim.keymap.set('n', '\\', '<cmd>split<cr>', { noremap = true, silent = false, desc = 'Horizontal split' })
vim.keymap.set('n', '<C-h>', '<C-w><', { noremap = true, silent = false, desc = 'Decrease window width' })
vim.keymap.set('n', '<C-l>', '<C-w>>', { noremap = true, silent = false, desc = 'Increase window width' })
vim.keymap.set(
  'n',
  '<leader>pa',
  function() vim.cmd [[:Lexplore]] end,
  { noremap = true, silent = false, desc = 'Will open Netrw in the current working directory.' }
)
vim.keymap.set(
  'n',
  '<leader>pd',
  function() vim.cmd [[:Lexplore %:p:h]] end,
  { noremap = true, silent = false, desc = 'Open Netrw in the directory of the current file.' }
)
vim.keymap.set('n', 'K', 'k', { noremap = true, silent = false, desc = 'Up' })
vim.keymap.set('n', 'J', 'J', { noremap = true, silent = false, desc = 'Down' })
--
-- tresitter configuration
vim.treesitter.language.register('html', 'jsp') -- use html parser for jsp

-- Configure visual mode highlighting
vim.cmd [[:hi Visual  guifg=White guibg=Purple gui=none]]

-- shortcuts for full selection
vim.keymap.set('i', '<c-a>', '<c-o>:%y+<cr><cr>', { noremap = true, silent = false, desc = 'select all in insert mode' })
vim.keymap.set('n', '<leader>6', 'ggVGx', { noremap = true, silent = false, desc = 'Delete all' })
vim.keymap.set('n', '<leader>5', 'ggVG', { noremap = true, silent = false, desc = 'Select all' })

-- jsp comment logically
--
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'jsp',
  callback = function() vim.bo.commentstring = '<%-- %s --%>' end,
})

local function copy_buffer_path()
  local modify = vim.fn.fnamemodify
  local filePath = vim.api.nvim_buf_get_name(0)
  if filePath == '' then
    print 'No buffer is open. Aborting copy-paste.'
    return
  end
  local fileDir = modify(filePath, ':~')
  vim.fn.setreg('+', fileDir)
  print(('Copied: `%s`'):format(fileDir))
end

vim.keymap.set('n', '1c', function()
  local filePath = vim.api.nvim_buf_get_name(0)
  if filePath == '' then
    print 'No buffer is open. Aborting copy-paste.'
    return
  end
  print(('Copied: `%s`'):format(filePath))
  vim.fn.setreg('*', filePath)
end, { noremap = true, silent = true, desc = 'Copy buffer path to clipboard' })

vim.keymap.set('n', '2c', function()
  local filePath = vim.api.nvim_buf_get_name(0)
  if filePath == '' then
    print 'No buffer is open. Aborting path fetch'
    return
  end
  print(('Path: `%s`'):format(filePath))
  vim.fn.setreg('*', filePath)
end, { noremap = true, silent = true, desc = 'Print buffer path' })

vim.keymap.set('n', '3c', function()
  local filePath = vim.api.nvim_buf_get_name(0)
  if filePath == '' then
    print 'No buffer is open. Aborting copy-paste.'
    return
  end
  local bufferName = vim.fn.fnamemodify(filePath, ':t')
  vim.fn.setreg('+', bufferName)
  print(('Copied: `%s`'):format(bufferName))
end, { noremap = true, silent = true, desc = 'Copy buffer name to clipboard' })

-- Primagen keymapping
-- https://github.com/ThePrimeagen/init.lua/blob/master/lua/theprimeagen/remap.lua
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

vim.wo.relativenumber = true

vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = 'Go to definition' })

vim.lsp.config('ts_ls', {
  single_file_support = true,
})

-- print(vim.inspect(require('lspconfig').biome.document_config))
vim.lsp.enable 'ts_ls'


-- harpoon
--

-- REQUIRED
local harpoon = require('harpoon')
harpoon:setup()
-- REQUIRED

vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end); 
vim.keymap.set("n", "<leader>f5", function() harpoon:list():clear() end);
--
-- basic telescope harpoon configuration
local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
    local file_paths = {}
    for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
    end

    require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({
            results = file_paths,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
    }):find()
end

vim.keymap.set("n", "<leader>f3", function() toggle_telescope(harpoon:list()) end,
    { desc = "Open harpoon window" })
