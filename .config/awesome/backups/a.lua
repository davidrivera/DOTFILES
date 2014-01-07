require("awful")
require("awful.autofocus")
require("beautiful")
require("naughty")
require("vicious")
require("rodentbane")
require("shifty")
require("calendar2")
require("vain")
vain.widgets.terminal = "urxvt"

-- THEME
beautiful.init("/home/heleos/.config/awesome/themes/jack2/theme.lua")

-- COLOURS
coldef  = "</span>"
colblk  = "<span color='#1a1a1a'>"
colred  = "<span color='#b23535'>"
colgre  = "<span color='#60801f'>"
colyel  = "<span color='#be6e00'>"
colblu  = "<span color='#1f6080'>"
colmag  = "<span color='#8f46b2'>"
colcya  = "<span color='#73afb4'>"
colwhi  = "<span color='#b2b2b2'>"
colbblk = "<span color='#333333'>"
colbred = "<span color='#ff4b4b'>"
colbgre = "<span color='#9bcd32'>"
colbyel = "<span color='#d79b1e'>"
colbblu = "<span color='#329bcd'>"
colbmag = "<span color='#cd64ff'>"
colbcya = "<span color='#9bcdff'>"
colbwhi = "<span color='#ffffff'>"

-- ICONS
-- mpd
mpdicon = widget({ type = "imagebox", align = "left" })
mpdicon.image = image("/home/heleos/.config/awesome/icons/music18.png")
-- battery
baticon = widget({ type = "imagebox", align = "left" })
baticon.image = image("/home/heleos/.config/awesome/icons/bat18.png")
--calendar
calicon = widget({ type = "imagebox", align = "left" })
calicon.image = image("/home/heleos/.config/awesome/icons/cal18.png")
--cpu
cpuicon = widget({ type = "imagebox", align = "left" })
cpuicon.image = image("/home/heleos/.config/awesome/icons/cpu18.png")
--mem
memicon = widget({ type = "imagebox", align = "left" })
memicon.image = image("/home/heleos/.config/awesome/icons/mem18.png")
--root
rooticon = widget({ type = "imagebox", align = "left" })
rooticon.image = image("/home/heleos/.config/awesome/icons/disk18.png")
--home
homeicon = widget({ type = "imagebox", align = "left" })
homeicon.image = image("/home/heleos/.config/awesome/icons/disk18.png")
--upe
upeicon = widget({ type = "imagebox", align = "left" })
upeicon.image = image("/home/heleos/.config/awesome/icons/up18.png")
--downe
downeicon = widget({ type = "imagebox", align = "left" })
downeicon.image = image("/home/heleos/.config/awesome/icons/down18.png")
--upw
upwicon = widget({ type = "imagebox", align = "left" })
upwicon.image = image("/home/heleos/.config/awesome/icons/up18.png")
--downw
downwicon = widget({ type = "imagebox", align = "left" })
downwicon.image = image("/home/heleos/.config/awesome/icons/down18.png")
--vol
volicon = widget({ type = "imagebox", align = "left" })
volicon.image = image("/home/heleos/.config/awesome/icons/vol18.png")
--weather
weathericon = widget({ type = "imagebox", align = "left" })
weathericon.image = image("/home/heleos/.config/awesome/icons/weather18.png")
--wifi
wifiicon = widget({ type = "imagebox", align = "left" })
wifiicon.image = image("/home/heleos/.config/awesome/icons/wifi18.png")
--enet
neticon = widget({ type = "imagebox", align = "left" })
neticon.image = image("/home/heleos/.config/awesome/icons/net18.png")
--temp
tempicon = widget({ type = "imagebox", align = "left" })
tempicon.image = image("/home/heleos/.config/awesome/icons/temp18.png")



-- DEFAULTS
terminal = "urxvt"
editor = os.getenv("EDITOR") or "vim"
editor_cmd = terminal .. " -e " .. editor
browser = "chromium"
modkey = "Mod4"
altkey = "Mod1"
-- TAGS + TAG MATCHING
-- layouts
layouts = {
    awful.layout.suit.floating,
    awful.layout.suit.tile,
    awful.layout.suit.tile.left,
    awful.layout.suit.tile.bottom,
    awful.layout.suit.tile.top,
    awful.layout.suit.fair,
    awful.layout.suit.fair.horizontal,
    awful.layout.suit.spiral,
    awful.layout.suit.spiral.dwindle,
    awful.layout.suit.max,
    awful.layout.suit.max.fullscreen,
    awful.layout.suit.magnifier
}

