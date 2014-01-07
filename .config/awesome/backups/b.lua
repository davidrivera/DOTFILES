-- Standard awesome library
require("awful")
require("awful.autofocus")
require("awful.rules")
-- Theme handling library
require("beautiful")
-- Notification library
require("naughty")
require("vicious")
require("blingbling")
Cairo = require "oocairo"
-- Compositing manager
awful.util.spawn_with_shell("xcompmgr &")


-- {{{ Error handling
-- This code will only ever execute for the fallback config
if awesome.startup_errors then
    naughty.notify({ preset = naughty.config.presets.critical,
                     title = "Oops, there were errors during startup!",
                     text = awesome.startup_errors })
end

-- Handle runtime errors after startup
do
    local in_error = false
    awesome.add_signal("debug::error", function (err)
        -- Make sure we don't go into an endless error loop
        if in_error then return end
        in_error = true

        naughty.notify({ preset = naughty.config.presets.critical,
                         title = "Oops, an error happened!",
                         text = err })
        in_error = false
    end)
end
-- }}}


-- Themes/colours/icons/wallpapers
beautiful.init("/usr/share/awesome/themes/fence/theme.lua")

-- Terminal and Editor defaults
terminal = "lxterminal"
editor = os.getenv("EDITOR") or "leafpad"
editor_cmd = terminal .. " -e " .. editor

-- Default modkey.
modkey = "Mod4"

-- Table of layouts to cover with awful.layout.inc, order matters.
layouts =
{
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
-- }}}

-- {{{ Tags
-- Define a tag table which hold all screen tags.
 tags = {
   --names  = { "O_o", ">_<", "T_T", "-_-", "^_^" },
   names  = {"一", "二", "三", "四", "五", "六"},
   layout = { layouts[1], layouts[10], layouts[6], layouts[6], layouts[1], layouts[1], layouts[1], layouts[1], layouts[1], layouts[1]
 }}
 for s = 1, screen.count() do
     -- Each screen has its own tag table.
     tags[s] = awful.tag(tags.names, s, tags.layout)
 end
 -- }}}

-- {{{ Menu
-- Create a laucher widget and a main menu
myawesomemenu = {
   { "manual", terminal .. " -e man awesome" },
   { "edit config", editor_cmd .. " " .. awesome.conffile },
   { "open terminal", terminal },
   { "restart", awesome.restart },
   { "quit", awesome.quit }
}


--mymainmenu = awful.menu
mymainmenu=blingbling.menu({ items = { { "awesome", myawesomemenu, beautiful.awesome_icon },
                                  
                                  }
                        })

mylauncher = awful.widget.launcher({ image = image(beautiful.awesome_icon),
                                     menu = mymainmenu })
-- }}}

