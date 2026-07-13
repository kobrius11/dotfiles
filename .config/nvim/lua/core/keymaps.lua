local map = vim.keymap

local function opts(desc)
  return {
    desc = desc,
    silent = true,
  }
end

-- Explorer
map.set("n", "<leader>pv", vim.cmd.Ex, opts("Open netrw explorer"))

-- Move selected lines
map.set("v", "J", ":m '>+1<CR>gv=gv", opts("Move selection down"))
map.set("v", "K", ":m '<-2<CR>gv=gv", opts("Move selection up"))

-- Paste without replacing the paste register
map.set("x", "<leader>p", [["_dP]], opts("Paste without replacing register"))

-- Search and replace word under cursor
map.set(
  "n",
  "<leader>r",
  [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  opts("Replace word under cursor")
)

-- Quote operations
map.set(
  "n",
  "dq",
  [[v/["'`]<CR><Left>d<cmd>nohlsearch<CR>]],
  opts("Delete up to next quote")
)

map.set(
  "n",
  "yq",
  [[v/["'`]<CR><Left>y<cmd>nohlsearch<CR>]],
  opts("Yank up to next quote")
)

map.set(
  "n",
  "cq",
  [[v/["'`]<CR><Left>di<cmd>nohlsearch<CR>]],
  opts("Change up to next quote")
)

-- Line navigation
map.set({ "n", "v" }, "gh", "_", opts("Go to start of line"))
map.set({ "n", "v" }, "gl", "$", opts("Go to end of line"))

-- Window navigation
local directions = {
  h = "left",
  j = "down",
  k = "up",
  l = "right",
}

for key, description in pairs(directions) do
  map.set(
    "n",
    "<A-" .. key .. ">",
    "<C-w>" .. key,
    opts("Move to " .. description .. " window")
  )

  map.set(
    "i",
    "<A-" .. key .. ">",
    "<C-o><C-w>" .. key,
    opts("Move to " .. description .. " window")
  )

  map.set(
    "t",
    "<A-" .. key .. ">",
    "<C-\\><C-n><C-w>" .. key,
    opts("Move to " .. description .. " window")
  )
end

-- Diagnostics
map.set("n", "[d", function()
  vim.diagnostic.jump({
    count = -1,
    float = true,
  })
end, opts("Previous diagnostic"))

map.set("n", "]d", function()
  vim.diagnostic.jump({
    count = 1,
    float = true,
  })
end, opts("Next diagnostic"))

-- Duplicate current line and comment the original
map.set(
  "n",
  "yc",
  "yy<cmd>normal gcc<CR>p",
  opts("Duplicate line and comment original")
)

-- Insert mode
map.set("i", "jj", "<Esc>", opts("Exit insert mode"))
map.set("i", "kk", "<Esc>", opts("Exit insert mode"))

-- Native LSP mappings
map.set("n", "gD", vim.lsp.buf.definition, opts("Go to definition"))
map.set("n", "grt", vim.lsp.buf.type_definition, opts("Go to type definition"))

-- Buffers
map.set("n", "bd", "<cmd>bdelete<CR>", opts("Delete active buffer"))
map.set("n", "bn", "<cmd>enew<CR>", opts("Create new buffer"))
map.set("n", "b]", "<cmd>bnext<CR>", opts("Next buffer"))
map.set("n", "b[", "<cmd>bprevious<CR>", opts("Previous buffer"))

--------------------------------------------------------------------------------
-- Remote SSHFS
--------------------------------------------------------------------------------

map.set(
  "n",
  "<leader>rc",
  "<cmd>RemoteSSHFSConnect<CR>",
  opts("Connect to remote SSHFS")
)

map.set(
  "n",
  "<leader>rd",
  "<cmd>RemoteSSHFSDisconnect<CR>",
  opts("Disconnect remote SSHFS")
)

map.set(
  "n",
  "<leader>re",
  "<cmd>RemoteSSHFSEdit<CR>",
  opts("Edit SSH configuration")
)

--------------------------------------------------------------------------------
-- Telescope
--------------------------------------------------------------------------------

map.set(
  "n",
  "<leader>ff",
  "<cmd>Telescope find_files<CR>",
  opts("Find files")
)

map.set(
  "n",
  "<leader>fp",
  "<cmd>Telescope git_files<CR>",
  opts("Find Git files")
)

map.set(
  "n",
  "<leader>fg",
  "<cmd>Telescope live_grep<CR>",
  opts("Search text")
)

map.set(
  "n",
  "<leader>fb",
  "<cmd>Telescope buffers<CR>",
  opts("Find buffers")
)

--------------------------------------------------------------------------------
-- Harpoon 2
--------------------------------------------------------------------------------

local function get_harpoon()
  local ok, harpoon = pcall(require, "harpoon")

  if not ok then
    vim.notify("Harpoon is not available", vim.log.levels.ERROR)
    return nil
  end

  return harpoon
end

map.set("n", "<leader>hx", function()
  local harpoon = get_harpoon()

  if harpoon then
    harpoon:list():add()
  end
end, opts("Add file to Harpoon"))

map.set("n", "<leader>hh", function()
  local harpoon = get_harpoon()

  if harpoon then
    harpoon.ui:toggle_quick_menu(harpoon:list())
  end
end, opts("Open Harpoon menu"))

map.set("n", "<leader>hn", function()
  local harpoon = get_harpoon()

  if harpoon then
    harpoon:list():next()
  end
end, opts("Next Harpoon file"))

map.set("n", "<leader>hp", function()
  local harpoon = get_harpoon()

  if harpoon then
    harpoon:list():prev()
  end
end, opts("Previous Harpoon file"))

for index = 1, 4 do
  map.set("n", "<leader>h" .. index, function()
    local harpoon = get_harpoon()

    if harpoon then
      harpoon:list():select(index)
    end
  end, opts("Open Harpoon file " .. index))
end

--------------------------------------------------------------------------------
-- NvimTree
--------------------------------------------------------------------------------

map.set(
  "n",
  "<leader>nt",
  "<cmd>NvimTreeToggle<CR>",
  opts("Toggle NvimTree")
)

--------------------------------------------------------------------------------
-- Neogit
--------------------------------------------------------------------------------

map.set(
  "n",
  "<leader>gg",
  "<cmd>Neogit<CR>",
  opts("Open Neogit")
)

--------------------------------------------------------------------------------
-- Lspsaga
--------------------------------------------------------------------------------

map.set(
  { "n", "v" },
  "<leader>lc",
  "<cmd>Lspsaga code_action<CR>",
  opts("Code action")
)

map.set(
  "n",
  "<leader>lo",
  "<cmd>Lspsaga outline<CR>",
  opts("Symbol outline")
)

map.set(
  "n",
  "<leader>lr",
  "<cmd>Lspsaga rename<CR>",
  opts("Rename symbol")
)

map.set(
  "n",
  "<leader>ld",
  "<cmd>Lspsaga goto_definition<CR>",
  opts("Go to definition")
)

map.set(
  "n",
  "<leader>lf",
  "<cmd>Lspsaga finder<CR>",
  opts("LSP finder")
)

map.set(
  "n",
  "<leader>lp",
  "<cmd>Lspsaga peek_definition<CR>",
  opts("Peek definition")
)

map.set(
  "n",
  "<leader>ls",
  vim.lsp.buf.signature_help,
  opts("Signature help")
)

map.set(
  "n",
  "<leader>lw",
  "<cmd>Lspsaga show_workspace_diagnostics<CR>",
  opts("Workspace diagnostics")
)

--------------------------------------------------------------------------------
-- Visual Multi
--------------------------------------------------------------------------------

local function visual_cursors_with_delay()
  local keys = vim.keycode("<Plug>(VM-Visual-Cursors)")
  vim.api.nvim_feedkeys(keys, "m", false)

  vim.defer_fn(function()
    vim.api.nvim_feedkeys("A", "n", false)
  end, 200)
end

map.set(
  "n",
  "<leader>ma",
  "<Plug>(VM-Select-All)<Tab>",
  {
    desc = "Select all occurrences",
    remap = true,
    silent = true,
  }
)

map.set(
  "n",
  "<leader>mr",
  "<Plug>(VM-Start-Regex-Search)",
  {
    desc = "Start regex search",
    remap = true,
    silent = true,
  }
)

map.set(
  "n",
  "<leader>mp",
  "<Plug>(VM-Add-Cursor-At-Pos)",
  {
    desc = "Add cursor at position",
    remap = true,
    silent = true,
  }
)

map.set(
  "v",
  "<leader>mv",
  visual_cursors_with_delay,
  opts("Create visual cursors")
)

map.set(
  "n",
  "<leader>mo",
  "<Plug>(VM-Toggle-Mappings)",
  {
    desc = "Toggle Visual Multi mappings",
    remap = true,
    silent = true,
  }
)

--------------------------------------------------------------------------------
-- Undotree
--------------------------------------------------------------------------------

map.set("n", "<leader>u", function()
  local ok, undotree = pcall(require, "undotree")

  if not ok then
    vim.notify("Undotree is not available", vim.log.levels.ERROR)
    return
  end

  undotree.toggle()
end, opts("Toggle Undotree"))