-- shifty: predefined tags
shifty.config.tags = {
    ["1-main"]   = { init = true, position = 1, layout = awful.layout.suit.floating        },
--    ["1-term"]     = { init = true, position = 1, layout = vain.layout.uselessfair           },
    ["2-web"]    = { position = 2, layout = awful.layout.suit.floating, mwfact = 0.15, spawn = "chromium" },
    ["3-code"]   = { position = 3, layout = vain.layout.uselessfair                        },
    ["4-office"] = { position = 4, layout = awful.layout.suit.tile.bottom                  },
    ["5-game"]   = { position = 5, layout = awful.layout.suit.max                            },
    ["6-gimp"]   = { position = 6, layout = awful.layout.suit.floating                     },
    ["7-video"]  = { position = 7, layout = awful.layout.suit.floating                     },
    ["8-music"]  = { position = 8, layout = awful.layout.suit.tile.bottom                  },
    ["9-irc"]    = { position = 9, layout = awful.layout.suit.max                          },
    ["torrent"]  = { layout = awful.layout.suit.max                                        },
}

-- shifty: tags matching and client rules
shifty.config.apps = {
    { match = { "Chromium", "chromium"       }, tag = "2-web", float = false                                 },
    { match = { "geany"                      }, tag = "3-code",                                              },
    { match = { "Eclipse"                     }, tag = "3-code",                                                 },
    { match = { "OpenOffice.org 3.2"         }, tag = "4-office",                                            },
    { match = { "Wine"                       }, tag = "5-game",                                              },
    { match = { "Minecraft"                     }, tag = "5-game",                                                 },
    { match = { "Gimp"                       }, tag = "6-gimp",                                              },
    { match = { "gimp%-image%-window"        }, geometry = {175,15,900,770}, border_width = 0                },
    { match = { "^gimp%-toolbox$"            }, geometry = {0,15,175,770}, slave = true, border_width = 0    },
    { match = { "^gimp%-dock$"               }, geometry = {1080,15,175,770}, slave = true, border_width = 0 },
    { match = { "MPlayer", "Vlc"              }, tag = "7-video",                                             },
    { match = { "MPlayer"                    }, geometry = {0,15,nil,nil}, float = true                      },
    { match = { "ncmpcpp"                    }, tag = "8-music",                                             },
    { match = { "irssi"                      }, tag = "9-irc",                                               },
    { match = { "rtorrent"                   }, tag = "torrent",                                             },
    -- client manipulation
    { match = { "" },
        honorsizehints = false,
        buttons = awful.util.table.join (
        awful.button({ }, 1, function (c) client.focus = c; c:raise() end),
        awful.button({ modkey }, 1, awful.mouse.client.move),
        awful.button({ modkey }, 3, awful.mouse.client.resize))
    },
}

-- shifty: defaults
shifty.config.defaults = {
    layout = awful.layout.suit.float,
}
shifty.config.layouts = layouts
shifty.init()

-- MENU
networkmenu = {
    { "chromium",    "chromium" },
    { "wicd",        terminal .. " -e wicd-curses" },
    { "rtorrent",    terminal .. " -e rtorrent" }
}

officemenu = {
    { "writer",      "soffice -writer" },
    { "calc",        "soffice -calc" },
    { "impress",     "soffice -impress" },
}

editorsmenu = {
    { "leafpad",     "leafpad" },
    { "vim",         terminal .. " -e vim" },
    { "geany",       "geany" }
}

graphicsmenu = {
    { "gimp",        "gimp" },
    { "inkscape",     "inkscape" }
}

mediamenu = {
    { "sonata",    "sonata" },
    { "ncmpcpp",     terminal .. " -e ncmpcpp" },
    { "vlc",         "vlc" }
}

utilitiesmenu = {
    { "virtualbox",  "VirtualBox" },
    { "xfburn",      "xfburn" },
}

monitormenu = {
    { "scroff",      "xrandr --output LVDS --off" },
    { "scron",       "xrandr --output LVDS --auto" },
    { "scrmax",      "xrandr --output VGA-0 --preferred" }
}

systemmenu = {
    { "monitor",     monitormenu },
    { "htop",        terminal .. " -e htop" },
    { "kill",        "xkill" }
}

