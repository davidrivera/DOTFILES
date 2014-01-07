/**
 * RG3 Photo Zoom for Facebook
 * Author: Regis Gaughan, III
 * Email:  regis.gaughan@gmail.com
 * Web:    http://regisgaughan.com
 * (c) Copyright 2012. All Right Reserved
 */
var _gaq=_gaq||[];_gaq.push(["_setAccount","UA-22980224-1"]);_gaq.push(["_trackPageview"]);_gaq.push(["_setSampleRate","1"]);(function(){var b=document.createElement("script");b.type="text/javascript";b.async=true;b.src="https://ssl.google-analytics.com/ga.js";var a=document.getElementsByTagName("script")[0];a.parentNode.insertBefore(b,a)})();var extDetails;try{extDetails=window.chrome.app.getDetails()||{}}catch(e){window.console.error("Couldn't get app details");extDetails={}}function toBool(a){if(false==a||"false"===a||0==a||"0"==a){return false}else{return true}}var currentImageUrl=null;var addContextMenu,removeContextMenu,contextMenusMap={},contextMenuOnClicks={};contextMenuOnClicks={openCurrentImageInTab:function(b,a){currentImageUrl&&chrome.tabs.create({url:currentImageUrl,selected:true,index:a.index+1},function(){})},downloadCurrentImage:function(b,a){currentImageUrl&&chrome.tabs.update(a.id,{url:currentImageUrl+"?dl=1"},function(){})},openOptions:function(b,a){b=b||{};chrome.tabs.create({url:chrome.extension.getURL("html/options.html")+(b.hash?"#"+b.hash:""),selected:true,index:(a&&a.index+1)||9999},function(){})},toggleEnabled:function(b,a){RG3.storage.set("enabled",!RG3.storage.get("enabled"));chrome.contextMenus.update(contextMenusMap.toggleEnable,{checked:RG3.storage.get("enabled")});updateTabs()}};addContextMenu=function(b,c){var a={type:"normal",title:"",documentUrlPatterns:["http://*.facebook.com/*","http://facebook.com/*","https://*.facebook.com/*","https://facebook.com/*"]};c=c||{};a.type=c.type||a.type;a.title=c.title||a.title;a.contexts=c.contexts||["all"];if(a.type=="checkbox"||a.type=="radio"){a.checked=typeof(c.checked)=="boolean"?c.checked:false}a.onclick=contextMenuOnClicks[b];if(contextMenusMap[b]){chrome.contextMenus.update(contextMenusMap[b],a,function(){})}else{contextMenusMap[b]=chrome.contextMenus.create(a,function(){})}};removeContextMenu=function(a){if(contextMenusMap[a]){chrome.contextMenus.remove(contextMenusMap[a]);delete contextMenusMap[a]}};removeContextMenus=function(){chrome.contextMenus.removeAll();contextMenusMap={}};Array.prototype.remove=function(c,b){var a=this.slice((b||c)+1||this.length);this.length=c<0?this.length+c:c;return this.push.apply(this,a)};var tabs=[];function addTab(a){if(tabs.indexOf(a.id)==-1){tabs.push(a.id)}}function removeTab(a){if(tabs.indexOf(a)>-1){tabs.remove(a)}}var t;function updateTabs(){sendToTabs({name:"updateOptions"});if(RG3.storage.get("hideContextMenu")){removeContextMenus()}else{addContextMenu("toggleEnabled",{type:"checkbox",title:"Enabled",checked:RG3.storage.get("enabled")==null?true:!!RG3.storage.get("enabled")});addContextMenu("openOptions",{title:"Open Options Page"})}}function sendToTabs(c){for(var b=0,a=tabs.length;b<a;b++){chrome.tabs.sendRequest(tabs[b],c,function(d){})}}chrome.tabs.onRemoved.addListener(function(a){removeTab(a)});function openDebugLog(){chrome.tabs.create({url:chrome.extension.getURL("html/debug.html"),selected:true})}function debuglog(d,f,b){if(RG3.storage.get("debug")){var a,c;try{c=RG3.storage.get("debuglog")?JSON.parse(RG3.storage.get("debuglog")):[]}catch(g){c=[]}a={date:(new Date()).toString(),type:d||"info",message:f,data:b||"null"};c.unshift(a);c.length>500&&(c.length=500);RG3.storage.set("debuglog",JSON.stringify(c))}}chrome.extension.onRequest.addListener(function(f,h,a){switch(f.name){case"setEnabled":RG3.storage.set("enabled",!!f.value);a({});updateTabs();if(f.value){_gaq.push(["_trackEvent","Functionality","Enabled"])}else{_gaq.push(["_trackEvent","Functionality","Disabled"])}break;case"get":if(f.key){a(RG3.storage.get(f.key))}else{if(f.keys){var g={},m=f.keys.split(","),j,b=m.length;for(j=0;j<b;j++){g[m[j]]=RG3.storage.get(m[j])}a(g)}}break;case"set":if(RG3.storage.get(f.key)!==f.value){RG3.storage.set(f.key,f.value);updateIcon();updateTabs()}a({});break;case"getOptions":var d={},c;for(var c in localStorage){d[c]=RG3.storage.get(c)}if(extDetails){d.name=extDetails.name;d.version=extDetails.version;d.id=extDetails.id}addTab(h.tab);a({value:d});break;case"getGraphInfo":sendToTabs({name:"callback",callback_key:f.callback_key,data:null});a({});break;case"updateTabs":updateTabs();a({});break;case"getExtDetails":if(f.key){a(extDetails[f.key])}else{if(f.keys){var g={},m=f.keys.split(","),j,b=m.length;for(j=0;j<b;j++){g[m[j]]=extDetails[m[j]]}a(g)}else{a(extDetails)}}break;case"setCurrentImage":currentImageUrl=f.value;if(!RG3.storage.get("hideContextMenu")&&currentImageUrl){addContextMenu("downloadCurrentImage",{title:"Download zoomed photo"});addContextMenu("openCurrentImageInTab",{title:"Open zoomed photo in new tab"})}else{if(!RG3.storage.get("hideContextMenu")&&!currentImageUrl){removeContextMenu("downloadCurrentImage");removeContextMenu("openCurrentImageInTab")}}a({});if(f.value){_gaq.push(["_trackEvent","Photos","Zoom"])}break;case"openImage":openImage({},h.tab||{});a({});break;case"openOptions":contextMenuOnClicks.openOptions();a({});break;case"log":debuglog(f.type,f.message,f.data);break}});updateTabs();var version,release;version=extDetails.version;release="release"+version;if(!RG3.storage.get("launch_release20101207")){contextMenuOnClicks.openOptions();RG3.storage.set("launch_release20101207",true)}if(RG3.storage.get("release20110926_1")){RG3.storage.set("installed",true)}if(!RG3.storage.get("release20120611_1")){_gaq.push(["_trackEvent",RG3.storage.get("installed")?"Upgrade":"Install","1.1206.11.1"]);RG3.storage.set("release20120611_1",true);RG3.storage.set("installed",true)}if(!RG3.storage.get(release)){_gaq.push(["_trackEvent",RG3.storage.get("installed")?"Upgrade":"Install",String(version)]);RG3.storage.set(release,true);RG3.storage.set("installed",true)};"\n" 
