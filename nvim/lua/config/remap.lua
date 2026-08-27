
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- move if highlighted
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- replace highlighted
vim.keymap.set("v", "<C-r>", '"hy:%s/<C-r>h//gc<left><left><left>')

local fzf = require('fzf-lua')

-- Noise that is usually tracked in git, so ripgrep's .gitignore handling will
-- not drop it on its own. Filtering at the ripgrep level rather than through
-- fzf-lua's `file_ignore_patterns` keeps it out of Lua entirely.
local noise_globs = table.concat({
    '-g "!**/node_modules/**"',
    '-g "!*.min.js"',
    '-g "!*.min.css"',
    '-g "!*-lock.json"',
    '-g "!*.svg"',
    '-g "!*.png"',
    '-g "!*.jpg"',
}, ' ')

fzf.setup({
    -- fzf-lua pipes ripgrep straight into the fzf binary, so neither the
    -- results nor the filtering pass through Lua. Match count no longer
    -- drives editor responsiveness the way it did under telescope, which
    -- entry-made and scored every single line it received.
    grep = {
        -- `-e` must stay last: fzf-lua appends the search pattern after it.
        rg_opts = table.concat({
            '--column --line-number --no-heading --color=always --smart-case',
            '--max-columns=4096',
            '-g "!**/migrations/**"',
            noise_globs,
            '-e',
        }, ' '),
    },
    files = {
        rg_opts = table.concat({
            '--color=never --files -g "!.git" -g "!.jj"',
            noise_globs,
        }, ' '),
    },
})

-- finds files in current dir
vim.keymap.set('n', '<leader>ff', fzf.files, {})
-- search file contents in current dir (migrations excluded via grep.rg_opts)
vim.keymap.set('n', '<leader>fg', fzf.live_grep, {})
-- searches file contents with highlighted string
vim.keymap.set('v', '<leader>fg', fzf.grep_visual, {})
-- search buffers
vim.keymap.set('n', '<leader>b', fzf.buffers, {})
-- searches help tags for builting methods
vim.keymap.set('n', '<leader>fh', fzf.helptags, {})
-- searches builtin methods to execute
vim.keymap.set('n', '<leader>fb', fzf.builtin, {})
-- searches all the references
vim.keymap.set({'v', 'n'}, '<leader>fr', fzf.lsp_references, {})
-- search incoming calls
vim.keymap.set({'v', 'n'}, '<leader>fi', fzf.lsp_incoming_calls, {})
-- search outgoing calls
vim.keymap.set({'v', 'n'}, '<leader>fo', fzf.lsp_outgoing_calls, {})
-- search treesitter variables and functions
vim.keymap.set('n', '<leader>ft', fzf.treesitter, {})
-- fuzzy find the current file
vim.keymap.set({'n', 'v'}, '<leader>fz', fzf.blines, {})
