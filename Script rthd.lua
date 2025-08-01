local BATAS = "The limit for using level ups is only up to [3/4] levels"
local setVis=gg.setVisible
local isVis=gg.isVisible
local showmenu=false





gg.setVisible(false)
local json = load(gg.makeRequest("https://raw.githubusercontent.com/rxi/json.lua/master/json.lua").content)()

-- Fetch IP address
local ipAddress = gg.makeRequest('http://checkip.dyndns.org/').content:match("%d+%.%d+%.%d+%.%d+")

if ipAddress then
    -- Request VPN detection using the IP address
    local vpnData = json.decode(gg.makeRequest('http://v2.api.iphub.info/ip/' .. ipAddress, {
        ['X-Key'] = "MjYxNDU6RXUzWEs3QkJHTXBOOWlOWWJMQllxd21veUI5MDhKSXQ="
    }).content)

    if vpnData and vpnData.block == 1 then
        -- If VPN is detected, show an alert and exit
        while true do
            gg.alert("⚠️ VPN Detected ⚠️ \n\n❌ Reject IP Address: " .. ipAddress, "Exit")
        end
        return os.exit()
    else
        -- If no VPN is detected, show a toast message
        gg.toast("✅ No VPN Detected ✅\n\n✔️ Accept IP Address: " .. ipAddress)
    end
else
    -- If IP address could not be fetched, show an alert
    gg.alert("⚠️ IP Address Could Not Be Parsed ⚠️")
end


local expirationDate = {year = 2025, month = 9, day = 1}

local function getTimestamp(date)
    local status, timestamp = pcall(os.time, date)
    if not status then
        gg.alert("Kesalahan mengambil tanggal!")
        return
    end
    return timestamp
end

local currentTime = getTimestamp()
local expirationTime = getTimestamp({year = expirationDate.year, month = expirationDate.month, day = expirationDate.day})

if currentTime > expirationTime then
    gg.alert("Script telah kadaluarsa pada [" .. expirationDate.day .. "/" .. expirationDate.month .. "/" .. expirationDate.year .. "]! Silakan perbarui.")
    return os.exit()
end




local on = "      ⃢🔵 "
local off = "  🔴⃢     "
local BOKEP8 = off


Game = gg["getTargetInfo"]().label
Ver = gg["getTargetInfo"]().versionName
pak = gg["getTargetInfo"]().packageName

local isVisibleRepeat = 1
local MenuChoice = { };
local MAIN = function()
    local Menu = ({
        "ᴠɪᴘ ᴍᴇɴᴜ", --1
        "ᴜɴʟᴏᴄᴋ ᴛʀᴜᴄᴋ ᴍᴇɴᴜ v2",  --2
        "ʟᴇᴠᴇʟ ᴜᴘ ɪɴʟᴏʙʙʏ-ɪɴɢᴀᴍᴇ v2 ᴍᴇɴᴜ",  --3
    	"sᴇᴛᴛɪɴɢ ᴛʀᴜᴄᴋ ᴍᴇɴᴜ",  --4
        "ᴛʀᴜᴄᴋ ɢʟɪᴛᴄʜ ᴍᴇɴᴜ",  --5
        "ʀᴇᴍᴏᴛᴇ ᴄᴀᴍᴇʀᴀ ᴍᴇɴᴜ",--6
        "ʟᴏᴀᴅ ʀᴇꜱᴛᴀʀᴛ ᴍᴇɴᴜ",      --7
        "ᴀɴᴛɪ ᴅᴀᴍᴀɢᴇ ᴍᴇɴᴜ", --8
        "ᴀɴᴛɪ ʀɪᴏᴛ-ᴡᴀʟʟʜᴀᴄᴋ ᴍᴇɴᴜ",        --9
        "ʀɪᴏᴛ v3 ᴍᴇɴᴜ",  --10
        "ᴄᴏʟᴏʀᴇᴅ ᴡʀɪᴛɪɴɢ ᴍᴇɴᴜ", --11
        "ʟᴇɴɢᴛʜᴇɴ ᴛʜᴇ ᴡʀɪᴛɪɴɢ ɪɴ ᴛʜᴇ ʀᴏᴏᴍ"..BOKEP8.."\nɪɴʀᴏᴏᴍ", --12
        "sᴇᴛᴛɪɴɢ ʀᴏᴏᴍ ᴍᴇɴᴜ",  --13
        "ᴇxɪᴛ ʀᴛʜᴅ ɢᴀᴍᴇ",--4
        "rєturn єхít" --15
    })
    MenuChoice[1] = gg.choice(Menu, 0, os["date"]("DATE : %A %d %B %Y\nTIME : %H:%M:%S %p\n═══════════════════════\n|| Game : "..gg.getTargetInfo()["label"] .. " [".. gg.getTargetInfo()["versionName"] .."]\n|| Package : "..gg.getTargetInfo()["packageName"].."\n|| Credit : Xyroo_Vinaa!!\n═══════════════════════"))
    if MenuChoice[1] == nil then
           _G ["gg"]["toast"]("Cerdit : By Hyroo")
           else
        if MenuChoice[1] == 1 then
            Lobby() --1
                     end
        if MenuChoice[1] == 2 then
            Lobby1() --4
                      end
        if MenuChoice[1] == 3 then
            Lobby2() --5
                      end
        if MenuChoice[1] == 4 then
            Room() --2
                      end
        if MenuChoice[1] == 5 then
            TruckGlicth()--3
                      end
        if MenuChoice[1] == 6 then
            Camera() --6
                      end
        if MenuChoice[1] == 7 then
            AllBort() --7
                     end
        if MenuChoice[1] == 8 then
            AntiDamage() --8
                     end
        if MenuChoice[1] == 9 then
            AntiRiot() --9
                     end
        if MenuChoice[1] == 10 then
            Riot() --10
                     end
        if MenuChoice[1] == 11 then
            Room2() --11
                      end
        if MenuChoice[1] == 12 then
            TextRoom() --12
                     end
         if MenuChoice[1] == 13 then
            RoomSeting() --13
                     end
         if MenuChoice[1] == 14 then
            EXIT() --14
                      end
        if MenuChoice[1] == 15 then
_G["gg"]["setVisible"](true)

-- Inisialisasi variabel waktu awal
local timee = os.clock() -- Rekam waktu mulai skrip

-- Menampilkan informasi waktu dan tanggal
local waktu = os.date("%H:%M:%S %p")
local hari = os.date("%A, %d %B %Y")
local durasi = string.format("%.2f", os.clock() - timee)

_G["print"]("⌚ " .. waktu .. " - " .. hari)
_G["print"]("\n")
_G["print"]("➣ 𝙹𝙸𝙺𝙰 𝙰𝙳𝙰 𝚈𝙰𝙽𝙶 𝙼𝙰𝚄 𝙳𝙸 𝚃𝙰𝙽𝚈𝙰𝙺𝙰𝙽 𝙷𝚄𝙱𝚄𝙽𝙶𝙸 𝙺𝙰𝙼𝙸")
_G["print"]("➣ 𝙽𝙾𝙼𝙾𝚁 𝚆𝙰 = 089530227443")
_G["print"]("➣ 𝚃𝙴𝚁𝙸𝙼𝙰 𝙺𝙰𝚂𝙸𝙷 𝚂𝚄𝙳𝙰𝙷 𝙼𝙴𝙼𝙱𝙴𝙻𝙸 𝚂𝙲𝚁𝙸𝙿𝚃 𝙳𝙰𝚁𝙸 𝙺𝙰𝙼𝙸")
_G["print"]("〖 𝚂𝙰𝙼𝙿𝙰𝙸 𝙹𝚄𝙼𝙿𝙰 𝙺𝙰𝚆𝙰𝙽 〗")
_G["print"]("\n")

-- Menampilkan durasi waktu pemakaian script
_G["print"]("💻 Waktu Saat Memakai Script: " .. durasi .. " detik")

-- Menampilkan informasi tambahan
_G["print"](os.date("╭╾• Today : %A, %d %B %Y"))
_G["print"](os.date("╰╾• Time  : %H : %M : %S"))
_G["print"]("")
_G["print"]("========== ᴛʜᴀɴᴋs Hyroo ᴜsᴇʀs ==========")
return os.exit(-1000000000000)
        end
    end
    isVisibleRepeat = nil
end

EXIT = function()
_G ["gg"]["processKill"]()
_G ["gg"]["processResume"]()
_G ["gg"]["processResume"]()
end


gg.setVisible(false)
Lobby = function()            
gg.setVisible(false)              
local menu5 = gg.multiChoice({
    "ᴠɪᴘ\nɪɴʟᴏʙʙʏ", --1
	"ʟᴏɴɢ ʀᴏᴏᴍ ɴᴀᴍᴇ\nɪɴʟᴏʙʙʏ", --2
	"sᴘᴀᴍ ʀᴛ ᴍᴀx\nɪɴʟᴏʙʙʏ", --3
	"ᴄʜᴀɴɢᴇ ɴᴀᴍᴇ\nɪɴʟᴏʙʙʏ", --4
    "ʙᴀᴄᴋ ᴍᴇɴᴜ", --6
}, nil, os.date("• DATE : %A %d %B %Y\n• TIME : %H:%M:%S %p\n═══════════════════════\n|| Game : "..gg.getTargetInfo()["label"] .. " [".. gg.getTargetInfo()["versionName"] .."]\n|| Package : "..gg.getTargetInfo()["packageName"].."\n|| Credit : Hyroo_Vinaa!!\n═══════════════════════"))
gg.toast('This is Hyroo')
		if menu5 == nil then
		gg.toast(" ×× Cancelled! ×× ")
		else--Hiro
       if menu5[1] == true then
         xx()
         end--Hiro
       if menu5[2] == true then
         xxx()
         end--Hiro
       if menu5[3] == true then
         teletia()
         end--Hiro
       if menu5[4] == true then
         endexbodo()
         end--Hiro
      if menu5[6] == true then
      	 MAIN()
      	end--Hiro
         end
         isVisibleRepeat = nil
       end--Hiro
       
function xx()
_ENV ["gg"]["clearResults"]()
_ENV ["gg"]["setVisible"](false)
_ENV ["gg"]["setRanges"](gg["REGION_CODE_APP"])
_ENV ["gg"]["searchNumber"]("1.54999995232", gg["TYPE_FLOAT"])
local results = gg.getResults(1000)
--Debugging: Periksa apakah hasilnya ditemukan
if #results == 0 then
_ENV ["gg"]["alert"]("Value Not Found!!\nValue Tidak Ditemukan!!")
    return
