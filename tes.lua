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
		if menu99 == n
