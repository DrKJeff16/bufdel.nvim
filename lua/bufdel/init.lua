local M = {}

local function delete_buf(buf, opt) end

function M.delete(buf, opt)
	if type(buf) == "number" then
		delete_buf(buf, opt)
	elseif type(buf) == "function" then
		for _, v in ipairs(vim.api.nvim_list_bufs()) do
			if buf(v) then
				delete_buf(v, opt)
			end
		end
	end
end

return M
