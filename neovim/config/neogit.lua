local M = {}
function M.setup()
  local status_ok, neogit = pcall(require, "neogit")
  if not status_ok then
    return
  end
  neogit.setup {}
  require("neogit").setup { integrations = { diffview = true } }
end

return M