awesomemenu = {
    { "edit config", editor_cmd .. " " .. awful.util.getdir("config") .. "/rc.lua" },
    { "restart",     awesome.restart },
    { "lock",        terminal .. " -e xscreensaver-command --lock" },
    { "quit",        awesome.quit },
    { "reboot",      terminal .. " -e reboot" },
    { "shutdown",    terminal .. " -e shutdown" }
}

mainmenu = awful.menu({
    items = {
        { "network",   networkmenu },
        { "office",    officemenu },
        { "editors",   editorsmenu },
        { "graphics",  graphicsmenu },
        { "media",     mediamenu },
        { "utilities", utilitiesmenu },
        { "sytem",     systemmenu },
        { "awesome",   awesomemenu }
    }
})

-- WIDGETS TOP
-- Spacer widget
spacerwidget = widget({ type = "imagebox" })
spacerwidget.image = image("/home/heleos/.config/awesome/themes/jack2/spacer.png")

wifispacer = widget({ type = "imagebox" })
wifispacer.image = image("/home/heleos/.config/awesome/themes/jack2/spacer.png")

netspacer = widget({ type = "imagebox" })
netspacer.image = image("/home/heleos/.config/awesome/themes/jack2/spacer.png")

-- Calendar widget
calwidget = widget({ type = "textbox" })
    function dayth()
        local osd = os.date("%d")
        if osd == "01" or osd == "21" or osd == "31" then
            return "<span font='proggytiny 7'><sup>st</sup></span>"
        elseif osd == "02" or osd == "22" then
            return "<span font='proggytiny 7'><sup>nd</sup></span>"
        elseif osd == "03" or osd == "23" then
            return "<span font='proggytiny 7'><sup>rd</sup></span>"
        else
            return "<span font='proggytiny 7'><sup>th</sup></span>"
        end
    end
    vicious.register(calwidget, vicious.widgets.date, "" .. colyel .. " %a, %e" .. dayth() .. " %B" .. coldef .. " ")
    calendar2.addCalendarToWidget(calwidget, "" .. colyel .. "%s" .. coldef .. "")

-- Clock widget
clockwidget = widget({ type = "textbox" })
    vicious.register(clockwidget, vicious.widgets.date, "" .. colbyel .. "%l:%M%P" .. coldef .. "")
    clockwidget:add_signal('mouse::enter', function () cal_remt = { naughty.notify({ text = cal_gett(), border_color = "#1a1a1a", timeout = 0, hover_timeout = 0.5 }) } end)
    clockwidget:add_signal('mouse::leave', function () naughty.destroy(cal_remt[1]) end)

-- Weather widget
weatherwidget = widget({ type = "textbox" })
    vicious.register(weatherwidget, vicious.widgets.weather,
    function (widget, args)
        if args["{tempf}"] == "N/A" then
            return " No Info "
        else
--            weatherwidget:add_signal('mouse::enter', function () weather_n = { naughty.notify({ title = "" .. colblu .. "───────────── Weather ─────────────" .. coldef .. "", text = "" .. colbblu .. "Wind    : " .. args["{windmph}"] .. " mph " .. args["{wind}"] .. "\nHumidity: " .. args["{humid}"] .. " %\nPressure: " .. args["{press}"] .. " hPa" .. coldef .. "", border_color = "#1a1a1a", timeout = 0, hover_timeout = 0.5 }) } end)
--            weatherwidget:add_signal('mouse::leave', function () naughty.destroy(weather_n[1]) end)
            return "" .. colblu .. " weather " .. coldef .. colbblu .. string.lower(args["{sky}"]) .. ", " .. args["{tempf}"] .. "°F" .. coldef .. " "
        end
    end, 1200, "KPWM" )
--weatherwidget:buttons(awful.util.table.join(awful.button({}, 3, function () awful.util.spawn ( browser .. " http://www.wunderground.com/US/ME/Bath.html") end)))

-- WIDGETS BOTTOM RIGHT
-- CPU widget
cputwidget = widget({ type = "textbox" })
    vicious.register(cputwidget, vicious.widgets.cpu,
    function (widget, args)
        if  args[1] == 50 then
            return "" .. colyel .. "" .. coldef .. colbyel .. args[1] .. "% " .. coldef .. ""
        elseif args[1] >= 50 then
            return "" .. colred .. "" .. coldef .. colbred .. args[1] .. "% " .. coldef .. ""
        else
            return "" .. colwhi .. "" .. coldef .. colbwhi .. args[1] .. "% " .. coldef .. ""
        end
    end )
