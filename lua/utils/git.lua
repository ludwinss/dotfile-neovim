local M = {}

local U = require("utils.nvim")

local Job = require("plenary.job")
function M.get_git_compare()
    if U.current_window_floating() then return "" end
    if U.current_buffer_type() == "nofile" then return "" end

    local curr_dir = U.current_buffer_dir()

    if false then
        local result = Job:new({
            command = "git",
            cwd = curr_dir,
            args = {
                "rev-list",
                "--left-right",
                "--count",
                "HEAD...@{upstream}",
            },
        })
            :sync(100)[1]

        if type(result) ~= "string" then return "" end
        local ok, ahead, behind = pcall(string.match, result, "(%d+)%s*(%d+)")
        if not ok then return "" end

        local string = ""
        if behind ~= "0" then string = string .. "󱦳" .. behind end
        if ahead ~= "0" then string = string .. "󱦲" .. ahead end
        return string
    end
    return ""
end

function M.get_git_root()
    local handle = io.popen("git rev-parse --show-toplevel")
    if handle then
        local dir = handle:read("*a")
        handle:close()
        return dir:gsub("\n", "")
    end
end


return M
