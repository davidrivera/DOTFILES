//var commons = {
//    //init :  function(){
//    //    chrome.extension.sendRequest({"ret":""},function(response){
//    //        if(response){
//    //            commons.setUrlsToArray();
//    //        }
//    //    });  
//    //},
//    setUrlsToArray : function(){
//        var urls = [];
//        var objects = document.getElementsByTagName("embed");
//        //alert(objects.length);
//        if(objects.length > 0){
//            for(var i=0;i<objects.length;i++){
//                urls.push(objects[i].src);
//            }
//            chrome.extension.sendRequest({"ret":urls});
//        }else{
//            chrome.extension.sendRequest({"ret":null});
//        }
//    }
//}
//commons.setUrlsToArray();

//获取页面中的swf
//function getParams()
//{
//    var params = new Array();
//    var objects = document.getElementsByTagName("embed");
//    if(objects.length > 0){
//        for(var i=0;i<objects.length;i++){
//            //alert(objects[i].src);
//            params.push(objects[i].src);
//        }
//    }
//    return params;
//}

//chrome.extension.onRequest.addListener(
//    function(request, sender, sendResponse)
//    {
//        if(request.message == "request")
//        {
//            sendResponse({"result" : getParams()});
//        }
//    }
//);

//function getDocs()
//{
//    getParams(document);
//}

getParams(document);

function getParams(elm)
{
    var isFind = false;
    if(!elm || !elm.firstChild) return isFind;
    for(var c = elm.firstChild; c; c = c.nextSibling)
    {
        var nm = c.nodeName.toUpperCase();
        
        if(nm == 'OBJECT')
        {
            if(c.data){
                isFind = true;
                chrome.extension.sendRequest({result : c.data});
            }else{
                var obj = c.getElementsByTagName("embed")[0];
                isFind = true;
                chrome.extension.sendRequest({result : obj.src});
            }
        }
        else if(nm == 'EMBED')
        {
            isFind = true;
            chrome.extension.sendRequest({result : c.src});
        }
        else if(c.firstChild)
        {
            if(getParams(c))
            {
                isFind = true;
            }
        }
    }
    return isFind;
}