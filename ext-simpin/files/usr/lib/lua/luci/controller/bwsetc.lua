module("luci.controller.bwsetc", package.seeall)

I18N = require "luci.i18n"
translate = I18N.translate

function index()
	local page
	local lock = luci.model.uci.cursor():get("custom", "menu", "full")
	local multilock = luci.model.uci.cursor():get("custom", "multiuser", "multi") or "0"
	local rootlock = luci.model.uci.cursor():get("custom", "multiuser", "root") or "0"
	if (multilock == "0") or (multilock == "1" and rootlock == "1") then
		if lock == "1" then
			if (multilock == "1" and rootlock == "1") then
				page = entry({"admin", "adminmenu", "bwsetc"}, cbi("bwset"), translate("Change Bandwidth Amount"), 8)
			else
				page = entry({"admin", "adminmenu", "bwsetc"}, cbi("bwset"), translate("---Change Bandwidth Amount"), 8)
			end
			page.dependent = true
		end
	end
end
