function handlePageChange(a){var b=chrome.extension.getURL("");a.url.substr(0,b.length)===b&&a.url.indexOf(TD.bg.MAIN_APP_PAGE_LOCATION)!==-1?theTab?a.id!=theTab.id&&(console.log("Duplicate TweetDeck page"),chrome.tabs.remove(a.id),TD.bg.utils.showTDTab()):(console.log("TweetDeck page created"),theTab=a):theTab&&a.id==theTab.id&&(console.log("User has navigated away"),handlePageDeath(a.id))}function handlePageDeath(a){theTab&&a==theTab.id&&(console.log("TweetDeck page closed"),theTab=null)}TD={bg:{},util:{}},TD.util.isChromeApp=function(){return!0},TD.bg.init=function(){TD.bg.contextMenu.init(),TD.bg.MAIN_APP_PAGE_LOCATION="web/templates/default.html"};var theTab=null;chrome.tabs.onCreated.addListener(function(a){handlePageChange(a)}),chrome.tabs.onUpdated.addListener(function(a,b,c){b.url&&handlePageChange(c)}),chrome.tabs.onRemoved.addListener(function(a){handlePageDeath(a)}),TD.buildID="1a0e5ce0173741e88d65c15c7af61e7ad0186eef",TD.buildIDShort="1a0e5ce",TD.version="3.1.4",TD.config={api_root:"https://api.tweetdeck.com",td_create_key:"WRaMQNHU2Jy51bhFEL3C",td_create_secret:"MiLkmD1t1xlZqKoLLY8ScxX5gwpOQsjBopZcV4KLcuo=",client_name:"blackbird",debug_menu:!1,app_name:"TweetDeck",app_icon:"web/assets/logos/128.png",sync_name:"blackbird"},TD.util.i18n=function(){var a={},b,c,d=function(a){if(typeof TD_locale_messages=="undefined")return undefined;var b=TD_locale_messages[a];return b&&b.message?b.message:undefined},e=function(a){var b=deck.i18n(a);return b?b:undefined};return a.getMessage=function(a){return b||(TD.util.isChromeApp()?b=chrome.i18n.getMessage:TD.util.isWrapperApp()?b=e:b=d),b(a)},a.getLocale=function(){return c?c:(TD.util.isChromeApp()&&(c=a.getMessage("@@ui_locale")),c)},a}(),TD.i=function(){var a=/[^A-Za-z0-9_]/g,b={},c=TD.config.i18n_test_length_ratio||.2,d=TD.config.i18n_test_padding_char||"d";return function(e,f,g){var h,i,j;return typeof e=="string"&&(e={text:e}),TD.util.i18n.getLocale()==="en_US"?i=e.text:(h=b[e.text],h===undefined&&(h=e.text.replace(a,""),b[e.text]=h),i=TD.util.i18n.getMessage(h)||e.text),g||(i=TD.ui.template.toHtml(i,f)),TD.config.i18n_test&&(j=Math.round(i.length*c),i=i+Array(j+1).join(d)),i}}(),TD.bg.utils={},TD.bg.utils.getActiveTabWindow=function(){var a=chrome.extension.getViews(),b;for(var c=0;c<a.length;c++){b=a[c];if(b.location.href==theTab.url)return b}},TD.bg.utils.showTDTab=function(){if(!theTab)return;var a=this,b=function(a){theTab=a,chrome.windows.get(a.windowId,c)},c=function(a){a.focused||chrome.windows.update(a.id,{focused:!0})};chrome.tabs.get(theTab.id,b),chrome.tabs.update(theTab.id,{selected:!0})},TD.bg.utils.focusOrOpenTDTab=function(a){var b=function(){var b=TD.bg.utils.getActiveTabWindow(),c=function(){if(b.TD&&b.TD.ready){a(b.TD);return}setTimeout(c,500)};c()};theTab&&theTab.id?(TD.bg.utils.showTDTab(),b()):chrome.tabs.create({url:TD.bg.MAIN_APP_PAGE_LOCATION},function(a){setTimeout(function(){b()},100)})},TD.bg.contextMenu=function(){var a={},b=chrome.contextMenus,c=chrome.i18n.getMessage,d=function(a,b){var c;a.linkUrl?c=a.linkUrl:(b&&b.title&&(c=b.title,c.length>100&&(c=c.substr(0,100)+"…"),c+=" "),c+=a.pageUrl),TD.bg.utils.focusOrOpenTDTab(function(a){a.ui.compose.showComposeWindow(c+" ")})};return a.init=function(){b.create({title:TD.i("Share page with TweetDeck",null,!0),onclick:d}),b.create({title:TD.i("Share link with TweetDeck",null,!0),onclick:d,contexts:["link"]})},a}(),TD.bg.init();