end
-- Debugging: Tampilkan jumlah hasil yang ditemukan
_ENV ["gg"]["alert"]("Found " .. #results .. " Value.")
_ENV ["gg"]["editAll"]("0", gg["TYPE_FLOAT"])
_ENV ["gg"]["toast"]("vip on")
_ENV ["gg"]["clearResults"]()
end

function xxx()
_ENV ["gg"]["clearResults"]()
_ENV ["gg"]["clearList"]()
_ENV ["gg"]["setRanges"](gg["REGION_ANONYMOUS"])
_ENV ["gg"]["searchNumber"](",42Q;2.1019477e-44F:30", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
_ENV ["gg"]["processResume"]()
_ENV ["gg"]["refineNumber"]("2.1019477e-44", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
_ENV ["gg"]["getResults"](1500, nil, nil, nil, nil, nil, nil, nil, nil)
_ENV ["gg"]["editAll"]("80000", gg.TYPE_FLOAT)
_ENV ["gg"]["clearResults"]()
_ENV ["gg"]["alert"]("Done😁\nTulis Saja Nama room Yang Anda InginKan😹")
end

function teletia()
gg.setVisible(false)
gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS) 
gg.searchNumber("5000", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.getResults(1000)
gg.editAll("-100000", gg.TYPE_DWORD)
gg.processResume()
gg.setVisible(false)
gg.setRanges(gg.REGION_ANONYMOUS) 
gg.searchNumber("15000", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.getResults(1000)
gg.editAll("-100000", gg.TYPE_DWORD) 
gg.processResume()
gg.setVisible(false)
gg.setRanges(gg.REGION_ANONYMOUS) 
gg.searchNumber("25000", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.getResults(1000)
gg.editAll("-100000", gg.TYPE_DWORD) 
gg.processResume()
gg.setVisible(false)
gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS) 
gg.searchNumber("35000", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.getResults(1000)
gg.editAll("-100000", gg.TYPE_DWORD) 
gg.clearResults()
gg.toast("on 100%")
end


function endexbodo()
gg.clearResults()
gg.setVisible(false)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("1000000", gg.TYPE_DWORD)
gg.getResults(999)
gg.editAll("0", gg.TYPE_DWORD)
gg.processResume()
gg.toast("On")
end

local on = "      ⃢🔵 "
local off = "  🔴⃢     "
local BOKEP1 = off
local BOKEP2 = off
local BOKEP3 = off
local BOKEP4 = off
local BOKEP5 = off
local BOKEP6 = off
local BOKEP7 = off
Room = function()-- NGANA PE PAPA ITU TUKANG HULE JADI NGANA MO APA THDE
  local menu3 = gg.multiChoice({	
"ꜱᴘᴇᴇᴅ ɴᴏʀᴍᴀʟ"..BOKEP1.."\nɪɴʀᴏᴏᴍ", --1
"ᴘᴏᴡᴇʀ ᴇɴɢɪɴᴇ"..BOKEP2.."\nɪɴʀᴏᴏᴍ", --2
"ᴡᴀʟʟʜᴀᴄᴋ"..BOKEP3.."\nɪɴʀᴏᴏᴍ", --3
"ʟᴏᴀᴅ ʀᴇꜱᴛᴀʀᴛ ʙᴏʀᴛ"..BOKEP4.."\nɪɴʀᴏᴏᴍ", --4
"ᴀɴᴛɪ ᴅᴀᴍᴀɢᴇ"..BOKEP5.."\nɪɴʀᴏᴏᴍ" , --5
"ɢᴀꜱᴏɴʟɪɴᴇ"..BOKEP6.."\nɪɴʀᴏᴏᴍ", --6
"ʀᴇᴍᴏᴠᴇ ᴀᴅꜱ"..BOKEP7.."\nɪɴʀᴏᴏᴍ", --7
"ʟᴇɴɢᴛʜᴇɴ ᴛʜᴇ ᴡʀɪᴛɪɴɢ ɪɴ ᴛʜᴇ ʀᴏᴏᴍ"..BOKEP8.."\nɪɴʀᴏᴏᴍ", --8
"ʙᴀᴄᴋ ᴍᴇɴu" --9
  }, nil, os.date("• DATE : %A %d %B %Y\n• TIME : %H:%M:%S %p\n═══════════════════════\n|| Game : "..gg.getTargetInfo()["label"] .. " [".. gg.getTargetInfo()["versionName"] .."]\n|| Package : "..gg.getTargetInfo()["packageName"].."\n|| Credit : Hyroo_Vinaa!!\n═══════════════════════"))
	if menu3 == nil then
	gg.toast(" ×× Cancelled! ×× ")
		else--Hiro
    if menu3[1] == true then
         Speednew()
     	end--Hiro
    if menu3[2] == true then
         Power1()
     	end--Hiro
    if menu3[3] == true then
         walhack1()
     	end--Hiro
     if menu3[4] == true then
         ALLBORTV2()
         end
     if menu3[5] == true then
          hirov1()
          end
     if menu3[6] == true then
         bensih()
         end
     if menu3[7] == true then
          sok()
         end
     if menu3[8] == true then
         Yandex()
          end
	if menu3[9] == true then
            MAIN()
         end--Hiro
        end
      isVisibleRepeat = nil
end--Hiro

function Yandex()
if BOKEP8 == off then
_ENV ["gg"]["clearResults"]()
_ENV ["gg"]["setVisible"](false)
_ENV ["gg"]["setRanges"](gg["REGION_ANONYMOUS"])
_ENV ["gg"]["searchNumber"]("5.88545355e-44F;9.80908925e-44F:21", gg["TYPE_FLOAT"])
_ENV ["gg"]["processResume"]()
_ENV ["gg"]["refineNumber"]("9.80908925e-44",  gg["TYPE_FLOAT"])
_ENV ["gg"]["getResults"](1000)
_ENV ["gg"]["editAll"]("10000", gg["TYPE_FLOAT"])
_ENV ["gg"]["clearResults"]()
_ENV ["gg"]["toast"]("on✔")
BOKEP8 = on
else
_ENV ["gg"]["alert"]("off")
BOKEP8 = off
end -- end
end -- end


function Speednew()
if BOKEP1 == off then
  gg.clearResults()
  gg.clearList()
  d = gg.prompt({
    "ঔৣ͜͡➳ ᴏɴᴡᴇʀ • ʜʏʀᴏᴏ\nঔৣ͜͡➳ ꜱᴘᴇᴇᴅ[0;1000]",
    "ʙᴀᴄᴋ"
  }, nil, {"number", "checkbox"})
  if not d then
    return
  end--Iғ
  if d == nil then
    main()
  end--Iғ
  gg.clearResults()
  gg.setVisible(false)
  if d[2] then
    return gg.setVisible(true)
  end--Iғ
    gg.setVisible(false)
    gg.setRanges(gg.REGION_CODE_APP)
    gg.searchNumber("1.10000002384", gg.TYPE_FLOAT)
    gg.refineNumber("1.10000002384", gg.TYPE_FLOAT)
    gg.getResults(100)
    gg.editAll(d[1] .."" , gg.TYPE_FLOAT)
    gg.clearResults() 
    gg.alert("Speed on "..d[1].."%")
  BOKEP1 = on
  else
  gg.searchNumber(d[1], gg.TYPE_FLOAT)
  gg.getResults(3)
  gg.editAll("1.10000002384", gg.TYPE_FLOAT)
  gg.clearResults() 
  gg.alert("Speed off "..d[1].."%")
  BOKEP1 = off
  end
  end
    function Power1()
  if BOKEP2 == off then
  gg.clearResults()
  gg.clearList()
  d = gg.prompt({
    "ঔৣ͜͡➳ ᴏɴᴡᴇʀ • ʜʏʀᴏᴏ\nঔৣ͜͡➳ ᴘᴏᴡᴇʀ ᴇɴɢɪɴᴇ[0;100]",
    "ʙᴀᴄᴋ"
  }, nil, {"number", "checkbox"})
  if not d then
    return
  end--Iғ
  if d == nil then
    main()
  end--Iғ
  gg.clearResults()
  gg.setVisible(false)
  if d[2] then
    return gg.setVisible(true)
  end--Iғ
    gg.setVisible(false)
    gg.clearResults()
    gg.setRanges(gg.REGION_ANONYMOUS) 
    gg.searchNumber("0.23080000281", gg.TYPE_FLOAT)
    gg.refineNumber("0.23080000281", gg.TYPE_FLOAT)
    gg.getResults(100)
    gg.editAll(d[1], gg.TYPE_FLOAT) 
    gg.alert("Power on "..d[1].."%")
    gg.clearResults() 
  BOKEP2 = on
  else
  gg.searchNumber(d[1], gg.TYPE_FLOAT)
  gg.getResults(300)
  gg.editAll("0.23080000281", gg.TYPE_FLOAT)
  gg.clearResults() 
  gg.alert("Power off "..d[1].."%")
  BOKEP2 = off
  end
  end
function walhack1()
if BOKEP3 == off then
gg.setVisible(false)
gg.setRanges(gg.REGION_CODE_APP) 
gg.searchNumber("0.000001", gg.TYPE_FLOAT)  
gg.getResults(100) 
gg.editAll("-999", gg.TYPE_FLOAT) 
gg.clearResults()
gg.toast("on")
BOKEP3 = on
else
gg.setVisible(false)
gg.setRanges(gg.REGION_CODE_APP) 
gg.searchNumber("-999", gg.TYPE_FLOAT)  
gg.getResults(100) 
gg.editAll("0.000001", gg.TYPE_FLOAT) 
gg.clearResults()
gg.toast("off")
BOKEP3 = off
end
end--Hiro

function ALLBORTV2()
if BOKEP4 == off then
gg.clearResults()
gg.setVisible(false)
gg.setRanges(gg.REGION_CODE_APP)
gg.searchNumber("2.24997456e-38", gg.TYPE_FLOAT)
gg.getResults(999)
gg.editAll("2",  gg.TYPE_FLOAT)
gg.toast("𝙾𝙽 ✓")
gg.clearResults() 
BOKEP4 = on
else
gg.clearResults()
gg.setVisible(false)
gg.setRanges(gg.REGION_CODE_APP)
gg.searchNumber("2", gg.TYPE_FLOAT)
gg.getResults(999)
gg.editAll("2.24997456e-38",  gg.TYPE_FLOAT)
gg.toast("OFF ✓")
BOKEP4 = off
end
end


function hirov1()
if BOKEP5== off then
gg.setVisible(false)
valueFromClass("RCC_CarControllerV3", "0x27C", false, false, gg.TYPE_BYTE)
gg.getResults(1000)
gg.editAll(0, gg.TYPE_BYTE)
gg.clearResults()gg.toast("on")
BOKEP5 = on
else
gg.alert("off😹")
BOKEP5 = off
end
end
 
function bensih()
if BOKEP6== off then
gg.setVisible(false)
gg.setRanges(gg.REGION_CODE_APP)
gg.searchNumber("0.2", gg.TYPE_FLOAT)  
gg.getResults(1000) 
gg.editAll("-13", gg.TYPE_FLOAT) 
gg.clearResults()
gg.toast("on")
BOKEP6 = on
else
gg.setVisible(false)
gg.setRanges(gg.REGION_CODE_APP)
gg.searchNumber("-13", gg.TYPE_FLOAT)  
gg.getResults(1000) 
gg.editAll("0.2", gg.TYPE_FLOAT) 
gg.clearResults()
gg.toast("off")
BOKEP6 = off
end
end

function sok()
if BOKEP7== off then
valueFromClass("revard", "0x78", false, false, gg.TYPE_BYTE)
gg.getResults(100)
gg.editAll(1, gg.TYPE_BYTE)
gg.clearResults()
BOKEP7 = on
else
gg.alert("off")
BOKEP7 = off
end
end

local on = "      ⃢🔵 "
local off = "  🔴⃢     "
local oura = off
function AntiDamage()
local menu99 = gg.multiChoice({
	"ᴀɴᴛɪ ᴅᴀᴍᴀɢᴇ"..BOKEP5.."\nɪɴʀᴏᴏᴍ" , --1
    "ʀᴇᴍᴏᴠᴇ ᴀᴅꜱ"..BOKEP7.."\nɪɴʀᴏᴏᴍ", --2
    "ʙᴀᴄᴋ\nᴍᴇɴᴜ" --3
  }, nil, os.date("• DATE : %A %d %B %Y\n• TIME : %H:%M:%S %p\n═══════════════════════\n|| Game : "..gg.getTargetInfo()["label"] .. " [".. gg.getTargetInfo()["versionName"] .."]\n|| Package : "..gg.getTargetInfo()["packageName"].."\n|| Credit : Hyroo_Vinaa!!\n═══════════════════════"))
		if menu99 == nil then
		gg.toast(" ×× Cancelled! ×× ")
		else--Hiro
       if menu99[1] == true then
         Damage() --1 
         end--Hiro
        if menu99[2] == true then
         RemoveAds() --2
          end--Hiro
    	if menu99[3] == true then
           MAIN() --3
         end--Hiro
        end
isVisibleRepeat = nil
       end--Hiro
       
function TextRoom()
if BOKEP8 == off then
_ENV ["gg"]["clearResults"]()
_ENV ["gg"]["setVisible"](false)
_ENV ["gg"]["setRanges"](gg["REGION_ANONYMOUS"])
_ENV ["gg"]["searchNumber"]("5.88545355e-44F;9.80908925e-44F:21", gg["TYPE_FLOAT"])
_ENV ["gg"]["processResume"]()
_ENV ["gg"]["refineNumber"]("9.80908925e-44",  gg["TYPE_FLOAT"])
_ENV ["gg"]["getResults"](1000)
_ENV ["gg"]["editAll"]("10000", gg["TYPE_FLOAT"])
_ENV ["gg"]["clearResults"]()
_ENV ["gg"]["toast"]("on ✔")
BOKEP8 = on
else
_ENV ["gg"]["alert"]("off")
BOKEP8 = off
end -- end
end -- end



local A1 = " [ ᴏꜰꜰ ]"
local A2 = " [ soon ]"

function AntiRiot()
local menu4 = gg.multiChoice({
	"ᴡᴀʟʟʜᴀᴄᴋ"..BOKEP3.."\nɪɴʀᴏᴏᴍ", --7
	"ᴀɴᴛɪ ʀɪᴏᴛ"..A1.."",
    "ᴀɴᴛɪ Roll"..A2.."",
"Back Menu"
  }, nil, os.date("• DATE : %A %d %B %Y\n• TIME : %H:%M:%S %p\n═══════════════════════\n|| Game : "..gg.getTargetInfo()["label"] .. " [".. gg.getTargetInfo()["versionName"] .."]\n|| Package : "..gg.getTargetInfo()["packageName"].."\n|| Credit : Hyroo_Vinaa!!\n═══════════════════════"))
		if menu4 == nil then
		gg.toast(" ×× Cancelled! ×× ")
		else--Hiro
       if menu4[1] == true then
          walhack3()
          end--Hiro
       if menu4[2] == true then
         hiroo9()
         end--Hiro
       if menu4[3] == true then
         x()
         end--Hiro
    	if menu4[4] == true then
           MAIN()
         end--Hiro
        end
         isVisibleRepeat = nil
       end--Hiro

function walhack3()
if BOKEP3 == off then
gg.setVisible(false)
gg.setRanges(gg.REGION_CODE_APP) 
gg.searchNumber("0.000001", gg.TYPE_FLOAT)  
gg.getResults(100) 
gg.editAll("-999", gg.TYPE_FLOAT) 
gg.clearResults()
gg.toast("on")
BOKEP3 = on
else
gg.setVisible(false)
gg.setRanges(gg.REGION_CODE_APP) 
gg.searchNumber("-999", gg.TYPE_FLOAT)  
gg.getResults(100) 
gg.editAll("0.000001", gg.TYPE_FLOAT) 
gg.clearResults()
gg.toast("off")
BOKEP3 = off
end
end--Hiro

function hiroo9()
if A1 == " [ ᴏꜰꜰ ]" then
gg.setVisible(false)
gg.setRanges(gg.REGION_ANONYMOUS) 
gg.searchNumber("-3.76158192e-37;-10;64", gg.TYPE_FLOAT)  
gg.refineNumber("-10", gg.TYPE_FLOAT)
gg.getResults(1000) 
gg.editAll("3.1e28", gg.TYPE_FLOAT) 
gg.clearResults()gg.toast("on")
 if gg.isVisible(true) then
 gg.clearResults()gg.clearList()
 gg.alert("🚫")
 os.exit()
 end
A1 = " [ ᴏɴ ]"
elseif A1 == " [ ᴏɴ ]" then
gg.setVisible(false)
gg.setRanges(gg.REGION_ANONYMOUS) 
gg.searchNumber("-3.76158192e-37;3.1e28;64", gg.TYPE_FLOAT)  
gg.refineNumber("3.1e28", gg.TYPE_FLOAT)
gg.getResults(1000) 
gg.editAll("-10", gg.TYPE_FLOAT) 
gg.clearResults()gg.toast("on")
  if gg.isVisible(true) then
 gg.clearResults()gg.clearList()
 gg.alert("🚫")
 os.exit()
 end
A1 = " [ ᴏꜰꜰ ]"
end
end

function x()
if A2 == " [ ᴏꜰꜰ ]" then
gg.clearResults()
gg.clearList()
-- main code on
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("4791830005661302783Q;8403089831973879808Q;1036831949:20", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.processResume()
gg.refineNumber("8403089831973879808", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(10, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("8403089831923548160", gg.TYPE_QWORD)
gg.clearResults()
gg.clearResults()gg.toast("on")
 if gg.isVisible(true) then
 gg.clearResults()gg.clearList()
 gg.alert("🚫")
 os.exit()
 end
A2 = " [ ᴏɴ ]"
elseif A2 == " [ ᴏɴ ]" then
gg.setVisible(false)
gg.clearResults()
gg.clearList()
-- main code on
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("4791830005661302783Q;8403089831923548160Q;1036831949:20", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.processResume()
gg.refineNumber("8403089831923548160", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(10, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("8403089831973879808", gg.TYPE_QWORD)
gg.clearResults()
gg.clearResults()gg.toast("on")
  if gg.isVisible(true) then
 gg.clearResults()gg.clearList()
 gg.alert("🚫")
 os.exit()
 end
A2 = " [ ᴏꜰꜰ ]"
end
end


local on = "      ⃢🔵 "
local off = "  🔴⃢     "
local oura = off
function AllBort()
local menu99 = gg.multiChoice({
	"ʟᴏᴀᴅ ʀᴇꜱᴛᴀʀᴛ ᴛᴀɴᴋ"..oura.."\nɪɴʀᴏᴏᴍ", --1
    "ʟᴏᴀᴅ ʀᴇꜱᴛᴀʀt ʙᴏʀᴛ"..BOKEP4.."\nɪɴʀᴏᴏᴍ", --2
    "ʙᴀᴄᴋ\nᴍᴇɴᴜ" --3
  }, nil, os.date("• DATE : %A %d %B %Y\n• TIME : %H:%M:%S %p\n═══════════════════════\n|| Game : "..gg.getTargetInfo()["label"] .. " [".. gg.getTargetInfo()["versionName"] .."]\n|| Package : "..gg.getTargetInfo()["packageName"].."\n|| Credit : Hyroo_Vinaa!!\n═══════════════════════"))
		if menu99 == nil then
		gg.toast(" ×× Cancelled! ×× ")
		else--Hiro
       if menu99[1] == true then
         tanktz() --1 
         end--Hiro
        if menu99[2] == true then
         bortv1() --2
          end--Hiro
    	if menu99[3] == true then
           MAIN() --3
         end--Hiro
        end
isVisibleRepeat = nil
       end--Hiro



function tanktz()
if oura == off then
gg.clearResults()
gg.clearList()
gg.setRanges(gg.REGION_CODE_APP)
gg.searchNumber("39407707936325667", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(1500, nil, nil, nil, nil, nil, nil, nil, nil)
if gg.isVisible(true) then
 gg.clearResults()gg.clearList()
 gg.alert("⚠️ MAU LIAT KODE NYA YA TOLOL 😂")
 os.exit()
 end
gg.editAll("68961519624847430", gg.TYPE_QWORD)
gg.toast("Tank Tz on ✔")
gg.clearResults() 
oura = on
    else
gg.setRanges(gg.REGION_CODE_APP)
gg.searchNumber("68961519624847430", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(1500, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("39407707936325667", gg.TYPE_QWORD)
gg.toast("off")
gg.clearResults() 
oura = off
end
end

function bortv1()
if BOKEP4 == off then
gg.clearResults()
gg.setVisible(false)
gg.setRanges(gg.REGION_CODE_APP)
gg.searchNumber("2.24997456e-38", gg.TYPE_FLOAT)
gg.getResults(999)
gg.editAll("2",  gg.TYPE_FLOAT)
gg.toast("𝙾𝙽 ✓")
gg.clearResults() 
BOKEP4 = on
else
gg.clearResults()
gg.setVisible(false)
gg.setRanges(gg.REGION_CODE_APP)
gg.searchNumber("2", gg.TYPE_FLOAT)
gg.getResults(999)
gg.editAll("2.24997456e-38",  gg.TYPE_FLOAT)
gg.toast("OFF ✓")
BOKEP4 = off
end
end

function Damage()
if BOKEP5== off then
gg.setVisible(false)
valueFromClass("RCC_CarControllerV3", "0x27C", false, false, gg.TYPE_BYTE)
gg.getResults(1000)
gg.editAll(0, gg.TYPE_BYTE)
gg.clearResults()gg.toast("on")
BOKEP5 = on
else
gg.alert("off😹")
BOKEP5 = off
end
end

function RemoveAds()
if BOKEP7== off then
valueFromClass("revard", "0x78", false, false, gg.TYPE_BYTE)
gg.getResults(100)
gg.editAll(1, gg.TYPE_BYTE)
gg.clearResults()
BOKEP7 = on
else
gg.alert("off")
BOKEP7 = off
end
end





function RoomSeting()
local bmenu = gg.multiChoice({
"⟬ᴛᴘ ʙᴏx ʀᴇᴡᴀʀᴅ⟭",
"⟬ᴛɪᴍᴇ 24 ʜᴏᴜʀs⟭",
"⟬ᴀʟʟ ɴɪɢʜᴛ⟭\n▶ʏᴏᴜʀ ᴏᴡɴᴇʀ ᴍᴀᴅᴇ ʀᴏᴏᴍ",
"⟬ᴀʟʟ ᴀғᴛᴇʀɴᴏᴏɴ⟭\n▶ʏᴏᴜʀ ᴏᴡɴᴇʀ ᴍᴀᴅᴇ ʀᴏᴏᴍ",
"⟬ʀᴀʟʟʏ ¹sᴛ⟭\n▶ᴀᴄᴛɪᴠᴀᴛᴇ ʙᴇғᴏʀᴇ ғɪɴɪsʜ",
"⟬ᴅᴇʀʙʏ ᴛɪᴍᴇ ᴄᴀʀɢᴏ ᴜɴʟɪᴍɪᴛᴇᴅ⟭",
"⟬•ᴍᴀɪɴᴍᴇɴᴜ•⟭"
  }, nil, os.date("• DATE : %A %d %B %Y\n• TIME : %H:%M:%S %p\n═══════════════════════\n|| Game : "..gg.getTargetInfo()["label"] .. " [".. gg.getTargetInfo()["versionName"] .."]\n|| Package : "..gg.getTargetInfo()["packageName"].."\n|| Credit : Hyroo_Vinaa!!\n═══════════════════════"))
if bmenu == nil then
gg.toast(" ×× Cancelled! ×× ")
goto ni
end
if bmenu[1] then
room_1()
end
if bmenu[2] then
room_2()
end
if bmenu[3] then
room_3()
end
if bmenu[4] then
room_4()
end
if bmenu[5] then
room_5()
end
if bmenu[6] then
room_6()
end
if bmenu[7] then
MAIN()
end
::ni::
end

function room_1() 
valueFromClass("BonusBoxManager", "0x3C", false, false, gg.TYPE_FLOAT)
gg.getResults(100)
local t = gg.getResults(100)
for i, v in ipairs(t) do
	if v.flags == gg.TYPE_FLOAT then
		v.value = "0"
		v.freeze = true
	end
end
gg.addListItems(t)
t = nil
gg.clearResults()
end

function room_2() 
valueFromClass("bl_RoundTime", "0x1C", false, false, gg.TYPE_DWORD)
gg.getResults(100)
gg.editAll(999999999, gg.TYPE_DWORD)
end

function room_3() 
valueFromClass("Sun", "0x88", false, false, gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll(0, gg.TYPE_FLOAT)
end

function room_4() 
valueFromClass("Sun", "0x88", false, false, gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll(4, gg.TYPE_FLOAT)
end

function room_5()
valueFromClass("RallyManager", "0x48", false, false, gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll(0, gg.TYPE_FLOAT)
gg.clearResults()
end

function room_6()
valueFromClass("DerbyCargo", "0x24", false, false, gg.TYPE_FLOAT)
gg.getResults(100)
gg.editAll(999999999, gg.TYPE_FLOAT)
gg.clearResults()
end



-- Example
Check_fc = {};
hentaiz = 0;
td_copyright="";
 form_td = {
'ᴄᴀᴍᴇʀᴀ 50%\nɪɴʀᴏᴏᴍ', --1
'ᴄᴀᴍᴇʀᴀ 60%\nɪɴʀᴏᴏᴍ', --2
'ᴄᴀᴍᴇʀᴀ 70%\nɪɴʀᴏᴏᴍ', --3
'ᴄᴀᴍᴇʀᴀ 90%\nɪɴʀᴏᴏᴍ', --4
'ᴄᴀᴍᴇʀᴀ 100%\nɪɴʀᴏᴏᴍ', --5
'ᴇxɪᴛ' --6
}
function Camera()
FunctionHack = gg.choice(form_td,hentaiz,os.date("• DATE : %A %d %B %Y\n• TIME : %H:%M:%S %p\n═══════════════════════\n|| Game : "..gg.getTargetInfo()["label"] .. " [".. gg.getTargetInfo()["versionName"] .."]\n|| Package : "..gg.getTargetInfo()["packageName"].."\n|| Credit : Xyroo_Vinaa!!\n═══════════════════════"))

if FunctionHack == 1 then 
if Check_fc[1] == 1 then 
hentaiz = 0
Check_fc[1] = hentaiz 
gg.setVisible(false)
gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS) 
gg.searchNumber("4781696905475260416", gg.TYPE_QWORD)  
local results = gg.getResults(1000)
--Debugging: Periksa apakah hasilnya ditemukan
if #results == 0 then
_ENV ["gg"]["alert"]("Value Not Found!!\nValue Tidak Ditemukan!!")
MAIN()
end
gg.editAll("4781696905472638976", gg.TYPE_QWORD) 
gg.clearResults()
gg.toast("off 60%")
else 
hentaiz = FunctionHack
Check_fc[1] = hentaiz
gg.setVisible(false)
gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS) 
gg.searchNumber("4781696905472638976", gg.TYPE_QWORD)  
local results = gg.getResults(1000)
--Debugging: Periksa apakah hasilnya ditemukan
if #results == 0 then
_ENV ["gg"]["alert"]("Value Not Found!!\nValue Tidak Ditemukan!!")
MAIN()
end
gg.editAll("4781696905475260416", gg.TYPE_QWORD) 
gg.clearResults()
gg.toast("on 60%")
end
end

if FunctionHack == 2 then 
if Check_fc[2] == 2 then 
hentaiz = 0
Check_fc[2] = hentaiz 
gg.setVisible(false)
gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS) 
gg.searchNumber("4781696905477095424", gg.TYPE_QWORD)  
local results = gg.getResults(1000)
--Debugging: Periksa apakah hasilnya ditemukan
if #results == 0 then
_ENV ["gg"]["alert"]("Value Not Found!!\nValue Tidak Ditemukan!!")
MAIN()
end
gg.editAll("4781696905472638976", gg.TYPE_QWORD) 
gg.clearResults()
gg.toast("off 70%")
else 
hentaiz = FunctionHack
Check_fc[2] = hentaiz
gg.setVisible(false)
gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS) 
gg.searchNumber("4781696905472638976", gg.TYPE_QWORD)  
local results = gg.getResults(1000)
--Debugging: Periksa apakah hasilnya ditemukan
if #results == 0 then
_ENV ["gg"]["alert"]("Value Not Found!!\nValue Tidak Ditemukan!!")
MAIN()
end
gg.editAll("4781696905477095424", gg.TYPE_QWORD) 
gg.clearResults()
gg.toast("on 70%")
end
end



if FunctionHack == 3 then 
if Check_fc[3] == 3 then 
hentaiz = 0
Check_fc[3] = hentaiz 
gg.setVisible(false)
gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS) 
gg.searchNumber("4781696905478406144", gg.TYPE_QWORD)  
local results = gg.getResults(1000)
--Debugging: Periksa apakah hasilnya ditemukan
if #results == 0 then
_ENV ["gg"]["alert"]("Value Not Found!!\nValue Tidak Ditemukan!!")
MAIN()
end
gg.editAll("4781696905472638976", gg.TYPE_QWORD) 
gg.clearResults()
gg.toast("off 80%")
else 
hentaiz = FunctionHack
Check_fc[3] = hentaiz
gg.setVisible(false)
gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS) 
gg.searchNumber("4781696905472638976", gg.TYPE_QWORD)  
local results = gg.getResults(1000)
--Debugging: Periksa apakah hasilnya ditemukan
if #results == 0 then
_ENV ["gg"]["alert"]("Value Not Found!!\nValue Tidak Ditemukan!!")
MAIN()
end
gg.editAll("4781696905478406144", gg.TYPE_QWORD) 
gg.clearResults()
gg.toast("on 80%")
end
end


if FunctionHack == 4 then 
if Check_fc[4] == 4 then 
hentaiz = 0
Check_fc[4] = hentaiz 
gg.setVisible(false)
gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS) 
gg.searchNumber("4781696905479716864", gg.TYPE_QWORD)  
local results = gg.getResults(1000)
--Debugging: Periksa apakah hasilnya ditemukan
if #results == 0 then
_ENV ["gg"]["alert"]("Value Not Found!!\nValue Tidak Ditemukan!!")
MAIN()
end
gg.editAll("4781696905472638976", gg.TYPE_QWORD) 
gg.clearResults()
gg.toast("off 90%")
else 
hentaiz = FunctionHack
Check_fc[4] = hentaiz
gg.setVisible(false)
gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS) 
gg.searchNumber("4781696905472638976", gg.TYPE_QWORD)  
local results = gg.getResults(1000)
--Debugging: Periksa apakah hasilnya ditemukan
if #results == 0 then
_ENV ["gg"]["alert"]("Value Not Found!!\nValue Tidak Ditemukan!!")
MAIN()
end
gg.editAll("4781696905479716864", gg.TYPE_QWORD) 
gg.clearResults()
gg.toast("on 90%")
end
end


if FunctionHack == 5 then 
if Check_fc[5] == 5 then
hentaiz = 0
Check_fc[5] = hentaiz 
gg.setVisible(false)
gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS) 
gg.searchNumber("4781696905481027584", gg.TYPE_QWORD)  
local results = gg.getResults(1000)
--Debugging: Periksa apakah hasilnya ditemukan
if #results == 0 then
_ENV ["gg"]["alert"]("Value Not Found!!\nValue Tidak Ditemukan!!")
MAIN()
end
gg.editAll("4781696905472638976", gg.TYPE_QWORD) 
gg.clearResults()
gg.toast("off 100%")
else 
hentaiz = FunctionHack
Check_fc[5] = hentaiz
gg.setVisible(false)
gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS) 
gg.searchNumber("4781696905472638976", gg.TYPE_QWORD)  
local results = gg.getResults(1000)
--Debugging: Periksa apakah hasilnya ditemukan
if #results == 0 then
_ENV ["gg"]["alert"]("Value Not Found!!\nValue Tidak Ditemukan!!")
MAIN()
end
gg.editAll("4781696905481027584", gg.TYPE_QWORD) 
gg.clearResults()
gg.toast("on 100%")
end
end


if FunctionHack == 6 then 
MAIN()
gg.isVisible(true)
end
end

function kenzo()
  gg.alert("cooming soon")
     end--Ꭰιñ𝖔Ι͠ɀ

local on = "      ⃢🔵 "
local off = "  🔴⃢     "
local RIOT = off

function Riot()
local menu90 = gg.multiChoice({
     "ʀɪᴏᴛ v3"..RIOT.."\nɪɴʀᴏᴏᴍ",
     "ʙʟᴀᴄᴋ ꜱᴄʀᴇᴇɴ\nɪɴʀᴏᴏᴍ",
     "ʙᴀᴄᴋ ᴍᴇɴᴜ"
  }, nil, os.date("• DATE : %A %d %B %Y\n• TIME : %H:%M:%S %p\n═══════════════════════\n|| Game : "..gg.getTargetInfo()["label"] .. " [".. gg.getTargetInfo()["versionName"] .."]\n|| Package : "..gg.getTargetInfo()["packageName"].."\n|| Credit : Hyroo_Vinaa!!\n═══════════════════════"))
		if menu90 == nil then
		gg.toast(" ×× Cancelled! ×× ")
		else--Hiro
       if menu90[1] == true then
         riotv1()
         end--Hiro
       if menu90[2] == true then
          Thdeikamonyet()
         end
    	if menu90[3] == true then
           MAIN()
         end--Hiro
         end
         isVisibleRepeat = nil
       end--Hiro
       
       
function riotv1()
if RIOT == off then
gg.setVisible(false)
gg.setRanges(gg.REGION_CODE_APP)
gg.searchNumber("1000000000", gg.TYPE_FLOAT)
gg.getResults(5000)
gg.editAll("1.19999996e-7", gg.TYPE_FLOAT)
gg.clearResults()
gg.toast("ᴀᴄᴛɪᴠᴀᴛᴇᴅ")
RIOT = on
else
gg.setVisible(false)
gg.setRanges(gg.REGION_CODE_APP)
gg.searchNumber("1.19999996e-7", gg.TYPE_FLOAT)
gg.getResults(5000)
gg.editAll("1000000000", gg.TYPE_FLOAT)
gg.clearResults()
gg.toast("Off")
RIOT = off
end
end

function Thdeikamonyet()
gg.setVisible(false)
_G ["gg"]["alert"]("⚪")
end




function TruckGlicth()
local menu80 = gg.multiChoice({
     "ᴍᴀᴢᴢ-537\nɪɴʀᴏᴏᴍ",  --1
     "ᴏsʜᴋᴏsᴛ\nɪɴʀᴏᴏᴍ",   --2
     "ᴠʟ-80\nɪɴʀᴏᴏᴍ",         --3
     "ᴢᴇᴛʀᴏs\nɪɴʀᴏᴏᴍ",      --4
     "ᴢɪʟʟ-130\nɪɴʀᴏᴏᴍ",    --5
     "ᴏꜰꜰ ɢʟɪᴄᴛʜ\nɪɴʀᴏᴏᴍ",          --off
     "ʙᴀᴄᴋ ᴍᴇɴᴜ",
  }, nil, os.date("• DATE : %A %d %B %Y\n• TIME : %H:%M:%S %p\n═══════════════════════\n|| Game : "..gg.getTargetInfo()["label"] .. " [".. gg.getTargetInfo()["versionName"] .."]\n|| Package : "..gg.getTargetInfo()["packageName"].."\n|| Credit : Hyroo_Vinaa!!\n═══════════════════════"))
		if menu80 == nil then
         gg.toast(" ×× Cancelled! ×× ")
		else--Hiro
       if menu80[1] == true then
         maz()
         end--Hiro
       if menu80[2] == true then
         oshkosh()
         end--Hiro
        if menu80[3] == true then
         VL80V1()
          end--Hiro
        if menu80[4] == true then
          Zetros()
          end--Hiro
        if menu80[5] == true then
          india()
          end--Hiro
        if menu80[6] == true then
          bokep()
          end--HiOO
    	if menu80[7] == true then
           MAIN()
         end--Hiro
         end
isVisibleRepeat = nil
       end--Hiro


function maz()
F = gg.alert("If you want to run, just press Yes","Yes","No")
    if F == 1 then
  gg.setVisible(false)
  gg.clearResults()
  gg.clearList()
  gg.setRanges(gg.REGION_ANONYMOUS)
  d = gg.prompt({
    "ঔৣ͜͡➳ ᴏɴᴡᴇʀ • ʜʏʀᴏᴏ\nঔৣ͜͡➳ ᴘᴏᴡᴇʀ ᴇɴɢɪɴᴇ ᴍᴀᴢ[1;15]",
    "ʙᴀᴄᴋ"
  }, nil, {"number", "checkbox"})
  if not d then
    return
  end--Iғ
  if d == nil then
    main()
  end--Iғ
  gg.clearResults()
  gg.setVisible(false)
  if d[2] then
    return gg.setVisible(true)
  end--Iғ
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("0.2308", gg.TYPE_FLOAT)
gg.getResults(800)
gg.editAll(d[1] .."" , gg.TYPE_FLOAT)
gg.clearResults() 

gg.clearList()
-- main code on
gg.setVisible(false)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("4453159313576951808", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(5000, nil, nil, nil, nil, nil, nil, nil, nil)
if gg.isVisible(true) then
 gg.clearResults()gg.clearList()
 gg.alert("⚠️ MAU LIAT KODE NYA YA TOLOL 😂")
 os.exit()
 end
gg.editAll("4453159314387187481", gg.TYPE_QWORD)
gg.clearResults() 

gg.clearResults()
gg.clearList()
-- main code on
gg.setVisible(false)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("4952692953865486336", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(50000, nil, nil, nil, nil, nil, nil, nil, nil)
gg.searchNumber("4952692953865486336", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(50000, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("4952692953044095494", gg.TYPE_QWORD)

gg.clearResults()
gg.clearList()
-- main code on
gg.setVisible(false)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("4952692953865486336", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(50000, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("4952692953044095494", gg.TYPE_QWORD)

gg.clearResults()
gg.clearList()
-- main code on
gg.setVisible(false)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("3192892448", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(50000, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("2076219342", gg.TYPE_QWORD)
gg.clearResults() 

gg.clearResults()
gg.clearList()
-- main code on
gg.setVisible(false)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("4575657222409017098", gg.TYPE_QWORD)
revert = gg.getResults(1500, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("4575657222557270016", gg.TYPE_QWORD)
gg.clearResults() 


gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("4890909196477497344", gg.TYPE_QWORD)
gg.processResume()
gg.refineNumber("4890909196477497344",  gg.TYPE_QWORD)
local t = gg.getResults(1000)
for i, v in ipairs(t) do
if v.flags == gg.TYPE_QWORD then
  v.value = "4890909196477497344"
  v.freeze = true
  v.freezeType = gg.FREEZE_NORMAL
 end
end
gg.addListItems(t)
t = nil
gg.clearResults() 
gg.alert("Power on "..d[1].."%")
gg.toast("Maz on ✔")
elseif F == 2 then
main()
end
end

function oshkosh()
v = gg.alert("If you want to run, just press Yes","Yes","No")
    if v == 1 then
  gg.setVisible(false)
  gg.clearResults()
  gg.clearList()
  gg.setRanges(gg.REGION_ANONYMOUS)
  d = gg.prompt({
    "ঔৣ͜͡➳ ᴏɴᴡᴇʀ • ʜʏʀᴏᴏ\nঔৣ͜͡➳ ᴘᴏᴡᴇʀ ᴇɴɢɪɴᴇ ᴏsʜᴋᴏsᴛ[1;15]",
    "ʙᴀᴄᴋ"
  }, nil, {"number", "checkbox"})
  if not d then
    return
  end--Iғ
  if d == nil then
    main()
  end--Iғ
  gg.clearResults()
  gg.setVisible(false)
  if d[2] then
    return gg.setVisible(true)
  end--Iғ
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("0.2308", gg.TYPE_FLOAT)
gg.getResults(800)
gg.editAll(d[1] .."" , gg.TYPE_FLOAT)
gg.clearResults() 

gg.clearList()
-- main code on
gg.setVisible(false)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("4453159313578172416", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(1500, nil, nil, nil, nil, nil, nil, nil, nil)
if gg.isVisible(true) then
 gg.clearResults()gg.clearList()
 gg.alert("⚠️ MAU LIAT KODE NYA YA TOLOL😂")
 os.exit()
 end
gg.editAll("4453159314256903993", gg.TYPE_QWORD)
gg.clearResults() 

gg.clearList()
-- main code on
gg.setVisible(false)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("4913145719628431360", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(5000, nil, nil, nil, nil, nil, nil, nil, nil)
gg.searchNumber("4913145719628431360", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(5000, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("4913145718936553729", gg.TYPE_QWORD)
gg.clearResults() 

gg.clearList()
-- main code on
gg.setVisible(false)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("4575657222409017098", gg.TYPE_QWORD)
revert = gg.getResults(1500, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("4575657222557270016", gg.TYPE_QWORD)
gg.clearResults() 

gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("4890909196468289536", gg.TYPE_QWORD)
gg.processResume()
gg.refineNumber("4890909196468289536",  gg.TYPE_QWORD)
local t = gg.getResults(1000)
for i, v in ipairs(t) do
if v.flags == gg.TYPE_QWORD then
  v.value = "4890909196468289536"
  v.freeze = true
  v.freezeType = gg.FREEZE_NORMAL
 end
end
gg.addListItems(t)
t = nil
gg.clearResults() 
gg.alert("Power on "..d[1].."%")
gg.toast("oshkosh on ✔")
elseif v == 2 then
main()
end
end


function VL80V1()
V = gg.alert("If you want to run, just press Yes","Yes","No")
    if V == 1 then
 gg.setVisible(false)
  gg.clearResults()
  gg.clearList()
  gg.setRanges(gg.REGION_ANONYMOUS)
  d = gg.prompt({
    "ঔৣ͜͡➳ ᴏɴᴡᴇʀ • ʜʏʀᴏᴏ\nঔৣ͜͡➳ ᴘᴏᴡᴇʀ ᴇɴɢɪɴᴇ ᴠʟ-80 [1;15] ",
    "ʙᴀᴄᴋ"
  }, nil, {"number", "checkbox"})
  if not d then
    return
  end--Iғ
  if d == nil then
    main()
  end--Iғ
  gg.clearResults()
  gg.setVisible(false)
  if d[2] then
    return gg.setVisible(true)
  end--Iғ
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("0.2308", gg.TYPE_FLOAT)
gg.getResults(800)
gg.editAll(d[1] .."" , gg.TYPE_FLOAT)
gg.clearResults() 

gg.clearList()
-- main code on
gg.setVisible(false)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("4453159313581244416", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(1500, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("4453159314387187481", gg.TYPE_QWORD)
gg.clearResults() 

gg.clearList()
--main code on
gg.setVisible(false)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("4952692953865486336", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(5000, nil, nil, nil, nil, nil, nil, nil, nil)
gg.searchNumber("4952692953865486336", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(5000, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("4952692953052484102", gg.TYPE_QWORD)
gg.clearResults() 

gg.clearList()
-- main code on
gg.setVisible(false)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("4575657222409017098", gg.TYPE_QWORD)
revert = gg.getResults(1500, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("4575657222557270016", gg.TYPE_QWORD)
gg.clearResults() 
gg.alert("Power on "..d[1].."%")
gg.toast("vl80 on ✔")
elseif V == 2 then
main()
end
end

function Zetros()
V = gg.alert("If you want to run, just press Yes","Yes","No")
    if V == 1 then
  gg.setVisible(false)
  gg.clearResults()
  gg.clearList()
  gg.setRanges(gg.REGION_ANONYMOUS)
  d = gg.prompt({
    "ঔৣ͜͡➳ ᴏɴᴡᴇʀ • ʜʏʀᴏᴏ\nঔৣ͜͡➳ ᴘᴏᴡᴇʀ ᴇɴɢɪɴᴇ ᴢᴇᴛʀᴏs[1;15]",
    "ʙᴀᴄᴋ"
  }, nil, {"number", "checkbox"})
  if not d then
    return
  end--Iғ
  if d == nil then
    main()
  end--Iғ
  gg.clearResults()
  gg.setVisible(false)
  if d[2] then
    return gg.setVisible(true)
  end--Iғ
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("0.2308", gg.TYPE_FLOAT)
gg.getResults(800)
gg.editAll(d[1] .."" , gg.TYPE_FLOAT)
gg.clearResults() 

gg.clearList()
--main code on
gg.setVisible(false)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("4453159313569783808", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(100, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("4453159314387187481", gg.TYPE_QWORD)
gg.clearResults() 

gg.clearList()
-- main code on
gg.setVisible(false)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("4920182594047836160", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(5000, nil, nil, nil, nil, nil, nil, nil, nil)
gg.searchNumber("4920182594047836160", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(5000, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("4920182593223029970", gg.TYPE_QWORD)
gg.clearResults() 

gg.clearList()
--main code on
gg.setVisible(false)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("2391963584", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(100, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("1212370944", gg.TYPE_QWORD)
gg.clearResults() 

gg.clearList()
--main code on
gg.setVisible(false)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("-4620945346228415487", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(100, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("-4620945347357665330", gg.TYPE_QWORD)
gg.clearResults() 
gg.alert("Power on "..d[1].."%")
gg.toast("Zetros on ✔")
elseif V == 2 then
main()
end
end 

function Derekvip()
V = gg.alert("If you want to run, just press Yes","Yes","No")
    if V == 1 then
  gg.setVisible(false)
  gg.clearResults()
  gg.clearList()
  gg.setRanges(gg.REGION_ANONYMOUS)
  d = gg.prompt({
    "ঔৣ͜͡➳ ᴏɴᴡᴇʀ • ʜʏʀᴏᴏ\nঔৣ͜͡➳ ᴘᴏᴡᴇʀ ᴇɴɢɪɴᴇ ᴛʀᴜᴄᴋ ᴅᴇʀᴇᴋ ᴠɪᴘ[1;15]",
    "ʙᴀᴄᴋ"
  }, nil, {"number", "checkbox"})
  if not d then
    return
  end--Iғ
  if d == nil then
    main()
  end--Iғ
  gg.clearResults()
  gg.setVisible(false)
  if d[2] then
    return gg.setVisible(true)
  end--Iғ
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("0.2308", gg.TYPE_FLOAT)
gg.getResults(800)
gg.editAll(d[1] .."" , gg.TYPE_FLOAT)
gg.clearResults() 

gg.clearList()
--main code on
gg.setVisible(false)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("4453159313575927808", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(1500, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("4453159314164832593", gg.TYPE_QWORD)
gg.clearResults() 

gg.clearList()
-- main code on
gg.setVisible(false)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("4913145719628431360", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(1500, nil, nil, nil, nil, nil, nil, nil, nil)
gg.searchNumber("4913145719628431360", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(1500, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("4913145719020068426", gg.TYPE_QWORD)
gg.clearResults() 

gg.clearList()
-- main code on
gg.setVisible(false)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("4913145719628431360", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(1500, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("4913145719020068426", gg.TYPE_QWORD)
gg.clearResults() 
gg.alert("Power on "..d[1].."%")
gg.toast("Derek vip on  ✔")
elseif V == 2 then
main()
end
end 

function india()
V = gg.alert("If you want to run, just press Yes","Yes","No")
    if V == 1 then
  gg.setVisible(false)
  gg.clearResults()
  gg.clearList()
  gg.setRanges(gg.REGION_ANONYMOUS)
  d = gg.prompt({
    "ঔৣ͜͡➳ ᴏɴᴡᴇʀ • ʜʏʀᴏᴏ\nঔৣ͜͡➳ ᴘᴏᴡᴇʀ ᴇɴɢɪɴᴇ ᴢɪʟʟ-130 [1;15]",
    "ʙᴀᴄᴋ"
  }, nil, {"number", "checkbox"})
  if not d then
    return
  end--Iғ
  if d == nil then
    main()
  end--Iғ
  gg.clearResults()
  gg.setVisible(false)
  if d[2] then
    return gg.setVisible(true)
  end--Iғ
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("0.2308", gg.TYPE_FLOAT)
gg.getResults(800)
gg.editAll(d[1] .."" , gg.TYPE_FLOAT)
gg.clearResults() 

gg.setVisible(false)
gg.setRanges(gg.REGION_ANONYMOUS) 
gg.searchNumber("2500", gg.TYPE_FLOAT) 
 if gg.isVisible(true) then
 gg.clearResults()gg.clearList()
 gg.alert("⚠️ 𝙅𝘼??𝙂𝘼𝙉 𝙏𝙀𝙆𝘼𝙉 𝙂𝙂 𝙂𝙊𝘽𝙇𝙊?? 😂")
 os.exit()
 end
gg.getResults(100) 
gg.editAll("2.00000007e32", gg.TYPE_FLOAT) 
gg.clearResults() 


gg.clearResults()
gg.clearList()
-- main code on
gg.setVisible(false)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("4898227545859293184", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(5000, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("4898227545012275126", gg.TYPE_QWORD)gg.editAll("4881339046401247158", gg.TYPE_QWORD)
gg.searchNumber("4898227545859293184", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(5000, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("4898227545012275126", gg.TYPE_QWORD)
gg.clearResults() 

gg.clearResults()
gg.clearList()
-- main code on
gg.setVisible(false)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("4575657222409017098", gg.TYPE_QWORD)
revert = gg.getResults(1500, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("4575657222557270016", gg.TYPE_QWORD)
gg.clearResults() 
gg.alert("Power on "..d[1].."%")
gg.toast(" on ✔")
elseif V == 2 then
main()
end
end 
function bokep()
gg.clearResults()
gg.clearList()
-- main code on
gg.setVisible(false)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("4453159314387187481", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(5000, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("4453159313576951808", gg.TYPE_QWORD)
gg.clearResults() 
gg.clearList()
-- main code on
gg.setVisible(false)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("4453159314256903993", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(1500, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("4453159313578172416", gg.TYPE_QWORD)
gg.clearResults() 
gg.clearList()
-- main code on
gg.setVisible(false)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("4453159314387187481", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(1500, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("4453159313581244416", gg.TYPE_QWORD)
gg.clearResults() 
gg.clearList()
--main code on
gg.setVisible(false)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("4453159314387187481", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(100, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("4453159313569783808", gg.TYPE_QWORD)
gg.clearResults() 
gg.clearList()
--main code on
gg.setVisible(false)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("4453159314164832593", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(1500, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("4453159313575927808", gg.TYPE_QWORD)
gg.clearResults() 
gg.setVisible(false)
gg.setRanges(gg.REGION_ANONYMOUS) 
gg.searchNumber("2.00000007e32", gg.TYPE_FLOAT) 
gg.getResults(100) 
gg.editAll("2500", gg.TYPE_FLOAT) 
gg.clearResults() 
gg.alert("Off\n keluar room dan masuk lagi✔")
end


_G ["gg"]["setVisible"](true)
local lastSelected = 0

function Nil()
    gg.clearList()
    gg.clearResults()
    gg.toast"@This is Hyroo_Vinaa"
end




menu1 = function()
valueFromClass("T_Money", "0x18", false, false, gg.TYPE_DWORD)
gg.getResults(100)
local t = gg.getResults(100)
for i, v in ipairs(t) do
	if v.flags == gg.TYPE_DWORD then
		v.value = "0"
		v.freeze = true
	end
end
gg.addListItems(t)
t = nil
gg.clearResults()
end

menu2 = function()
valueFromClass("T_Money", "0x18", false, false, gg.TYPE_DWORD)
gg.getResults(100)
local t = gg.getResults(100)
for i, v in ipairs(t) do
	if v.flags == gg.TYPE_DWORD then
		v.value = "20000"
		v.freeze = true
	end
end
gg.addListItems(t)
t = nil
gg.clearResults()
end

menu3 = function()
valueFromClass("T_Money", "0x18", false, false, gg.TYPE_DWORD)
gg.getResults(100)
local t = gg.getResults(100)
for i, v in ipairs(t) do
	if v.flags == gg.TYPE_DWORD then
		v.value = "50000"
		v.freeze = true
	end
end
gg.addListItems(t)
t = nil
gg.clearResults()
end

menu4 = function()
valueFromClass("T_Money", "0x18", false, false, gg.TYPE_DWORD)
gg.getResults(100)
local t = gg.getResults(100)
for i, v in ipairs(t) do
	if v.flags == gg.TYPE_DWORD then
		v.value = "35000"
		v.freeze = true
	end
end
gg.addListItems(t)
t = nil
gg.clearResults()
end

menu5 = function()
valueFromClass("T_Money", "0x18", false, false, gg.TYPE_DWORD)
gg.getResults(100)
local t = gg.getResults(100)
for i, v in ipairs(t) do
	if v.flags == gg.TYPE_DWORD then
		v.value = "100000"
		v.freeze = true
	end
end
gg.addListItems(t)
t = nil
gg.clearResults()
end

menu6 = function()
valueFromClass("T_Money", "0x18", false, false, gg.TYPE_DWORD)
gg.getResults(100)
local t = gg.getResults(100)
for i, v in ipairs(t) do
	if v.flags == gg.TYPE_DWORD then
		v.value = "500000"
		v.freeze = true
	end
end
gg.addListItems(t)
t = nil
gg.clearResults()
end

menu7 = function()
valueFromClass("T_Money", "0x18", false, false, gg.TYPE_DWORD)
gg.getResults(100)
local t = gg.getResults(100)
for i, v in ipairs(t) do
	if v.flags == gg.TYPE_DWORD then
		v.value = "550000"
		v.freeze = true
	end
end
gg.addListItems(t)
t = nil
gg.clearResults()
end

menu8 = function()
valueFromClass("T_Money", "0x18", false, false, gg.TYPE_DWORD)
gg.getResults(100)
local t = gg.getResults(100)
for i, v in ipairs(t) do
	if v.flags == gg.TYPE_DWORD then
		v.value = "150000"
		v.freeze = true
	end
end
gg.addListItems(t)
t = nil
gg.clearResults()
end

menu9 = function()
valueFromClass("T_Money", "0x18", false, false, gg.TYPE_DWORD)
gg.getResults(100)
local t = gg.getResults(100)
for i, v in ipairs(t) do
	if v.flags == gg.TYPE_DWORD then
		v.value = "300000"
		v.freeze = true
	end
end
gg.addListItems(t)
t = nil
gg.clearResults()
end

menu10 = function()
valueFromClass("T_Money", "0x18", false, false, gg.TYPE_DWORD)
gg.getResults(100)
local t = gg.getResults(100)
for i, v in ipairs(t) do
	if v.flags == gg.TYPE_DWORD then
		v.value = "450000"
		v.freeze = true
	end
end
gg.addListItems(t)
t = nil
gg.clearResults()
end

menu11 = function()
gg.clearResults()
gg.clearList()
gg.setVisible(false)
gg.setRanges(gg.REGION_CODE_APP)
gg.searchNumber("4,647,714,816,516,318,822", gg.TYPE_QWORD,false, gg.SIGN_EQUAL, 0, -8, 0)
gg.getResults(100) 
gg.editAll("0", gg.TYPE_QWORD,false, gg.SIGN_EQUAL, 0, -8, 0)
gg.clearResults()
gg.toast("ᴀᴄᴛɪᴠᴀᴛᴇᴅ")
end

menu12= function()
valueFromClass("T_Money", "0x18", false, false, gg.TYPE_DWORD)
gg.getResults(100)
local t = gg.getResults(100)
for i, v in ipairs(t) do
	if v.flags == gg.TYPE_DWORD then
		v.value = "100000"
		v.freeze = true
	end
end
gg.addListItems(t)
t = nil
gg.clearResults()
end

menu13 = function()
gg.clearResults()
gg.clearList()
gg.setVisible(false)
gg.setRanges(gg.REGION_CODE_APP)
gg.searchNumber("4,647,714,816,516,318,822", gg.TYPE_QWORD,false, gg.SIGN_EQUAL, 0, -8, 0)
gg.getResults(100) 
gg.editAll("0", gg.TYPE_QWORD,false, gg.SIGN_EQUAL, 0, -8, 0)
gg.clearResults()
gg.toast("ᴀᴄᴛɪᴠᴀᴛᴇᴅ")
end

menu14 = function()
valueFromClass("T_Money", "0x18", false, false, gg.TYPE_DWORD)
gg.getResults(100)
local t = gg.getResults(100)
for i, v in ipairs(t) do
	if v.flags == gg.TYPE_DWORD then
		v.value = "90000"
		v.freeze = true
	end
end
gg.addListItems(t)
t = nil
gg.clearResults()
end

menu15 = function()
valueFromClass("T_Money", "0x18", false, false, gg.TYPE_DWORD)
gg.getResults(100)
local t = gg.getResults(100)
for i, v in ipairs(t) do
	if v.flags == gg.TYPE_DWORD then
		v.value = "1100000"
		v.freeze = true
	end
end
gg.addListItems(t)
t = nil
gg.clearResults()
end

menu16 = function()
valueFromClass("T_Money", "0x18", false, false, gg.TYPE_DWORD)
gg.getResults(100)
local t = gg.getResults(100)
for i, v in ipairs(t) do
	if v.flags == gg.TYPE_DWORD then
		v.value = "80000"
		v.freeze = true
	end
end
gg.addListItems(t)
t = nil
gg.clearResults()
end

menu17 = function()
valueFromClass("T_Money", "0x18", false, false, gg.TYPE_DWORD)
gg.getResults(100)
local t = gg.getResults(100)
for i, v in ipairs(t) do
	if v.flags == gg.TYPE_DWORD then
		v.value = "1000000"
		v.freeze = true
	end
end
gg.addListItems(t)
t = nil
gg.clearResults()
end

menu18 = function()
valueFromClass("T_Money", "0x18", false, false, gg.TYPE_DWORD)
gg.getResults(100)
local t = gg.getResults(100)
for i, v in ipairs(t) do
	if v.flags == gg.TYPE_DWORD then
		v.value = "3000000"
		v.freeze = true
	end
end
gg.addListItems(t)
t = nil
gg.clearResults()
end

menu19 = function()
gg.clearResults()
gg.clearList()
gg.setVisible(false)
gg.setRanges(gg.REGION_CODE_APP)
gg.searchNumber("4,647,714,816,516,318,822", gg.TYPE_QWORD,false, gg.SIGN_EQUAL, 0, -8, 0)
gg.getResults(100) 
gg.editAll("0", gg.TYPE_QWORD,false, gg.SIGN_EQUAL, 0, -8, 0)
gg.clearResults()
gg.toast("ᴀᴄᴛɪᴠᴀᴛᴇᴅ")
end

menu20 = function()
valueFromClass("T_Money", "0x18", false, false, gg.TYPE_DWORD)
gg.getResults(100)
local t = gg.getResults(100)
for i, v in ipairs(t) do
	if v.flags == gg.TYPE_DWORD then
		v.value = "500000"
		v.freeze = true
	end
end
gg.addListItems(t)
t = nil
gg.clearResults()
end

menu21 = function()
valueFromClass("T_Money", "0x18", false, false, gg.TYPE_DWORD)
gg.getResults(100)
local t = gg.getResults(100)
for i, v in ipairs(t) do
	if v.flags == gg.TYPE_DWORD then
		v.value = "200000"
		v.freeze = true
	end
end
gg.addListItems(t)
t = nil
gg.clearResults()
end

menu22 = function()
valueFromClass("T_Money", "0x18", false, false, gg.TYPE_DWORD)
gg.getResults(100)
local t = gg.getResults(100)
for i, v in ipairs(t) do
	if v.flags == gg.TYPE_DWORD then
		v.value = "950000"
		v.freeze = true
	end
end
gg.addListItems(t)
t = nil
gg.clearResults()
end

menu23 = function()
valueFromClass("T_Money", "0x18", false, false, gg.TYPE_DWORD)
gg.getResults(100)
local t = gg.getResults(100)
for i, v in ipairs(t) do
	if v.flags == gg.TYPE_DWORD then
		v.value = "5000000"
		v.freeze = true
	end
end
gg.addListItems(t)
t = nil
gg.clearResults()
end

menu24 = function()
valueFromClass("T_Money", "0x18", false, false, gg.TYPE_DWORD)
gg.getResults(100)
local t = gg.getResults(100)
for i, v in ipairs(t) do
	if v.flags == gg.TYPE_DWORD then
		v.value = "5000000"
		v.freeze = true
	end
end
gg.addListItems(t)
t = nil
gg.clearResults()
end

menu25 = function()
valueFromClass("T_Money", "0x18", false, false, gg.TYPE_DWORD)
gg.getResults(100)
local t = gg.getResults(100)
for i, v in ipairs(t) do
	if v.flags == gg.TYPE_DWORD then
		v.value = "30000000"
		v.freeze = true
	end
end
gg.addListItems(t)
t = nil
gg.clearResults()
end

menu26 = function()
valueFromClass("T_Money", "0x18", false, false, gg.TYPE_DWORD)
gg.getResults(100)
local t = gg.getResults(100)
for i, v in ipairs(t) do
	if v.flags == gg.TYPE_DWORD then
		v.value = "1500000"
		v.freeze = true
	end
end
gg.addListItems(t)
t = nil
gg.clearResults()
end



hc1= function() 
_G ["gg"]["alert"]("Cilik Logo Game Gurdian")
    repeat
         repeat until gg.isVisible()
         gg.setVisible(false)
local mnb = gg.choice({
"ᴢɪʟʟ-130 ", --1
"ᴍᴀɴ-ᴛɢ", --2
"ᴘᴇᴛᴇʀʙɪʟᴛ", --3
"ᴍ-3", --4
"ᴋᴀᴍᴀᴢ", --5
"ᴢɪʟʟ-130 ʀᴀᴄɪɴɢ", --6
"ᴜɴɪᴍᴏɢ",  --7
"ᴍᴀɴ-ᴋᴀᴛ 1", --8
"ᴜʀᴀʟ-4320",  --9
"ᴋʀᴀᴢᴢ-255", --10
"ᴄᴏᴍɪɴɢ sᴏᴏɴ", --11
"ᴢɪʟʟ-131", --12
"ᴄᴏᴍɪɴɢ sᴏᴏɴ",  --13
"ᴢɪʟʟ-157", --14
"ᴏsʜᴋᴏsᴛ", --15
"ɢᴀᴢ-666", --16
"ᴋ-700", --17
"ᴍᴀᴢᴢ-537",
"ᴄᴏᴍɪɴɢ sᴏᴏɴ",
"ɢᴀᴢ-3303",
"ɢᴀᴢ-31",
"ᴘʀᴀɢᴀ-ᴠ3s",
"ᴢᴇᴛʀᴏs",
"ᴜʀᴀʟ ɴᴇxᴛ",
"ᴠʟ-80",
"ᴋʀᴀᴢᴢ-260",
"Back Script",
         }, lastSelected,os.date("• DATE : %A %d %B %Y\n• TIME : %H:%M:%S %p\n═══════════════════════\n|| Game : "..gg.getTargetInfo()["label"] .. " [".. gg.getTargetInfo()["versionName"] .."]\n|| Package : "..gg.getTargetInfo()["packageName"].."\n|| Credit : Xyroo_Vinaa!!\n═══════════════════════"))
    
      if mnb == nil then 
         Nil()
     else
           lastSelected = mnb
      end
      if mnb == 1 then menu1() end
      if mnb == 2 then menu2() end
      if mnb == 3 then menu3() end
      if mnb == 4 then menu4() end
      if mnb == 5 then menu5() end
      if mnb == 6 then menu6() end 
      if mnb == 7 then menu7() end 
      if mnb == 8 then menu8() end
      if mnb == 9 then menu9() end
      if mnb == 10 then menu10() end
      if mnb == 11 then menu11() end
      if mnb == 12 then menu12() end
      if mnb == 13 then menu13() end
      if mnb == 14 then menu14() end
      if mnb == 15 then menu15() end
      if mnb == 16 then menu16() end
      if mnb == 17 then menu17() end
      if mnb == 18 then menu18() end
      if mnb == 19 then menu19() end
      if mnb == 20 then menu20() end
      if mnb == 21 then menu21() end
      if mnb == 22 then menu22() end
      if mnb == 23 then menu23() end
      if mnb == 24 then menu24() end
      if mnb == 25 then menu25() end
      if mnb == 26 then menu26() end
      if mnb == 27 then return end
    until nil
end


mn1 = function()
gg.processResume()
gg.getResults(100)
local t = gg.getResults(100)
for i, v in ipairs(t) do
	if v.flags == gg.TYPE_DWORD then
		v.value = "0"
		v.freeze = true
	end
end
gg.addListItems(t)
t = nil
gg.processResume()
gg.toast("Done")
end

mn2 = function()
gg.processResume()
gg.getResults(100)
local t = gg.getResults(100)
for i, v in ipairs(t) do
	if v.flags == gg.TYPE_DWORD then
		v.value = "20000"
		v.freeze = true
	end
end
gg.addListItems(t)
t = nil
gg.processResume()
gg.toast("Done")
end

mn3 = function()
gg.processResume()
gg.getResults(100)
local t = gg.getResults(100)
for i, v in ipairs(t) do
	if v.flags == gg.TYPE_DWORD then
		v.value = "50000"
		v.freeze = true
	end
end
gg.addListItems(t)
t = nil
gg.processResume()
gg.toast("Done")
end

mn4 = function()
gg.processResume()
gg.getResults(100)
local t = gg.getResults(100)
for i, v in ipairs(t) do
	if v.flags == gg.TYPE_DWORD then
		v.value = "35000"
		v.freeze = true
	end
end
gg.addListItems(t)
t = nil
gg.processResume()
gg.toast("Done")
end

mn5 = function()
gg.processResume()
gg.getResults(100)
local t = gg.getResults(100)
for i, v in ipairs(t) do
	if v.flags == gg.TYPE_DWORD then
		v.value = "100000"
		v.freeze = true
	end
end
gg.addListItems(t)
t = nil
gg.processResume()
gg.toast("Done")
end

mn6 = function()
gg.processResume()
gg.getResults(100)
local t = gg.getResults(100)
for i, v in ipairs(t) do
	if v.flags == gg.TYPE_DWORD then
		v.value = "500000"
		v.freeze = true
	end
end
gg.addListItems(t)
t = nil
gg.processResume()
gg.toast("Done")
end

mn7 = function()
gg.processResume()
gg.getResults(100)
local t = gg.getResults(100)
for i, v in ipairs(t) do
	if v.flags == gg.TYPE_DWORD then
		v.value = "550000"
		v.freeze = true
	end
end
gg.addListItems(t)
t = nil
gg.processResume()
gg.toast("Done")
end

mn8 = function()
gg.processResume()
gg.getResults(100)
local t = gg.getResults(100)
for i, v in ipairs(t) do
	if v.flags == gg.TYPE_DWORD then
		v.value = "150000"
		v.freeze = true
	end
end
gg.addListItems(t)
t = nil
gg.processResume()
gg.toast("Done")
end

mn9 = function()
gg.processResume()
gg.getResults(100)
local t = gg.getResults(100)
for i, v in ipairs(t) do
	if v.flags == gg.TYPE_DWORD then
		v.value = "300000"
		v.freeze = true
	end
end
gg.addListItems(t)
t = nil
gg.processResume()
gg.toast("Done")
end

mn10 = function()
gg.processResume()
gg.getResults(100)
local t = gg.getResults(100)
for i, v in ipairs(t) do
	if v.flags == gg.TYPE_DWORD then
		v.value = "450000"
		v.freeze = true
	end
end
gg.addListItems(t)
t = nil
gg.processResume()
gg.toast("Done")
end

mn11 = function()
gg.processResume()
gg.clearResults()
gg.clearList()
gg.setVisible(false)
gg.setRanges(gg.REGION_CODE_APP)
gg.searchNumber("4,647,714,816,516,318,822", gg.TYPE_QWORD,false, gg.SIGN_EQUAL, 0, -8, 0)
gg.getResults(100) 
gg.editAll("0", gg.TYPE_QWORD,false, gg.SIGN_EQUAL, 0, -8, 0)
gg.clearResults()
gg.toast("ᴀᴄᴛɪᴠᴀᴛᴇᴅ")
end

mn12 = function()
gg.processResume()
gg.getResults(100)
local t = gg.getResults(100)
for i, v in ipairs(t) do
	if v.flags == gg.TYPE_DWORD then
		v.value = "100000"
		v.freeze = true
	end
end
gg.addListItems(t)
t = nil
gg.processResume()
gg.toast("Done")
end

mn13 = function()
gg.processResume()
gg.clearResults()
gg.clearList()
gg.setVisible(false)
gg.setRanges(gg.REGION_CODE_APP)
gg.searchNumber("4,647,714,816,516,318,822", gg.TYPE_QWORD,false, gg.SIGN_EQUAL, 0, -8, 0)
gg.getResults(100) 
gg.editAll("0", gg.TYPE_QWORD,false, gg.SIGN_EQUAL, 0, -8, 0)
gg.clearResults()
gg.toast("ᴀᴄᴛɪᴠᴀᴛᴇᴅ")
end

mn14 = function()
gg.processResume()
gg.getResults(100)
local t = gg.getResults(100)
for i, v in ipairs(t) do
	if v.flags == gg.TYPE_DWORD then
		v.value = "90000"
		v.freeze = true
	end
end
gg.addListItems(t)
t = nil
gg.processResume()
gg.toast("Done")
end

mn15 = function()
gg.processResume()
gg.getResults(100)
local t = gg.getResults(100)
for i, v in ipairs(t) do
	if v.flags == gg.TYPE_DWORD then
		v.value = "1100000"
		v.freeze = true
	end
end
gg.addListItems(t)
t = nil
gg.processResume()
gg.toast("Done")
end

mn16 = function()
gg.processResume()
gg.getResults(100)
local t = gg.getResults(100)
for i, v in ipairs(t) do
	if v.flags == gg.TYPE_DWORD then
		v.value = "80000"
		v.freeze = true
	end
end
gg.addListItems(t)
t = nil
gg.processResume()
gg.toast("Done")
end

mn17 = function()
gg.processResume()
gg.getResults(100)
local t = gg.getResults(100)
for i, v in ipairs(t) do
	if v.flags == gg.TYPE_DWORD then
		v.value = "1000000"
		v.freeze = true
        v.freezeType = gg.FREEZE_NORMAL
	end
end
gg.addListItems(t)
t = nil
gg.processResume()
gg.toast("Done")
end

mn18 = function()
gg.processResume()
gg.getResults(100)
local t = gg.getResults(100)
for i, v in ipairs(t) do
	if v.flags == gg.TYPE_DWORD then
		v.value = "3000000"
		v.freeze = true
	end
end
gg.addListItems(t)
t = nil
gg.processResume()
gg.toast("Done")
end

mn19 = function()
gg.processResume()
gg.clearResults()
gg.clearList()
gg.setVisible(false)
gg.setRanges(gg.REGION_CODE_APP)
gg.searchNumber("4,647,714,816,516,318,822", gg.TYPE_QWORD,false, gg.SIGN_EQUAL, 0, -8, 0)
gg.getResults(100) 
gg.editAll("0", gg.TYPE_QWORD,false, gg.SIGN_EQUAL, 0, -8, 0)
gg.clearResults()
gg.toast("ᴀᴄᴛɪᴠᴀᴛᴇᴅ")
end

mn20 = function()
gg.processResume()
gg.getResults(100)
local t = gg.getResults(100)
for i, v in ipairs(t) do
	if v.flags == gg.TYPE_DWORD then
		v.value = "500000"
		v.freeze = true
	end
end
gg.addListItems(t)
t = nil
gg.processResume()
gg.toast("Done")
end

mn21 = function()
gg.processResume()
gg.getResults(100)
local t = gg.getResults(100)
for i, v in ipairs(t) do
	if v.flags == gg.TYPE_DWORD then
		v.value = "200000"
		v.freeze = true
	end
end
gg.addListItems(t)
t = nil
gg.clearResults()
end

mn22 = function()
gg.processResume()
gg.getResults(100)
local t = gg.getResults(100)
for i, v in ipairs(t) do
	if v.flags == gg.TYPE_DWORD then
		v.value = "950000"
		v.freeze = true
	end
end
gg.addListItems(t)
t = nil
gg.processResume()
gg.toast("Done")
end

mn23 = function()
gg.processResume()
gg.getResults(100)
local t = gg.getResults(100)
for i, v in ipairs(t) do
	if v.flags == gg.TYPE_DWORD then
		v.value = "5000000"
		v.freeze = true
	end
end
gg.addListItems(t)
t = nil
gg.processResume()
gg.toast("Done")
end

mn24 = function()
gg.processResume()
gg.getResults(100)
local t = gg.getResults(100)
for i, v in ipairs(t) do
	if v.flags == gg.TYPE_DWORD then
		v.value = "5000000"
		v.freeze = true
	end
end
gg.addListItems(t)
t = nil
gg.processResume()
gg.toast("Done")
end

mn25 = function()
gg.processResume()
gg.getResults(100)
local t = gg.getResults(100)
for i, v in ipairs(t) do
	if v.flags == gg.TYPE_DWORD then
		v.value = "30000000"
		v.freeze = true
	end
end
gg.addListItems(t)
t = nil
gg.processResume()
gg.toast("Done")
end

mn26 = function()
gg.processResume()
gg.getResults(100)
local t = gg.getResults(100)
for i, v in ipairs(t) do
	if v.flags == gg.TYPE_DWORD then
		v.value = "1500000"
		v.freeze = true
	end
end
gg.addListItems(t)
t = nil
gg.processResume()
gg.toast("Done")
end





--32bit
hc2 = function()
local d = gg.prompt({
    "Script Beta Tester",
   "ʙᴀᴄᴋ"
  },nil,{"number","checkbox"})
  if not d then
    return
  end--Iғ
  if d == nil then
    local lastSelected = 0
  end--Iғ
  gg.processResume()
  gg.setVisible(false)
  if d[2] then
    return gg.setVisible(true)
  end--Iғ
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("1065353216D;1D;"..d[1].."D:29", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.processResume()
gg.refineNumber("1065353216D;1D;"..d[1]..";D:29", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
local results = gg.getResults(1000)
--Debugging: Periksa apakah hasilnya ditemukan
if #results == 0 then
_ENV ["gg"]["alert"]("Value Not Found!!\nValue Tidak Ditemukan!!")
    return
end
gg.processResume()
      _G ["gg"]["alert"]("Cilik Logo Game Gurdian")
    repeat
         repeat until gg.isVisible()
         gg.setVisible(false)
local mnb = gg.choice({
"ᴢɪʟʟ-130 ", --1
"ᴍᴀɴ-ᴛɢ", --2
"ᴘᴇᴛᴇʀʙɪʟᴛ", --3
"ᴍ-3", --4
"ᴋᴀᴍᴀᴢ", --5
"ᴢɪʟʟ-130 ʀᴀᴄɪɴɢ", --6
"ᴜɴɪᴍᴏɢ",  --7
"ᴍᴀɴ-ᴋᴀᴛ 1", --8
"ᴜʀᴀʟ-4320",  --9
"ᴋʀᴀᴢᴢ-255", --10
"ᴄᴏᴍɪɴɢ sᴏᴏɴ", --11
"ᴢɪʟʟ-131", --12
"ᴄᴏᴍɪɴɢ sᴏᴏɴ",  --13
"ᴢɪʟʟ-157", --14
"ᴏsʜᴋᴏsᴛ", --15
"ɢᴀᴢ-666", --16
"ᴋ-700", --17
"ᴍᴀᴢᴢ-537",--18
"ᴄᴏᴍɪɴɢ sᴏᴏɴ", --19
"ɢᴀᴢ-3303", --20
"ɢᴀᴢ-31", --21
"ᴘʀᴀɢᴀ-ᴠ3s", --22
"ᴢᴇᴛʀᴏs",
"ᴜʀᴀʟ ɴᴇxᴛ",
"ᴠʟ-80",
"ᴋʀᴀᴢᴢ-260",
"Back Script",
         }, lastSelected,os.date("• DATE : %A %d %B %Y\n• TIME : %H:%M:%S %p\n═══════════════════════\n|| Game : "..gg.getTargetInfo()["label"] .. " [".. gg.getTargetInfo()["versionName"] .."]\n|| Package : "..gg.getTargetInfo()["packageName"].."\n|| Credit : Xyroo_Vinaa!!\n═══════════════════════"))
    
      if mnb == nil then 
         Nil()
     else
           lastSelected = mnb
      end
      if mnb == 1 then mn1() end
      if mnb == 2 then mn2() end
      if mnb == 3 then mn3() end
      if mnb == 4 then mn4() end
      if mnb == 5 then mn5() end
      if mnb == 6 then mn6() end 
      if mnb == 7 then mn7() end 
      if mnb == 8 then mn8() end
      if mnb == 9 then mn9() end
      if mnb == 10 then mn10() end
      if mnb == 11 then mn11() end
      if mnb == 12 then mn12() end
      if mnb == 13 then mn13() end
      if mnb == 14 then mn14() end
      if mnb == 15 then mn15() end
      if mnb == 16 then mn16() end
      if mnb == 17 then mn17() end
      if mnb == 18 then mn18() end
      if mnb == 19 then mn19() end
      if mnb == 20 then mn20() end
      if mnb == 21 then mn21() end
      if mnb == 22 then mn22() end
      if mnb == 23 then mn23() end
      if mnb == 24 then mn24() end
      if mnb == 25 then mn25() end
      if mnb == 26 then mn26() end
      if mnb == 27 then return end
    until nil
end




Lobby1 = function()
_G ["gg"]["alert"]("Cilik Logo Game Gurdian")
_G ["gg"]["setVisible"](false)
_G ["gg"]["clearResults"]()
_G ["gg"]["clearList"]()
repeat
    repeat until gg.isVisible()
    gg.setVisible(false)
    local mnu = gg.choice({
        "ᴜɴʟᴏᴄᴋ ᴛʀᴜᴄᴋ ꜰᴏʀ 𝟨𝟦ʙɪᴛ ᴍᴇɴᴜ",--1
        "ᴜɴʟᴏᴄᴋ ᴛʀᴜᴄᴋ ꜰᴏʀ 𝟥𝟤ʙɪᴛ ᴍᴇɴᴜ",--2
        "Exit"--3
    }, lastSelected,os.date("• DATE : %A %d %B %Y\n• TIME : %H:%M:%S %p\n═══════════════════════\n|| Game : "..gg.getTargetInfo()["label"] .. " [".. gg.getTargetInfo()["versionName"] .."]\n|| Package : "..gg.getTargetInfo()["packageName"].."\n|| Credit : Xyroo_Vinaa!!\n═══════════════════════\n|| Tutorials For Menu 32bits : You must have RT if you want to use the 32bit unlock truck"))
    
    if mnu == nil then 
    else
        lastSelected = mnu
    end
    if mnu == 1 then hc1() end
    if mnu == 2 then hc2() end
    if mnu == 3 then
    break
  end
until nil
 end




Room2 = function()
local vinaa = gg.choice({
	"ʏᴇʟʟᴏᴡ",
	"ғᴜᴄʜsɪᴀ  ",
	"ʙʀᴏᴡɴ  ",
	"ᴘᴜʀᴘʟᴇ  ",
	"ᴏʀᴀɴɢᴇ ",
	"ʀᴇᴅ ",
	"ɢʀᴇᴇɴ ",
	"ᴡʜɪᴛᴇ ",
	"ɴᴀᴠʏ  ",
	"ᴀǫᴜᴀ ",
	"ʙᴀᴄᴋ Script"
}, 0, os.date("• DATE : %A %d %B %Y\n• TIME : %H:%M:%S %p\n═══════════════════════\n|| Game : "..gg.getTargetInfo()["label"] .. " [".. gg.getTargetInfo()["versionName"] .."]\n|| Package : "..gg.getTargetInfo()["packageName"].."\n|| Credit : Hyroo_Vinaa!!\n═══════════════════════"))
gg.toast('This is Hyroo')
if vinaa == nil then
goto Vinaa
end

if vinaa == 1 then
local v = gg.prompt({
    "Onwer : Hyroo_Vinaa",
    "ঔৣ͜͡➳ Text size",
    "ʙᴀᴄᴋ"
  },{"You\tText","100"}, {"text","number","checkbox",})
  if not v then
    return
  end--Iғ
  if v == nil then
    main()
  end--Iғ
  gg.clearResults()
  gg.setVisible(false)
  if v[3] then
    return gg.setVisible(true)
  end--Iғ
_G ["gg"]["setVisible"](false)
_G ["gg"]["copyText"]("<COLOR=YELLOW><SIZE=,"..v[2]..",>,"..v[1]..",</SIZE></COLOR> ")
_G ["gg"]["processResume"]()
_G ["gg"]["toast"]('on')
end


if vinaa == 2 then
local v = gg.prompt({
    "Onwer : Hyroo_Vinaa",
    "ঔৣ͜͡➳ Text size",
    "ʙᴀᴄᴋ"
  },{"You\tText","100"}, {"text","number","checkbox",})
  if not v then
    return
  end--Iғ
  if v == nil then
    main()
  end--Iғ
  gg.clearResults()
  gg.setVisible(false)
  if v[3] then
    return gg.setVisible(true)
  end--Iғ
_G ["gg"]["setVisible"](false)
_G ["gg"]["copyText"]("<COLOR=FUCHSIA><SIZE=,"..v[2]..",>,"..v[1]..",</SIZE></COLOR> ")
_G ["gg"]["processResume"]()
_G ["gg"]["toast"]('on')
end

if vinaa == 3 then
local v = gg.prompt({
    "Onwer : Hyroo_Vinaa",
    "ঔৣ͜͡➳ Text size",
    "ʙᴀᴄᴋ"
  },{"You\tText","100"}, {"text","number","checkbox",})
  if not v then
    return
  end--Iғ
  if v == nil then
    main()
  end--Iғ
  gg.clearResults()
  gg.setVisible(false)
  if v[3] then
    return gg.setVisible(true)
  end--Iғ
_G ["gg"]["setVisible"](false)
_G ["gg"]["copyText"]("<COLOR=BROWN><SIZE=,"..v[2]..",>,"..v[1]..",</SIZE></COLOR> ")
_G ["gg"]["processResume"]()
_G ["gg"]["toast"]('on')
end

if vinaa == 4 then
local v = gg.prompt({
    "Onwer : Hyroo_Vinaa",
    "ঔৣ͜͡➳ Text size",
    "ʙᴀᴄᴋ"
  },{"You\tText","100"}, {"text","number","checkbox",})
  if not v then
    return
  end--Iғ
  if v == nil then
    main()
  end--Iғ
  gg.clearResults()
  gg.setVisible(false)
  if v[3] then
    return gg.setVisible(true)
  end--Iғ
_G ["gg"]["setVisible"](false)
_G ["gg"]["copyText"]("<COLOR=PURPLE><SIZE=,"..v[2]..",>,"..v[1]..",</SIZE></COLOR> ")
_G ["gg"]["processResume"]()
_G ["gg"]["toast"]('on')
end

if vinaa == 5 then
local v = gg.prompt({
    "Onwer : Hyroo_Vinaa",
    "ঔৣ͜͡➳ Text size",
    "ʙᴀᴄᴋ"
  },{"You\tText","100"}, {"text","number","checkbox",})
  if not v then
    return
  end--Iғ
  if v == nil then
    main()
  end--Iғ
  gg.clearResults()
  gg.setVisible(false)
  if v[3] then
    return gg.setVisible(true)
  end--Iғ
_G ["gg"]["setVisible"](false)
_G ["gg"]["copyText"]("<COLOR=ORANGE><SIZE=,"..v[2]..",>,"..v[1]..",</SIZE></COLOR> ")
_G ["gg"]["processResume"]()
_G ["gg"]["toast"]('on')
end

if vinaa == 6 then
local v = gg.prompt({
    "Onwer : Hyroo_Vinaa",
    "ঔৣ͜͡➳ Text size",
    "ʙᴀᴄᴋ"
  },{"You\tText","100"}, {"text","number","checkbox",})
  if not v then
    return
  end--Iғ
  if v == nil then
    main()
  end--Iғ
  gg.clearResults()
  gg.setVisible(false)
  if v[3] then
    return gg.setVisible(true)
  end--Iғ
_G ["gg"]["setVisible"](false)
_G ["gg"]["copyText"]("<COLOR=RED><SIZE=,"..v[2]..",>,"..v[1]..",</SIZE></COLOR> ")
_G ["gg"]["processResume"]()
_G ["gg"]["toast"]('on')
end

if vinaa == 7 then
local v = gg.prompt({
    "Onwer : Hyroo_Vinaa",
    "ঔৣ͜͡➳ Text size",
    "ʙᴀᴄᴋ"
  },{"You\tText","100"}, {"text","number","checkbox",})
  if not v then
    return
  end--Iғ
  if v == nil then
    main()
  end--Iғ
  gg.clearResults()
  gg.setVisible(false)
  if v[3] then
    return gg.setVisible(true)
  end--Iғ
_G ["gg"]["setVisible"](false)
_G ["gg"]["copyText"]("<COLOR=GREEN><SIZE=,"..v[2]..",>,"..v[1]..",</SIZE></COLOR> ")
_G ["gg"]["processResume"]()
_G ["gg"]["toast"]('on')
end

if vinaa == 8 then
local v = gg.prompt({
    "Onwer : Hyroo_Vinaa",
    "ঔৣ͜͡➳ Text size",
    "ʙᴀᴄᴋ"
  },{"You\tText","100"}, {"text","number","checkbox",})
  if not v then
    return
  end--Iғ
  if v == nil then
    main()
  end--Iғ
  gg.clearResults()
  gg.setVisible(false)
  if v[3] then
    return gg.setVisible(true)
  end--Iғ
_G ["gg"]["setVisible"](false)
_G ["gg"]["copyText"]("<COLOR=WHITE><SIZE=,"..v[2]..",>,"..v[1]..",</SIZE></COLOR> ")
_G ["gg"]["processResume"]()
_G ["gg"]["toast"]('on')
end

if vinaa == 9 then
local v = gg.prompt({
    "Onwer : Hyroo_Vinaa",
    "ঔৣ͜͡➳ Text size",
    "ʙᴀᴄᴋ"
},{"You\tText","100"}, {"text","number","checkbox",})
  if not v then
    return
  end--Iғ
  if v == nil then
    main()
  end--Iғ
  gg.clearResults()
  gg.setVisible(false)
  if v[3] then
    return gg.setVisible(true)
  end--Iғ
_G ["gg"]["setVisible"](false)
_G ["gg"]["copyText"]("<COLOR=NAVY><SIZE=,"..v[2]..",>,"..v[1]..",</SIZE></COLOR> ")
_G ["gg"]["processResume"]()
_G ["gg"]["toast"]('on')
end

if vinaa == 10 then
local v = gg.prompt({
    "Onwer : Hyroo_Vinaa",
    "ঔৣ͜͡➳ Text size",
    "ʙᴀᴄᴋ"
  },{"You\tText","100"}, {"text","number","checkbox",})
  if not v then
    return
  end--Iғ
  if v == nil then
    main()
  end--Iғ
  gg.clearResults()
  gg.setVisible(false)
  if v[3] then
    return gg.setVisible(true)
  end--Iғ
_G ["gg"]["setVisible"](false)
_G ["gg"]["copyText"]("<COLOR=AQUA><SIZE=,"..v[2]..",>,"..v[1]..",</SIZE></COLOR> ")
_G ["gg"]["processResume"]()
_G ["gg"]["toast"]('on')
end


if vinaa == 11 then 
MAIN()
end
         ::Vinaa::
         end

gg.setVisible(false)
Lobby2 = function()            
     gg.setVisible(false)                 
local bmenu = gg.multiChoice({
"ʟᴇᴠᴇʟ ᴜᴘ v1\nɪɴʟᴏʙʙʏ-ɪɴɢᴀᴍᴇ",
"ᴍᴀɴᴜᴀʟ ʟᴇᴠᴇʟ ᴜᴘ v2\nɪɴʟᴏʙʙʏ-ɪɴɢᴀᴍᴇ",
"ʙᴀᴄᴋ ᴍᴇɴᴜ"
}, nil, os.date("• DATE : %A %d %B %Y\n• TIME : %H:%M:%S %p\n═══════════════════════\n|| Game : "..gg.getTargetInfo()["label"] .. " [".. gg.getTargetInfo()["versionName"] .."]\n|| Package : "..gg.getTargetInfo()["packageName"].."\n|| Credit : Xyroo_Vinaa!!\n\n|| tutorials | "..BATAS.."\n═══════════════════════"))
if bmenu == nil then
goto nill
end
if bmenu[1] then
levelup_1()
end
if bmenu[2] then
levelup_2()
end
if bmenu[3] then
MAIN()
end
::nill::
end

levelup_1 = function()
local V = gg.alert("[🇬🇧] If you have pressed OK, just press the ad on the left side which is yellow\n\n[🇮🇩] Jika sudah pencet OK, langsung saja pencet iklan sebelah kiri yang berwarna kuning","Ok","No")
if V == 1 then 
valueFromClass("LvLManager", "0x34", false, false, gg.TYPE_DWORD)
gg.getResults(100)
gg.editAll(0, gg.TYPE_DWORD)
gg.clearResults()
elseif V == 2 then
MAIN()
end
end

levelup_2 = function()
local V = gg.alert("If you want to run, just press Yes","Yes","No")
    if V == 1 then
_ENV ["gg"]["clearResults"]()
local d = gg.prompt({
    "ঔৣ͜͡➳ ᴏɴᴡᴇʀ • ʜʏʀᴏᴏ\nঔৣ͜͡➳ tᴜʟɪꜱ ꜱᴇꜱᴜᴀɪ ᴅᴇɴɢᴀɴ ᴇxᴘ ʏᴀɴɢ ᴅɪ ꜱᴀᴍᴘɪɴɢ ᴋᴀɴᴀɴ ᴀɴᴅᴀ\n⚠️ ʙᴀᴛᴀꜱ ʜᴀɴʏᴀ 3/4 ʟᴇᴠᴇʟ ⚠️ ",
   "ʙᴀᴄᴋ"
  }, nil,{"number","checkbox"})
  if not d then
    return
  end--Iғ
  if d == nil then
    MAIN()
  end--Iғ
  gg.processResume()
  gg.setVisible(false)
  if d[2] then
    return gg.setVisible(true)
  end--Iғ
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber(d[1].."D;7.00649232e-42F:5" , gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.processResume()
gg.refineNumber(d[1].."",gg.TYPE_DWORD)
local results = gg.getResults(1000)
--Debugging: Periksa apakah hasilnya ditemukan
if #results == 0 then
_ENV ["gg"]["alert"]("Value Not Found!!\nValue Tidak Ditemukan!!")
    return
end
gg.processResume()
gg.alert("Tekan Saja Iklan Yang Di Samping Kiri Dan\nBuka Game Guardian Saat Iklan Dan Ketika/Tulis EXP Yang Kanan")
while true do
    if isVis() == true then
      showmenu=true
      setVis(false)
    end
    if showmenu==true then
      showmenu=false
      gg.processResume()
local d = gg.prompt({
    "ঔৣ͜͡➳ ᴏɴᴡᴇʀ • ʜʏʀᴏᴏ\n ঔৣ͜͡➳ ᴛᴜʟɪꜱ ꜱᴇꜱᴜᴀɪ ᴅᴇɴɢᴀɴ ᴇxᴘ ʏᴀɴɢ ᴅɪ ꜱᴀᴍᴘɪɴɢ ᴋᴀɴᴀɴ ᴀɴᴅᴀ\n⚠️ ʙᴀᴛᴀꜱ ʜᴀɴʏᴀ 3/4 ʟᴇᴠᴇʟ ⚠️ ",
    "ʙᴀᴄᴋ"
  }, nil, {"number", "checkbox"})
  if not d then
    return
  end--Iғ
  if d == nil then
   MAIN()
  end--Iғ
  gg.processResume()
  gg.setVisible(false)
  if d[2] then
    return gg.setVisible(true)
  end--Iғ
gg.setRanges(gg.REGION_ANONYMOUS)
gg.editAll(d[1].."" , gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.alert("You Exp " ..d[1].."")
gg.copyText(""..d[1].."")
gg.processResume()
elseif V == 2 then
MAIN()
end end end end



Misterius = 2
function valueFromClass(class, offset, tryHard, bit32, valueType)
Get_user_input = {}
Get_user_input[1] = class
Get_user_input[2] = offset
Get_user_input[3] = tryHard
Get_user_input[4] = bit32
Get_user_type = valueType
start()
end

function loopCheck()
if Misterius == 1 then
UI()
elseif error == 3 then
return os.exit()
end
end

function found_(message)
if error == 1 then
found2(message)
elseif error == 2 then
found3(message)
elseif error == 3 then
found4(message)
else
found(message)
end
end

function found(message)
if count == 0 then
gg.clearResults()
gg.clearList()
first_error = message
error = 1
second_start()
end
end

function found2(message)
if count == 0 then
gg.clearResults()
gg.clearList()
second_error = message
error = 2
third_start()
end
end

function found3(message)
if count == 0 then
gg.clearResults()
gg.clearList()
third_error = message
error = 3
fourth_start()
end
end

function found4(message)
if count == 0 then
gg.clearResults()
gg.clearList()
gg.alert("ℹ️ ᴇʀʀᴏʀ : ᴛʀʏ ᴀɢᴀɪɴ ℹ️","")
gg.setVisible(false)
loopCheck()
end
end

function user_input_taker()
::stort::
gg.clearResults()
if Misterius == 1 then
if Get_user_input == nil then
default1 = ""
default2 = ""
default3 = false
default4 = false
else
default1 =Get_user_input[1]
default2 = Get_user_input[2]
default3 = Get_user_input[3]
default4 = Get_user_input[4]
end
Get_user_input = gg.prompt(
{"🔰 sᴄʀɪᴘᴛ ʙʏ ?? : https://www.youtube.com/@Rthdhack\n\nᴄʟᴀss ɴᴀᴍᴇ : ", "ᴏғғsᴇᴛ :","𝐓𝐫𝐲 𝐇𝐚𝐫𝐝𝐞𝐫 --(𝐃𝐞𝐜𝐫??𝐚𝐬𝐞𝐬 𝐀𝐜𝐜𝐮𝐫𝐚𝐜??)","𝐓𝐫𝐲 𝐅𝐨𝐫 𝟑𝟐 𝐁𝐢𝐭"},
{default1,default2,default3,default4},
{"text","text","checkbox","checkbox"})
if Get_user_input ~= nil then
if (Get_user_input[1] == "") or (Get_user_input[2] == "") then
gg.alert("ℹ️ ᴅᴏɴ'ᴛ ʟᴇᴀᴠᴇ ɪɴᴘᴜᴛ ʙʟᴀɴᴋ ℹ️")
goto stort
end
else
gg.alert("ℹ️ ᴇʀʀᴏʀ : ᴛʀʏ ᴀɢᴀɪɴ ℹ️","")
goto stort
end
Get_user_type = gg.choice({"1. 𝐁𝐲𝐭𝐞 / 𝐁𝐨𝐨𝐥𝐞𝐚𝐧","2. ??𝐰𝐨𝐫𝐝 / 𝟑𝟐 𝐛𝐢𝐭 𝐈𝐧𝐭","3. 𝐐𝐰𝐨𝐫𝐝 / 𝟔𝟒 𝐛𝐢𝐭 𝐈𝐧𝐭","4. ??𝐥𝐨𝐚𝐭","5. 𝐃𝐨𝐮𝐛𝐥𝐞"},nil,"🔰 sᴄʀɪᴘᴛ ʙʏ 🔰 : https://www.youtube.com/@Rthdhack\n\nℹ️ ᴄʜᴏᴏsᴇ ᴛʜᴇ ᴏᴜᴛᴘᴜᴛ ᴛʏᴘᴇ ℹ️")
if Get_user_type == 1 then
Get_user_type = gg.TYPE_BYTE
elseif Get_user_type == 2 then
Get_user_type = gg.TYPE_DWORD
elseif Get_user_type == 3 then
Get_user_type = gg.TYPE_QWORD
elseif Get_user_type == 4 then
Get_user_type = gg.TYPE_FLOAT
elseif Get_user_type == 5 then
Get_user_type = gg.TYPE_DOUBLE
end
if Get_user_type ~= gg.TYPE_BYTE then
if (Get_user_input[2] % 4) ~= 0 then
gg.alert("ℹ️ ʜᴇx ᴏғғsᴇᴛ ᴍᴜsᴛ ʙᴇ ᴀɴ ᴍᴜʟᴛɪᴘʟᴇ ᴏғ 4 ℹ️")
goto stort
end
end
end
error = 0 
end

function O_initial_search()
gg.setVisible(false)
gg.toast("🟢🔴🔴🔴")
user_input = ":"..Get_user_input[1] 
if Get_user_input[3] then
offst = 25
else
offst = 0
end
end

function O_dinitial_search()
if error > 1 then
gg.setRanges(gg.REGION_C_ALLOC)
else
gg.setRanges(gg.REGION_OTHER)
end
gg.searchNumber(user_input, gg.TYPE_BYTE)
count = gg.getResultsCount()
if count == 0 then
found_("O_dinitial_search")
return 0
end
Refiner = gg.getResults(1)
gg.refineNumber(Refiner[1].value, gg.TYPE_BYTE)
count = gg.getResultsCount()
if count == 0 then
found_("O_dinitial_search")
return 0
end
val = gg.getResults(count)
gg.addListItems(val)
end

function CA_pointer_search()
gg.clearResults()
gg.setRanges(gg.REGION_C_ALLOC | gg.REGION_OTHER)
gg.loadResults(gg.getListItems())
gg.searchPointer(offst)
count = gg.getResultsCount()
if count == 0 then
found_("CA_pointer_search")
return 0
end
vel = gg.getResults(count)
gg.clearList()
gg.addListItems(vel)
end

function CA_apply_offset()
if Get_user_input[4] then
tanker = 0xfffffffffffffff8
else
tanker = 0xfffffffffffffff0
end
local copy = false
local l = gg.getListItems()
if not copy then gg.removeListItems(l) end
for i, v in ipairs(l) do
	v.address = v.address + tanker
	if copy then v.name = v.name..' #2' end
end
gg.addListItems(l)
end

function CA2_apply_offset()
if Get_user_input[4] then
tanker = 0xfffffffffffffff8
else
tanker = 0xfffffffffffffff0
end
local copy = false
local l = gg.getListItems()
if not copy then gg.removeListItems(l) end
for i, v in ipairs(l) do
	v.address = v.address + tanker
	if copy then v.name = v.name..' #2' end
end
gg.addListItems(l)
end

function Q_apply_fix()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.loadResults(gg.getListItems())
gg.clearList()
count = gg.getResultsCount()
if count == 0 then
found_("Q_apply_fix")
return 0
end
yy = gg.getResults(1000)
gg.clearResults()
i = 1
c = 1
s = {}
while (i-1) < count do
yy[i].address = yy[i].address + 0xb400000000000000
gg.searchNumber(yy[i].address, gg.TYPE_QWORD)
cnt = gg.getResultsCount()
if 0 < cnt then
bytr = gg.getResults(cnt)
n = 1
while (n-1) < cnt do
s[c] = {}
s[c].address = bytr[n].address
s[c].flags = 32
n = n + 1
c = c + 1
end
end
gg.clearResults()
i = i + 1
end
gg.addListItems(s)
end

function A_base_value()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.loadResults(gg.getListItems())
gg.clearList()
gg.searchPointer(offst)
count = gg.getResultsCount()
if count == 0 then
found_("A_base_value")
return 0
end
tel = gg.getResults(count)
gg.addListItems(tel)
end

function A_base_accuracy()
gg.setRanges(gg.REGION_ANONYMOUS | gg.REGION_C_ALLOC)
gg.loadResults(gg.getListItems())
gg.clearList()
gg.searchPointer(offst)
count = gg.getResultsCount()
if count == 0 then
found_("A_base_accuracy")
return 0
end
kol = gg.getResults(count)
i = 1
h = {}
while (i-1) < count do
h[i] = {}
h[i].address = kol[i].value
h[i].flags = 32
i = i + 1
end
gg.addListItems(h)
end

function A_user_given_offset()
local old_save_list = gg.getListItems()
for i, v in ipairs(old_save_list) do
v.address = v.address + Get_user_input[2]
v.flags = Get_user_type
end
gg.clearResults()
gg.clearList()
gg.loadResults(old_save_list)
count = gg.getResultsCount()
if count == 0 then
found_("Q_apply_fix++")
return 0
end
gg.setVisible(true)
end


function start()
user_input_taker()
O_initial_search()
O_dinitial_search()
if error > 0 then
return 0
end
CA_pointer_search()
if error > 0 then
return 0
end
CA_apply_offset()
if error > 0 then
return 0
end
A_base_value()
if error > 0 then
return 0
end
if offst == 0 then
A_base_accuracy()
end
if error > 0 then
return 0
end
A_user_given_offset()
if error > 0 then
return 0
end
loopCheck()
if error > 0 then
return 0
end
end

function second_start()
gg.toast("🟢🟢🔴🔴")
O_dinitial_search()
if error > 1 then
return 0
end
CA_pointer_search()
if error > 1 then
return 0
end
CA_apply_offset()
if error > 1 then
return 0
end
Q_apply_fix()
if error > 1 then
return 0
end
if offst == 0 then
A_base_accuracy()
end
if error > 1 then
return 0
end
A_user_given_offset()
if error > 1 then
return 0
end
loopCheck()
if error > 1 then
return 0
end
end

function third_start()
gg.toast("🟢🟢🟢🔴")
O_dinitial_search()
if error > 2 then
return 0
end
CA_pointer_search()
if error > 2 then
return 0
end
if offst == 0 then
CA2_apply_offset()
end
if error > 2 then
return 0
end
A_base_value()
if error > 2 then
return 0
end
if offst == 0 then
A_base_accuracy()
end
if error > 2 then
return 0
end
A_user_given_offset()
if error > 2 then
return 0
end
loopCheck()
if error > 2 then
return 0
end
end

function fourth_start()
gg.toast("🟢🟢🟢🟢")
O_dinitial_search()
CA_pointer_search()
CA2_apply_offset()
Q_apply_fix()
if offst == 0 then
A_base_accuracy()
end
A_user_given_offset()
loopCheck()
end

function UI()
gg.showUiButton()
while true do
if gg.isClickedUiButton() then
start()
end
end
end



local bool = true
repeat
    if gg.isVisible(true) then
        isVisibleRepeat = 1
        gg.setVisible(false)
    end
    if isVisibleRepeat == 1 then
        MAIN()
    end
until bool == nil 