-- {{{ Wibox

-- Seperator widget

 seperator = widget({ type = "textbox" })
 seperator.text = "        "
 small_seperator = widget({ type = "textbox" })
 small_seperator.text = "    "

-- NET WIDGET W/POPUP

 my_net=blingbling.net.new()
 my_net:set_height(18)
 my_net:set_interface("wlan0")
 --activate popup with ip informations on the net widget
 my_net:set_ippopup()
 my_net:set_show_text(true)
 my_net:set_v_margin(3)


-- MEMORY GRAPH WIDGET
 memlabel= widget({ type = "textbox" })
 memlabel.text='MEM: '
 memwidget=blingbling.classical_graph.new()
 memwidget:set_height(18)
 memwidget:set_width(65)
 memwidget:set_tiles_color("#00000022")
 memwidget:set_show_text(true)
 vicious.register(memwidget, vicious.widgets.mem, '$1', 2)
 --bind a top popup on the graph 
 blingbling.popups.htop(memwidget.widget,
                       { title_color = "#66CC00",
                         user_color    = "#33CCFF",
                         root_color= "#FF6600", 
                         terminal = "lxterminal"})

 -- core graph
 corelabel = widget({ type = "textbox" })
 corelabel.text=' CORES: '
 --
 mycore1=blingbling.progress_graph.new()
 mycore1:set_height(18)
 mycore1:set_width(6)
 mycore1:set_filled(true)
 mycore1:set_h_margin(1)
 mycore1:set_filled_color("#00000033")
 vicious.register(mycore1, vicious.widgets.cpu, "$2")
 -- 
 mycore2=blingbling.progress_graph.new()
 mycore2:set_height(18)
 mycore2:set_width(6)
 mycore2:set_filled(true)
 mycore2:set_h_margin(1)
 mycore2:set_filled_color("#00000033")
 vicious.register(mycore2, vicious.widgets.cpu, "$2")
 --
 mycore3=blingbling.progress_graph.new()
 mycore3:set_height(18)
 mycore3:set_width(6)
 mycore3:set_filled(true)
 mycore3:set_h_margin(1)
 mycore3:set_filled_color("#00000033")
 vicious.register(mycore3, vicious.widgets.cpu, "$2")
 --
 mycore4=blingbling.progress_graph.new()
 mycore4:set_height(18)
 mycore4:set_width(6)
 mycore4:set_filled(true)
 mycore4:set_h_margin(1)
 mycore4:set_filled_color("#00000033")
 vicious.register(mycore4, vicious.widgets.cpu, "$2")
 --
 mycore5=blingbling.progress_graph.new()
 mycore5:set_height(18)
 mycore5:set_width(6)
 mycore5:set_filled(true)
 mycore5:set_h_margin(1)
 mycore5:set_filled_color("#00000033")
 vicious.register(mycore5, vicious.widgets.cpu, "$2")
 --
 mycore6=blingbling.progress_graph.new()
 mycore6:set_height(18)
 mycore6:set_width(6)
 mycore6:set_filled(true)
 mycore6:set_h_margin(1)
 mycore6:set_filled_color("#00000033")
 vicious.register(mycore6, vicious.widgets.cpu, "$2")
 --
 mycore7=blingbling.progress_graph.new()
 mycore7:set_height(18)
 mycore7:set_width(6)
 mycore7:set_filled(true)
 mycore7:set_h_margin(1)
 mycore7:set_filled_color("#00000033")
 vicious.register(mycore7, vicious.widgets.cpu, "$2")
 --
 mycore8=blingbling.progress_graph.new()
 mycore8:set_height(18)
 mycore8:set_width(6)
 mycore8:set_filled(true)
 mycore8:set_h_margin(1)
 mycore8:set_filled_color("#00000033")
 vicious.register(mycore8, vicious.widgets.cpu, "$2")

-- MPD WIDGET

  mpdtextbox = widget({ type = "textbox" })
  mpdtextbox.text = "Music: "
  require("awesompd/awesompd")
  musicwidget = awesompd:create() -- Create awesompd widget
  musicwidget.font = "liberation mono" -- Set widget font 
  musicwidget.scrolling = true -- If true, the text in the widget will be scrolled
  musicwidget.output_size = 28 -- Set the size of widget in symbols
  musicwidget.update_interval = 5 -- Set the update interval in seconds
  -- Set the folder where icons are located (change username to your login name)
  musicwidget.path_to_icons = "/home/happi/.config/awesome/awesompd/icons" 
  -- Set the default music format for Jamendo streams. You can change
  -- this option on the fly in awesompd itself.
  -- possible formats: awesompd.FORMAT_MP3, awesompd.FORMAT_OGG
  --musicwidget.jamendo_format = awesompd.FORMAT_MP3
  -- If true, song notifications for Jamendo tracks and local tracks will also contain
  -- album cover image.
  musicwidget.show_album_cover = true
  -- Specify how big in pixels should an album cover be. Maximum value
  -- is 100.
  musicwidget.album_cover_size = 50
  -- This option is necessary if you want the album covers to be shown
  -- for your local tracks.
  musicwidget.mpd_config = "/home/happi/.mpdconf"
  -- Specify the browser you use so awesompd can open links from
  -- Jamendo in it.
  musicwidget.browser = "firefox"
  -- Specify decorators on the left and the right side of the
  -- widget. Or just leave empty strings if you decorate the widget
  -- from outside.
  musicwidget.ldecorator = " "
  musicwidget.rdecorator = " "
  -- Set all the servers to work with (here can be any servers you use)
  musicwidget.servers = {
     { server = "localhost",
          port = 6600 },
     { server = "192.168.0.72",
          port = 6600 } }
  -- Set the buttons of the widget
  musicwidget:register_buttons({ { "", "XF86AudioPlay", musicwidget:command_toggle() },
                       { "", "XF86AudioPrev", musicwidget:command_prev_track() },
                   { "", "XF86AudioNext", musicwidget:command_next_track() },
                   --{ "", awesompd.MOUSE_SCROLL_UP, musicwidget:command_volume_up() },
                   --{ "", awesompd.MOUSE_SCROLL_DOWN, musicwidget:command_volume_down() },
                   { "", awesompd.MOUSE_RIGHT, musicwidget:command_show_menu() },
                               --{ "", "XF86AudioLowerVolume", musicwidget:command_volume_down() },
                               --{ "", "XF86AudioRaiseVolume", musicwidget:command_volume_up() },
                               { modkey, "Pause", musicwidget:command_playpause() } })
  musicwidget:run() -- After all configuration is done, run the widget





-- BINARY CLOCK WIDGET

 binaryclock = {}
 binaryclock.widget = widget({type = "imagebox"})
 binaryclock.w = 51 --width 
 binaryclock.h = 24 --height (better to be a multiple of 6) 
 --dont forget that awesome resizes our image with clocks to fit wibox's height
 binaryclock.show_sec = true --must we show seconds? 
 binaryclock.color_active = "#66CC00" --active dot color
 binaryclock.color_bg = beautiful.bg_normal --background color
 binaryclock.color_inactive = beautiful.bg_focus --inactive dot color
 binaryclock.dotsize = math.floor(binaryclock.h / 6) --dot size
 binaryclock.step = math.floor(binaryclock.dotsize / 2) --whitespace between dots
 binaryclock.widget.image = image.argb32(binaryclock.w, binaryclock.h, nil) --create image
 if (binaryclock.show_sec) then binaryclock.timeout = 1 else binaryclock.timeout = 20 end --we don't need to update often
 binaryclock.DEC_BIN = function(IN) --thanx to Lostgallifreyan (http://lua-users.org/lists/lua-l/2004-09/msg00054.html)
     local B,K,OUT,I,D=2,"01","",0
     while IN>0 do
         I=I+1
         IN,D=math.floor(IN/B),math.mod(IN,B)+1
         OUT=string.sub(K,D,D)..OUT
     end
     return OUT
 end
 binaryclock.paintdot = function(val,shift,limit) --paint number as dots with shift from left side
       local binval = binaryclock.DEC_BIN(val)
       local l = string.len(binval)
       local height = 0 --height adjustment, if you need to lift dots up
       if (l < limit) then
              for i=1,limit - l do binval = "0" .. binval end
       end
       for i=0,limit-1 do
              if (string.sub(binval,limit-i,limit-i) == "1") then
                    binaryclock.widget.image:draw_rectangle(shift,  binaryclock.h - binaryclock.dotsize - height, binaryclock.dotsize, binaryclock.dotsize, true, binaryclock.color_active)
              else
                    binaryclock.widget.image:draw_rectangle(shift,  binaryclock.h - binaryclock.dotsize - height, binaryclock.dotsize,binaryclock.dotsize, true, binaryclock.color_inactive)
              end
              height = height + binaryclock.dotsize + binaryclock.step
        end
 end
 binaryclock.drawclock = function () --get time and send digits to paintdot()
       binaryclock.widget.image:draw_rectangle(0, 0, binaryclock.w, binaryclock.h, true, binaryclock.color_bg) --fill background
       local t = os.date("*t")
       local hour = t.hour
       if (string.len(hour) == 1) then
              hour = "0" .. t.hour
       end
       local min = t.min
       if (string.len(min) == 1) then
              min = "0" .. t.min
       end
       local sec = t.sec
       if (string.len(sec) == 1) then
              sec = "0" .. t.sec
       end
       local col_count = 6
       if (not binaryclock.show_sec) then col_count = 4 end
       local step = math.floor((binaryclock.w - col_count * binaryclock.dotsize) / 8) --calc horizontal whitespace between cols
       binaryclock.paintdot(0 + string.sub(hour, 1, 1), step, 2)
       binaryclock.paintdot(0 + string.sub(hour, 2, 2), binaryclock.dotsize + 2 * step, 4)
       binaryclock.paintdot(0 + string.sub(min, 1, 1),binaryclock.dotsize * 2 + 4 * step, 3)
       binaryclock.paintdot(0 + string.sub(min, 2, 2),binaryclock.dotsize * 3 + 5 * step, 4)
       if (binaryclock.show_sec) then
              binaryclock.paintdot(0 + string.sub(sec, 1, 1), binaryclock.dotsize * 4 + 7 * step, 3)
              binaryclock.paintdot(0 + string.sub(sec, 2, 2), binaryclock.dotsize * 5 + 8 * step, 4)
       end
       binaryclock.widget.image = binaryclock.widget.image
   end

 binarytimer = timer { timeout = binaryclock.timeout } --register timer
   binarytimer:add_signal("timeout", function()
       binaryclock.drawclock()
   end)
   binarytimer:start()--start timer




-- Create a systray
 --mysystray = widget({ type = "systray" })

-- Create a wibox for each screen and add it
mywibox = {}
mypromptbox = {}
mylayoutbox = {}
mytaglist = {}
mytaglist.buttons = awful.util.table.join(
                    awful.button({ }, 1, awful.tag.viewonly),
                    awful.button({ modkey }, 1, awful.client.movetotag),
                    awful.button({ }, 3, awful.tag.viewtoggle),
                    awful.button({ modkey }, 3, awful.client.toggletag),
                    awful.button({ }, 4, awful.tag.viewnext),
                    awful.button({ }, 5, awful.tag.viewprev)
                    )
mytasklist = {}
mytasklist.buttons = awful.util.table.join(
                     awful.button({ }, 1, function (c)
                                              if c == client.focus then
                                                  c.minimized = true
                                              else
                                                  if not c:isvisible() then
                                                      awful.tag.viewonly(c:tags()[1])
                                                  end
                                                  -- This will also un-minimize
                                                  -- the client, if needed
                                                  client.focus = c
                                                  c:raise()
                                              end
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
                                              if client.focus then client.focus:raise() end
                                          end),
                     awful.button({ }, 5, function ()
                                              awful.client.focus.byidx(-1)
                                              if client.focus then client.focus:raise() end
                                          end))

for s = 1, screen.count() do
    -- Create a promptbox for each screen
    mypromptbox[s] = awful.widget.prompt({ layout = awful.widget.layout.horizontal.leftright })
    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    mylayoutbox[s] = awful.widget.layoutbox(s)
    mylayoutbox[s]:buttons(awful.util.table.join(
                           awful.button({ }, 1, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(layouts, -1) end),
                           awful.button({ }, 4, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(layouts, -1) end)))
    -- Create a taglist widget
    mytaglist[s] = awful.widget.taglist(s, awful.widget.taglist.label.all, mytaglist.buttons)

    -- Create a tasklist widget
    --mytasklist[s] = awful.widget.tasklist(function(c)
    --                                          return awful.widget.tasklist.label.currenttags(c, s)
    --                                      end, mytasklist.buttons)

    -- Create the wibox
    mywibox[s] = awful.wibox({ position = "top", screen = s })
    -- Add widgets to the wibox - order matters
    mywibox[s].widgets = {
        {
        small_seperator,
            mylauncher,
        small_seperator,
            mytaglist[s],
            mypromptbox[s],

        seperator,

        mpdtextbox,
        musicwidget.widget,

        seperator,


        memlabel,
        memwidget,

        seperator,

        corelabel,
        mycore1,
        mycore2,
        mycore3,
        mycore4,
        mycore5,
        mycore6,
        mycore7,
        mycore8,

        seperator,
        
        
            layout = awful.widget.layout.horizontal.leftright
        },

        mylayoutbox[s],
        small_seperator,
       
        binaryclock.widget,

        seperator,
        seperator,

        my_net,


        s == 1 and mysystray or nil,
        mytasklist[s],
        layout = awful.widget.layout.horizontal.rightleft
    }
end
-- }}}

-- {{{ Mouse bindings
root.buttons(awful.util.table.join(
    awful.button({ }, 3, function () mymainmenu:toggle() end),
    awful.button({ }, 4, awful.tag.viewnext),
    awful.button({ }, 5, awful.tag.viewprev)
))
-- }}}

-- {{{ Key bindings
globalkeys = awful.util.table.join(
    awful.key({ modkey,           }, "Left",   awful.tag.viewprev       ),
    awful.key({ modkey,           }, "Right",  awful.tag.viewnext       ),
    awful.key({ modkey,           }, "Escape", awful.tag.history.restore),

    awful.key({ modkey,           }, "j",
        function ()
            awful.client.focus.byidx( 1)
            if client.focus then client.focus:raise() end
        end),
    awful.key({ modkey,           }, "k",
        function ()
            awful.client.focus.byidx(-1)
            if client.focus then client.focus:raise() end
        end),
    awful.key({ modkey,           }, "w", function () mymainmenu:show({keygrabber=true}) end),

    -- Layout manipulation
    awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end),
    awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end),
    awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end),
    awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end),
    awful.key({ modkey,           }, "u", awful.client.urgent.jumpto),
    awful.key({ modkey,           }, "Tab",
        function ()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end),

    -- Standard program
    awful.key({ modkey,           }, "Return", function () awful.util.spawn(terminal) end),
    awful.key({ modkey, "Control" }, "r", awesome.restart),
    awful.key({ modkey, "Shift"   }, "q", awesome.quit),

    awful.key({ modkey,           }, "l",     function () awful.tag.incmwfact( 0.05)    end),
    awful.key({ modkey,           }, "h",     function () awful.tag.incmwfact(-0.05)    end),
    awful.key({ modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1)      end),
    awful.key({ modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1)      end),
    awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol( 1)         end),
    awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1)         end),
    awful.key({ modkey,           }, "space", function () awful.layout.inc(layouts,  1) end),
    awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(layouts, -1) end),

    awful.key({ modkey, "Control" }, "n", awful.client.restore),

    -- Prompt
    awful.key({ modkey },            "r",     function () mypromptbox[mouse.screen]:run() end),

    awful.key({ modkey }, "x",
              function ()
                  awful.prompt.run({ prompt = "Run Lua code: " },
                  mypromptbox[mouse.screen].widget,
                  awful.util.eval, nil,
                  awful.util.getdir("cache") .. "/history_eval")
              end)
)