cputwidget:buttons(awful.util.table.join(awful.button({}, 1, function () awful.util.spawn ( terminal .. " -e htop --sort-key PERCENT_CPU") end ) ) )

-- CPU temp widget
tempwidget = widget({ type = "textbox" })
    vicious.register(tempwidget, vicious.widgets.thermal,
    function (widget, args)
        if  args[1] >= 65 and args[1] < 75 then
            return "" .. colyel .. "" .. coldef .. colbyel .. args[1] .. "°C " .. coldef .. ""
        elseif args[1] >= 75 and args[1] < 80 then
            return "" .. colred .. "" .. coldef .. colbred .. args[1] .. "°C " .. coldef .. ""
        elseif args[1] > 80 then
            naughty.notify({ title = "Temperature Warning", text = "Running hot! " .. args[1] .. "°C!\nTake it easy.", timeout = 10, position = "top_right", fg = beautiful.fg_urgent, bg = beautiful.bg_urgent })
            return "" .. colred .. "" .. coldef .. colbred .. args[1] .. "°C " .. coldef .. "" 
        else
            return "" .. colwhi .. "" .. coldef .. colbwhi .. args[1] .. "°C " .. coldef .. ""
        end
    end, 19, "thermal_zone0" )

-- Ram widget
memwidget = widget({ type = "textbox" })
    vicious.cache(vicious.widgets.mem)
    vicious.register(memwidget, vicious.widgets.mem, "" .. colwhi .. "" .. coldef .. colbwhi .. "$1% ($2 MB) " .. coldef .. "", 13)

-- Filesystem widgets
-- root
fsrwidget = widget({ type = "textbox" })
    vicious.register(fsrwidget, vicious.widgets.fs,
    function (widget, args)
        if  args["{/ used_p}"] >= 93 and args["{/ used_p}"] < 97 then
            return "" .. colyel .. "" .. coldef .. colbyel .. args["{/ used_p}"] .. "% (" .. args["{/ avail_gb}"] .. " GB) " .. coldef .. ""
        elseif args["{/ used_p}"] >= 97 and args["{/ used_p}"] < 99 then
            return "" .. colred .. "" .. coldef .. colbred .. args["{/ used_p}"] .. "% (" .. args["{/ avail_gb}"] .. " GB) " .. coldef .. ""
        elseif args["{/ used_p}"] >= 99 and args["{/ used_p}"] <= 100 then
            naughty.notify({ title = "Hard drive Warning", text = "No space left on root!\nMake some room.", timeout = 10, position = "top_right", fg = beautiful.fg_urgent, bg = beautiful.bg_urgent })
            return "" .. colred .. "" .. coldef .. colbred .. args["{/ used_p}"] .. "% (" .. args["{/ avail_gb}"] .. " GB) " .. coldef .. "" 
        else
            return "" .. colwhi .. "" .. coldef .. colbwhi .. args["{/ used_p}"] .. "% (" .. args["{/ avail_gb}"] .. " GB) " .. coldef .. ""
        end
    end, 620)

-- home
fshwidget = widget({ type = "textbox" })
    vicious.register(fshwidget, vicious.widgets.fs,
    function (widget, args)
        if  args["{/home used_p}"] >= 93 and args["{/home used_p}"] < 97 then
            return "" .. colyel .. "" .. coldef .. colbyel .. args["{/home used_p}"] .. "% (" .. args["{/home avail_gb}"] .. " GB) " .. coldef .. ""
        elseif args["{/home used_p}"] >= 97 and args["{/home used_p}"] < 99 then
            return "" .. colred .. "" .. coldef .. colbred .. args["{/home used_p}"] .. "% (" .. args["{/home avail_gb}"] .. " GB) " .. coldef .. ""
        elseif args["{/home used_p}"] >= 99 and args["{/home used_p}"] <= 100 then
            naughty.notify({ title = "Hard drive Warning", text = "No space left on root!\nMake some room.", timeout = 10, position = "top_right", fg = beautiful.fg_urgent, bg = beautiful.bg_urgent })
            return "" .. colred .. "" .. coldef .. colbred .. args["{/home used_p}"] .. "% (" .. args["{/home avail_gb}"] .. " GB) " .. coldef .. "" 
        else
            return "" .. colwhi .. "" .. coldef .. colbwhi .. args["{/home used_p}"] .. "% (" .. args["{/home avail_gb}"] .. " GB) " .. coldef .. ""
        end
    end, 620)

