local levee = require("levee")
local Sedaas = require("demo.sedaas")


return {
	test_core = function()
		local h = levee.Hub()
		local sedaas = Sedaas(h)
		assert.equal(sedaas("foo"), "foo")
		assert.equal(sedaas("trump card"), "orange pumpkin head card")
	end,
}
