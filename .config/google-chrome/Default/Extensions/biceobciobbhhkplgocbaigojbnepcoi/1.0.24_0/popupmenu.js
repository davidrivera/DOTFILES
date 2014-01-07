//chrome.tabs.getSelected(null, function(tab) {
    //chrome.tabs.sendRequest(tab.id, {"message" : "request"}, function(response) {
    //    getSwfUrl(response.result);
    //});
//});

chrome.tabs.executeScript(null,{file : 'common.js',allFrames : true},function(){
    //var code = "getDocs();";
    //chrome.tabs.executeScript(null, {code : code,allFrames : true});
    var winBackgroundPage = chrome.extension.getBackgroundPage();
    getSwfUrl(winBackgroundPage.data);
    winBackgroundPage.data = [];
});

function getSwfUrl(e){
    var str = "";
    if(e.length > 0){        
        var validateURLsArr = e; 
        for(var i = 0;i < validateURLsArr.length;i++){
            str += "<table width='206' border='0' cellpadding='0' cellspacing='0'>"+
                   "<tr onmouseover='this.style.backgroundColor =\"#cccccc\"' onmouseout='this.style.backgroundColor = \"#f5f5f5\"'>"+
                   "<td align='left'><a href='javascript:;' onmouseover='preSwf(\""+validateURLsArr[i]+"\")'"+
                   "onclick='openSwf(\""+validateURLsArr[i]+"\")'>"+subStr(validateURLsArr[i])+"</a></td><td align='right'>"+getFileSize(validateURLsArr[i])+"</td></tr></table>";
        }
        $("#maincontent").html(str);
    }
    else
    {
        str = "<div style='text-align:center;color:#9d9da1;line-height:100px;'>No SWF file(s) in this webpage.</div>";
        $("#maincontent").html(str);
    }
}

function subStr(str){
    var strArr = str.split("/");
    var tmp ;
    for(var i = 0;i < strArr.length;i++)
    {
        if(strArr[i].toLowerCase().indexOf(".swf") > -1)
        {
            tmp = strArr[i];
            break;
        }
    }
    
    if(tmp.indexOf("?") > -1)
    {
        tmp = tmp.substring(0,tmp.indexOf("?"));
    }
    
    if(tmp.length > 20)
    {
        tmp = tmp.substring(0,20)+"...";
    }
    
    return tmp;
}

function getFileSize(src){
    var xhr = new XMLHttpRequest(),oImgFileSize;
    xhr.open("GET",src,false);
    xhr.onreadystatechange = function()
    {
        if(xhr.status==200&&xhr.readyState==4)
        {
            oImgFileSize=xhr.getResponseHeader("Content-Length");
        }
        else if(xhr.status>=300)
        {
            oImgFileSize = "?";
        }
    }
    xhr.send(null);
    return oImgFileSize;
}

function preSwf(src){
    document.getElementById("preview").style.display = "block";
    swfobject.embedSWF(src, "swf_container", "100%", "100%", "10", "#FFFFFF");
}

function openSwf(src){
    chrome.tabs.create( { url:src });
    
    //var nwin = window.open();
    //nwin.location = src;
    
    //var plugin = document.getElementById("pluginId");
    //var des = "C:\Users\chenting\Desktop";
    //plugin.SaveURItoPath(src,des);  // call a method in your plugin
}