-- Net widgets
-- eth
neteupwidget = widget({ type = "textbox" })
    vicious.cache(vicious.widgets.net)
    vicious.register(neteupwidget, vicious.widgets.net, "" .. colwhi .. "" .. coldef .. colbwhi .. "${eth0 up_kb} " .. coldef .. "")

netedownwidget = widget({ type = "textbox" })
    vicious.register(netedownwidget, vicious.widgets.net, "" .. colwhi .. "" ..coldef .. colbwhi .. "${eth0 down_kb} " .. coldef .. "")

netwidget = widget({ type = "textbox" })
    vicious.register(netwidget, vicious.widgets.net,
    function (widget, args)
        if args["{ip}"] == nil then
            downeicon.visible = false
            netedownwidget.visible = false
            upeicon.visible = false
            neteupwidget.visible = false
            neticon.visible = false
            netspacer.visible = false
            return "" 
        else
            downeicon.visible = true
            netedownwidget.visible = true
            upeicon.visible = true
            neteupwidget.visible = true
            neticon.visible = true
            netspacer.visible = true
            return "" .. colwhi .. "eth0 " .. coldef .. colbwhi .. args["{ip}"] .. coldef .. " "
        end
    end, refresh_delay, "eth0")

-- wlan
netwupwidget = widget({ type = "textbox" })
    vicious.register(netwupwidget, vicious.widgets.net, "" .. colwhi .. "" .. coldef .. colbwhi .. "${wlan0 up_kb} " .. coldef .. "")

netwdownwidget = widget({ type = "textbox" })
    vicious.register(netwdownwidget, vicious.widgets.net, "" .. colwhi .. "" .. coldef .. colbwhi .. "${wlan0 down_kb} " .. coldef .. "")

wifiwidget = widget({ type = "textbox" })
    vicious.register(wifiwidget, vicious.widgets.wifi,
    function (widget, args)
        if args["{link}"] == 0 then
            downwicon.visible = false
            netwdownwidget.visible = false
            upwicon.visible = false
            netwupwidget.visible = false
            wifiicon.visible = false
            wifispacer.visible = false
            return ""
        else
            downwicon.visible = true
            netwdownwidget.visible = true
            upwicon.visible = true
            netwupwidget.visible = true
            wifiicon.visible = true
            wifispacer.visible = true
            return "" .. colwhi .. "wlan " .. coldef .. colbwhi .. string.format("%s [%i%%]", args["{ssid}"], args["{link}"]/70*100) .. coldef .. " "
        end
    end, refresh_delay, "wlan0" )

-- Battery widget
batwidget = widget({ type = "textbox" })
    vicious.register(batwidget, vicious.widgets.bat,
    function (widget, args)
        if args[2] >= 50 and args[2] < 75 then
            return "" .. colyel .. "" .. coldef .. colbyel .. args[2] .. "% " .. "(" .. args[3] .. ") " .. coldef .. ""
        elseif args[2] >= 20 and args[2] < 50 then
            return "" .. colred .. "" .. coldef .. colbred .. args[2] .. "% " .. "(" .. args[3] .. ") " .. coldef .. ""
        elseif args[2] < 20 and args[1] == "-" then
            naughty.notify({ title = "Battery Warning", text = "Battery low! "..args[2].."% left!\nBetter get some power.", timeout = 10, position = "top_right", fg = beautiful.fg_urgent, bg = beautiful.bg_urgent })
            return "" .. colred .. "" .. coldef .. colbred .. args[2] .. "% " .. "(" .. args[3] .. ") " .. coldef .. ""
        elseif args[2] < 20 then 
            return "" .. colred .. "" .. coldef .. colbred .. args[2] .. "% " .. "(" .. args[3] .. ") " .. coldef .. ""
        else
            return "" .. colwhi .. "" .. coldef .. colbwhi .. args[2] .. "% " .. "(" .. args[3] .. ") " .. coldef .. ""
        end
    end, 23, "BAT0"    )

-- Volume widget
volwidget = widget({ type = "textbox" })
    vicious.register(volwidget, vicious.widgets.volume,
        function (widget, args)
            if args[1] == 0 or args[2] == "♩" then
                return "" .. colwhi .. "" .. coldef .. colbred .. "mute" .. coldef .. "" 
            else
                return "" .. colwhi .. "" .. coldef .. colbwhi .. args[1] .. "% " .. coldef .. ""
            end
        end, 2, "Master" )
    volwidget:buttons(
        awful.util.table.join(
            awful.button({ }, 1, function () awful.util.spawn("amixer -q sset Master toggle")   end),
            awful.button({ }, 3, function () awful.util.spawn( terminal .. " -e alsamixer")   end),
            awful.button({ }, 4, function () awful.util.spawn("amixer -q sset Master 2dB+") end),
            awful.button({ }, 5, function () awful.util.spawn("amixer -q sset Master 2dB-") end)
        )
    )