clientkeys = awful.util.table.join(
    awful.key({ modkey,           }, "f",      function (c) c.fullscreen = not c.fullscreen  end),
    awful.key({ modkey, "Shift"   }, "c",      function (c) c:kill()                         end),
    awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ),
    awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end),
    awful.key({ modkey,           }, "o",      awful.client.movetoscreen                        ),
    awful.key({ modkey, "Shift"   }, "r",      function (c) c:redraw()                       end),
    awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end),
    awful.key({ modkey,           }, "n",
        function (c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end),
    awful.key({ modkey,           }, "m",
        function (c)
            c.maximized_horizontal = not c.maximized_horizontal
            c.maximized_vertical   = not c.maximized_vertical
        end)
)

-- Compute the maximum number of digit we need, limited to 9
keynumber = 0
for s = 1, screen.count() do
   keynumber = math.min(9, math.max(#tags[s], keynumber));
end

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, keynumber do
    globalkeys = awful.util.table.join(globalkeys,
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        local screen = mouse.screen
                        if tags[screen][i] then
                            awful.tag.viewonly(tags[screen][i])
                        end
                  end),
        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = mouse.screen
                      if tags[screen][i] then
                          awful.tag.viewtoggle(tags[screen][i])
                      end
                  end),
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus and tags[client.focus.screen][i] then
                          awful.client.movetotag(tags[client.focus.screen][i])
                      end
                  end),
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus and tags[client.focus.screen][i] then
                          awful.client.toggletag(tags[client.focus.screen][i])
                      end
                  end))
