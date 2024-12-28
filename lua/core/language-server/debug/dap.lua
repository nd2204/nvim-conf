local dap_ok, dap = pcall(require, "dap")
local dapvt_ok, dapvt = pcall(require, "nvim-dap-virtual-text")
local dapui_ok, dapui = pcall(require, "dapui")
local wk_ok, wk = pcall(require, "which-key")

if not dap_ok or not dapui_ok or not dapvt_ok or not wk_ok then
  return
end

dapvt.setup({
  enabled = Arunvi.plugins.dap.virtualtext.enable,
})

dap.listeners.before.attach.dapui_config = function ()
  dapui.open()
end

dap.listeners.before.launch.dapui_config = function ()
  dapui.open()
end

dap.listeners.before.event_exited.dapui_config = function ()
  dapui.close()
end

dap.listeners.before.event_terminated.dapui_config = function ()
  dapui.close()
end

local ADAPTERS = { "codelldb", "debugpy" }
local languages = { "c", "cpp", "rust", "python" }

-- set adapters configuration
for _, adapter in pairs(ADAPTERS) do
  dap.ADAPTERS[adapter] = require("core.language-server.debug.adapter."..adapter)
end

-- set languages configuration
for _, lang in ipairs(languages) do
  if lang == "c" or lang == "rust" then
    local config_ok, config = pcall(require, "core.language-server.debug.configuration.cpp")
    if config_ok then
      dap.configurations[lang] = config
    end
  else
    dap.configurations[lang] = require("core.language-server.debug.configuration." .. lang)
  end
end

-- Dap
local sign = vim.fn.sign_define
sign("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = ""})
sign("DapBreakpointCondition", { text = "●", texthl = "DapBreakpointCondition", linehl = "", numhl = ""})
sign("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = ""})

local mappings = {
  d = {
    name = "Debugging",
    b = {"<cmd>DapToggleBreakpoint<cr>","Toggle Breakpoint"},
    c = {"<cmd>DapContinue<cr>","Continue"},
    i = {"<cmd>DapStepInto<cr>","Step Into"},
    S = {"<cmd>DapStepOut<cr>","Step Out"},
    d = {"<cmd>lua Arunvi.plugins.dap.toggle_ui()<cr>","Toggle Debugger"},
  },
}
local prefix = {prefix = "<leader>"}

wk.add(mappings)
