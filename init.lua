local autocmd = vim.api.nvim_create_autocmd
local keymap = vim.keymap.set
-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
vim.opt.linebreak = true

-- autocmd("BufWritePost", {
--   callback = function()
--     local clients = vim.lsp.get_active_clients()
--     -- check if no lsp is active
--     if clients ~= nil then
--       -- check whether table empty or not
--       if type(clients) == "table" then
--         if next(clients) ~= nil then
--           vim.lsp.buf.format { async = true }
--         end
--       end
--     end
--   end,
-- })

local opts = { noremap = true, silent = true }

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- move selection
keymap("v", "J", ":m '>+1<CR>gv=gv")
keymap("v", "K", ":m '<-2<CR>gv=gv")

-- move better
keymap("n", "<C-d>", "<C-d>zz")
keymap("n", "<C-u>", "<C-u>zz")

-- greatest remap ever
keymap("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
-- copy to systel clipboard
keymap({ "n", "v" }, "<leader>y", [["+y]])
keymap("n", "<leader>Y", [["+Y]])

-- flutter-tools statusline
function _G.statusLine()
  return vim.g.flutter_tools_decorations.app_version
end
vim.opt.statusline = "%!v:statusLine()"
