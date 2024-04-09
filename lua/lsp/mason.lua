local mason_status, mason = pcall(require, "mason")

if not mason_status then
    vim.notify("没有找到mason")
    return
end

local nlsp_status, nvim_lsp = pcall(require, "lspconfig")
if not nlsp_status then
 vim.notify("没有找到 lspconfig")
 return
end

local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")

if not mason_lspconfig_status then
    vim.notify("没有找到mason-lspconfig")
    return
end

mason.setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

mason_lspconfig.setup({
 automatic_installation = true,
 ensure_installed = { "lua_ls", "clangd" },
})

-- lua配置
nvim_lsp.lua_ls.setup({
 on_init = function(client)
  local path = client.workspace_folders[1].name
  if not vim.loop.fs_stat(path .. "/.luarc.json") and not vim.loop.fs_stat(path .. "/.luarc.jsonc") then
   client.config.settings = vim.tbl_deep_extend("force", client.config.settings, {
    Lua = {
     runtime = {
      version = "LuaJIT",
     },
     workspace = {
      checkThirdParty = false,
      library = {
       vim.env.VIMRUNTIME,
      },
     },
    },
   })

   client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
  end
  return true
 end,
})

local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
 end

-- clangd配置 
nvim_lsp.clangd.setup(
    {
        on_attach = on_attach
    }
)
