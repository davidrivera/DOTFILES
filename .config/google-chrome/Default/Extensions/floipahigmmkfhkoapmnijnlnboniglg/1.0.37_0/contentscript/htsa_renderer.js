(function(){if(window==window.top&&(window.google=window.google||{},window.google.htsa=window.google.htsa||{},!window.google.htsa.$a)){window.google.htsa.$a=!0;var a=chrome.extension.connect({name:"htsaRendererToBackground"}),b=new $(a,document);a.onMessage.addListener(function(a){switch(a.command){case "htsaRender":var d=B(document);if(a.name||a.src!=document.URL){var e;e=a.name;for(var g=null,h=document.getElementsByTagName("iframe"),q=h.length,F=nc(a.src),r=0;r<q;r++){var k;if(!(k=h[r].name&&h[r].name==
e)&&(k=h[r].src)){var z=F,s=nc(h[r].src);k=z.l();var u=!!s.R;u?dc(k,s.R):u=!!s.V;if(u){var l=k,A=s.V;W(l);l.V=A}else u=!!s.M;u?(l=k,A=s.M,W(l),l.M=A):u=null!=s.j;l=s.H;if(u)ec(k,s.j);else if(u=!!s.H)if("/"!=l.charAt(0)&&(z.M&&!z.H?l="/"+l:(z=k.H.lastIndexOf("/"),-1!=z&&(l=k.H.substr(0,z+1)+l))),".."==l||"."==l)l="";else if(-1!=l.indexOf("./")||-1!=l.indexOf("/.")){for(var z=0==l.lastIndexOf("/",0),l=l.split("/"),A=[],Qa=0;Qa<l.length;){var ob=l[Qa++];"."==ob?z&&Qa==l.length&&A.push(""):".."==ob?((1<
A.length||1==A.length&&""!=A[0])&&A.pop(),z&&Qa==l.length&&A.push("")):(A.push(ob),z=!0)}l=A.join("/")}u?(z=k,W(z),z.H=l):u=""!==s.D.toString();u?fc(k,s.D.toString()?decodeURIComponent(s.D.toString()):""):u=!!s.U;u&&(u=k,s=s.U,W(u),u.U=s);k=k.toString()==F.toString()}if(k){g=h[r];break}}g||Ta("tblf.htsa");(e=g)&&(d=Wb(e))}d=new y(a.x+d.x,a.y+d.y);b.Fa(d.x,d.y,a.query);a.doFocus&&xc(b);break;case "htsaUnrender":b.J()}});a.onDisconnect.addListener(function(){b.J();window.google.htsa.$a=!1})}})();