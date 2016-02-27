local levee = require("levee")

local h = levee.Hub()

local err, serve = h.tcp:listen(9000, "0.0.0.0")

local connections = {}

for conn in serve do
	h:spawn(function()
		print(("connected: %s"):format(conn))
		connections[conn.no] = conn
		local stream = conn:stream()
		while true do
			local err, line = stream:line("\r\n")
			if err then break end
			for __, item in pairs(connections) do
				item:write(line.."\n")
			end
		end
		conn:close()
		connections[conn.no] = nil
		print(("disconnected: %s"):format(conn))
	end)
end
