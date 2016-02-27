local levee = require("levee")

local h = levee.Hub()

local err, serve = h.tcp:listen(9000)

for conn in serve do
	h:spawn(function()
		while true do
			local err = conn:write("Hello World\n")
			if err then break end
			h:sleep(1000)
		end
		conn:close()
	end)
end
