return function(h)
	local child = h.process:spawn(
		"sed", {argv={"-l", "s/trump/orange pumpkin head/g"}})
	local stream = child.stdout:stream()
	return function(s)
		child.stdin:send(s.."\n")
		local err, line = stream:line()
		return line
	end
end
