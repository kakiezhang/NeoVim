-- vim.cmd[[ hi HopNextKey cterm=bold ctermfg=176 gui=bold guibg=#ff00ff guifg=#ffffff ]]
-- vim.cmd[[ hi HopNextKey1 cterm=bold ctermfg=176 gui=bold guibg=#ff00ff guifg=#ffffff ]]
-- vim.cmd[[ hi HopNextKey2 cterm=bold ctermfg=176 gui=bold guibg=#ff00ff guifg=#ffffff ]]

local status_ok, hop = pcall(require, "hop")
if not status_ok then
  return
end

hop.setup { 
	case_insensitive = true,
	char2_fallback_key = '<CR>',
    quit_key='<Esc>',
	keys = 'etovxqpdygfblzhckisuran',
	jump_on_sole_occurrence = false, 
}

-- NormalMode

-- Move to Word
vim.api.nvim_set_keymap('n', 'mw', "<cmd>lua require'hop'.hint_words()<cr>", {noremap = true, silent = true})
-- Move to Line
vim.api.nvim_set_keymap('n', 'mL', "<cmd>lua require'hop'.hint_lines()<cr>", {noremap = true, silent = true})

-- Move to Left
vim.api.nvim_set_keymap('n', 'mh', "<cmd>lua require'hop'.hint_words({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>", {noremap = true, silent = true})
-- Move to Right
vim.api.nvim_set_keymap('n', 'ml', "<cmd>lua require'hop'.hint_words({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>", {noremap = true, silent = true})
-- Move to Up
vim.api.nvim_set_keymap('n', 'mk', "<cmd>lua require'hop'.hint_words({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR })<cr>", {noremap = true, silent = true})
-- Move to Down
vim.api.nvim_set_keymap('n', 'mj', "<cmd>lua require'hop'.hint_words({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR })<cr>", {noremap = true, silent = true})

-- VisalMode

-- Move to Word
vim.api.nvim_set_keymap('v', 'mw', "<cmd>lua require'hop'.hint_words()<cr>", {noremap = true, silent = true})
-- Move to Line
vim.api.nvim_set_keymap('v', 'mL', "<cmd>lua require'hop'.hint_lines()<cr>", {noremap = true, silent = true})

-- Move to Left
vim.api.nvim_set_keymap('v', 'mh', "<cmd>lua require'hop'.hint_words({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>", {noremap = true, silent = true})
-- Move to Right
vim.api.nvim_set_keymap('v', 'ml', "<cmd>lua require'hop'.hint_words({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>", {noremap = true, silent = true})
-- Move to Up
vim.api.nvim_set_keymap('v', 'mk', "<cmd>lua require'hop'.hint_words({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR })<cr>", {noremap = true, silent = true})
-- Move to Down
vim.api.nvim_set_keymap('v', 'mj', "<cmd>lua require'hop'.hint_words({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR })<cr>", {noremap = true, silent = true})
