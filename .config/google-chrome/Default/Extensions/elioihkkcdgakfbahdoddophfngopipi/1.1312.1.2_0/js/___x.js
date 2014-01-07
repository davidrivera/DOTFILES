// "Photo Zoom for Facebook" v1.1312.1.2
// Everything is (c) Copyright by Regis Gaughan, III <regis.gaughan@gmail.com>.
// All rights reserved.

!function(a){"use strict";var b;try{b=a.chrome.app.getDetails()||{}}catch(c){a.console&&a.console.error("Couldn't get app details"),b={}}b.analyticsId="UA-22980224-1";var d=chrome.storage.local;d.get("installed",function(a){if(!a.installed&&localStorage.getItem("installed")){var b={installed:localStorage.getItem("installed")||!1,exposedSettings:localStorage.getItem("exposedSettings")||!1,enableShortcut:localStorage.getItem("enableShortcut")||90,forceZoomKey:localStorage.getItem("forceZoomKey")||-1,forceHideKey:localStorage.getItem("forceHideKey")||-1,delay:localStorage.getItem("delay")||50,fadeInDuration:localStorage.getItem("fadeInDuration")||150,fadeOutDuration:localStorage.getItem("fadeOutDuration")||150};localStorage.clear(),d.set(b)}});var e,f,g,h={},i={};i={openOptions:function(a,b){a=a||{},chrome.tabs.create({url:chrome.extension.getURL("html/options.html")+(a.hash?"#"+a.hash:""),selected:!0,index:b&&b.index+1||9999},function(){})},toggleEnabled:function(){d.get("enabled",function(a){d.set({enabled:!a.enabled}),chrome.contextMenus.update(h.toggleEnable,{checked:!a.enabled}),updateTabs()})}},e=function(a,b){var c={type:"normal",title:"",documentUrlPatterns:["http://*.facebook.com/*","http://facebook.com/*","https://*.facebook.com/*","https://facebook.com/*"]};b=b||{},c.type=b.type||c.type,c.title=b.title||c.title,c.contexts=b.contexts||["all"],("checkbox"==c.type||"radio"==c.type)&&(c.checked="boolean"==typeof b.checked?b.checked:!1),c.onclick=i[a],h[a]?chrome.contextMenus.update(h[a],c,function(){}):h[a]=chrome.contextMenus.create(c,function(){})},f=function(a){h[a]&&(chrome.contextMenus.remove(h[a]),delete h[a])},g=function(){chrome.contextMenus.removeAll(),h={}},d.get(["hideContextMenu","enabled"],function(a){a.hideContextMenu?g():(e("toggleEnabled",{type:"checkbox",title:"Enabled",checked:void 0===a.enabled?!0:!!a.enabled}),e("openOptions",{title:"Open Options Page"}))}),chrome.extension.onRequest.addListener(function(a,c,d){var e;e=a.name,"getExtDetails"===e&&d(b)});var j=j||[];if(j.push(["_setAccount",b.analyticsId]),j.push(["_trackPageview"]),j.push(["_setSampleRate","1"]),function(){var a=document.createElement("script");a.type="text/javascript",a.async=!0,a.src="https://ssl.google-analytics.com/ga.js";var b=document.getElementsByTagName("script")[0];b.parentNode.insertBefore(a,b)}(),b){var k,l;k=b.version,l="release"+k,d.get(["installed",l],function(a){if(!a[l]){a.installed||localStorage.getItem("installed")||i.openOptions();var b={installed:!0};b[l]=!0,d.set(b),j.push(["_trackEvent",a.installed?"Upgrade":"Install",k])}})}}(this);