-- WIDGETS BOTTOM LEFT
-- MPD widget
mpdwidget = widget({ type = 'textbox' })
    vicious.register(mpdwidget, vicious.widgets.mpd,
        function (widget, args)
            if args["{state}"] == "Stop" then
                mpdicon.visible = false
                return ""
            elseif args["{state}"] == "Play" then
                mpdicon.visible = true
                return "" .. colwhi .. "mpd " .. coldef .. colbgre .. args["{Artist}"] .. " - " .. args["{Album}"] .. " - " .. args["{Title}"] .. coldef .. ""
            elseif args["{state}"] == "Pause" then
                mpdicon.visible = true
                return "" .. colwhi .. "mpd " .. coldef .. colbyel .. "paused" .. coldef .. ""
            end
        end)
    mpdwidget:buttons(
        awful.util.table.join(
            awful.button({}, 1, function () awful.util.spawn("mpc toggle", false) end),
            awful.button({}, 2, function () awful.util.spawn( terminal .. " -e ncmpcpp")   end),
            awful.button({}, 4, function () awful.util.spawn("mpc prev", false) end),
            awful.button({}, 5, function () awful.util.spawn("mpc next", false) end)
        )
    )

-- SYSTRAY
mysystray = widget({ type = "systray" })

-- WIBOXES
mywibox = {}
infobox = {}
mypromptbox = {}
-- taglist
mytaglist = {}
mytaglist.buttons = awful.util.table.join(
    awful.button({ }, 1, awful.tag.viewonly),
    awful.button({ modkey }, 1, awful.client.movetotag),
    awful.button({ }, 3, awful.tag.viewtoggle),
    awful.button({ modkey }, 3, awful.client.toggletag),
    awful.button({ }, 4, awful.tag.viewnext),
    awful.button({ }, 5, awful.tag.viewprev)
    )
shifty.taglist = mytaglist
-- tasklist
mytasklist = {}
mytasklist.buttons = awful.util.table.join(
    awful.button({ }, 1, function (c)
        if not c:isvisible() then
            awful.tag.viewonly(c:tags()[1])
        end
        client.focus = c
        c:raise()
    end),
    awful.button({ }, 3, function ()
        if instance then
            instance:hide()
            instance = nil
        else
            instance = awful.menu.clients({ width=250 })
        end
    end),
    awful.button({ }, 4, function ()
        awful.client.focus.byidx(1)
        if client.focus then
            client.focus:raise()
        end
    end),
    awful.button({ }, 5, function ()
        awful.client.focus.byidx(-1)
        if client.focus then
            client.focus:raise()
        end
    end)
)
-- Create for each screen
for s = 1, screen.count() do
    mypromptbox[s] = awful.widget.prompt({ layout = awful.widget.layout.horizontal.leftright })
    mytaglist[s] = awful.widget.taglist(s, awful.widget.taglist.label.all, mytaglist.buttons)
    mytasklist[s] = awful.widget.tasklist(function(c)
        return awful.widget.tasklist.label.currenttags(c, s)
    end, mytasklist.buttons)
    -- top box
    mywibox[s] = awful.wibox({ position = "top", height = "14", screen = s })
    mywibox[s].widgets = { {
        mytaglist[s], spacerwidget,
        mypromptbox[s], layout = awful.widget.layout.horizontal.leftright },
        clockwidget,
        calwidget,
        calicon,
        spacerwidget,
        weatherwidget,
        weathericon,
        spacerwidget,
        s == 1 and mysystray or nil,
        mytasklist[s],
        layout = awful.widget.layout.horizontal.rightleft }
    -- bottom box
    infobox[s] = awful.wibox({ position = "bottom", height = "14", screen = s })
    infobox[s].widgets = { {
        mpdicon,
        mpdwidget, layout = awful.widget.layout.horizontal.leftright },
        volwidget,
        volicon,
        spacerwidget,
        batwidget,
        baticon,
        netspacer,
        neteupwidget, 
        upeicon,
        netedownwidget,
        downeicon,
        netwidget,
        neticon,
        wifispacer,
        netwupwidget,
        upwicon,
        netwdownwidget,
        downwicon,
        wifiwidget,
        wifiicon,
        spacerwidget,
        fshwidget,
        homeicon,
        spacerwidget,
        fsrwidget,
        rooticon,
        spacerwidget,
        memwidget,
        memicon,
        spacerwidget,
        tempwidget,
        tempicon,
        spacerwidget,
        cputwidget,
        cpuicon,
        spacerwidget,
        layout = awful.widget.layout.horizontal.rightleft }