end

clientbuttons = awful.util.table.join(
    awful.button({ }, 1, function (c) client.focus = c; c:raise() end),
    awful.button({ modkey }, 1, awful.mouse.client.move),
    awful.button({ modkey }, 3, awful.mouse.client.resize))

-- Set keys
musicwidget:append_global_keys()
root.keys(globalkeys)
-- }}}

-- {{{ Rules
awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = true,
                     keys = clientkeys,
                     buttons = clientbuttons } },
    { rule = { class = "MPlayer" },
      properties = { floating = true } },
    { rule = { class = "pinentry" },
      properties = { floating = true } },
    { rule = { class = "gimp" },
      properties = { floating = true } },
    -- Set Firefox to always map on tags number 2 of screen 1.
    { rule = { class = "Firefox" },
      properties = { tag = tags[1][2] } },
    -- Set terminal opacity
    {rule = { class = "lxterminal"}, 
      properties = {opacity = 0.8} },
    { rule = { class = "minecraft" },
      properties = { tag = tags[1][5] } },

}
-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.add_signal("manage", function (c, startup)
    -- Add a titlebar
    -- awful.titlebar.add(c, { modkey = modkey })

    -- Enable sloppy focus
    c:add_signal("mouse::enter", function(c)
        if awful.layout.get(c.screen) ~= awful.layout.suit.magnifier
            and awful.client.focus.filter(c) then
            client.focus = c
        end
    end)

    if not startup then
        -- Set the windows at the slave,
        -- i.e. put it at the end of others instead of setting it master.
        -- awful.client.setslave(c)

        -- Put windows in a smart way, only if they does not set an initial position.
        if not c.size_hints.user_position and not c.size_hints.program_position then
            awful.placement.no_overlap(c)
            awful.placement.no_offscreen(c)
        end
    end
end)

client.add_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.add_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
-- }}}


-- {{{ Autostart
-- Launch programs at startup
awful.util.spawn("nitrogen --restore &")
awful.util.spawn("firefox")


-- }}}
-- disable startup-notification globally
local oldspawn = awful.util.spawn
awful.util.spawn = function (s)
  oldspawn(s, false)
end
 
