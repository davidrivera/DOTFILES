(function() {var h,l=this,m=function(a){var b=typeof a;if("object"==b)if(a){if(a instanceof Array)return"array";if(a instanceof Object)return b;var c=Object.prototype.toString.call(a);if("[object Window]"==c)return"object";if("[object Array]"==c||"number"==typeof a.length&&"undefined"!=typeof a.splice&&"undefined"!=typeof a.propertyIsEnumerable&&!a.propertyIsEnumerable("splice"))return"array";if("[object Function]"==c||"undefined"!=typeof a.call&&"undefined"!=typeof a.propertyIsEnumerable&&!a.propertyIsEnumerable("call"))return"function"}else return"null";
else if("function"==b&&"undefined"==typeof a.call)return"object";return b},n=function(a,b){function c(){}c.prototype=b.prototype;a.l=b.prototype;a.prototype=new c};chrome.i={};chrome.i.m={};chrome.i.m.o=function(){};var r=Array.prototype,aa=r.indexOf?function(a,b,c){return r.indexOf.call(a,b,c)}:function(a,b,c){c=null==c?0:0>c?Math.max(0,a.length+c):c;if("string"==typeof a)return"string"==typeof b&&1==b.length?a.indexOf(b,c):-1;for(;c<a.length;c++)if(c in a&&a[c]===b)return c;return-1};var s=function(a){s[" "](a);return a};s[" "]=function(){};var t,u,v,w,x=function(){return l.navigator?l.navigator.userAgent:null};w=v=u=t=!1;var y;if(y=x()){var ba=l.navigator;t=0==y.lastIndexOf("Opera",0);u=!t&&(-1!=y.indexOf("MSIE")||-1!=y.indexOf("Trident"));v=!t&&-1!=y.indexOf("WebKit");w=!t&&!v&&!u&&"Gecko"==ba.product}var z=t,A=u,B=w,C=v,D=function(){var a=l.document;return a?a.documentMode:void 0},E;
t:{var F="",G;if(z&&l.opera)var H=l.opera.version,F="function"==typeof H?H():H;else if(B?G=/rv\:([^\);]+)(\)|;)/:A?G=/\b(?:MSIE|rv)[: ]([^\);]+)(\)|;)/:C&&(G=/WebKit\/(\S+)/),G)var I=G.exec(x()),F=I?I[1]:"";if(A){var J=D();if(J>parseFloat(F)){E=String(J);break t}}E=F}
var K=E,L={},M=function(a){var b;if(!(b=L[a])){b=0;for(var c=String(K).replace(/^[\s\xa0]+|[\s\xa0]+$/g,"").split("."),e=String(a).replace(/^[\s\xa0]+|[\s\xa0]+$/g,"").split("."),d=Math.max(c.length,e.length),f=0;0==b&&f<d;f++){var g=c[f]||"",k=e[f]||"",ta=RegExp("(\\d*)(\\D*)","g"),ua=RegExp("(\\d*)(\\D*)","g");do{var p=ta.exec(g)||["","",""],q=ua.exec(k)||["","",""];if(0==p[0].length&&0==q[0].length)break;b=((0==p[1].length?0:parseInt(p[1],10))<(0==q[1].length?0:parseInt(q[1],10))?-1:(0==p[1].length?
0:parseInt(p[1],10))>(0==q[1].length?0:parseInt(q[1],10))?1:0)||((0==p[2].length)<(0==q[2].length)?-1:(0==p[2].length)>(0==q[2].length)?1:0)||(p[2]<q[2]?-1:p[2]>q[2]?1:0)}while(0==b)}b=L[a]=0<=b}return b},N=l.document,ca=N&&A?D()||("CSS1Compat"==N.compatMode?parseInt(K,10):5):void 0;var da=!A||A&&9<=ca,ea=A&&!M("9");!C||M("528");B&&M("1.9b")||A&&M("8")||z&&M("9.5")||C&&M("528");B&&!M("8")||A&&M("9");var fa=function(){};var O=function(a,b){this.type=a;this.currentTarget=this.target=b};O.prototype.f=!1;O.prototype.defaultPrevented=!1;O.prototype.preventDefault=function(){this.defaultPrevented=!0};var P=function(a,b){if(a){var c=this.type=a.type;O.call(this,c);this.target=a.target||a.srcElement;this.currentTarget=b;var e=a.relatedTarget;if(e){if(B){var d;t:{try{s(e.nodeName);d=!0;break t}catch(f){}d=!1}d||(e=null)}}else"mouseover"==c?e=a.fromElement:"mouseout"==c&&(e=a.toElement);this.relatedTarget=e;this.offsetX=C||void 0!==a.offsetX?a.offsetX:a.layerX;this.offsetY=C||void 0!==a.offsetY?a.offsetY:a.layerY;this.clientX=void 0!==a.clientX?a.clientX:a.pageX;this.clientY=void 0!==a.clientY?a.clientY:
a.pageY;this.screenX=a.screenX||0;this.screenY=a.screenY||0;this.button=a.button;this.keyCode=a.keyCode||0;this.charCode=a.charCode||("keypress"==c?a.keyCode:0);this.ctrlKey=a.ctrlKey;this.altKey=a.altKey;this.shiftKey=a.shiftKey;this.metaKey=a.metaKey;this.state=a.state;this.h=a;a.defaultPrevented&&this.preventDefault();delete this.f}};n(P,O);h=P.prototype;h.target=null;h.relatedTarget=null;h.offsetX=0;h.offsetY=0;h.clientX=0;h.clientY=0;h.screenX=0;h.screenY=0;h.button=0;h.keyCode=0;
h.charCode=0;h.ctrlKey=!1;h.altKey=!1;h.shiftKey=!1;h.metaKey=!1;h.h=null;h.preventDefault=function(){P.l.preventDefault.call(this);var a=this.h;if(a.preventDefault)a.preventDefault();else if(a.returnValue=!1,ea)try{if(a.ctrlKey||112<=a.keyCode&&123>=a.keyCode)a.keyCode=-1}catch(b){}};var ga="closure_listenable_"+(1E6*Math.random()|0),ha=function(a){try{return!(!a||!a[ga])}catch(b){return!1}},ia=0;var ja=function(a,b,c,e,d){this.b=a;this.proxy=null;this.src=b;this.type=c;this.capture=!!e;this.c=d;this.key=++ia;this.removed=this.d=!1},ka=function(a){a.removed=!0;a.b=null;a.proxy=null;a.src=null;a.c=null};var Q=function(a){this.src=a;this.a={};this.e=0};Q.prototype.add=function(a,b,c,e,d){var f=this.a[a];f||(f=this.a[a]=[],this.e++);var g;t:{for(g=0;g<f.length;++g){var k=f[g];if(!k.removed&&k.b==b&&k.capture==!!e&&k.c==d)break t}g=-1}-1<g?(a=f[g],c||(a.d=!1)):(a=new ja(b,this.src,a,!!e,d),a.d=c,f.push(a));return a};var la=function(a,b){var c=b.type;if(c in a.a){var e=a.a[c],d=aa(e,b),f;(f=0<=d)&&r.splice.call(e,d,1);f&&(ka(b),0==a.a[c].length&&(delete a.a[c],a.e--))}};var R="closure_lm_"+(1E6*Math.random()|0),S={},ma=0,na=function(a,b,c,e,d){if("array"==m(b)){for(var f=0;f<b.length;f++)na(a,b[f],c,e,d);return null}c=oa(c);if(ha(a))a=a.listen(b,c,e,d);else{if(!b)throw Error("Invalid event type");var f=!!e,g=T(a);g||(a[R]=g=new Q(a));c=g.add(b,c,!1,e,d);c.proxy||(e=pa(),c.proxy=e,e.src=a,e.b=c,a.addEventListener?a.addEventListener(b,e,f):a.attachEvent(b in S?S[b]:S[b]="on"+b,e),ma++);a=c}return a},pa=function(){var a=qa,b=da?function(c){return a.call(b.src,b.b,c)}:
function(c){c=a.call(b.src,b.b,c);if(!c)return c};return b},sa=function(a,b,c,e){var d=1;if(a=T(a))if(b=a.a[b]){a=b.length;if(0<a){for(var f=Array(a),g=0;g<a;g++)f[g]=b[g];b=f}else b=[];for(a=0;a<b.length;a++)(f=b[a])&&f.capture==c&&!f.removed&&(d&=!1!==ra(f,e))}return Boolean(d)},ra=function(a,b){var c=a.b,e=a.c||a.src;if(a.d&&"number"!=typeof a&&a&&!a.removed){var d=a.src;if(ha(d))la(d.n,a);else{var f=a.type,g=a.proxy;d.removeEventListener?d.removeEventListener(f,g,a.capture):d.detachEvent&&d.detachEvent(f in
S?S[f]:S[f]="on"+f,g);ma--;(f=T(d))?(la(f,a),0==f.e&&(f.src=null,d[R]=null)):ka(a)}}return c.call(e,b)},qa=function(a,b){if(a.removed)return!0;if(!da){var c;if(!(c=b))t:{c=["window","event"];for(var e=l,d;d=c.shift();)if(null!=e[d])e=e[d];else{c=null;break t}c=e}d=c;c=new P(d,this);e=!0;if(!(0>d.keyCode||void 0!=d.returnValue)){t:{var f=!1;if(0==d.keyCode)try{d.keyCode=-1;break t}catch(g){f=!0}if(f||void 0==d.returnValue)d.returnValue=!0}d=[];for(f=c.currentTarget;f;f=f.parentNode)d.push(f);for(var f=
a.type,k=d.length-1;!c.f&&0<=k;k--)c.currentTarget=d[k],e&=sa(d[k],f,!0,c);for(k=0;!c.f&&k<d.length;k++)c.currentTarget=d[k],e&=sa(d[k],f,!1,c)}return e}return ra(a,new P(b,this))},T=function(a){a=a[R];return a instanceof Q?a:null},va="__closure_events_fn_"+(1E9*Math.random()>>>0),oa=function(a){return"function"==m(a)?a:a[va]||(a[va]=function(b){return a.handleEvent(b)})};var U=function(){};U.prototype.g=null;U.prototype.getChildren=function(){this.g||(this.g={});return this.g};U.prototype.info=function(){};var V={},W=null,wa=function(a){W||(W=new U,V[""]=W);var b;if(!(b=V[a])){b=new U;var c=a.lastIndexOf("."),e=a.substr(c+1);wa(a.substr(0,c)).getChildren()[e]=b;V[a]=b}return b};!B&&!A||A&&A&&9<=ca||B&&M("1.9.1");A&&M("9");var X=function(a){this.j=a;this.k={}};n(X,fa);var xa=[];X.prototype.listen=function(a,b,c,e,d){"array"!=m(b)&&(xa[0]=b,b=xa);for(var f=0;f<b.length;f++){var g=na(a,b[f],c||this,e||!1,d||this.j||this);if(!g)break;this.k[g.key]=g}return this};X.prototype.handleEvent=function(){throw Error("EventHandler.handleEvent not implemented");};var ya=function(){X.call(this)};n(ya,X);var Aa=za,Y=["tblf","htsa","initOptions"],Z=l;Y[0]in Z||!Z.execScript||Z.execScript("var "+Y[0]);for(var $;Y.length&&($=Y.shift());)Y.length||void 0===Aa?Z=Z[$]?Z[$]:Z[$]={}:Z[$]=Aa;
var Ba=null,Ca={"pref-navigate-new-tab":{type:"checkbox",defaultValue:"true"},"pref-enable-https":{type:"checkbox",defaultValue:"false"},"pref-show-search-button-on-select":{type:"checkbox",defaultValue:"true"}},za=function(){wa("tblf.htsa").info("initOptions()");Ba=new ya;document.body.appendChild(Da())},Da=function(){var a=document.createElement("form");a.id="option-form";for(var b in Ca){var c=document.createElement("fieldset"),e=Ca[b];switch(e.type){case "checkbox":var d=document.createElement("input");
d.type="checkbox";d.name=b;d.id=b;d.checked="false"!=(window.localStorage.getItem(b)||e.defaultValue);e=document.createElement("label");e.setAttribute("for",b);e.appendChild(document.createTextNode(chrome.i18n.getMessage(b.split("-").join("_"))));c.appendChild(d);c.appendChild(e);Ba.listen(d,"change",Ea,!1)}a.appendChild(c)}return a},Ea=function(a){a=a.target;var b=a.name;switch(a.type){case "checkbox":window.localStorage.setItem(b,a.checked?"true":"false")}};window.onload=function(){za()};})()