end

-- BINDINGS
-- Mouse bindings
root.buttons(awful.util.table.join(
    awful.button({ }, 3, function () mainmenu:toggle() end),
    awful.button({ }, 4, awful.tag.viewnext),
    awful.button({ }, 5, awful.tag.viewprev))
)

-- Key bindings
-- Global
globalkeys = awful.util.table.join(
    -- Tags
    awful.key({ modkey,           }, "Prior",                awful.tag.viewprev       ),
    awful.key({ modkey,           }, "Next",                 awful.tag.viewnext       ),
    awful.key({ modkey, "Shift"   }, "Prior",                shifty.shift_prev        ),
    awful.key({ modkey, "Shift"   }, "Next",                 shifty.shift_next        ),
    awful.key({ modkey            }, "a",                    function() shifty.add({ rel_index = 1 }) end ),
    awful.key({ modkey, "Shift"   }, "a",                    function() shifty.add({ rel_index = 1, nopopup = true }) end ),
    awful.key({ modkey            }, "z",                    shifty.del ),
    awful.key({ modkey,           }, "Escape",               awful.tag.history.restore),
    awful.key({ modkey,           }, "Right",                function ()
        awful.client.focus.byidx( 1)
        if client.focus then
            client.focus:raise()
        end
    end),
    awful.key({ altkey,           }, "Tab",                 function ()
        awful.client.focus.byidx(-1)
        if client.focus then
            client.focus:raise()
        end
    end),

    -- Programs
    -- launchers
    awful.key({ modkey,           }, "w",                     function () mainmenu:show({keygrabber=true}) end),
--    awful.key({ modkey,           }, "p",                     function () awful.util.spawn("dmenu_run -b -fn 'terminus' -nb '#1a1a1a' -nf '#9bcd32' -sb '#4c4b49' -sf '#9bcd32'") end),
    awful.key({ modkey,           }, "Tab",                   function () awful.util.spawn(terminal) end),
    awful.key({ modkey, "Shift"   }, "Tab",                   function () awful.util.spawn(terminal .. " -e su") end),
    -- miscellaneous
    awful.key({ modkey, "Shift"   }, "x",                     function () awful.util.spawn("xkill") end),
    awful.key({ modkey, "Shift"   }, "l",                     function () awful.util.spawn(terminal .. " -e xscreensaver-command --lock") end),
    awful.key({ modkey, "Control", "Shift" }, "r",            rodentbane.start),         
    -- volume + mpd
    awful.key({                   }, "XF86AudioLowerVolume",  function () awful.util.spawn("amixer -q set Master 2-") end),
    awful.key({                   }, "XF86AudioRaiseVolume",  function () awful.util.spawn("amixer -q set Master 2+") end),
    awful.key({                   }, "XF86AudioStop",         function () awful.util.spawn("mpc stop") end),
    awful.key({                   }, "XF86AudioPlay",         function () awful.util.spawn("mpc toggle") end),
    awful.key({                   }, "XF86AudioNext",         function () awful.util.spawn("mpc next") end),
    awful.key({                   }, "XF86AudioPrev",         function () awful.util.spawn("mpc prev") end),
    awful.key({                   }, "XF86AudioMute",         function () awful.util.spawn("amixer -q set Master toggle") end),
    awful.key({ modkey,           }, "m",                     function () awful.util.spawn(terminal .. " -e ncmpcpp") end),
    -- office
--    awful.key({ modkey,           }, "F2",                    function () awful.util.spawn("soffice -writer") end),
--    awful.key({ modkey,           }, "F3",                    function () awful.util.spawn("soffice -calc") end),
--    awful.key({ modkey,           }, "F4",                    function () awful.util.spawn("soffice -impress") end),
    -- web
--    awful.key({ modkey,           }, "i",                     function () awful.util.spawn(terminal .. " -e irssi") end),
--    awful.key({ modkey,           }, "d",                     function () awful.util.spawn(terminal .. " -e wicd-curses") end),
--    awful.key({ modkey, "Shift"   }, "d",                     function () awful.util.spawn(terminal .. " -e sudo wvdial optus") end),
--    awful.key({ modkey,           }, "F12",                   function () awful.util.spawn(terminal .. " -e rtorrent") end),
    -- file managers
--    awful.key({ modkey,           }, "r",                     function () awful.util.spawn(terminal .. " -e ranger") end),
--    awful.key({ modkey,           }, "t",                     function () awful.util.spawn("thunar") end),

    -- Layouts
    awful.key({ modkey, "Shift"   }, "Right",                 function () awful.client.swap.byidx(  1) end),
    awful.key({ modkey, "Shift"   }, "Left",                  function () awful.client.swap.byidx( -1) end),
    awful.key({ modkey, "Control" }, "Right",                 function () awful.screen.focus_relative( 1) end),
    awful.key({ modkey, "Control" }, "Left",                  function () awful.screen.focus_relative(-1) end),
    awful.key({ modkey,           }, "u",                     awful.client.urgent.jumpto),

    -- Awesome
    awful.key({ modkey, "Control" }, "r",                     awesome.restart),
    awful.key({ modkey, "Shift"   }, "q",                      awesome.quit),
    awful.key({ modkey,           }, "space",                 function () awful.layout.inc(layouts,  1) end),
    awful.key({ modkey, "Shift"   }, "space",                 function () awful.layout.inc(layouts, -1) end),

    -- Prompts
    awful.key({ modkey,           }, "r",                    function () mypromptbox[mouse.screen]:run() end),
    awful.key({ modkey, "Shift"   }, "x",                    function ()
        awful.prompt.run({ prompt = "Run Lua code: " },
        mypromptbox[mouse.screen].widget,
        awful.prompt.run({ prompt = "Run Lua code: " },
        mypromptbox[mouse.screen].widget,
        awful.util.eval, nil,
        awful.util.getdir("cache") .. "/history_eval"))
    end)
)

