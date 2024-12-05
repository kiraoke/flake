-- Place this in your Yazi configuration file (usually ~/.config/yazi/init.lua)

local function output_last_dir()
    -- Get the current directory
    local current_dir = ya.current.dir()
    
    -- Open a temporary file to write the path
    local temp_file = os.getenv("HOME") .. "/.cache/yazi_last_dir"
    local file = io.open(temp_file, "w")
    
    if file then
        file:write(current_dir)
        file:close()
    end
end

-- Hook the plugin to run when Yazi exits
require("ya").sync(function()
    output_last_dir()
end)