-- Clients
clientkeys = awful.util.table.join(
    awful.key({ modkey,           }, "o",                    function (c) c.fullscreen = not c.fullscreen  end),
    awful.key({ modkey, "Shift"   }, "c",                    function (c) c:kill() end),
    awful.key({ modkey, "Control" }, "space",                awful.client.floating.toggle ),
    awful.key({ modkey, "Control" }, "Return",               function (c) c:swap(awful.client.getmaster()) end),
    awful.key({ modkey, "Control" }, "o",                    awful.client.movetoscreen ),
    awful.key({ modkey,           }, "n",                    function (c) c.minimized = not c.minimized end),
    awful.key({ modkey, "Shift"   }, "n",                    function ()
        local allclients = client.get(mouse.screen)
        for _,c in ipairs(allclients) do
            if c.minimized and c:tags()[mouse.screen] == awful.tag.selected(mouse.screen) then
                c.minimized = false client.focus = c c:raise()
                return
            end
        end end),
    awful.key({ modkey,           }, "f",                    function (c)
        c.maximized_horizontal = not c.maximized_horizontal
        c.maximized_vertical   = not c.maximized_vertical
    end)
)

-- WORKSPACES
-- shifty:
for i=1,9 do
    globalkeys = awful.util.table.join(globalkeys, awful.key({ modkey }, i, function ()
        local t = awful.tag.viewonly(shifty.getpos(i))
    end))
    globalkeys = awful.util.table.join(globalkeys, awful.key({ modkey, "Control" }, i, function ()
        local t = shifty.getpos(i)
        t.selected = not t.selected
    end))
    globalkeys = awful.util.table.join(globalkeys, awful.key({ modkey, "Control", "Shift" }, i, function ()
        if client.focus then
            awful.client.toggletag(shifty.getpos(i))
        end
    end))
    globalkeys = awful.util.table.join(globalkeys, awful.key({ modkey, "Shift" }, i, function ()
        if client.focus then
            local t = shifty.getpos(i)
            awful.client.movetotag(t)
            awful.tag.viewonly(t)
        end
    end))
end

-- Set keys
root.keys(globalkeys)
shifty.config.globalkeys = globalkeys
shifty.config.clientkeys = clientkeys

-- SIGNALS
client.add_signal("manage", function (c, startup)
    if not startup then
        if not c.size_hints.user_position and not c.size_hints.program_position then
            awful.placement.no_overlap(c)
            awful.placement.no_offscreen(c)
        end
    end
end)

client.add_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.add_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
