/*! jQuery v@1.8.1 jquery.com | jquery.org/license */
(function(a,b){function G(a){var b=F[a]={};return p.each(a.split(s),function(a,c){b[c]=!0}),b}function J(a,c,d){if(d===b&&a.nodeType===1){var e="data-"+c.replace(I,"-$1").toLowerCase();d=a.getAttribute(e);if(typeof d=="string"){try{d=d==="true"?!0:d==="false"?!1:d==="null"?null:+d+""===d?+d:H.test(d)?p.parseJSON(d):d}catch(f){}p.data(a,c,d)}else d=b}return d}function K(a){var b;for(b in a){if(b==="data"&&p.isEmptyObject(a[b]))continue;if(b!=="toJSON")return!1}return!0}function ba(){return!1}function bb(){return!0}function bh(a){return!a||!a.parentNode||a.parentNode.nodeType===11}function bi(a,b){do a=a[b];while(a&&a.nodeType!==1);return a}function bj(a,b,c){b=b||0;if(p.isFunction(b))return p.grep(a,function(a,d){var e=!!b.call(a,d,a);return e===c});if(b.nodeType)return p.grep(a,function(a,d){return a===b===c});if(typeof b=="string"){var d=p.grep(a,function(a){return a.nodeType===1});if(be.test(b))return p.filter(b,d,!c);b=p.filter(b,d)}return p.grep(a,function(a,d){return p.inArray(a,b)>=0===c})}function bk(a){var b=bl.split("|"),c=a.createDocumentFragment();if(c.createElement)while(b.length)c.createElement(b.pop());return c}function bC(a,b){return a.getElementsByTagName(b)[0]||a.appendChild(a.ownerDocument.createElement(b))}function bD(a,b){if(b.nodeType!==1||!p.hasData(a))return;var c,d,e,f=p._data(a),g=p._data(b,f),h=f.events;if(h){delete g.handle,g.events={};for(c in h)for(d=0,e=h[c].length;d<e;d++)p.event.add(b,c,h[c][d])}g.data&&(g.data=p.extend({},g.data))}function bE(a,b){var c;if(b.nodeType!==1)return;b.clearAttributes&&b.clearAttributes(),b.mergeAttributes&&b.mergeAttributes(a),c=b.nodeName.toLowerCase(),c==="object"?(b.parentNode&&(b.outerHTML=a.outerHTML),p.support.html5Clone&&a.innerHTML&&!p.trim(b.innerHTML)&&(b.innerHTML=a.innerHTML)):c==="input"&&bv.test(a.type)?(b.defaultChecked=b.checked=a.checked,b.value!==a.value&&(b.value=a.value)):c==="option"?b.selected=a.defaultSelected:c==="input"||c==="textarea"?b.defaultValue=a.defaultValue:c==="script"&&b.text!==a.text&&(b.text=a.text),b.removeAttribute(p.expando)}function bF(a){return typeof a.getElementsByTagName!="undefined"?a.getElementsByTagName("*"):typeof a.querySelectorAll!="undefined"?a.querySelectorAll("*"):[]}function bG(a){bv.test(a.type)&&(a.defaultChecked=a.checked)}function bY(a,b){if(b in a)return b;var c=b.charAt(0).toUpperCase()+b.slice(1),d=b,e=bW.length;while(e--){b=bW[e]+c;if(b in a)return b}return d}function bZ(a,b){return a=b||a,p.css(a,"display")==="none"||!p.contains(a.ownerDocument,a)}function b$(a,b){var c,d,e=[],f=0,g=a.length;for(;f<g;f++){c=a[f];if(!c.style)continue;e[f]=p._data(c,"olddisplay"),b?(!e[f]&&c.style.display==="none"&&(c.style.display=""),c.style.display===""&&bZ(c)&&(e[f]=p._data(c,"olddisplay",cc(c.nodeName)))):(d=bH(c,"display"),!e[f]&&d!=="none"&&p._data(c,"olddisplay",d))}for(f=0;f<g;f++){c=a[f];if(!c.style)continue;if(!b||c.style.display==="none"||c.style.display==="")c.style.display=b?e[f]||"":"none"}return a}function b_(a,b,c){var d=bP.exec(b);return d?Math.max(0,d[1]-(c||0))+(d[2]||"px"):b}function ca(a,b,c,d){var e=c===(d?"border":"content")?4:b==="width"?1:0,f=0;for(;e<4;e+=2)c==="margin"&&(f+=p.css(a,c+bV[e],!0)),d?(c==="content"&&(f-=parseFloat(bH(a,"padding"+bV[e]))||0),c!=="margin"&&(f-=parseFloat(bH(a,"border"+bV[e]+"Width"))||0)):(f+=parseFloat(bH(a,"padding"+bV[e]))||0,c!=="padding"&&(f+=parseFloat(bH(a,"border"+bV[e]+"Width"))||0));return f}function cb(a,b,c){var d=b==="width"?a.offsetWidth:a.offsetHeight,e=!0,f=p.support.boxSizing&&p.css(a,"boxSizing")==="border-box";if(d<=0||d==null){d=bH(a,b);if(d<0||d==null)d=a.style[b];if(bQ.test(d))return d;e=f&&(p.support.boxSizingReliable||d===a.style[b]),d=parseFloat(d)||0}return d+ca(a,b,c||(f?"border":"content"),e)+"px"}function cc(a){if(bS[a])return bS[a];var b=p("<"+a+">").appendTo(e.body),c=b.css("display");b.remove();if(c==="none"||c===""){bI=e.body.appendChild(bI||p.extend(e.createElement("iframe"),{frameBorder:0,width:0,height:0}));if(!bJ||!bI.createElement)bJ=(bI.contentWindow||bI.contentDocument).document,bJ.write("<!doctype html><html><body>"),bJ.close();b=bJ.body.appendChild(bJ.createElement(a)),c=bH(b,"display"),e.body.removeChild(bI)}return bS[a]=c,c}function ci(a,b,c,d){var e;if(p.isArray(b))p.each(b,function(b,e){c||ce.test(a)?d(a,e):ci(a+"["+(typeof e=="object"?b:"")+"]",e,c,d)});else if(!c&&p.type(b)==="object")for(e in b)ci(a+"["+e+"]",b[e],c,d);else d(a,b)}function cz(a){return function(b,c){typeof b!="string"&&(c=b,b="*");var d,e,f,g=b.toLowerCase().split(s),h=0,i=g.length;if(p.isFunction(c))for(;h<i;h++)d=g[h],f=/^\+/.test(d),f&&(d=d.substr(1)||"*"),e=a[d]=a[d]||[],e[f?"unshift":"push"](c)}}function cA(a,c,d,e,f,g){f=f||c.dataTypes[0],g=g||{},g[f]=!0;var h,i=a[f],j=0,k=i?i.length:0,l=a===cv;for(;j<k&&(l||!h);j++)h=i[j](c,d,e),typeof h=="string"&&(!l||g[h]?h=b:(c.dataTypes.unshift(h),h=cA(a,c,d,e,h,g)));return(l||!h)&&!g["*"]&&(h=cA(a,c,d,e,"*",g)),h}function cB(a,c){var d,e,f=p.ajaxSettings.flatOptions||{};for(d in c)c[d]!==b&&((f[d]?a:e||(e={}))[d]=c[d]);e&&p.extend(!0,a,e)}function cC(a,c,d){var e,f,g,h,i=a.contents,j=a.dataTypes,k=a.responseFields;for(f in k)f in d&&(c[k[f]]=d[f]);while(j[0]==="*")j.shift(),e===b&&(e=a.mimeType||c.getResponseHeader("content-type"));if(e)for(f in i)if(i[f]&&i[f].test(e)){j.unshift(f);break}if(j[0]in d)g=j[0];else{for(f in d){if(!j[0]||a.converters[f+" "+j[0]]){g=f;break}h||(h=f)}g=g||h}if(g)return g!==j[0]&&j.unshift(g),d[g]}function cD(a,b){var c,d,e,f,g=a.dataTypes.slice(),h=g[0],i={},j=0;a.dataFilter&&(b=a.dataFilter(b,a.dataType));if(g[1])for(c in a.converters)i[c.toLowerCase()]=a.converters[c];for(;e=g[++j];)if(e!=="*"){if(h!=="*"&&h!==e){c=i[h+" "+e]||i["* "+e];if(!c)for(d in i){f=d.split(" ");if(f[1]===e){c=i[h+" "+f[0]]||i["* "+f[0]];if(c){c===!0?c=i[d]:i[d]!==!0&&(e=f[0],g.splice(j--,0,e));break}}}if(c!==!0)if(c&&a["throws"])b=c(b);else try{b=c(b)}catch(k){return{state:"parsererror",error:c?k:"No conversion from "+h+" to "+e}}}h=e}return{state:"success",data:b}}function cL(){try{return new a.XMLHttpRequest}catch(b){}}function cM(){try{return new a.ActiveXObject("Microsoft.XMLHTTP")}catch(b){}}function cU(){return setTimeout(function(){cN=b},0),cN=p.now()}function cV(a,b){p.each(b,function(b,c){var d=(cT[b]||[]).concat(cT["*"]),e=0,f=d.length;for(;e<f;e++)if(d[e].call(a,b,c))return})}function cW(a,b,c){var d,e=0,f=0,g=cS.length,h=p.Deferred().always(function(){delete i.elem}),i=function(){var b=cN||cU(),c=Math.max(0,j.startTime+j.duration-b),d=1-(c/j.duration||0),e=0,f=j.tweens.length;for(;e<f;e++)j.tweens[e].run(d);return h.notifyWith(a,[j,d,c]),d<1&&f?c:(h.resolveWith(a,[j]),!1)},j=h.promise({elem:a,props:p.extend({},b),opts:p.extend(!0,{specialEasing:{}},c),originalProperties:b,originalOptions:c,startTime:cN||cU(),duration:c.duration,tweens:[],createTween:function(b,c,d){var e=p.Tween(a,j.opts,b,c,j.opts.specialEasing[b]||j.opts.easing);return j.tweens.push(e),e},stop:function(b){var c=0,d=b?j.tweens.length:0;for(;c<d;c++)j.tweens[c].run(1);return b?h.resolveWith(a,[j,b]):h.rejectWith(a,[j,b]),this}}),k=j.props;cX(k,j.opts.specialEasing);for(;e<g;e++){d=cS[e].call(j,a,k,j.opts);if(d)return d}return cV(j,k),p.isFunction(j.opts.start)&&j.opts.start.call(a,j),p.fx.timer(p.extend(i,{anim:j,queue:j.opts.queue,elem:a})),j.progress(j.opts.progress).done(j.opts.done,j.opts.complete).fail(j.opts.fail).always(j.opts.always)}function cX(a,b){var c,d,e,f,g;for(c in a){d=p.camelCase(c),e=b[d],f=a[c],p.isArray(f)&&(e=f[1],f=a[c]=f[0]),c!==d&&(a[d]=f,delete a[c]),g=p.cssHooks[d];if(g&&"expand"in g){f=g.expand(f),delete a[d];for(c in f)c in a||(a[c]=f[c],b[c]=e)}else b[d]=e}}function cY(a,b,c){var d,e,f,g,h,i,j,k,l=this,m=a.style,n={},o=[],q=a.nodeType&&bZ(a);c.queue||(j=p._queueHooks(a,"fx"),j.unqueued==null&&(j.unqueued=0,k=j.empty.fire,j.empty.fire=function(){j.unqueued||k()}),j.unqueued++,l.always(function(){l.always(function(){j.unqueued--,p.queue(a,"fx").length||j.empty.fire()})})),a.nodeType===1&&("height"in b||"width"in b)&&(c.overflow=[m.overflow,m.overflowX,m.overflowY],p.css(a,"display")==="inline"&&p.css(a,"float")==="none"&&(!p.support.inlineBlockNeedsLayout||cc(a.nodeName)==="inline"?m.display="inline-block":m.zoom=1)),c.overflow&&(m.overflow="hidden",p.support.shrinkWrapBlocks||l.done(function(){m.overflow=c.overflow[0],m.overflowX=c.overflow[1],m.overflowY=c.overflow[2]}));for(d in b){f=b[d];if(cP.exec(f)){delete b[d];if(f===(q?"hide":"show"))continue;o.push(d)}}g=o.length;if(g){h=p._data(a,"fxshow")||p._data(a,"fxshow",{}),q?p(a).show():l.done(function(){p(a).hide()}),l.done(function(){var b;p.removeData(a,"fxshow",!0);for(b in n)p.style(a,b,n[b])});for(d=0;d<g;d++)e=o[d],i=l.createTween(e,q?h[e]:0),n[e]=h[e]||p.style(a,e),e in h||(h[e]=i.start,q&&(i.end=i.start,i.start=e==="width"||e==="height"?1:0))}}function cZ(a,b,c,d,e){return new cZ.prototype.init(a,b,c,d,e)}function c$(a,b){var c,d={height:a},e=0;b=b?1:0;for(;e<4;e+=2-b)c=bV[e],d["margin"+c]=d["padding"+c]=a;return b&&(d.opacity=d.width=a),d}function da(a){return p.isWindow(a)?a:a.nodeType===9?a.defaultView||a.parentWindow:!1}var c,d,e=a.document,f=a.location,g=a.navigator,h=a.jQuery,i=a.$,j=Array.prototype.push,k=Array.prototype.slice,l=Array.prototype.indexOf,m=Object.prototype.toString,n=Object.prototype.hasOwnProperty,o=String.prototype.trim,p=function(a,b){return new p.fn.init(a,b,c)},q=/[\-+]?(?:\d*\.|)\d+(?:[eE][\-+]?\d+|)/.source,r=/\S/,s=/\s+/,t=/^[\s\uFEFF\xA0]+|[\s\uFEFF\xA0]+$/g,u=/^(?:[^#<]*(<[\w\W]+>)[^>]*$|#([\w\-]*)$)/,v=/^<(\w+)\s*\/?>(?:<\/\1>|)$/,w=/^[\],:{}\s]*$/,x=/(?:^|:|,)(?:\s*\[)+/g,y=/\\(?:["\\\/bfnrt]|u[\da-fA-F]{4})/g,z=/"[^"\\\r\n]*"|true|false|null|-?(?:\d\d*\.|)\d+(?:[eE][\-+]?\d+|)/g,A=/^-ms-/,B=/-([\da-z])/gi,C=function(a,b){return(b+"").toUpperCase()},D=function(){e.addEventListener?(e.removeEventListener("DOMContentLoaded",D,!1),p.ready()):e.readyState==="complete"&&(e.detachEvent("onreadystatechange",D),p.ready())},E={};p.fn=p.prototype={constructor:p,init:function(a,c,d){var f,g,h,i;if(!a)return this;if(a.nodeType)return this.context=this[0]=a,this.length=1,this;if(typeof a=="string"){a.charAt(0)==="<"&&a.charAt(a.length-1)===">"&&a.length>=3?f=[null,a,null]:f=u.exec(a);if(f&&(f[1]||!c)){if(f[1])return c=c instanceof p?c[0]:c,i=c&&c.nodeType?c.ownerDocument||c:e,a=p.parseHTML(f[1],i,!0),v.test(f[1])&&p.isPlainObject(c)&&this.attr.call(a,c,!0),p.merge(this,a);g=e.getElementById(f[2]);if(g&&g.parentNode){if(g.id!==f[2])return d.find(a);this.length=1,this[0]=g}return this.context=e,this.selector=a,this}return!c||c.jquery?(c||d).find(a):this.constructor(c).find(a)}return p.isFunction(a)?d.ready(a):(a.selector!==b&&(this.selector=a.selector,this.context=a.context),p.makeArray(a,this))},selector:"",jquery:"1.8.1",length:0,size:function(){return this.length},toArray:function(){return k.call(this)},get:function(a){return a==null?this.toArray():a<0?this[this.length+a]:this[a]},pushStack:function(a,b,c){var d=p.merge(this.constructor(),a);return d.prevObject=this,d.context=this.context,b==="find"?d.selector=this.selector+(this.selector?" ":"")+c:b&&(d.selector=this.selector+"."+b+"("+c+")"),d},each:function(a,b){return p.each(this,a,b)},ready:function(a){return p.ready.promise().done(a),this},eq:function(a){return a=+a,a===-1?this.slice(a):this.slice(a,a+1)},first:function(){return this.eq(0)},last:function(){return this.eq(-1)},slice:function(){return this.pushStack(k.apply(this,arguments),"slice",k.call(arguments).join(","))},map:function(a){return this.pushStack(p.map(this,function(b,c){return a.call(b,c,b)}))},end:function(){return this.prevObject||this.constructor(null)},push:j,sort:[].sort,splice:[].splice},p.fn.init.prototype=p.fn,p.extend=p.fn.extend=function(){var a,c,d,e,f,g,h=arguments[0]||{},i=1,j=arguments.length,k=!1;typeof h=="boolean"&&(k=h,h=arguments[1]||{},i=2),typeof h!="object"&&!p.isFunction(h)&&(h={}),j===i&&(h=this,--i);for(;i<j;i++)if((a=arguments[i])!=null)for(c in a){d=h[c],e=a[c];if(h===e)continue;k&&e&&(p.isPlainObject(e)||(f=p.isArray(e)))?(f?(f=!1,g=d&&p.isArray(d)?d:[]):g=d&&p.isPlainObject(d)?d:{},h[c]=p.extend(k,g,e)):e!==b&&(h[c]=e)}return h},p.extend({noConflict:function(b){return a.$===p&&(a.$=i),b&&a.jQuery===p&&(a.jQuery=h),p},isReady:!1,readyWait:1,holdReady:function(a){a?p.readyWait++:p.ready(!0)},ready:function(a){if(a===!0?--p.readyWait:p.isReady)return;if(!e.body)return setTimeout(p.ready,1);p.isReady=!0;if(a!==!0&&--p.readyWait>0)return;d.resolveWith(e,[p]),p.fn.trigger&&p(e).trigger("ready").off("ready")},isFunction:function(a){return p.type(a)==="function"},isArray:Array.isArray||function(a){return p.type(a)==="array"},isWindow:function(a){return a!=null&&a==a.window},isNumeric:function(a){return!isNaN(parseFloat(a))&&isFinite(a)},type:function(a){return a==null?String(a):E[m.call(a)]||"object"},isPlainObject:function(a){if(!a||p.type(a)!=="object"||a.nodeType||p.isWindow(a))return!1;try{if(a.constructor&&!n.call(a,"constructor")&&!n.call(a.constructor.prototype,"isPrototypeOf"))return!1}catch(c){return!1}var d;for(d in a);return d===b||n.call(a,d)},isEmptyObject:function(a){var b;for(b in a)return!1;return!0},error:function(a){throw new Error(a)},parseHTML:function(a,b,c){var d;return!a||typeof a!="string"?null:(typeof b=="boolean"&&(c=b,b=0),b=b||e,(d=v.exec(a))?[b.createElement(d[1])]:(d=p.buildFragment([a],b,c?null:[]),p.merge([],(d.cacheable?p.clone(d.fragment):d.fragment).childNodes)))},parseJSON:function(b){if(!b||typeof b!="string")return null;b=p.trim(b);if(a.JSON&&a.JSON.parse)return a.JSON.parse(b);if(w.test(b.replace(y,"@").replace(z,"]").replace(x,"")))return(new Function("return "+b))();p.error("Invalid JSON: "+b)},parseXML:function(c){var d,e;if(!c||typeof c!="string")return null;try{a.DOMParser?(e=new DOMParser,d=e.parseFromString(c,"text/xml")):(d=new ActiveXObject("Microsoft.XMLDOM"),d.async="false",d.loadXML(c))}catch(f){d=b}return(!d||!d.documentElement||d.getElementsByTagName("parsererror").length)&&p.error("Invalid XML: "+c),d},noop:function(){},globalEval:function(b){b&&r.test(b)&&(a.execScript||function(b){a.eval.call(a,b)})(b)},camelCase:function(a){return a.replace(A,"ms-").replace(B,C)},nodeName:function(a,b){return a.nodeName&&a.nodeName.toUpperCase()===b.toUpperCase()},each:function(a,c,d){var e,f=0,g=a.length,h=g===b||p.isFunction(a);if(d){if(h){for(e in a)if(c.apply(a[e],d)===!1)break}else for(;f<g;)if(c.apply(a[f++],d)===!1)break}else if(h){for(e in a)if(c.call(a[e],e,a[e])===!1)break}else for(;f<g;)if(c.call(a[f],f,a[f++])===!1)break;return a},trim:o&&!o.call("ï»¿Â ")?function(a){return a==null?"":o.call(a)}:function(a){return a==null?"":a.toString().replace(t,"")},makeArray:function(a,b){var c,d=b||[];return a!=null&&(c=p.type(a),a.length==null||c==="string"||c==="function"||c==="regexp"||p.isWindow(a)?j.call(d,a):p.merge(d,a)),d},inArray:function(a,b,c){var d;if(b){if(l)return l.call(b,a,c);d=b.length,c=c?c<0?Math.max(0,d+c):c:0;for(;c<d;c++)if(c in b&&b[c]===a)return c}return-1},merge:function(a,c){var d=c.length,e=a.length,f=0;if(typeof d=="number")for(;f<d;f++)a[e++]=c[f];else while(c[f]!==b)a[e++]=c[f++];return a.length=e,a},grep:function(a,b,c){var d,e=[],f=0,g=a.length;c=!!c;for(;f<g;f++)d=!!b(a[f],f),c!==d&&e.push(a[f]);return e},map:function(a,c,d){var e,f,g=[],h=0,i=a.length,j=a instanceof p||i!==b&&typeof i=="number"&&(i>0&&a[0]&&a[i-1]||i===0||p.isArray(a));if(j)for(;h<i;h++)e=c(a[h],h,d),e!=null&&(g[g.length]=e);else for(f in a)e=c(a[f],f,d),e!=null&&(g[g.length]=e);return g.concat.apply([],g)},guid:1,proxy:function(a,c){var d,e,f;return typeof c=="string"&&(d=a[c],c=a,a=d),p.isFunction(a)?(e=k.call(arguments,2),f=function(){return a.apply(c,e.concat(k.call(arguments)))},f.guid=a.guid=a.guid||f.guid||p.guid++,f):b},access:function(a,c,d,e,f,g,h){var i,j=d==null,k=0,l=a.length;if(d&&typeof d=="object"){for(k in d)p.access(a,c,k,d[k],1,g,e);f=1}else if(e!==b){i=h===b&&p.isFunction(e),j&&(i?(i=c,c=function(a,b,c){return i.call(p(a),c)}):(c.call(a,e),c=null));if(c)for(;k<l;k++)c(a[k],d,i?e.call(a[k],k,c(a[k],d)):e,h);f=1}return f?a:j?c.call(a):l?c(a[0],d):g},now:function(){return(new Date).getTime()}}),p.ready.promise=function(b){if(!d){d=p.Deferred();if(e.readyState==="complete")setTimeout(p.ready,1);else if(e.addEventListener)e.addEventListener("DOMContentLoaded",D,!1),a.addEventListener("load",p.ready,!1);else{e.attachEvent("onreadystatechange",D),a.attachEvent("onload",p.ready);var c=!1;try{c=a.frameElement==null&&e.documentElement}catch(f){}c&&c.doScroll&&function g(){if(!p.isReady){try{c.doScroll("left")}catch(a){return setTimeout(g,50)}p.ready()}}()}}return d.promise(b)},p.each("Boolean Number String Function Array Date RegExp Object".split(" "),function(a,b){E["[object "+b+"]"]=b.toLowerCase()}),c=p(e);var F={};p.Callbacks=function(a){a=typeof a=="string"?F[a]||G(a):p.extend({},a);var c,d,e,f,g,h,i=[],j=!a.once&&[],k=function(b){c=a.memory&&b,d=!0,h=f||0,f=0,g=i.length,e=!0;for(;i&&h<g;h++)if(i[h].apply(b[0],b[1])===!1&&a.stopOnFalse){c=!1;break}e=!1,i&&(j?j.length&&k(j.shift()):c?i=[]:l.disable())},l={add:function(){if(i){var b=i.length;(function d(b){p.each(b,function(b,c){var e=p.type(c);e==="function"&&(!a.unique||!l.has(c))?i.push(c):c&&c.length&&e!=="string"&&d(c)})})(arguments),e?g=i.length:c&&(f=b,k(c))}return this},remove:function(){return i&&p.each(arguments,function(a,b){var c;while((c=p.inArray(b,i,c))>-1)i.splice(c,1),e&&(c<=g&&g--,c<=h&&h--)}),this},has:function(a){return p.inArray(a,i)>-1},empty:function(){return i=[],this},disable:function(){return i=j=c=b,this},disabled:function(){return!i},lock:function(){return j=b,c||l.disable(),this},locked:function(){return!j},fireWith:function(a,b){return b=b||[],b=[a,b.slice?b.slice():b],i&&(!d||j)&&(e?j.push(b):k(b)),this},fire:function(){return l.fireWith(this,arguments),this},fired:function(){return!!d}};return l},p.extend({Deferred:function(a){var b=[["resolve","done",p.Callbacks("once memory"),"resolved"],["reject","fail",p.Callbacks("once memory"),"rejected"],["notify","progress",p.Callbacks("memory")]],c="pending",d={state:function(){return c},always:function(){return e.done(arguments).fail(arguments),this},then:function(){var a=arguments;return p.Deferred(function(c){p.each(b,function(b,d){var f=d[0],g=a[b];e[d[1]](p.isFunction(g)?function(){var a=g.apply(this,arguments);a&&p.isFunction(a.promise)?a.promise().done(c.resolve).fail(c.reject).progress(c.notify):c[f+"With"](this===e?c:this,[a])}:c[f])}),a=null}).promise()},promise:function(a){return typeof a=="object"?p.extend(a,d):d}},e={};return d.pipe=d.then,p.each(b,function(a,f){var g=f[2],h=f[3];d[f[1]]=g.add,h&&g.add(function(){c=h},b[a^1][2].disable,b[2][2].lock),e[f[0]]=g.fire,e[f[0]+"With"]=g.fireWith}),d.promise(e),a&&a.call(e,e),e},when:function(a){var b=0,c=k.call(arguments),d=c.length,e=d!==1||a&&p.isFunction(a.promise)?d:0,f=e===1?a:p.Deferred(),g=function(a,b,c){return function(d){b[a]=this,c[a]=arguments.length>1?k.call(arguments):d,c===h?f.notifyWith(b,c):--e||f.resolveWith(b,c)}},h,i,j;if(d>1){h=new Array(d),i=new Array(d),j=new Array(d);for(;b<d;b++)c[b]&&p.isFunction(c[b].promise)?c[b].promise().done(g(b,j,c)).fail(f.reject).progress(g(b,i,h)):--e}return e||f.resolveWith(j,c),f.promise()}}),p.support=function(){var b,c,d,f,g,h,i,j,k,l,m,n=e.createElement("div");n.setAttribute("className","t"),n.innerHTML="  <link/><table></table><a href='/a'>a</a><input type='checkbox'/>",c=n.getElementsByTagName("*"),d=n.getElementsByTagName("a")[0],d.style.cssText="top:1px;float:left;opacity:.5";if(!c||!c.length||!d)return{};f=e.createElement("select"),g=f.appendChild(e.createElement("option")),h=n.getElementsByTagName("input")[0],b={leadingWhitespace:n.firstChild.nodeType===3,tbody:!n.getElementsByTagName("tbody").length,htmlSerialize:!!n.getElementsByTagName("link").length,style:/top/.test(d.getAttribute("style")),hrefNormalized:d.getAttribute("href")==="/a",opacity:/^0.5/.test(d.style.opacity),cssFloat:!!d.style.cssFloat,checkOn:h.value==="on",optSelected:g.selected,getSetAttribute:n.className!=="t",enctype:!!e.createElement("form").enctype,html5Clone:e.createElement("nav").cloneNode(!0).outerHTML!=="<:nav></:nav>",boxModel:e.compatMode==="CSS1Compat",submitBubbles:!0,changeBubbles:!0,focusinBubbles:!1,deleteExpando:!0,noCloneEvent:!0,inlineBlockNeedsLayout:!1,shrinkWrapBlocks:!1,reliableMarginRight:!0,boxSizingReliable:!0,pixelPosition:!1},h.checked=!0,b.noCloneChecked=h.cloneNode(!0).checked,f.disabled=!0,b.optDisabled=!g.disabled;try{delete n.test}catch(o){b.deleteExpando=!1}!n.addEventListener&&n.attachEvent&&n.fireEvent&&(n.attachEvent("onclick",m=function(){b.noCloneEvent=!1}),n.cloneNode(!0).fireEvent("onclick"),n.detachEvent("onclick",m)),h=e.createElement("input"),h.value="t",h.setAttribute("type","radio"),b.radioValue=h.value==="t",h.setAttribute("checked","checked"),h.setAttribute("name","t"),n.appendChild(h),i=e.createDocumentFragment(),i.appendChild(n.lastChild),b.checkClone=i.cloneNode(!0).cloneNode(!0).lastChild.checked,b.appendChecked=h.checked,i.removeChild(h),i.appendChild(n);if(n.attachEvent)for(k in{submit:!0,change:!0,focusin:!0})j="on"+k,l=j in n,l||(n.setAttribute(j,"return;"),l=typeof n[j]=="function"),b[k+"Bubbles"]=l;return p(function(){var c,d,f,g,h="padding:0;margin:0;border:0;display:block;overflow:hidden;",i=e.getElementsByTagName("body")[0];if(!i)return;c=e.createElement("div"),c.style.cssText="visibility:hidden;border:0;width:0;height:0;position:static;top:0;margin-top:1px",i.insertBefore(c,i.firstChild),d=e.createElement("div"),c.appendChild(d),d.innerHTML="<table><tr><td></td><td>t</td></tr></table>",f=d.getElementsByTagName("td"),f[0].style.cssText="padding:0;margin:0;border:0;display:none",l=f[0].offsetHeight===0,f[0].style.display="",f[1].style.display="none",b.reliableHiddenOffsets=l&&f[0].offsetHeight===0,d.innerHTML="",d.style.cssText="box-sizing:border-box;-moz-box-sizing:border-box;-webkit-box-sizing:border-box;padding:1px;border:1px;display:block;width:4px;margin-top:1%;position:absolute;top:1%;",b.boxSizing=d.offsetWidth===4,b.doesNotIncludeMarginInBodyOffset=i.offsetTop!==1,a.getComputedStyle&&(b.pixelPosition=(a.getComputedStyle(d,null)||{}).top!=="1%",b.boxSizingReliable=(a.getComputedStyle(d,null)||{width:"4px"}).width==="4px",g=e.createElement("div"),g.style.cssText=d.style.cssText=h,g.style.marginRight=g.style.width="0",d.style.width="1px",d.appendChild(g),b.reliableMarginRight=!parseFloat((a.getComputedStyle(g,null)||{}).marginRight)),typeof d.style.zoom!="undefined"&&(d.innerHTML="",d.style.cssText=h+"width:1px;padding:1px;display:inline;zoom:1",b.inlineBlockNeedsLayout=d.offsetWidth===3,d.style.display="block",d.style.overflow="visible",d.innerHTML="<div></div>",d.firstChild.style.width="5px",b.shrinkWrapBlocks=d.offsetWidth!==3,c.style.zoom=1),i.removeChild(c),c=d=f=g=null}),i.removeChild(n),c=d=f=g=h=i=n=null,b}();var H=/(?:\{[\s\S]*\}|\[[\s\S]*\])$/,I=/([A-Z])/g;p.extend({cache:{},deletedIds:[],uuid:0,expando:"jQuery"+(p.fn.jquery+Math.random()).replace(/\D/g,""),noData:{embed:!0,object:"clsid:D27CDB6E-AE6D-11cf-96B8-444553540000",applet:!0},hasData:function(a){return a=a.nodeType?p.cache[a[p.expando]]:a[p.expando],!!a&&!K(a)},data:function(a,c,d,e){if(!p.acceptData(a))return;var f,g,h=p.expando,i=typeof c=="string",j=a.nodeType,k=j?p.cache:a,l=j?a[h]:a[h]&&h;if((!l||!k[l]||!e&&!k[l].data)&&i&&d===b)return;l||(j?a[h]=l=p.deletedIds.pop()||++p.uuid:l=h),k[l]||(k[l]={},j||(k[l].toJSON=p.noop));if(typeof c=="object"||typeof c=="function")e?k[l]=p.extend(k[l],c):k[l].data=p.extend(k[l].data,c);return f=k[l],e||(f.data||(f.data={}),f=f.data),d!==b&&(f[p.camelCase(c)]=d),i?(g=f[c],g==null&&(g=f[p.camelCase(c)])):g=f,g},removeData:function(a,b,c){if(!p.acceptData(a))return;var d,e,f,g=a.nodeType,h=g?p.cache:a,i=g?a[p.expando]:p.expando;if(!h[i])return;if(b){d=c?h[i]:h[i].data;if(d){p.isArray(b)||(b in d?b=[b]:(b=p.camelCase(b),b in d?b=[b]:b=b.split(" ")));for(e=0,f=b.length;e<f;e++)delete d[b[e]];if(!(c?K:p.isEmptyObject)(d))return}}if(!c){delete h[i].data;if(!K(h[i]))return}g?p.cleanData([a],!0):p.support.deleteExpando||h!=h.window?delete h[i]:h[i]=null},_data:function(a,b,c){return p.data(a,b,c,!0)},acceptData:function(a){var b=a.nodeName&&p.noData[a.nodeName.toLowerCase()];return!b||b!==!0&&a.getAttribute("classid")===b}}),p.fn.extend({data:function(a,c){var d,e,f,g,h,i=this[0],j=0,k=null;if(a===b){if(this.length){k=p.data(i);if(i.nodeType===1&&!p._data(i,"parsedAttrs")){f=i.attributes;for(h=f.length;j<h;j++)g=f[j].name,g.indexOf("data-")===0&&(g=p.camelCase(g.substring(5)),J(i,g,k[g]));p._data(i,"parsedAttrs",!0)}}return k}return typeof a=="object"?this.each(function(){p.data(this,a)}):(d=a.split(".",2),d[1]=d[1]?"."+d[1]:"",e=d[1]+"!",p.access(this,function(c){if(c===b)return k=this.triggerHandler("getData"+e,[d[0]]),k===b&&i&&(k=p.data(i,a),k=J(i,a,k)),k===b&&d[1]?this.data(d[0]):k;d[1]=c,this.each(function(){var b=p(this);b.triggerHandler("setData"+e,d),p.data(this,a,c),b.triggerHandler("changeData"+e,d)})},null,c,arguments.length>1,null,!1))},removeData:function(a){return this.each(function(){p.removeData(this,a)})}}),p.extend({queue:function(a,b,c){var d;if(a)return b=(b||"fx")+"queue",d=p._data(a,b),c&&(!d||p.isArray(c)?d=p._data(a,b,p.makeArray(c)):d.push(c)),d||[]},dequeue:function(a,b){b=b||"fx";var c=p.queue(a,b),d=c.length,e=c.shift(),f=p._queueHooks(a,b),g=function(){p.dequeue(a,b)};e==="inprogress"&&(e=c.shift(),d--),e&&(b==="fx"&&c.unshift("inprogress"),delete f.stop,e.call(a,g,f)),!d&&f&&f.empty.fire()},_queueHooks:function(a,b){var c=b+"queueHooks";return p._data(a,c)||p._data(a,c,{empty:p.Callbacks("once memory").add(function(){p.removeData(a,b+"queue",!0),p.removeData(a,c,!0)})})}}),p.fn.extend({queue:function(a,c){var d=2;return typeof a!="string"&&(c=a,a="fx",d--),arguments.length<d?p.queue(this[0],a):c===b?this:this.each(function(){var b=p.queue(this,a,c);p._queueHooks(this,a),a==="fx"&&b[0]!=="inprogress"&&p.dequeue(this,a)})},dequeue:function(a){return this.each(function(){p.dequeue(this,a)})},delay:function(a,b){return a=p.fx?p.fx.speeds[a]||a:a,b=b||"fx",this.queue(b,function(b,c){var d=setTimeout(b,a);c.stop=function(){clearTimeout(d)}})},clearQueue:function(a){return this.queue(a||"fx",[])},promise:function(a,c){var d,e=1,f=p.Deferred(),g=this,h=this.length,i=function(){--e||f.resolveWith(g,[g])};typeof a!="string"&&(c=a,a=b),a=a||"fx";while(h--)d=p._data(g[h],a+"queueHooks"),d&&d.empty&&(e++,d.empty.add(i));return i(),f.promise(c)}});var L,M,N,O=/[\t\r\n]/g,P=/\r/g,Q=/^(?:button|input)$/i,R=/^(?:button|input|object|select|textarea)$/i,S=/^a(?:rea|)$/i,T=/^(?:autofocus|autoplay|async|checked|controls|defer|disabled|hidden|loop|multiple|open|readonly|required|scoped|selected)$/i,U=p.support.getSetAttribute;p.fn.extend({attr:function(a,b){return p.access(this,p.attr,a,b,arguments.length>1)},removeAttr:function(a){return this.each(function(){p.removeAttr(this,a)})},prop:function(a,b){return p.access(this,p.prop,a,b,arguments.length>1)},removeProp:function(a){return a=p.propFix[a]||a,this.each(function(){try{this[a]=b,delete this[a]}catch(c){}})},addClass:function(a){var b,c,d,e,f,g,h;if(p.isFunction(a))return this.each(function(b){p(this).addClass(a.call(this,b,this.className))});if(a&&typeof a=="string"){b=a.split(s);for(c=0,d=this.length;c<d;c++){e=this[c];if(e.nodeType===1)if(!e.className&&b.length===1)e.className=a;else{f=" "+e.className+" ";for(g=0,h=b.length;g<h;g++)~f.indexOf(" "+b[g]+" ")||(f+=b[g]+" ");e.className=p.trim(f)}}}return this},removeClass:function(a){var c,d,e,f,g,h,i;if(p.isFunction(a))return this.each(function(b){p(this).removeClass(a.call(this,b,this.className))});if(a&&typeof a=="string"||a===b){c=(a||"").split(s);for(h=0,i=this.length;h<i;h++){e=this[h];if(e.nodeType===1&&e.className){d=(" "+e.className+" ").replace(O," ");for(f=0,g=c.length;f<g;f++)while(d.indexOf(" "+c[f]+" ")>-1)d=d.replace(" "+c[f]+" "," ");e.className=a?p.trim(d):""}}}return this},toggleClass:function(a,b){var c=typeof a,d=typeof b=="boolean";return p.isFunction(a)?this.each(function(c){p(this).toggleClass(a.call(this,c,this.className,b),b)}):this.each(function(){if(c==="string"){var e,f=0,g=p(this),h=b,i=a.split(s);while(e=i[f++])h=d?h:!g.hasClass(e),g[h?"addClass":"removeClass"](e)}else if(c==="undefined"||c==="boolean")this.className&&p._data(this,"__className__",this.className),this.className=this.className||a===!1?"":p._data(this,"__className__")||""})},hasClass:function(a){var b=" "+a+" ",c=0,d=this.length;for(;c<d;c++)if(this[c].nodeType===1&&(" "+this[c].className+" ").replace(O," ").indexOf(b)>-1)return!0;return!1},val:function(a){var c,d,e,f=this[0];if(!arguments.length){if(f)return c=p.valHooks[f.type]||p.valHooks[f.nodeName.toLowerCase()],c&&"get"in c&&(d=c.get(f,"value"))!==b?d:(d=f.value,typeof d=="string"?d.replace(P,""):d==null?"":d);return}return e=p.isFunction(a),this.each(function(d){var f,g=p(this);if(this.nodeType!==1)return;e?f=a.call(this,d,g.val()):f=a,f==null?f="":typeof f=="number"?f+="":p.isArray(f)&&(f=p.map(f,function(a){return a==null?"":a+""})),c=p.valHooks[this.type]||p.valHooks[this.nodeName.toLowerCase()];if(!c||!("set"in c)||c.set(this,f,"value")===b)this.value=f})}}),p.extend({valHooks:{option:{get:function(a){var b=a.attributes.value;return!b||b.specified?a.value:a.text}},select:{get:function(a){var b,c,d,e,f=a.selectedIndex,g=[],h=a.options,i=a.type==="select-one";if(f<0)return null;c=i?f:0,d=i?f+1:h.length;for(;c<d;c++){e=h[c];if(e.selected&&(p.support.optDisabled?!e.disabled:e.getAttribute("disabled")===null)&&(!e.parentNode.disabled||!p.nodeName(e.parentNode,"optgroup"))){b=p(e).val();if(i)return b;g.push(b)}}return i&&!g.length&&h.length?p(h[f]).val():g},set:function(a,b){var c=p.makeArray(b);return p(a).find("option").each(function(){this.selected=p.inArray(p(this).val(),c)>=0}),c.length||(a.selectedIndex=-1),c}}},attrFn:{},attr:function(a,c,d,e){var f,g,h,i=a.nodeType;if(!a||i===3||i===8||i===2)return;if(e&&p.isFunction(p.fn[c]))return p(a)[c](d);if(typeof a.getAttribute=="undefined")return p.prop(a,c,d);h=i!==1||!p.isXMLDoc(a),h&&(c=c.toLowerCase(),g=p.attrHooks[c]||(T.test(c)?M:L));if(d!==b){if(d===null){p.removeAttr(a,c);return}return g&&"set"in g&&h&&(f=g.set(a,d,c))!==b?f:(a.setAttribute(c,""+d),d)}return g&&"get"in g&&h&&(f=g.get(a,c))!==null?f:(f=a.getAttribute(c),f===null?b:f)},removeAttr:function(a,b){var c,d,e,f,g=0;if(b&&a.nodeType===1){d=b.split(s);for(;g<d.length;g++)e=d[g],e&&(c=p.propFix[e]||e,f=T.test(e),f||p.attr(a,e,""),a.removeAttribute(U?e:c),f&&c in a&&(a[c]=!1))}},attrHooks:{type:{set:function(a,b){if(Q.test(a.nodeName)&&a.parentNode)p.error("type property can't be changed");else if(!p.support.radioValue&&b==="radio"&&p.nodeName(a,"input")){var c=a.value;return a.setAttribute("type",b),c&&(a.value=c),b}}},value:{get:function(a,b){return L&&p.nodeName(a,"button")?L.get(a,b):b in a?a.value:null},set:function(a,b,c){if(L&&p.nodeName(a,"button"))return L.set(a,b,c);a.value=b}}},propFix:{tabindex:"tabIndex",readonly:"readOnly","for":"htmlFor","class":"className",maxlength:"maxLength",cellspacing:"cellSpacing",cellpadding:"cellPadding",rowspan:"rowSpan",colspan:"colSpan",usemap:"useMap",frameborder:"frameBorder",contenteditable:"contentEditable"},prop:function(a,c,d){var e,f,g,h=a.nodeType;if(!a||h===3||h===8||h===2)return;return g=h!==1||!p.isXMLDoc(a),g&&(c=p.propFix[c]||c,f=p.propHooks[c]),d!==b?f&&"set"in f&&(e=f.set(a,d,c))!==b?e:a[c]=d:f&&"get"in f&&(e=f.get(a,c))!==null?e:a[c]},propHooks:{tabIndex:{get:function(a){var c=a.getAttributeNode("tabindex");return c&&c.specified?parseInt(c.value,10):R.test(a.nodeName)||S.test(a.nodeName)&&a.href?0:b}}}}),M={get:function(a,c){var d,e=p.prop(a,c);return e===!0||typeof e!="boolean"&&(d=a.getAttributeNode(c))&&d.nodeValue!==!1?c.toLowerCase():b},set:function(a,b,c){var d;return b===!1?p.removeAttr(a,c):(d=p.propFix[c]||c,d in a&&(a[d]=!0),a.setAttribute(c,c.toLowerCase())),c}},U||(N={name:!0,id:!0,coords:!0},L=p.valHooks.button={get:function(a,c){var d;return d=a.getAttributeNode(c),d&&(N[c]?d.value!=="":d.specified)?d.value:b},set:function(a,b,c){var d=a.getAttributeNode(c);return d||(d=e.createAttribute(c),a.setAttributeNode(d)),d.value=b+""}},p.each(["width","height"],function(a,b){p.attrHooks[b]=p.extend(p.attrHooks[b],{set:function(a,c){if(c==="")return a.setAttribute(b,"auto"),c}})}),p.attrHooks.contenteditable={get:L.get,set:function(a,b,c){b===""&&(b="false"),L.set(a,b,c)}}),p.support.hrefNormalized||p.each(["href","src","width","height"],function(a,c){p.attrHooks[c]=p.extend(p.attrHooks[c],{get:function(a){var d=a.getAttribute(c,2);return d===null?b:d}})}),p.support.style||(p.attrHooks.style={get:function(a){return a.style.cssText.toLowerCase()||b},set:function(a,b){return a.style.cssText=""+b}}),p.support.optSelected||(p.propHooks.selected=p.extend(p.propHooks.selected,{get:function(a){var b=a.parentNode;return b&&(b.selectedIndex,b.parentNode&&b.parentNode.selectedIndex),null}})),p.support.enctype||(p.propFix.enctype="encoding"),p.support.checkOn||p.each(["radio","checkbox"],function(){p.valHooks[this]={get:function(a){return a.getAttribute("value")===null?"on":a.value}}}),p.each(["radio","checkbox"],function(){p.valHooks[this]=p.extend(p.valHooks[this],{set:function(a,b){if(p.isArray(b))return a.checked=p.inArray(p(a).val(),b)>=0}})});var V=/^(?:textarea|input|select)$/i,W=/^([^\.]*|)(?:\.(.+)|)$/,X=/(?:^|\s)hover(\.\S+|)\b/,Y=/^key/,Z=/^(?:mouse|contextmenu)|click/,$=/^(?:focusinfocus|focusoutblur)$/,_=function(a){return p.event.special.hover?a:a.replace(X,"mouseenter$1 mouseleave$1")};p.event={add:function(a,c,d,e,f){var g,h,i,j,k,l,m,n,o,q,r;if(a.nodeType===3||a.nodeType===8||!c||!d||!(g=p._data(a)))return;d.handler&&(o=d,d=o.handler,f=o.selector),d.guid||(d.guid=p.guid++),i=g.events,i||(g.events=i={}),h=g.handle,h||(g.handle=h=function(a){return typeof p!="undefined"&&(!a||p.event.triggered!==a.type)?p.event.dispatch.apply(h.elem,arguments):b},h.elem=a),c=p.trim(_(c)).split(" ");for(j=0;j<c.length;j++){k=W.exec(c[j])||[],l=k[1],m=(k[2]||"").split(".").sort(),r=p.event.special[l]||{},l=(f?r.delegateType:r.bindType)||l,r=p.event.special[l]||{},n=p.extend({type:l,origType:k[1],data:e,handler:d,guid:d.guid,selector:f,namespace:m.join(".")},o),q=i[l];if(!q){q=i[l]=[],q.delegateCount=0;if(!r.setup||r.setup.call(a,e,m,h)===!1)a.addEventListener?a.addEventListener(l,h,!1):a.attachEvent&&a.attachEvent("on"+l,h)}r.add&&(r.add.call(a,n),n.handler.guid||(n.handler.guid=d.guid)),f?q.splice(q.delegateCount++,0,n):q.push(n),p.event.global[l]=!0}a=null},global:{},remove:function(a,b,c,d,e){var f,g,h,i,j,k,l,m,n,o,q,r=p.hasData(a)&&p._data(a);if(!r||!(m=r.events))return;b=p.trim(_(b||"")).split(" ");for(f=0;f<b.length;f++){g=W.exec(b[f])||[],h=i=g[1],j=g[2];if(!h){for(h in m)p.event.remove(a,h+b[f],c,d,!0);continue}n=p.event.special[h]||{},h=(d?n.delegateType:n.bindType)||h,o=m[h]||[],k=o.length,j=j?new RegExp("(^|\\.)"+j.split(".").sort().join("\\.(?:.*\\.|)")+"(\\.|$)"):null;for(l=0;l<o.length;l++)q=o[l],(e||i===q.origType)&&(!c||c.guid===q.guid)&&(!j||j.test(q.namespace))&&(!d||d===q.selector||d==="**"&&q.selector)&&(o.splice(l--,1),q.selector&&o.delegateCount--,n.remove&&n.remove.call(a,q));o.length===0&&k!==o.length&&((!n.teardown||n.teardown.call(a,j,r.handle)===!1)&&p.removeEvent(a,h,r.handle),delete m[h])}p.isEmptyObject(m)&&(delete r.handle,p.removeData(a,"events",!0))},customEvent:{getData:!0,setData:!0,changeData:!0},trigger:function(c,d,f,g){if(!f||f.nodeType!==3&&f.nodeType!==8){var h,i,j,k,l,m,n,o,q,r,s=c.type||c,t=[];if($.test(s+p.event.triggered))return;s.indexOf("!")>=0&&(s=s.slice(0,-1),i=!0),s.indexOf(".")>=0&&(t=s.split("."),s=t.shift(),t.sort());if((!f||p.event.customEvent[s])&&!p.event.global[s])return;c=typeof c=="object"?c[p.expando]?c:new p.Event(s,c):new p.Event(s),c.type=s,c.isTrigger=!0,c.exclusive=i,c.namespace=t.join("."),c.namespace_re=c.namespace?new RegExp("(^|\\.)"+t.join("\\.(?:.*\\.|)")+"(\\.|$)"):null,m=s.indexOf(":")<0?"on"+s:"";if(!f){h=p.cache;for(j in h)h[j].events&&h[j].events[s]&&p.event.trigger(c,d,h[j].handle.elem,!0);return}c.result=b,c.target||(c.target=f),d=d!=null?p.makeArray(d):[],d.unshift(c),n=p.event.special[s]||{};if(n.trigger&&n.trigger.apply(f,d)===!1)return;q=[[f,n.bindType||s]];if(!g&&!n.noBubble&&!p.isWindow(f)){r=n.delegateType||s,k=$.test(r+s)?f:f.parentNode;for(l=f;k;k=k.parentNode)q.push([k,r]),l=k;l===(f.ownerDocument||e)&&q.push([l.defaultView||l.parentWindow||a,r])}for(j=0;j<q.length&&!c.isPropagationStopped();j++)k=q[j][0],c.type=q[j][1],o=(p._data(k,"events")||{})[c.type]&&p._data(k,"handle"),o&&o.apply(k,d),o=m&&k[m],o&&p.acceptData(k)&&o.apply(k,d)===!1&&c.preventDefault();return c.type=s,!g&&!c.isDefaultPrevented()&&(!n._default||n._default.apply(f.ownerDocument,d)===!1)&&(s!=="click"||!p.nodeName(f,"a"))&&p.acceptData(f)&&m&&f[s]&&(s!=="focus"&&s!=="blur"||c.target.offsetWidth!==0)&&!p.isWindow(f)&&(l=f[m],l&&(f[m]=null),p.event.triggered=s,f[s](),p.event.triggered=b,l&&(f[m]=l)),c.result}return},dispatch:function(c){c=p.event.fix(c||a.event);var d,e,f,g,h,i,j,k,l,m,n=(p._data(this,"events")||{})[c.type]||[],o=n.delegateCount,q=[].slice.call(arguments),r=!c.exclusive&&!c.namespace,s=p.event.special[c.type]||{},t=[];q[0]=c,c.delegateTarget=this;if(s.preDispatch&&s.preDispatch.call(this,c)===!1)return;if(o&&(!c.button||c.type!=="click"))for(f=c.target;f!=this;f=f.parentNode||this)if(f.disabled!==!0||c.type!=="click"){h={},j=[];for(d=0;d<o;d++)k=n[d],l=k.selector,h[l]===b&&(h[l]=p(l,this).index(f)>=0),h[l]&&j.push(k);j.length&&t.push({elem:f,matches:j})}n.length>o&&t.push({elem:this,matches:n.slice(o)});for(d=0;d<t.length&&!c.isPropagationStopped();d++){i=t[d],c.currentTarget=i.elem;for(e=0;e<i.matches.length&&!c.isImmediatePropagationStopped();e++){k=i.matches[e];if(r||!c.namespace&&!k.namespace||c.namespace_re&&c.namespace_re.test(k.namespace))c.data=k.data,c.handleObj=k,g=((p.event.special[k.origType]||{}).handle||k.handler).apply(i.elem,q),g!==b&&(c.result=g,g===!1&&(c.preventDefault(),c.stopPropagation()))}}return s.postDispatch&&s.postDispatch.call(this,c),c.result},props:"attrChange attrName relatedNode srcElement altKey bubbles cancelable ctrlKey currentTarget eventPhase metaKey relatedTarget shiftKey target timeStamp view which".split(" "),fixHooks:{},keyHooks:{props:"char charCode key keyCode".split(" "),filter:function(a,b){return a.which==null&&(a.which=b.charCode!=null?b.charCode:b.keyCode),a}},mouseHooks:{props:"button buttons clientX clientY fromElement offsetX offsetY pageX pageY screenX screenY toElement".split(" "),filter:function(a,c){var d,f,g,h=c.button,i=c.fromElement;return a.pageX==null&&c.clientX!=null&&(d=a.target.ownerDocument||e,f=d.documentElement,g=d.body,a.pageX=c.clientX+(f&&f.scrollLeft||g&&g.scrollLeft||0)-(f&&f.clientLeft||g&&g.clientLeft||0),a.pageY=c.clientY+(f&&f.scrollTop||g&&g.scrollTop||0)-(f&&f.clientTop||g&&g.clientTop||0)),!a.relatedTarget&&i&&(a.relatedTarget=i===a.target?c.toElement:i),!a.which&&h!==b&&(a.which=h&1?1:h&2?3:h&4?2:0),a}},fix:function(a){if(a[p.expando])return a;var b,c,d=a,f=p.event.fixHooks[a.type]||{},g=f.props?this.props.concat(f.props):this.props;a=p.Event(d);for(b=g.length;b;)c=g[--b],a[c]=d[c];return a.target||(a.target=d.srcElement||e),a.target.nodeType===3&&(a.target=a.target.parentNode),a.metaKey=!!a.metaKey,f.filter?f.filter(a,d):a},special:{load:{noBubble:!0},focus:{delegateType:"focusin"},blur:{delegateType:"focusout"},beforeunload:{setup:function(a,b,c){p.isWindow(this)&&(this.onbeforeunload=c)},teardown:function(a,b){this.onbeforeunload===b&&(this.onbeforeunload=null)}}},simulate:function(a,b,c,d){var e=p.extend(new p.Event,c,{type:a,isSimulated:!0,originalEvent:{}});d?p.event.trigger(e,null,b):p.event.dispatch.call(b,e),e.isDefaultPrevented()&&c.preventDefault()}},p.event.handle=p.event.dispatch,p.removeEvent=e.removeEventListener?function(a,b,c){a.removeEventListener&&a.removeEventListener(b,c,!1)}:function(a,b,c){var d="on"+b;a.detachEvent&&(typeof a[d]=="undefined"&&(a[d]=null),a.detachEvent(d,c))},p.Event=function(a,b){if(this instanceof p.Event)a&&a.type?(this.originalEvent=a,this.type=a.type,this.isDefaultPrevented=a.defaultPrevented||a.returnValue===!1||a.getPreventDefault&&a.getPreventDefault()?bb:ba):this.type=a,b&&p.extend(this,b),this.timeStamp=a&&a.timeStamp||p.now(),this[p.expando]=!0;else return new p.Event(a,b)},p.Event.prototype={preventDefault:function(){this.isDefaultPrevented=bb;var a=this.originalEvent;if(!a)return;a.preventDefault?a.preventDefault():a.returnValue=!1},stopPropagation:function(){this.isPropagationStopped=bb;var a=this.originalEvent;if(!a)return;a.stopPropagation&&a.stopPropagation(),a.cancelBubble=!0},stopImmediatePropagation:function(){this.isImmediatePropagationStopped=bb,this.stopPropagation()},isDefaultPrevented:ba,isPropagationStopped:ba,isImmediatePropagationStopped:ba},p.each({mouseenter:"mouseover",mouseleave:"mouseout"},function(a,b){p.event.special[a]={delegateType:b,bindType:b,handle:function(a){var c,d=this,e=a.relatedTarget,f=a.handleObj,g=f.selector;if(!e||e!==d&&!p.contains(d,e))a.type=f.origType,c=f.handler.apply(this,arguments),a.type=b;return c}}}),p.support.submitBubbles||(p.event.special.submit={setup:function(){if(p.nodeName(this,"form"))return!1;p.event.add(this,"click._submit keypress._submit",function(a){var c=a.target,d=p.nodeName(c,"input")||p.nodeName(c,"button")?c.form:b;d&&!p._data(d,"_submit_attached")&&(p.event.add(d,"submit._submit",function(a){a._submit_bubble=!0}),p._data(d,"_submit_attached",!0))})},postDispatch:function(a){a._submit_bubble&&(delete a._submit_bubble,this.parentNode&&!a.isTrigger&&p.event.simulate("submit",this.parentNode,a,!0))},teardown:function(){if(p.nodeName(this,"form"))return!1;p.event.remove(this,"._submit")}}),p.support.changeBubbles||(p.event.special.change={setup:function(){if(V.test(this.nodeName)){if(this.type==="checkbox"||this.type==="radio")p.event.add(this,"propertychange._change",function(a){a.originalEvent.propertyName==="checked"&&(this._just_changed=!0)}),p.event.add(this,"click._change",function(a){this._just_changed&&!a.isTrigger&&(this._just_changed=!1),p.event.simulate("change",this,a,!0)});return!1}p.event.add(this,"beforeactivate._change",function(a){var b=a.target;V.test(b.nodeName)&&!p._data(b,"_change_attached")&&(p.event.add(b,"change._change",function(a){this.parentNode&&!a.isSimulated&&!a.isTrigger&&p.event.simulate("change",this.parentNode,a,!0)}),p._data(b,"_change_attached",!0))})},handle:function(a){var b=a.target;if(this!==b||a.isSimulated||a.isTrigger||b.type!=="radio"&&b.type!=="checkbox")return a.handleObj.handler.apply(this,arguments)},teardown:function(){return p.event.remove(this,"._change"),!V.test(this.nodeName)}}),p.support.focusinBubbles||p.each({focus:"focusin",blur:"focusout"},function(a,b){var c=0,d=function(a){p.event.simulate(b,a.target,p.event.fix(a),!0)};p.event.special[b]={setup:function(){c++===0&&e.addEventListener(a,d,!0)},teardown:function(){--c===0&&e.removeEventListener(a,d,!0)}}}),p.fn.extend({on:function(a,c,d,e,f){var g,h;if(typeof a=="object"){typeof c!="string"&&(d=d||c,c=b);for(h in a)this.on(h,c,d,a[h],f);return this}d==null&&e==null?(e=c,d=c=b):e==null&&(typeof c=="string"?(e=d,d=b):(e=d,d=c,c=b));if(e===!1)e=ba;else if(!e)return this;return f===1&&(g=e,e=function(a){return p().off(a),g.apply(this,arguments)},e.guid=g.guid||(g.guid=p.guid++)),this.each(function(){p.event.add(this,a,e,d,c)})},one:function(a,b,c,d){return this.on(a,b,c,d,1)},off:function(a,c,d){var e,f;if(a&&a.preventDefault&&a.handleObj)return e=a.handleObj,p(a.delegateTarget).off(e.namespace?e.origType+"."+e.namespace:e.origType,e.selector,e.handler),this;if(typeof a=="object"){for(f in a)this.off(f,c,a[f]);return this}if(c===!1||typeof c=="function")d=c,c=b;return d===!1&&(d=ba),this.each(function(){p.event.remove(this,a,d,c)})},bind:function(a,b,c){return this.on(a,null,b,c)},unbind:function(a,b){return this.off(a,null,b)},live:function(a,b,c){return p(this.context).on(a,this.selector,b,c),this},die:function(a,b){return p(this.context).off(a,this.selector||"**",b),this},delegate:function(a,b,c,d){return this.on(b,a,c,d)},undelegate:function(a,b,c){return arguments.length==1?this.off(a,"**"):this.off(b,a||"**",c)},trigger:function(a,b){return this.each(function(){p.event.trigger(a,b,this)})},triggerHandler:function(a,b){if(this[0])return p.event.trigger(a,b,this[0],!0)},toggle:function(a){var b=arguments,c=a.guid||p.guid++,d=0,e=function(c){var e=(p._data(this,"lastToggle"+a.guid)||0)%d;return p._data(this,"lastToggle"+a.guid,e+1),c.preventDefault(),b[e].apply(this,arguments)||!1};e.guid=c;while(d<b.length)b[d++].guid=c;return this.click(e)},hover:function(a,b){return this.mouseenter(a).mouseleave(b||a)}}),p.each("blur focus focusin focusout load resize scroll unload click dblclick mousedown mouseup mousemove mouseover mouseout mouseenter mouseleave change select submit keydown keypress keyup error contextmenu".split(" "),function(a,b){p.fn[b]=function(a,c){return c==null&&(c=a,a=null),arguments.length>0?this.on(b,null,a,c):this.trigger(b)},Y.test(b)&&(p.event.fixHooks[b]=p.event.keyHooks),Z.test(b)&&(p.event.fixHooks[b]=p.event.mouseHooks)}),function(a,b){function $(a,b,c,d){c=c||[],b=b||q;var e,f,g,j,k=b.nodeType;if(k!==1&&k!==9)return[];if(!a||typeof a!="string")return c;g=h(b);if(!g&&!d)if(e=L.exec(a))if(j=e[1]){if(k===9){f=b.getElementById(j);if(!f||!f.parentNode)return c;if(f.id===j)return c.push(f),c}else if(b.ownerDocument&&(f=b.ownerDocument.getElementById(j))&&i(b,f)&&f.id===j)return c.push(f),c}else{if(e[2])return u.apply(c,t.call(b.getElementsByTagName(a),0)),c;if((j=e[3])&&X&&b.getElementsByClassName)return u.apply(c,t.call(b.getElementsByClassName(j),0)),c}return bk(a,b,c,d,g)}function _(a){return function(b){var c=b.nodeName.toLowerCase();return c==="input"&&b.type===a}}function ba(a){return function(b){var c=b.nodeName.toLowerCase();return(c==="input"||c==="button")&&b.type===a}}function bb(a,b,c){if(a===b)return c;var d=a.nextSibling;while(d){if(d===b)return-1;d=d.nextSibling}return 1}function bc(a,b,c,d){var e,g,h,i,j,k,l,m,n,p,r=!c&&b!==q,s=(r?"<s>":"")+a.replace(H,"$1<s>"),u=y[o][s];if(u)return d?0:t.call(u,0);j=a,k=[],m=0,n=f.preFilter,p=f.filter;while(j){if(!e||(g=I.exec(j)))g&&(j=j.slice(g[0].length),h.selector=l),k.push(h=[]),l="",r&&(j=" "+j);e=!1;if(g=J.exec(j))l+=g[0],j=j.slice(g[0].length),e=h.push({part:g.pop().replace(H," "),string:g[0],captures:g});for(i in p)(g=S[i].exec(j))&&(!n[i]||(g=n[i](g,b,c)))&&(l+=g[0],j=j.slice(g[0].length),e=h.push({part:i,string:g.shift(),captures:g}));if(!e)break}return l&&(h.selector=l),d?j.length:j?$.error(a):t.call(y(s,k),0)}function bd(a,b,e,f){var g=b.dir,h=s++;return a||(a=function(a){return a===e}),b.first?function(b){while(b=b[g])if(b.nodeType===1)return a(b)&&b}:f?function(b){while(b=b[g])if(b.nodeType===1&&a(b))return b}:function(b){var e,f=h+"."+c,i=f+"."+d;while(b=b[g])if(b.nodeType===1){if((e=b[o])===i)return b.sizset;if(typeof e=="string"&&e.indexOf(f)===0){if(b.sizset)return b}else{b[o]=i;if(a(b))return b.sizset=!0,b;b.sizset=!1}}}}function be(a,b){return a?function(c){var d=b(c);return d&&a(d===!0?c:d)}:b}function bf(a,b,c){var d,e,g=0;for(;d=a[g];g++)f.relative[d.part]?e=bd(e,f.relative[d.part],b,c):e=be(e,f.filter[d.part].apply(null,d.captures.concat(b,c)));return e}function bg(a){return function(b){var c,d=0;for(;c=a[d];d++)if(c(b))return!0;return!1}}function bh(a,b,c,d){var e=0,f=b.length;for(;e<f;e++)$(a,b[e],c,d)}function bi(a,b,c,d,e,g){var h,i=f.setFilters[b.toLowerCase()];return i||$.error(b),(a||!(h=e))&&bh(a||"*",d,h=[],e),h.length>0?i(h,c,g):[]}function bj(a,c,d,e){var f,g,h,i,j,k,l,m,n,o,p,q,r,s=0,t=a.length,v=S.POS,w=new RegExp("^"+v.source+"(?!"+A+")","i"),x=function(){var a=1,c=arguments.length-2;for(;a<c;a++)arguments[a]===b&&(n[a]=b)};for(;s<t;s++){f=a[s],g="",m=e;for(h=0,i=f.length;h<i;h++){j=f[h],k=j.string;if(j.part==="PSEUDO"){v.exec(""),l=0;while(n=v.exec(k)){o=!0,p=v.lastIndex=n.index+n[0].length;if(p>l){g+=k.slice(l,n.index),l=p,q=[c],J.test(g)&&(m&&(q=m),m=e);if(r=O.test(g))g=g.slice(0,-5).replace(J,"$&*"),l++;n.length>1&&n[0].replace(w,x),m=bi(g,n[1],n[2],q,m,r)}g=""}}o||(g+=k),o=!1}g?J.test(g)?bh(g,m||[c],d,e):$(g,c,d,e?e.concat(m):m):u.apply(d,m)}return t===1?d:$.uniqueSort(d)}function bk(a,b,e,g,h){a=a.replace(H,"$1");var i,k,l,m,n,o,p,q,r,s,v=bc(a,b,h),w=b.nodeType;if(S.POS.test(a))return bj(v,b,e,g);if(g)i=t.call(g,0);else if(v.length===1){if((o=t.call(v[0],0)).length>2&&(p=o[0]).part==="ID"&&w===9&&!h&&f.relative[o[1].part]){b=f.find.ID(p.captures[0].replace(R,""),b,h)[0];if(!b)return e;a=a.slice(o.shift().string.length)}r=(v=N.exec(o[0].string))&&!v.index&&b.parentNode||b,q="";for(n=o.length-1;n>=0;n--){p=o[n],s=p.part,q=p.string+q;if(f.relative[s])break;if(f.order.test(s)){i=f.find[s](p.captures[0].replace(R,""),r,h);if(i==null)continue;a=a.slice(0,a.length-q.length)+q.replace(S[s],""),a||u.apply(e,t.call(i,0));break}}}if(a){k=j(a,b,h),c=k.dirruns++,i==null&&(i=f.find.TAG("*",N.test(a)&&b.parentNode||b));for(n=0;m=i[n];n++)d=k.runs++,k(m)&&e.push(m)}return e}var c,d,e,f,g,h,i,j,k,l,m=!0,n="undefined",o=("sizcache"+Math.random()).replace(".",""),q=a.document,r=q.documentElement,s=0,t=[].slice,u=[].push,v=function(a,b){return a[o]=b||!0,a},w=function(){var a={},b=[];return v(function(c,d){return b.push(c)>f.cacheLength&&delete a[b.shift()],a[c]=d},a)},x=w(),y=w(),z=w(),A="[\\x20\\t\\r\\n\\f]",B="(?:\\\\.|[-\\w]|[^\\x00-\\xa0])+",C=B.replace("w","w#"),D="([*^$|!~]?=)",E="\\["+A+"*("+B+")"+A+"*(?:"+D+A+"*(?:(['\"])((?:\\\\.|[^\\\\])*?)\\3|("+C+")|)|)"+A+"*\\]",F=":("+B+")(?:\\((?:(['\"])((?:\\\\.|[^\\\\])*?)\\2|([^()[\\]]*|(?:(?:"+E+")|[^:]|\\\\.)*|.*))\\)|)",G=":(nth|eq|gt|lt|first|last|even|odd)(?:\\(((?:-\\d)?\\d*)\\)|)(?=[^-]|$)",H=new RegExp("^"+A+"+|((?:^|[^\\\\])(?:\\\\.)*)"+A+"+$","g"),I=new RegExp("^"+A+"*,"+A+"*"),J=new RegExp("^"+A+"*([\\x20\\t\\r\\n\\f>+~])"+A+"*"),K=new RegExp(F),L=/^(?:#([\w\-]+)|(\w+)|\.([\w\-]+))$/,M=/^:not/,N=/[\x20\t\r\n\f]*[+~]/,O=/:not\($/,P=/h\d/i,Q=/input|select|textarea|button/i,R=/\\(?!\\)/g,S={ID:new RegExp("^#("+B+")"),CLASS:new RegExp("^\\.("+B+")"),NAME:new RegExp("^\\[name=['\"]?("+B+")['\"]?\\]"),TAG:new RegExp("^("+B.replace("w","w*")+")"),ATTR:new RegExp("^"+E),PSEUDO:new RegExp("^"+F),CHILD:new RegExp("^:(only|nth|last|first)-child(?:\\("+A+"*(even|odd|(([+-]|)(\\d*)n|)"+A+"*(?:([+-]|)"+A+"*(\\d+)|))"+A+"*\\)|)","i"),POS:new RegExp(G,"ig"),needsContext:new RegExp("^"+A+"*[>+~]|"+G,"i")},T=function(a){var b=q.createElement("div");try{return a(b)}catch(c){return!1}finally{b=null}},U=T(function(a){return a.appendChild(q.createComment("")),!a.getElementsByTagName("*").length}),V=T(function(a){return a.innerHTML="<a href='#'></a>",a.firstChild&&typeof a.firstChild.getAttribute!==n&&a.firstChild.getAttribute("href")==="#"}),W=T(function(a){a.innerHTML="<select></select>";var b=typeof a.lastChild.getAttribute("multiple");return b!=="boolean"&&b!=="string"}),X=T(function(a){return a.innerHTML="<div class='hidden e'></div><div class='hidden'></div>",!a.getElementsByClassName||!a.getElementsByClassName("e").length?!1:(a.lastChild.className="e",a.getElementsByClassName("e").length===2)}),Y=T(function(a){a.id=o+0,a.innerHTML="<a name='"+o+"'></a><div name='"+o+"'></div>",r.insertBefore(a,r.firstChild);var b=q.getElementsByName&&q.getElementsByName(o).length===2+q.getElementsByName(o+0).length;return e=!q.getElementById(o),r.removeChild(a),b});try{t.call(r.childNodes,0)[0].nodeType}catch(Z){t=function(a){var b,c=[];for(;b=this[a];a++)c.push(b);return c}}$.matches=function(a,b){return $(a,null,null,b)},$.matchesSelector=function(a,b){return $(b,null,null,[a]).length>0},g=$.getText=function(a){var b,c="",d=0,e=a.nodeType;if(e){if(e===1||e===9||e===11){if(typeof a.textContent=="string")return a.textContent;for(a=a.firstChild;a;a=a.nextSibling)c+=g(a)}else if(e===3||e===4)return a.nodeValue}else for(;b=a[d];d++)c+=g(b);return c},h=$.isXML=function(a){var b=a&&(a.ownerDocument||a).documentElement;return b?b.nodeName!=="HTML":!1},i=$.contains=r.contains?function(a,b){var c=a.nodeType===9?a.documentElement:a,d=b&&b.parentNode;return a===d||!!(d&&d.nodeType===1&&c.contains&&c.contains(d))}:r.compareDocumentPosition?function(a,b){return b&&!!(a.compareDocumentPosition(b)&16)}:function(a,b){while(b=b.parentNode)if(b===a)return!0;return!1},$.attr=function(a,b){var c,d=h(a);return d||(b=b.toLowerCase()),f.attrHandle[b]?f.attrHandle[b](a):W||d?a.getAttribute(b):(c=a.getAttributeNode(b),c?typeof a[b]=="boolean"?a[b]?b:null:c.specified?c.value:null:null)},f=$.selectors={cacheLength:50,createPseudo:v,match:S,order:new RegExp("ID|TAG"+(Y?"|NAME":"")+(X?"|CLASS":"")),attrHandle:V?{}:{href:function(a){return a.getAttribute("href",2)},type:function(a){return a.getAttribute("type")}},find:{ID:e?function(a,b,c){if(typeof b.getElementById!==n&&!c){var d=b.getElementById(a);return d&&d.parentNode?[d]:[]}}:function(a,c,d){if(typeof c.getElementById!==n&&!d){var e=c.getElementById(a);return e?e.id===a||typeof e.getAttributeNode!==n&&e.getAttributeNode("id").value===a?[e]:b:[]}},TAG:U?function(a,b){if(typeof b.getElementsByTagName!==n)return b.getElementsByTagName(a)}:function(a,b){var c=b.getElementsByTagName(a);if(a==="*"){var d,e=[],f=0;for(;d=c[f];f++)d.nodeType===1&&e.push(d);return e}return c},NAME:function(a,b){if(typeof b.getElementsByName!==n)return b.getElementsByName(name)},CLASS:function(a,b,c){if(typeof b.getElementsByClassName!==n&&!c)return b.getElementsByClassName(a)}},relative:{">":{dir:"parentNode",first:!0}," ":{dir:"parentNode"},"+":{dir:"previousSibling",first:!0},"~":{dir:"previousSibling"}},preFilter:{ATTR:function(a){return a[1]=a[1].replace(R,""),a[3]=(a[4]||a[5]||"").replace(R,""),a[2]==="~="&&(a[3]=" "+a[3]+" "),a.slice(0,4)},CHILD:function(a){return a[1]=a[1].toLowerCase(),a[1]==="nth"?(a[2]||$.error(a[0]),a[3]=+(a[3]?a[4]+(a[5]||1):2*(a[2]==="even"||a[2]==="odd")),a[4]=+(a[6]+a[7]||a[2]==="odd")):a[2]&&$.error(a[0]),a},PSEUDO:function(a,b,c){var d,e;if(S.CHILD.test(a[0]))return null;if(a[3])a[2]=a[3];else if(d=a[4])K.test(d)&&(e=bc(d,b,c,!0))&&(e=d.indexOf(")",d.length-e)-d.length)&&(d=d.slice(0,e),a[0]=a[0].slice(0,e)),a[2]=d;return a.slice(0,3)}},filter:{ID:e?function(a){return a=a.replace(R,""),function(b){return b.getAttribute("id")===a}}:function(a){return a=a.replace(R,""),function(b){var c=typeof b.getAttributeNode!==n&&b.getAttributeNode("id");return c&&c.value===a}},TAG:function(a){return a==="*"?function(){return!0}:(a=a.replace(R,"").toLowerCase(),function(b){return b.nodeName&&b.nodeName.toLowerCase()===a})},CLASS:function(a){var b=x[o][a];return b||(b=x(a,new RegExp("(^|"+A+")"+a+"("+A+"|$)"))),function(a){return b.test(a.className||typeof a.getAttribute!==n&&a.getAttribute("class")||"")}},ATTR:function(a,b,c){return b?function(d){var e=$.attr(d,a),f=e+"";if(e==null)return b==="!=";switch(b){case"=":return f===c;case"!=":return f!==c;case"^=":return c&&f.indexOf(c)===0;case"*=":return c&&f.indexOf(c)>-1;case"$=":return c&&f.substr(f.length-c.length)===c;case"~=":return(" "+f+" ").indexOf(c)>-1;case"|=":return f===c||f.substr(0,c.length+1)===c+"-"}}:function(b){return $.attr(b,a)!=null}},CHILD:function(a,b,c,d){if(a==="nth"){var e=s++;return function(a){var b,f,g=0,h=a;if(c===1&&d===0)return!0;b=a.parentNode;if(b&&(b[o]!==e||!a.sizset)){for(h=b.firstChild;h;h=h.nextSibling)if(h.nodeType===1){h.sizset=++g;if(h===a)break}b[o]=e}return f=a.sizset-d,c===0?f===0:f%c===0&&f/c>=0}}return function(b){var c=b;switch(a){case"only":case"first":while(c=c.previousSibling)if(c.nodeType===1)return!1;if(a==="first")return!0;c=b;case"last":while(c=c.nextSibling)if(c.nodeType===1)return!1;return!0}}},PSEUDO:function(a,b,c,d){var e,g=f.pseudos[a]||f.pseudos[a.toLowerCase()];return g||$.error("unsupported pseudo: "+a),g[o]?g(b,c,d):g.length>1?(e=[a,a,"",b],function(a){return g(a,0,e)}):g}},pseudos:{not:v(function(a,b,c){var d=j(a.replace(H,"$1"),b,c);return function(a){return!d(a)}}),enabled:function(a){return a.disabled===!1},disabled:function(a){return a.disabled===!0},checked:function(a){var b=a.nodeName.toLowerCase();return b==="input"&&!!a.checked||b==="option"&&!!a.selected},selected:function(a){return a.parentNode&&a.parentNode.selectedIndex,a.selected===!0},parent:function(a){return!f.pseudos.empty(a)},empty:function(a){var b;a=a.firstChild;while(a){if(a.nodeName>"@"||(b=a.nodeType)===3||b===4)return!1;a=a.nextSibling}return!0},contains:v(function(a){return function(b){return(b.textContent||b.innerText||g(b)).indexOf(a)>-1}}),has:v(function(a){return function(b){return $(a,b).length>0}}),header:function(a){return P.test(a.nodeName)},text:function(a){var b,c;return a.nodeName.toLowerCase()==="input"&&(b=a.type)==="text"&&((c=a.getAttribute("type"))==null||c.toLowerCase()===b)},radio:_("radio"),checkbox:_("checkbox"),file:_("file"),password:_("password"),image:_("image"),submit:ba("submit"),reset:ba("reset"),button:function(a){var b=a.nodeName.toLowerCase();return b==="input"&&a.type==="button"||b==="button"},input:function(a){return Q.test(a.nodeName)},focus:function(a){var b=a.ownerDocument;return a===b.activeElement&&(!b.hasFocus||b.hasFocus())&&(!!a.type||!!a.href)},active:function(a){return a===a.ownerDocument.activeElement}},setFilters:{first:function(a,b,c){return c?a.slice(1):[a[0]]},last:function(a,b,c){var d=a.pop();return c?a:[d]},even:function(a,b,c){var d=[],e=c?1:0,f=a.length;for(;e<f;e=e+2)d.push(a[e]);return d},odd:function(a,b,c){var d=[],e=c?0:1,f=a.length;for(;e<f;e=e+2)d.push(a[e]);return d},lt:function(a,b,c){return c?a.slice(+b):a.slice(0,+b)},gt:function(a,b,c){return c?a.slice(0,+b+1):a.slice(+b+1)},eq:function(a,b,c){var d=a.splice(+b,1);return c?a:d}}},k=r.compareDocumentPosition?function(a,b){return a===b?(l=!0,0):(!a.compareDocumentPosition||!b.compareDocumentPosition?a.compareDocumentPosition:a.compareDocumentPosition(b)&4)?-1:1}:function(a,b){if(a===b)return l=!0,0;if(a.sourceIndex&&b.sourceIndex)return a.sourceIndex-b.sourceIndex;var c,d,e=[],f=[],g=a.parentNode,h=b.parentNode,i=g;if(g===h)return bb(a,b);if(!g)return-1;if(!h)return 1;while(i)e.unshift(i),i=i.parentNode;i=h;while(i)f.unshift(i),i=i.parentNode;c=e.length,d=f.length;for(var j=0;j<c&&j<d;j++)if(e[j]!==f[j])return bb(e[j],f[j]);return j===c?bb(a,f[j],-1):bb(e[j],b,1)},[0,0].sort(k),m=!l,$.uniqueSort=function(a){var b,c=1;l=m,a.sort(k);if(l)for(;b=a[c];c++)b===a[c-1]&&a.splice(c--,1);return a},$.error=function(a){throw new Error("Syntax error, unrecognized expression: "+a)},j=$.compile=function(a,b,c){var d,e,f,g=z[o][a];if(g&&g.context===b)return g;d=bc(a,b,c);for(e=0,f=d.length;e<f;e++)d[e]=bf(d[e],b,c);return g=z(a,bg(d)),g.context=b,g.runs=g.dirruns=0,g},q.querySelectorAll&&function(){var a,b=bk,c=/'|\\/g,d=/\=[\x20\t\r\n\f]*([^'"\]]*)[\x20\t\r\n\f]*\]/g,e=[],f=[":active"],g=r.matchesSelector||r.mozMatchesSelector||r.webkitMatchesSelector||r.oMatchesSelector||r.msMatchesSelector;T(function(a){a.innerHTML="<select><option selected=''></option></select>",a.querySelectorAll("[selected]").length||e.push("\\["+A+"*(?:checked|disabled|ismap|multiple|readonly|selected|value)"),a.querySelectorAll(":checked").length||e.push(":checked")}),T(function(a){a.innerHTML="<p test=''></p>",a.querySelectorAll("[test^='']").length&&e.push("[*^$]="+A+"*(?:\"\"|'')"),a.innerHTML="<input type='hidden'/>",a.querySelectorAll(":enabled").length||e.push(":enabled",":disabled")}),e=e.length&&new RegExp(e.join("|")),bk=function(a,d,f,g,h){if(!g&&!h&&(!e||!e.test(a)))if(d.nodeType===9)try{return u.apply(f,t.call(d.querySelectorAll(a),0)),f}catch(i){}else if(d.nodeType===1&&d.nodeName.toLowerCase()!=="object"){var j,k,l,m=d.getAttribute("id"),n=m||o,p=N.test(a)&&d.parentNode||d;m?n=n.replace(c,"\\$&"):d.setAttribute("id",n),j=bc(a,d,h),n="[id='"+n+"']";for(k=0,l=j.length;k<l;k++)j[k]=n+j[k].selector;try{return u.apply(f,t.call(p.querySelectorAll(j.join(",")),0)),f}catch(i){}finally{m||d.removeAttribute("id")}}return b(a,d,f,g,h)},g&&(T(function(b){a=g.call(b,"div");try{g.call(b,"[test!='']:sizzle"),f.push(S.PSEUDO.source,S.POS.source,"!=")}catch(c){}}),f=new RegExp(f.join("|")),$.matchesSelector=function(b,c){c=c.replace(d,"='$1']");if(!h(b)&&!f.test(c)&&(!e||!e.test(c)))try{var i=g.call(b,c);if(i||a||b.document&&b.document.nodeType!==11)return i}catch(j){}return $(c,null,null,[b]).length>0})}(),f.setFilters.nth=f.setFilters.eq,f.filters=f.pseudos,$.attr=p.attr,p.find=$,p.expr=$.selectors,p.expr[":"]=p.expr.pseudos,p.unique=$.uniqueSort,p.text=$.getText,p.isXMLDoc=$.isXML,p.contains=$.contains}(a);var bc=/Until$/,bd=/^(?:parents|prev(?:Until|All))/,be=/^.[^:#\[\.,]*$/,bf=p.expr.match.needsContext,bg={children:!0,contents:!0,next:!0,prev:!0};p.fn.extend({find:function(a){var b,c,d,e,f,g,h=this;if(typeof a!="string")return p(a).filter(function(){for(b=0,c=h.length;b<c;b++)if(p.contains(h[b],this))return!0});g=this.pushStack("","find",a);for(b=0,c=this.length;b<c;b++){d=g.length,p.find(a,this[b],g);if(b>0)for(e=d;e<g.length;e++)for(f=0;f<d;f++)if(g[f]===g[e]){g.splice(e--,1);break}}return g},has:function(a){var b,c=p(a,this),d=c.length;return this.filter(function(){for(b=0;b<d;b++)if(p.contains(this,c[b]))return!0})},not:function(a){return this.pushStack(bj(this,a,!1),"not",a)},filter:function(a){return this.pushStack(bj(this,a,!0),"filter",a)},is:function(a){return!!a&&(typeof a=="string"?bf.test(a)?p(a,this.context).index(this[0])>=0:p.filter(a,this).length>0:this.filter(a).length>0)},closest:function(a,b){var c,d=0,e=this.length,f=[],g=bf.test(a)||typeof a!="string"?p(a,b||this.context):0;for(;d<e;d++){c=this[d];while(c&&c.ownerDocument&&c!==b&&c.nodeType!==11){if(g?g.index(c)>-1:p.find.matchesSelector(c,a)){f.push(c);break}c=c.parentNode}}return f=f.length>1?p.unique(f):f,this.pushStack(f,"closest",a)},index:function(a){return a?typeof a=="string"?p.inArray(this[0],p(a)):p.inArray(a.jquery?a[0]:a,this):this[0]&&this[0].parentNode?this.prevAll().length:-1},add:function(a,b){var c=typeof a=="string"?p(a,b):p.makeArray(a&&a.nodeType?[a]:a),d=p.merge(this.get(),c);return this.pushStack(bh(c[0])||bh(d[0])?d:p.unique(d))},addBack:function(a){return this.add(a==null?this.prevObject:this.prevObject.filter(a))}}),p.fn.andSelf=p.fn.addBack,p.each({parent:function(a){var b=a.parentNode;return b&&b.nodeType!==11?b:null},parents:function(a){return p.dir(a,"parentNode")},parentsUntil:function(a,b,c){return p.dir(a,"parentNode",c)},next:function(a){return bi(a,"nextSibling")},prev:function(a){return bi(a,"previousSibling")},nextAll:function(a){return p.dir(a,"nextSibling")},prevAll:function(a){return p.dir(a,"previousSibling")},nextUntil:function(a,b,c){return p.dir(a,"nextSibling",c)},prevUntil:function(a,b,c){return p.dir(a,"previousSibling",c)},siblings:function(a){return p.sibling((a.parentNode||{}).firstChild,a)},children:function(a){return p.sibling(a.firstChild)},contents:function(a){return p.nodeName(a,"iframe")?a.contentDocument||a.contentWindow.document:p.merge([],a.childNodes)}},function(a,b){p.fn[a]=function(c,d){var e=p.map(this,b,c);return bc.test(a)||(d=c),d&&typeof d=="string"&&(e=p.filter(d,e)),e=this.length>1&&!bg[a]?p.unique(e):e,this.length>1&&bd.test(a)&&(e=e.reverse()),this.pushStack(e,a,k.call(arguments).join(","))}}),p.extend({filter:function(a,b,c){return c&&(a=":not("+a+")"),b.length===1?p.find.matchesSelector(b[0],a)?[b[0]]:[]:p.find.matches(a,b)},dir:function(a,c,d){var e=[],f=a[c];while(f&&f.nodeType!==9&&(d===b||f.nodeType!==1||!p(f).is(d)))f.nodeType===1&&e.push(f),f=f[c];return e},sibling:function(a,b){var c=[];for(;a;a=a.nextSibling)a.nodeType===1&&a!==b&&c.push(a);return c}});var bl="abbr|article|aside|audio|bdi|canvas|data|datalist|details|figcaption|figure|footer|header|hgroup|mark|meter|nav|output|progress|section|summary|time|video",bm=/ jQuery\d+="(?:null|\d+)"/g,bn=/^\s+/,bo=/<(?!area|br|col|embed|hr|img|input|link|meta|param)(([\w:]+)[^>]*)\/>/gi,bp=/<([\w:]+)/,bq=/<tbody/i,br=/<|&#?\w+;/,bs=/<(?:script|style|link)/i,bt=/<(?:script|object|embed|option|style)/i,bu=new RegExp("<(?:"+bl+")[\\s/>]","i"),bv=/^(?:checkbox|radio)$/,bw=/checked\s*(?:[^=]|=\s*.checked.)/i,bx=/\/(java|ecma)script/i,by=/^\s*<!(?:\[CDATA\[|\-\-)|[\]\-]{2}>\s*$/g,bz={option:[1,"<select multiple='multiple'>","</select>"],legend:[1,"<fieldset>","</fieldset>"],thead:[1,"<table>","</table>"],tr:[2,"<table><tbody>","</tbody></table>"],td:[3,"<table><tbody><tr>","</tr></tbody></table>"],col:[2,"<table><tbody></tbody><colgroup>","</colgroup></table>"],area:[1,"<map>","</map>"],_default:[0,"",""]},bA=bk(e),bB=bA.appendChild(e.createElement("div"));bz.optgroup=bz.option,bz.tbody=bz.tfoot=bz.colgroup=bz.caption=bz.thead,bz.th=bz.td,p.support.htmlSerialize||(bz._default=[1,"X<div>","</div>"]),p.fn.extend({text:function(a){return p.access(this,function(a){return a===b?p.text(this):this.empty().append((this[0]&&this[0].ownerDocument||e).createTextNode(a))},null,a,arguments.length)},wrapAll:function(a){if(p.isFunction(a))return this.each(function(b){p(this).wrapAll(a.call(this,b))});if(this[0]){var b=p(a,this[0].ownerDocument).eq(0).clone(!0);this[0].parentNode&&b.insertBefore(this[0]),b.map(function(){var a=this;while(a.firstChild&&a.firstChild.nodeType===1)a=a.firstChild;return a}).append(this)}return this},wrapInner:function(a){return p.isFunction(a)?this.each(function(b){p(this).wrapInner(a.call(this,b))}):this.each(function(){var b=p(this),c=b.contents();c.length?c.wrapAll(a):b.append(a)})},wrap:function(a){var b=p.isFunction(a);return this.each(function(c){p(this).wrapAll(b?a.call(this,c):a)})},unwrap:function(){return this.parent().each(function(){p.nodeName(this,"body")||p(this).replaceWith(this.childNodes)}).end()},append:function(){return this.domManip(arguments,!0,function(a){(this.nodeType===1||this.nodeType===11)&&this.appendChild(a)})},prepend:function(){return this.domManip(arguments,!0,function(a){(this.nodeType===1||this.nodeType===11)&&this.insertBefore(a,this.firstChild)})},before:function(){if(!bh(this[0]))return this.domManip(arguments,!1,function(a){this.parentNode.insertBefore(a,this)});if(arguments.length){var a=p.clean(arguments);return this.pushStack(p.merge(a,this),"before",this.selector)}},after:function(){if(!bh(this[0]))return this.domManip(arguments,!1,function(a){this.parentNode.insertBefore(a,this.nextSibling)});if(arguments.length){var a=p.clean(arguments);return this.pushStack(p.merge(this,a),"after",this.selector)}},remove:function(a,b){var c,d=0;for(;(c=this[d])!=null;d++)if(!a||p.filter(a,[c]).length)!b&&c.nodeType===1&&(p.cleanData(c.getElementsByTagName("*")),p.cleanData([c])),c.parentNode&&c.parentNode.removeChild(c);return this},empty:function(){var a,b=0;for(;(a=this[b])!=null;b++){a.nodeType===1&&p.cleanData(a.getElementsByTagName("*"));while(a.firstChild)a.removeChild(a.firstChild)}return this},clone:function(a,b){return a=a==null?!1:a,b=b==null?a:b,this.map(function(){return p.clone(this,a,b)})},html:function(a){return p.access(this,function(a){var c=this[0]||{},d=0,e=this.length;if(a===b)return c.nodeType===1?c.innerHTML.replace(bm,""):b;if(typeof a=="string"&&!bs.test(a)&&(p.support.htmlSerialize||!bu.test(a))&&(p.support.leadingWhitespace||!bn.test(a))&&!bz[(bp.exec(a)||["",""])[1].toLowerCase()]){a=a.replace(bo,"<$1></$2>");try{for(;d<e;d++)c=this[d]||{},c.nodeType===1&&(p.cleanData(c.getElementsByTagName("*")),c.innerHTML=a);c=0}catch(f){}}c&&this.empty().append(a)},null,a,arguments.length)},replaceWith:function(a){return bh(this[0])?this.length?this.pushStack(p(p.isFunction(a)?a():a),"replaceWith",a):this:p.isFunction(a)?this.each(function(b){var c=p(this),d=c.html();c.replaceWith(a.call(this,b,d))}):(typeof a!="string"&&(a=p(a).detach()),this.each(function(){var b=this.nextSibling,c=this.parentNode;p(this).remove(),b?p(b).before(a):p(c).append(a)}))},detach:function(a){return this.remove(a,!0)},domManip:function(a,c,d){a=[].concat.apply([],a);var e,f,g,h,i=0,j=a[0],k=[],l=this.length;if(!p.support.checkClone&&l>1&&typeof j=="string"&&bw.test(j))return this.each(function(){p(this).domManip(a,c,d)});if(p.isFunction(j))return this.each(function(e){var f=p(this);a[0]=j.call(this,e,c?f.html():b),f.domManip(a,c,d)});if(this[0]){e=p.buildFragment(a,this,k),g=e.fragment,f=g.firstChild,g.childNodes.length===1&&(g=f);if(f){c=c&&p.nodeName(f,"tr");for(h=e.cacheable||l-1;i<l;i++)d.call(c&&p.nodeName(this[i],"table")?bC(this[i],"tbody"):this[i],i===h?g:p.clone(g,!0,!0))}g=f=null,k.length&&p.each(k,function(a,b){b.src?p.ajax?p.ajax({url:b.src,type:"GET",dataType:"script",async:!1,global:!1,"throws":!0}):p.error("no ajax"):p.globalEval((b.text||b.textContent||b.innerHTML||"").replace(by,"")),b.parentNode&&b.parentNode.removeChild(b)})}return this}}),p.buildFragment=function(a,c,d){var f,g,h,i=a[0];return c=c||e,c=!c.nodeType&&c[0]||c,c=c.ownerDocument||c,a.length===1&&typeof i=="string"&&i.length<512&&c===e&&i.charAt(0)==="<"&&!bt.test(i)&&(p.support.checkClone||!bw.test(i))&&(p.support.html5Clone||!bu.test(i))&&(g=!0,f=p.fragments[i],h=f!==b),f||(f=c.createDocumentFragment(),p.clean(a,c,f,d),g&&(p.fragments[i]=h&&f)),{fragment:f,cacheable:g}},p.fragments={},p.each({appendTo:"append",prependTo:"prepend",insertBefore:"before",insertAfter:"after",replaceAll:"replaceWith"},function(a,b){p.fn[a]=function(c){var d,e=0,f=[],g=p(c),h=g.length,i=this.length===1&&this[0].parentNode;if((i==null||i&&i.nodeType===11&&i.childNodes.length===1)&&h===1)return g[b](this[0]),this;for(;e<h;e++)d=(e>0?this.clone(!0):this).get(),p(g[e])[b](d),f=f.concat(d);return this.pushStack(f,a,g.selector)}}),p.extend({clone:function(a,b,c){var d,e,f,g;p.support.html5Clone||p.isXMLDoc(a)||!bu.test("<"+a.nodeName+">")?g=a.cloneNode(!0):(bB.innerHTML=a.outerHTML,bB.removeChild(g=bB.firstChild));if((!p.support.noCloneEvent||!p.support.noCloneChecked)&&(a.nodeType===1||a.nodeType===11)&&!p.isXMLDoc(a)){bE(a,g),d=bF(a),e=bF(g);for(f=0;d[f];++f)e[f]&&bE(d[f],e[f])}if(b){bD(a,g);if(c){d=bF(a),e=bF(g);for(f=0;d[f];++f)bD(d[f],e[f])}}return d=e=null,g},clean:function(a,b,c,d){var f,g,h,i,j,k,l,m,n,o,q,r,s=b===e&&bA,t=[];if(!b||typeof b.createDocumentFragment=="undefined")b=e;for(f=0;(h=a[f])!=null;f++){typeof h=="number"&&(h+="");if(!h)continue;if(typeof h=="string")if(!br.test(h))h=b.createTextNode(h);else{s=s||bk(b),l=b.createElement("div"),s.appendChild(l),h=h.replace(bo,"<$1></$2>"),i=(bp.exec(h)||["",""])[1].toLowerCase(),j=bz[i]||bz._default,k=j[0],l.innerHTML=j[1]+h+j[2];while(k--)l=l.lastChild;if(!p.support.tbody){m=bq.test(h),n=i==="table"&&!m?l.firstChild&&l.firstChild.childNodes:j[1]==="<table>"&&!m?l.childNodes:[];for(g=n.length-1;g>=0;--g)p.nodeName(n[g],"tbody")&&!n[g].childNodes.length&&n[g].parentNode.removeChild(n[g])}!p.support.leadingWhitespace&&bn.test(h)&&l.insertBefore(b.createTextNode(bn.exec(h)[0]),l.firstChild),h=l.childNodes,l.parentNode.removeChild(l)}h.nodeType?t.push(h):p.merge(t,h)}l&&(h=l=s=null);if(!p.support.appendChecked)for(f=0;(h=t[f])!=null;f++)p.nodeName(h,"input")?bG(h):typeof h.getElementsByTagName!="undefined"&&p.grep(h.getElementsByTagName("input"),bG);if(c){q=function(a){if(!a.type||bx.test(a.type))return d?d.push(a.parentNode?a.parentNode.removeChild(a):a):c.appendChild(a)};for(f=0;(h=t[f])!=null;f++)if(!p.nodeName(h,"script")||!q(h))c.appendChild(h),typeof h.getElementsByTagName!="undefined"&&(r=p.grep(p.merge([],h.getElementsByTagName("script")),q),t.splice.apply(t,[f+1,0].concat(r)),f+=r.length)}return t},cleanData:function(a,b){var c,d,e,f,g=0,h=p.expando,i=p.cache,j=p.support.deleteExpando,k=p.event.special;for(;(e=a[g])!=null;g++)if(b||p.acceptData(e)){d=e[h],c=d&&i[d];if(c){if(c.events)for(f in c.events)k[f]?p.event.remove(e,f):p.removeEvent(e,f,c.handle);i[d]&&(delete i[d],j?delete e[h]:e.removeAttribute?e.removeAttribute(h):e[h]=null,p.deletedIds.push(d))}}}}),function(){var a,b;p.uaMatch=function(a){a=a.toLowerCase();var b=/(chrome)[ \/]([\w.]+)/.exec(a)||/(webkit)[ \/]([\w.]+)/.exec(a)||/(opera)(?:.*version|)[ \/]([\w.]+)/.exec(a)||/(msie) ([\w.]+)/.exec(a)||a.indexOf("compatible")<0&&/(mozilla)(?:.*? rv:([\w.]+)|)/.exec(a)||[];return{browser:b[1]||"",version:b[2]||"0"}},a=p.uaMatch(g.userAgent),b={},a.browser&&(b[a.browser]=!0,b.version=a.version),b.chrome?b.webkit=!0:b.webkit&&(b.safari=!0),p.browser=b,p.sub=function(){function a(b,c){return new a.fn.init(b,c)}p.extend(!0,a,this),a.superclass=this,a.fn=a.prototype=this(),a.fn.constructor=a,a.sub=this.sub,a.fn.init=function c(c,d){return d&&d instanceof p&&!(d instanceof a)&&(d=a(d)),p.fn.init.call(this,c,d,b)},a.fn.init.prototype=a.fn;var b=a(e);return a}}();var bH,bI,bJ,bK=/alpha\([^)]*\)/i,bL=/opacity=([^)]*)/,bM=/^(top|right|bottom|left)$/,bN=/^(none|table(?!-c[ea]).+)/,bO=/^margin/,bP=new RegExp("^("+q+")(.*)$","i"),bQ=new RegExp("^("+q+")(?!px)[a-z%]+$","i"),bR=new RegExp("^([-+])=("+q+")","i"),bS={},bT={position:"absolute",visibility:"hidden",display:"block"},bU={letterSpacing:0,fontWeight:400},bV=["Top","Right","Bottom","Left"],bW=["Webkit","O","Moz","ms"],bX=p.fn.toggle;p.fn.extend({css:function(a,c){return p.access(this,function(a,c,d){return d!==b?p.style(a,c,d):p.css(a,c)},a,c,arguments.length>1)},show:function(){return b$(this,!0)},hide:function(){return b$(this)},toggle:function(a,b){var c=typeof a=="boolean";return p.isFunction(a)&&p.isFunction(b)?bX.apply(this,arguments):this.each(function(){(c?a:bZ(this))?p(this).show():p(this).hide()})}}),p.extend({cssHooks:{opacity:{get:function(a,b){if(b){var c=bH(a,"opacity");return c===""?"1":c}}}},cssNumber:{fillOpacity:!0,fontWeight:!0,lineHeight:!0,opacity:!0,orphans:!0,widows:!0,zIndex:!0,zoom:!0},cssProps:{"float":p.support.cssFloat?"cssFloat":"styleFloat"},style:function(a,c,d,e){if(!a||a.nodeType===3||a.nodeType===8||!a.style)return;var f,g,h,i=p.camelCase(c),j=a.style;c=p.cssProps[i]||(p.cssProps[i]=bY(j,i)),h=p.cssHooks[c]||p.cssHooks[i];if(d===b)return h&&"get"in h&&(f=h.get(a,!1,e))!==b?f:j[c];g=typeof d,g==="string"&&(f=bR.exec(d))&&(d=(f[1]+1)*f[2]+parseFloat(p.css(a,c)),g="number");if(d==null||g==="number"&&isNaN(d))return;g==="number"&&!p.cssNumber[i]&&(d+="px");if(!h||!("set"in h)||(d=h.set(a,d,e))!==b)try{j[c]=d}catch(k){}},css:function(a,c,d,e){var f,g,h,i=p.camelCase(c);return c=p.cssProps[i]||(p.cssProps[i]=bY(a.style,i)),h=p.cssHooks[c]||p.cssHooks[i],h&&"get"in h&&(f=h.get(a,!0,e)),f===b&&(f=bH(a,c)),f==="normal"&&c in bU&&(f=bU[c]),d||e!==b?(g=parseFloat(f),d||p.isNumeric(g)?g||0:f):f},swap:function(a,b,c){var d,e,f={};for(e in b)f[e]=a.style[e],a.style[e]=b[e];d=c.call(a);for(e in b)a.style[e]=f[e];return d}}),a.getComputedStyle?bH=function(b,c){var d,e,f,g,h=a.getComputedStyle(b,null),i=b.style;return h&&(d=h[c],d===""&&!p.contains(b.ownerDocument,b)&&(d=p.style(b,c)),bQ.test(d)&&bO.test(c)&&(e=i.width,f=i.minWidth,g=i.maxWidth,i.minWidth=i.maxWidth=i.width=d,d=h.width,i.width=e,i.minWidth=f,i.maxWidth=g)),d}:e.documentElement.currentStyle&&(bH=function(a,b){var c,d,e=a.currentStyle&&a.currentStyle[b],f=a.style;return e==null&&f&&f[b]&&(e=f[b]),bQ.test(e)&&!bM.test(b)&&(c=f.left,d=a.runtimeStyle&&a.runtimeStyle.left,d&&(a.runtimeStyle.left=a.currentStyle.left),f.left=b==="fontSize"?"1em":e,e=f.pixelLeft+"px",f.left=c,d&&(a.runtimeStyle.left=d)),e===""?"auto":e}),p.each(["height","width"],function(a,b){p.cssHooks[b]={get:function(a,c,d){if(c)return a.offsetWidth===0&&bN.test(bH(a,"display"))?p.swap(a,bT,function(){return cb(a,b,d)}):cb(a,b,d)},set:function(a,c,d){return b_(a,c,d?ca(a,b,d,p.support.boxSizing&&p.css(a,"boxSizing")==="border-box"):0)}}}),p.support.opacity||(p.cssHooks.opacity={get:function(a,b){return bL.test((b&&a.currentStyle?a.currentStyle.filter:a.style.filter)||"")?.01*parseFloat(RegExp.$1)+"":b?"1":""},set:function(a,b){var c=a.style,d=a.currentStyle,e=p.isNumeric(b)?"alpha(opacity="+b*100+")":"",f=d&&d.filter||c.filter||"";c.zoom=1;if(b>=1&&p.trim(f.replace(bK,""))===""&&c.removeAttribute){c.removeAttribute("filter");if(d&&!d.filter)return}c.filter=bK.test(f)?f.replace(bK,e):f+" "+e}}),p(function(){p.support.reliableMarginRight||(p.cssHooks.marginRight={get:function(a,b){return p.swap(a,{display:"inline-block"},function(){if(b)return bH(a,"marginRight")})}}),!p.support.pixelPosition&&p.fn.position&&p.each(["top","left"],function(a,b){p.cssHooks[b]={get:function(a,c){if(c){var d=bH(a,b);return bQ.test(d)?p(a).position()[b]+"px":d}}}})}),p.expr&&p.expr.filters&&(p.expr.filters.hidden=function(a){return a.offsetWidth===0&&a.offsetHeight===0||!p.support.reliableHiddenOffsets&&(a.style&&a.style.display||bH(a,"display"))==="none"},p.expr.filters.visible=function(a){return!p.expr.filters.hidden(a)}),p.each({margin:"",padding:"",border:"Width"},function(a,b){p.cssHooks[a+b]={expand:function(c){var d,e=typeof c=="string"?c.split(" "):[c],f={};for(d=0;d<4;d++)f[a+bV[d]+b]=e[d]||e[d-2]||e[0];return f}},bO.test(a)||(p.cssHooks[a+b].set=b_)});var cd=/%20/g,ce=/\[\]$/,cf=/\r?\n/g,cg=/^(?:color|date|datetime|datetime-local|email|hidden|month|number|password|range|search|tel|text|time|url|week)$/i,ch=/^(?:select|textarea)/i;p.fn.extend({serialize:function(){return p.param(this.serializeArray())},serializeArray:function(){return this.map(function(){return this.elements?p.makeArray(this.elements):this}).filter(function(){return this.name&&!this.disabled&&(this.checked||ch.test(this.nodeName)||cg.test(this.type))}).map(function(a,b){var c=p(this).val();return c==null?null:p.isArray(c)?p.map(c,function(a,c){return{name:b.name,value:a.replace(cf,"\r\n")}}):{name:b.name,value:c.replace(cf,"\r\n")}}).get()}}),p.param=function(a,c){var d,e=[],f=function(a,b){b=p.isFunction(b)?b():b==null?"":b,e[e.length]=encodeURIComponent(a)+"="+encodeURIComponent(b)};c===b&&(c=p.ajaxSettings&&p.ajaxSettings.traditional);if(p.isArray(a)||a.jquery&&!p.isPlainObject(a))p.each(a,function(){f(this.name,this.value)});else for(d in a)ci(d,a[d],c,f);return e.join("&").replace(cd,"+")};var cj,ck,cl=/#.*$/,cm=/^(.*?):[ \t]*([^\r\n]*)\r?$/mg,cn=/^(?:about|app|app\-storage|.+\-extension|file|res|widget):$/,co=/^(?:GET|HEAD)$/,cp=/^\/\//,cq=/\?/,cr=/<script\b[^<]*(?:(?!<\/script>)<[^<]*)*<\/script>/gi,cs=/([?&])_=[^&]*/,ct=/^([\w\+\.\-]+:)(?:\/\/([^\/?#:]*)(?::(\d+)|)|)/,cu=p.fn.load,cv={},cw={},cx=["*/"]+["*"];try{cj=f.href}catch(cy){cj=e.createElement("a"),cj.href="",cj=cj.href}ck=ct.exec(cj.toLowerCase())||[],p.fn.load=function(a,c,d){if(typeof a!="string"&&cu)return cu.apply(this,arguments);if(!this.length)return this;var e,f,g,h=this,i=a.indexOf(" ");return i>=0&&(e=a.slice(i,a.length),a=a.slice(0,i)),p.isFunction(c)?(d=c,c=b):c&&typeof c=="object"&&(f="POST"),p.ajax({url:a,type:f,dataType:"html",data:c,complete:function(a,b){d&&h.each(d,g||[a.responseText,b,a])}}).done(function(a){g=arguments,h.html(e?p("<div>").append(a.replace(cr,"")).find(e):a)}),this},p.each("ajaxStart ajaxStop ajaxComplete ajaxError ajaxSuccess ajaxSend".split(" "),function(a,b){p.fn[b]=function(a){return this.on(b,a)}}),p.each(["get","post"],function(a,c){p[c]=function(a,d,e,f){return p.isFunction(d)&&(f=f||e,e=d,d=b),p.ajax({type:c,url:a,data:d,success:e,dataType:f})}}),p.extend({getScript:function(a,c){return p.get(a,b,c,"script")},getJSON:function(a,b,c){return p.get(a,b,c,"json")},ajaxSetup:function(a,b){return b?cB(a,p.ajaxSettings):(b=a,a=p.ajaxSettings),cB(a,b),a},ajaxSettings:{url:cj,isLocal:cn.test(ck[1]),global:!0,type:"GET",contentType:"application/x-www-form-urlencoded; charset=UTF-8",processData:!0,async:!0,accepts:{xml:"application/xml, text/xml",html:"text/html",text:"text/plain",json:"application/json, text/javascript","*":cx},contents:{xml:/xml/,html:/html/,json:/json/},responseFields:{xml:"responseXML",text:"responseText"},converters:{"* text":a.String,"text html":!0,"text json":p.parseJSON,"text xml":p.parseXML},flatOptions:{context:!0,url:!0}},ajaxPrefilter:cz(cv),ajaxTransport:cz(cw),ajax:function(a,c){function y(a,c,f,i){var k,s,t,u,w,y=c;if(v===2)return;v=2,h&&clearTimeout(h),g=b,e=i||"",x.readyState=a>0?4:0,f&&(u=cC(l,x,f));if(a>=200&&a<300||a===304)l.ifModified&&(w=x.getResponseHeader("Last-Modified"),w&&(p.lastModified[d]=w),w=x.getResponseHeader("Etag"),w&&(p.etag[d]=w)),a===304?(y="notmodified",k=!0):(k=cD(l,u),y=k.state,s=k.data,t=k.error,k=!t);else{t=y;if(!y||a)y="error",a<0&&(a=0)}x.status=a,x.statusText=""+(c||y),k?o.resolveWith(m,[s,y,x]):o.rejectWith(m,[x,y,t]),x.statusCode(r),r=b,j&&n.trigger("ajax"+(k?"Success":"Error"),[x,l,k?s:t]),q.fireWith(m,[x,y]),j&&(n.trigger("ajaxComplete",[x,l]),--p.active||p.event.trigger("ajaxStop"))}typeof a=="object"&&(c=a,a=b),c=c||{};var d,e,f,g,h,i,j,k,l=p.ajaxSetup({},c),m=l.context||l,n=m!==l&&(m.nodeType||m instanceof p)?p(m):p.event,o=p.Deferred(),q=p.Callbacks("once memory"),r=l.statusCode||{},t={},u={},v=0,w="canceled",x={readyState:0,setRequestHeader:function(a,b){if(!v){var c=a.toLowerCase();a=u[c]=u[c]||a,t[a]=b}return this},getAllResponseHeaders:function(){return v===2?e:null},getResponseHeader:function(a){var c;if(v===2){if(!f){f={};while(c=cm.exec(e))f[c[1].toLowerCase()]=c[2]}c=f[a.toLowerCase()]}return c===b?null:c},overrideMimeType:function(a){return v||(l.mimeType=a),this},abort:function(a){return a=a||w,g&&g.abort(a),y(0,a),this}};o.promise(x),x.success=x.done,x.error=x.fail,x.complete=q.add,x.statusCode=function(a){if(a){var b;if(v<2)for(b in a)r[b]=[r[b],a[b]];else b=a[x.status],x.always(b)}return this},l.url=((a||l.url)+"").replace(cl,"").replace(cp,ck[1]+"//"),l.dataTypes=p.trim(l.dataType||"*").toLowerCase().split(s),l.crossDomain==null&&(i=ct.exec(l.url.toLowerCase()),l.crossDomain=!(!i||i[1]==ck[1]&&i[2]==ck[2]&&(i[3]||(i[1]==="http:"?80:443))==(ck[3]||(ck[1]==="http:"?80:443)))),l.data&&l.processData&&typeof l.data!="string"&&(l.data=p.param(l.data,l.traditional)),cA(cv,l,c,x);if(v===2)return x;j=l.global,l.type=l.type.toUpperCase(),l.hasContent=!co.test(l.type),j&&p.active++===0&&p.event.trigger("ajaxStart");if(!l.hasContent){l.data&&(l.url+=(cq.test(l.url)?"&":"?")+l.data,delete l.data),d=l.url;if(l.cache===!1){var z=p.now(),A=l.url.replace(cs,"$1_="+z);l.url=A+(A===l.url?(cq.test(l.url)?"&":"?")+"_="+z:"")}}(l.data&&l.hasContent&&l.contentType!==!1||c.contentType)&&x.setRequestHeader("Content-Type",l.contentType),l.ifModified&&(d=d||l.url,p.lastModified[d]&&x.setRequestHeader("If-Modified-Since",p.lastModified[d]),p.etag[d]&&x.setRequestHeader("If-None-Match",p.etag[d])),x.setRequestHeader("Accept",l.dataTypes[0]&&l.accepts[l.dataTypes[0]]?l.accepts[l.dataTypes[0]]+(l.dataTypes[0]!=="*"?", "+cx+"; q=0.01":""):l.accepts["*"]);for(k in l.headers)x.setRequestHeader(k,l.headers[k]);if(!l.beforeSend||l.beforeSend.call(m,x,l)!==!1&&v!==2){w="abort";for(k in{success:1,error:1,complete:1})x[k](l[k]);g=cA(cw,l,c,x);if(!g)y(-1,"No Transport");else{x.readyState=1,j&&n.trigger("ajaxSend",[x,l]),l.async&&l.timeout>0&&(h=setTimeout(function(){x.abort("timeout")},l.timeout));try{v=1,g.send(t,y)}catch(B){if(v<2)y(-1,B);else throw B}}return x}return x.abort()},active:0,lastModified:{},etag:{}});var cE=[],cF=/\?/,cG=/(=)\?(?=&|$)|\?\?/,cH=p.now();p.ajaxSetup({jsonp:"callback",jsonpCallback:function(){var a=cE.pop()||p.expando+"_"+cH++;return this[a]=!0,a}}),p.ajaxPrefilter("json jsonp",function(c,d,e){var f,g,h,i=c.data,j=c.url,k=c.jsonp!==!1,l=k&&cG.test(j),m=k&&!l&&typeof i=="string"&&!(c.contentType||"").indexOf("application/x-www-form-urlencoded")&&cG.test(i);if(c.dataTypes[0]==="jsonp"||l||m)return f=c.jsonpCallback=p.isFunction(c.jsonpCallback)?c.jsonpCallback():c.jsonpCallback,g=a[f],l?c.url=j.replace(cG,"$1"+f):m?c.data=i.replace(cG,"$1"+f):k&&(c.url+=(cF.test(j)?"&":"?")+c.jsonp+"="+f),c.converters["script json"]=function(){return h||p.error(f+" was not called"),h[0]},c.dataTypes[0]="json",a[f]=function(){h=arguments},e.always(function(){a[f]=g,c[f]&&(c.jsonpCallback=d.jsonpCallback,cE.push(f)),h&&p.isFunction(g)&&g(h[0]),h=g=b}),"script"}),p.ajaxSetup({accepts:{script:"text/javascript, application/javascript, application/ecmascript, application/x-ecmascript"},contents:{script:/javascript|ecmascript/},converters:{"text script":function(a){return p.globalEval(a),a}}}),p.ajaxPrefilter("script",function(a){a.cache===b&&(a.cache=!1),a.crossDomain&&(a.type="GET",a.global=!1)}),p.ajaxTransport("script",function(a){if(a.crossDomain){var c,d=e.head||e.getElementsByTagName("head")[0]||e.documentElement;return{send:function(f,g){c=e.createElement("script"),c.async="async",a.scriptCharset&&(c.charset=a.scriptCharset),c.src=a.url,c.onload=c.onreadystatechange=function(a,e){if(e||!c.readyState||/loaded|complete/.test(c.readyState))c.onload=c.onreadystatechange=null,d&&c.parentNode&&d.removeChild(c),c=b,e||g(200,"success")},d.insertBefore(c,d.firstChild)},abort:function(){c&&c.onload(0,1)}}}});var cI,cJ=a.ActiveXObject?function(){for(var a in cI)cI[a](0,1)}:!1,cK=0;p.ajaxSettings.xhr=a.ActiveXObject?function(){return!this.isLocal&&cL()||cM()}:cL,function(a){p.extend(p.support,{ajax:!!a,cors:!!a&&"withCredentials"in a})}(p.ajaxSettings.xhr()),p.support.ajax&&p.ajaxTransport(function(c){if(!c.crossDomain||p.support.cors){var d;return{send:function(e,f){var g,h,i=c.xhr();c.username?i.open(c.type,c.url,c.async,c.username,c.password):i.open(c.type,c.url,c.async);if(c.xhrFields)for(h in c.xhrFields)i[h]=c.xhrFields[h];c.mimeType&&i.overrideMimeType&&i.overrideMimeType(c.mimeType),!c.crossDomain&&!e["X-Requested-With"]&&(e["X-Requested-With"]="XMLHttpRequest");try{for(h in e)i.setRequestHeader(h,e[h])}catch(j){}i.send(c.hasContent&&c.data||null),d=function(a,e){var h,j,k,l,m;try{if(d&&(e||i.readyState===4)){d=b,g&&(i.onreadystatechange=p.noop,cJ&&delete cI[g]);if(e)i.readyState!==4&&i.abort();else{h=i.status,k=i.getAllResponseHeaders(),l={},m=i.responseXML,m&&m.documentElement&&(l.xml=m);try{l.text=i.responseText}catch(a){}try{j=i.statusText}catch(n){j=""}!h&&c.isLocal&&!c.crossDomain?h=l.text?200:404:h===1223&&(h=204)}}}catch(o){e||f(-1,o)}l&&f(h,j,l,k)},c.async?i.readyState===4?setTimeout(d,0):(g=++cK,cJ&&(cI||(cI={},p(a).unload(cJ)),cI[g]=d),i.onreadystatechange=d):d()},abort:function(){d&&d(0,1)}}}});var cN,cO,cP=/^(?:toggle|show|hide)$/,cQ=new RegExp("^(?:([-+])=|)("+q+")([a-z%]*)$","i"),cR=/queueHooks$/,cS=[cY],cT={"*":[function(a,b){var c,d,e,f=this.createTween(a,b),g=cQ.exec(b),h=f.cur(),i=+h||0,j=1;if(g){c=+g[2],d=g[3]||(p.cssNumber[a]?"":"px");if(d!=="px"&&i){i=p.css(f.elem,a,!0)||c||1;do e=j=j||".5",i=i/j,p.style(f.elem,a,i+d),j=f.cur()/h;while(j!==1&&j!==e)}f.unit=d,f.start=i,f.end=g[1]?i+(g[1]+1)*c:c}return f}]};p.Animation=p.extend(cW,{tweener:function(a,b){p.isFunction(a)?(b=a,a=["*"]):a=a.split(" ");var c,d=0,e=a.length;for(;d<e;d++)c=a[d],cT[c]=cT[c]||[],cT[c].unshift(b)},prefilter:function(a,b){b?cS.unshift(a):cS.push(a)}}),p.Tween=cZ,cZ.prototype={constructor:cZ,init:function(a,b,c,d,e,f){this.elem=a,this.prop=c,this.easing=e||"swing",this.options=b,this.start=this.now=this.cur(),this.end=d,this.unit=f||(p.cssNumber[c]?"":"px")},cur:function(){var a=cZ.propHooks[this.prop];return a&&a.get?a.get(this):cZ.propHooks._default.get(this)},run:function(a){var b,c=cZ.propHooks[this.prop];return this.options.duration?this.pos=b=p.easing[this.easing](a,this.options.duration*a,0,1,this.options.duration):this.pos=b=a,this.now=(this.end-this.start)*b+this.start,this.options.step&&this.options.step.call(this.elem,this.now,this),c&&c.set?c.set(this):cZ.propHooks._default.set(this),this}},cZ.prototype.init.prototype=cZ.prototype,cZ.propHooks={_default:{get:function(a){var b;return a.elem[a.prop]==null||!!a.elem.style&&a.elem.style[a.prop]!=null?(b=p.css(a.elem,a.prop,!1,""),!b||b==="auto"?0:b):a.elem[a.prop]},set:function(a){p.fx.step[a.prop]?p.fx.step[a.prop](a):a.elem.style&&(a.elem.style[p.cssProps[a.prop]]!=null||p.cssHooks[a.prop])?p.style(a.elem,a.prop,a.now+a.unit):a.elem[a.prop]=a.now}}},cZ.propHooks.scrollTop=cZ.propHooks.scrollLeft={set:function(a){a.elem.nodeType&&a.elem.parentNode&&(a.elem[a.prop]=a.now)}},p.each(["toggle","show","hide"],function(a,b){var c=p.fn[b];p.fn[b]=function(d,e,f){return d==null||typeof d=="boolean"||!a&&p.isFunction(d)&&p.isFunction(e)?c.apply(this,arguments):this.animate(c$(b,!0),d,e,f)}}),p.fn.extend({fadeTo:function(a,b,c,d){return this.filter(bZ).css("opacity",0).show().end().animate({opacity:b},a,c,d)},animate:function(a,b,c,d){var e=p.isEmptyObject(a),f=p.speed(b,c,d),g=function(){var b=cW(this,p.extend({},a),f);e&&b.stop(!0)};return e||f.queue===!1?this.each(g):this.queue(f.queue,g)},stop:function(a,c,d){var e=function(a){var b=a.stop;delete a.stop,b(d)};return typeof a!="string"&&(d=c,c=a,a=b),c&&a!==!1&&this.queue(a||"fx",[]),this.each(function(){var b=!0,c=a!=null&&a+"queueHooks",f=p.timers,g=p._data(this);if(c)g[c]&&g[c].stop&&e(g[c]);else for(c in g)g[c]&&g[c].stop&&cR.test(c)&&e(g[c]);for(c=f.length;c--;)f[c].elem===this&&(a==null||f[c].queue===a)&&(f[c].anim.stop(d),b=!1,f.splice(c,1));(b||!d)&&p.dequeue(this,a)})}}),p.each({slideDown:c$("show"),slideUp:c$("hide"),slideToggle:c$("toggle"),fadeIn:{opacity:"show"},fadeOut:{opacity:"hide"},fadeToggle:{opacity:"toggle"}},function(a,b){p.fn[a]=function(a,c,d){return this.animate(b,a,c,d)}}),p.speed=function(a,b,c){var d=a&&typeof a=="object"?p.extend({},a):{complete:c||!c&&b||p.isFunction(a)&&a,duration:a,easing:c&&b||b&&!p.isFunction(b)&&b};d.duration=p.fx.off?0:typeof d.duration=="number"?d.duration:d.duration in p.fx.speeds?p.fx.speeds[d.duration]:p.fx.speeds._default;if(d.queue==null||d.queue===!0)d.queue="fx";return d.old=d.complete,d.complete=function(){p.isFunction(d.old)&&d.old.call(this),d.queue&&p.dequeue(this,d.queue)},d},p.easing={linear:function(a){return a},swing:function(a){return.5-Math.cos(a*Math.PI)/2}},p.timers=[],p.fx=cZ.prototype.init,p.fx.tick=function(){var a,b=p.timers,c=0;for(;c<b.length;c++)a=b[c],!a()&&b[c]===a&&b.splice(c--,1);b.length||p.fx.stop()},p.fx.timer=function(a){a()&&p.timers.push(a)&&!cO&&(cO=setInterval(p.fx.tick,p.fx.interval))},p.fx.interval=13,p.fx.stop=function(){clearInterval(cO),cO=null},p.fx.speeds={slow:600,fast:200,_default:400},p.fx.step={},p.expr&&p.expr.filters&&(p.expr.filters.animated=function(a){return p.grep(p.timers,function(b){return a===b.elem}).length});var c_=/^(?:body|html)$/i;p.fn.offset=function(a){if(arguments.length)return a===b?this:this.each(function(b){p.offset.setOffset(this,a,b)});var c,d,e,f,g,h,i,j,k,l,m=this[0],n=m&&m.ownerDocument;if(!n)return;return(e=n.body)===m?p.offset.bodyOffset(m):(d=n.documentElement,p.contains(d,m)?(c=m.getBoundingClientRect(),f=da(n),g=d.clientTop||e.clientTop||0,h=d.clientLeft||e.clientLeft||0,i=f.pageYOffset||d.scrollTop,j=f.pageXOffset||d.scrollLeft,k=c.top+i-g,l=c.left+j-h,{top:k,left:l}):{top:0,left:0})},p.offset={bodyOffset:function(a){var b=a.offsetTop,c=a.offsetLeft;return p.support.doesNotIncludeMarginInBodyOffset&&(b+=parseFloat(p.css(a,"marginTop"))||0,c+=parseFloat(p.css(a,"marginLeft"))||0),{top:b,left:c}},setOffset:function(a,b,c){var d=p.css(a,"position");d==="static"&&(a.style.position="relative");var e=p(a),f=e.offset(),g=p.css(a,"top"),h=p.css(a,"left"),i=(d==="absolute"||d==="fixed")&&p.inArray("auto",[g,h])>-1,j={},k={},l,m;i?(k=e.position(),l=k.top,m=k.left):(l=parseFloat(g)||0,m=parseFloat(h)||0),p.isFunction(b)&&(b=b.call(a,c,f)),b.top!=null&&(j.top=b.top-f.top+l),b.left!=null&&(j.left=b.left-f.left+m),"using"in b?b.using.call(a,j):e.css(j)}},p.fn.extend({position:function(){if(!this[0])return;var a=this[0],b=this.offsetParent(),c=this.offset(),d=c_.test(b[0].nodeName)?{top:0,left:0}:b.offset();return c.top-=parseFloat(p.css(a,"marginTop"))||0,c.left-=parseFloat(p.css(a,"marginLeft"))||0,d.top+=parseFloat(p.css(b[0],"borderTopWidth"))||0,d.left+=parseFloat(p.css(b[0],"borderLeftWidth"))||0,{top:c.top-d.top,left:c.left-d.left}},offsetParent:function(){return this.map(function(){var a=this.offsetParent||e.body;while(a&&!c_.test(a.nodeName)&&p.css(a,"position")==="static")a=a.offsetParent;return a||e.body})}}),p.each({scrollLeft:"pageXOffset",scrollTop:"pageYOffset"},function(a,c){var d=/Y/.test(c);p.fn[a]=function(e){return p.access(this,function(a,e,f){var g=da(a);if(f===b)return g?c in g?g[c]:g.document.documentElement[e]:a[e];g?g.scrollTo(d?p(g).scrollLeft():f,d?f:p(g).scrollTop()):a[e]=f},a,e,arguments.length,null)}}),p.each({Height:"height",Width:"width"},function(a,c){p.each({padding:"inner"+a,content:c,"":"outer"+a},function(d,e){p.fn[e]=function(e,f){var g=arguments.length&&(d||typeof e!="boolean"),h=d||(e===!0||f===!0?"margin":"border");return p.access(this,function(c,d,e){var f;return p.isWindow(c)?c.document.documentElement["client"+a]:c.nodeType===9?(f=c.documentElement,Math.max(c.body["scroll"+a],f["scroll"+a],c.body["offset"+a],f["offset"+a],f["client"+a])):e===b?p.css(c,d,e,h):p.style(c,d,e,h)},c,g?e:b,g,null)}})}),a.jQuery=a.$=p,typeof define=="function"&&define.amd&&define.amd.jQuery&&define("jquery",[],function(){return p})})(window);;
/*jshint -W020 */
/*
    json2.js
    2014-02-04

    Public Domain.

    NO WARRANTY EXPRESSED OR IMPLIED. USE AT YOUR OWN RISK.

    See http://www.JSON.org/js.html


    This code should be minified before deployment.
    See http://javascript.crockford.com/jsmin.html

    USE YOUR OWN COPY. IT IS EXTREMELY UNWISE TO LOAD CODE FROM SERVERS YOU DO
    NOT CONTROL.


    This file creates a global JSON object containing two methods: stringify
    and parse.

        JSON.stringify(value, replacer, space)
            value       any JavaScript value, usually an object or array.

            replacer    an optional parameter that determines how object
                        values are stringified for objects. It can be a
                        function or an array of strings.

            space       an optional parameter that specifies the indentation
                        of nested structures. If it is omitted, the text will
                        be packed without extra whitespace. If it is a number,
                        it will specify the number of spaces to indent at each
                        level. If it is a string (such as '\t' or '&nbsp;'),
                        it contains the characters used to indent at each level.

            This method produces a JSON text from a JavaScript value.

            When an object value is found, if the object contains a toJSON
            method, its toJSON method will be called and the result will be
            stringified. A toJSON method does not serialize: it returns the
            value represented by the name/value pair that should be serialized,
            or undefined if nothing should be serialized. The toJSON method
            will be passed the key associated with the value, and this will be
            bound to the value

            For example, this would serialize Dates as ISO strings.

                Date.prototype.toJSON = function (key) {
                    function f(n) {
                        // Format integers to have at least two digits.
                        return n < 10 ? '0' + n : n;
                    }

                    return this.getUTCFullYear()   + '-' +
                         f(this.getUTCMonth() + 1) + '-' +
                         f(this.getUTCDate())      + 'T' +
                         f(this.getUTCHours())     + ':' +
                         f(this.getUTCMinutes())   + ':' +
                         f(this.getUTCSeconds())   + 'Z';
                };

            You can provide an optional replacer method. It will be passed the
            key and value of each member, with this bound to the containing
            object. The value that is returned from your method will be
            serialized. If your method returns undefined, then the member will
            be excluded from the serialization.

            If the replacer parameter is an array of strings, then it will be
            used to select the members to be serialized. It filters the results
            such that only members with keys listed in the replacer array are
            stringified.

            Values that do not have JSON representations, such as undefined or
            functions, will not be serialized. Such values in objects will be
            dropped; in arrays they will be replaced with null. You can use
            a replacer function to replace those with JSON values.
            JSON.stringify(undefined) returns undefined.

            The optional space parameter produces a stringification of the
            value that is filled with line breaks and indentation to make it
            easier to read.

            If the space parameter is a non-empty string, then that string will
            be used for indentation. If the space parameter is a number, then
            the indentation will be that many spaces.

            Example:

            text = JSON.stringify(['e', {pluribus: 'unum'}]);
            // text is '["e",{"pluribus":"unum"}]'


            text = JSON.stringify(['e', {pluribus: 'unum'}], null, '\t');
            // text is '[\n\t"e",\n\t{\n\t\t"pluribus": "unum"\n\t}\n]'

            text = JSON.stringify([new Date()], function (key, value) {
                return this[key] instanceof Date ?
                    'Date(' + this[key] + ')' : value;
            });
            // text is '["Date(---current time---)"]'


        JSON.parse(text, reviver)
            This method parses a JSON text to produce an object or array.
            It can throw a SyntaxError exception.

            The optional reviver parameter is a function that can filter and
            transform the results. It receives each of the keys and values,
            and its return value is used instead of the original value.
            If it returns what it received, then the structure is not modified.
            If it returns undefined then the member is deleted.

            Example:

            // Parse the text. Values that look like ISO date strings will
            // be converted to Date objects.

            myData = JSON.parse(text, function (key, value) {
                var a;
                if (typeof value === 'string') {
                    a =
/^(\d{4})-(\d{2})-(\d{2})T(\d{2}):(\d{2}):(\d{2}(?:\.\d*)?)Z$/.exec(value);
                    if (a) {
                        return new Date(Date.UTC(+a[1], +a[2] - 1, +a[3], +a[4],
                            +a[5], +a[6]));
                    }
                }
                return value;
            });

            myData = JSON.parse('["Date(09/09/2001)"]', function (key, value) {
                var d;
                if (typeof value === 'string' &&
                        value.slice(0, 5) === 'Date(' &&
                        value.slice(-1) === ')') {
                    d = new Date(value.slice(5, -1));
                    if (d) {
                        return d;
                    }
                }
                return value;
            });


    This is a reference implementation. You are free to copy, modify, or
    redistribute.
*/

/*jslint evil: true, regexp: true */

/*members "", "\b", "\t", "\n", "\f", "\r", "\"", JSON, "\\", apply,
    call, charCodeAt, getUTCDate, getUTCFullYear, getUTCHours,
    getUTCMinutes, getUTCMonth, getUTCSeconds, hasOwnProperty, join,
    lastIndex, length, parse, prototype, push, replace, slice, stringify,
    test, toJSON, toString, valueOf
*/


// Create a JSON object only if one does not already exist. We create the
// methods in a closure to avoid creating global variables.

if (typeof JSON !== 'object') {
    JSON = {};
}

(function () {
    'use strict';

    function f(n) {
        // Format integers to have at least two digits.
        return n < 10 ? '0' + n : n;
    }

    if (typeof Date.prototype.toJSON !== 'function') {

        Date.prototype.toJSON = function () {

            return isFinite(this.valueOf())
                ? this.getUTCFullYear()     + '-' +
                f(this.getUTCMonth() + 1) + '-' +
                f(this.getUTCDate())      + 'T' +
                f(this.getUTCHours())     + ':' +
                f(this.getUTCMinutes())   + ':' +
                f(this.getUTCSeconds())   + 'Z'
                : null;
        };

        String.prototype.toJSON      =
            Number.prototype.toJSON  =
                Boolean.prototype.toJSON = function () {
                    return this.valueOf();
                };
    }

    var cx,
        escapable,
        gap,
        indent,
        meta,
        rep;


    function quote(string) {

// If the string contains no control characters, no quote characters, and no
// backslash characters, then we can safely slap some quotes around it.
// Otherwise we must also replace the offending characters with safe escape
// sequences.

        escapable.lastIndex = 0;
        return escapable.test(string) ? '"' + string.replace(escapable, function (a) {
            var c = meta[a];
            return typeof c === 'string'
                ? c
                : '\\u' + ('0000' + a.charCodeAt(0).toString(16)).slice(-4);
        }) + '"' : '"' + string + '"';
    }


    function str(key, holder) {

// Produce a string from holder[key].

        var i,          // The loop counter.
            k,          // The member key.
            v,          // The member value.
            length,
            mind = gap,
            partial,
            value = holder[key];

// If the value has a toJSON method, call it to obtain a replacement value.

        if (value && typeof value === 'object' &&
            typeof value.toJSON === 'function') {
            value = value.toJSON(key);
        }

// If we were called with a replacer function, then call the replacer to
// obtain a replacement value.

        if (typeof rep === 'function') {
            value = rep.call(holder, key, value);
        }

// What happens next depends on the value's type.

        switch (typeof value) {
            case 'string':
                return quote(value);

            case 'number':

// JSON numbers must be finite. Encode non-finite numbers as null.

                return isFinite(value) ? String(value) : 'null';

            case 'boolean':
            case 'null':

// If the value is a boolean or null, convert it to a string. Note:
// typeof null does not produce 'null'. The case is included here in
// the remote chance that this gets fixed someday.

                return String(value);

// If the type is 'object', we might be dealing with an object or an array or
// null.

            case 'object':

// Due to a specification blunder in ECMAScript, typeof null is 'object',
// so watch out for that case.

                if (!value) {
                    return 'null';
                }

// Make an array to hold the partial results of stringifying this object value.

                gap += indent;
                partial = [];

// Is the value an array?

                if (Object.prototype.toString.apply(value) === '[object Array]') {

// The value is an array. Stringify every element. Use null as a placeholder
// for non-JSON values.

                    length = value.length;
                    for (i = 0; i < length; i += 1) {
                        partial[i] = str(i, value) || 'null';
                    }

// Join all of the elements together, separated with commas, and wrap them in
// brackets.

                    v = partial.length === 0
                        ? '[]'
                        : gap
                            ? '[\n' + gap + partial.join(',\n' + gap) + '\n' + mind + ']'
                            : '[' + partial.join(',') + ']';
                    gap = mind;
                    return v;
                }

// If the replacer is an array, use it to select the members to be stringified.

                if (rep && typeof rep === 'object') {
                    length = rep.length;
                    for (i = 0; i < length; i += 1) {
                        if (typeof rep[i] === 'string') {
                            k = rep[i];
                            v = str(k, value);
                            if (v) {
                                partial.push(quote(k) + (gap ? ': ' : ':') + v);
                            }
                        }
                    }
                } else {

// Otherwise, iterate through all of the keys in the object.

                    for (k in value) {
                        if (Object.prototype.hasOwnProperty.call(value, k)) {
                            v = str(k, value);
                            if (v) {
                                partial.push(quote(k) + (gap ? ': ' : ':') + v);
                            }
                        }
                    }
                }

// Join all of the member texts together, separated with commas,
// and wrap them in braces.

                v = partial.length === 0
                    ? '{}'
                    : gap
                        ? '{\n' + gap + partial.join(',\n' + gap) + '\n' + mind + '}'
                        : '{' + partial.join(',') + '}';
                gap = mind;
                return v;
        }
    }

// If the JSON object does not yet have a stringify method, give it one.

    if (typeof JSON.stringify !== 'function') {
        escapable = /[\\\"\x00-\x1f\x7f-\x9f\u00ad\u0600-\u0604\u070f\u17b4\u17b5\u200c-\u200f\u2028-\u202f\u2060-\u206f\ufeff\ufff0-\uffff]/g;
        meta = {    // table of character substitutions
            '\b': '\\b',
            '\t': '\\t',
            '\n': '\\n',
            '\f': '\\f',
            '\r': '\\r',
            '"' : '\\"',
            '\\': '\\\\'
        };
        JSON.stringify = function (value, replacer, space) {

// The stringify method takes a value and an optional replacer, and an optional
// space parameter, and returns a JSON text. The replacer can be a function
// that can replace values, or an array of strings that will select the keys.
// A default replacer method can be provided. Use of the space parameter can
// produce text that is more easily readable.

            var i;
            gap = '';
            indent = '';

// If the space parameter is a number, make an indent string containing that
// many spaces.

            if (typeof space === 'number') {
                for (i = 0; i < space; i += 1) {
                    indent += ' ';
                }

// If the space parameter is a string, it will be used as the indent string.

            } else if (typeof space === 'string') {
                indent = space;
            }

// If there is a replacer, it must be a function or an array.
// Otherwise, throw an error.

            rep = replacer;
            if (replacer && typeof replacer !== 'function' &&
                (typeof replacer !== 'object' ||
                    typeof replacer.length !== 'number')) {
                throw new Error('JSON.stringify');
            }

// Make a fake root object containing our value under the key of ''.
// Return the result of stringifying the value.

            return str('', {'': value});
        };
    }


// If the JSON object does not yet have a parse method, give it one.

    if (typeof JSON.parse !== 'function') {
        cx = /[\u0000\u00ad\u0600-\u0604\u070f\u17b4\u17b5\u200c-\u200f\u2028-\u202f\u2060-\u206f\ufeff\ufff0-\uffff]/g;
        JSON.parse = function (text, reviver) {

// The parse method takes a text and an optional reviver function, and returns
// a JavaScript value if the text is a valid JSON text.

            var j;

            function walk(holder, key) {

// The walk method is used to recursively walk the resulting structure so
// that modifications can be made.

                var k, v, value = holder[key];
                if (value && typeof value === 'object') {
                    for (k in value) {
                        if (Object.prototype.hasOwnProperty.call(value, k)) {
                            v = walk(value, k);
                            if (v !== undefined) {
                                value[k] = v;
                            } else {
                                delete value[k];
                            }
                        }
                    }
                }
                return reviver.call(holder, key, value);
            }


// Parsing happens in four stages. In the first stage, we replace certain
// Unicode characters with escape sequences. JavaScript handles many characters
// incorrectly, either silently deleting them, or treating them as line endings.

            text = String(text);
            cx.lastIndex = 0;
            if (cx.test(text)) {
                text = text.replace(cx, function (a) {
                    return '\\u' +
                        ('0000' + a.charCodeAt(0).toString(16)).slice(-4);
                });
            }

// In the second stage, we run the text against regular expressions that look
// for non-JSON patterns. We are especially concerned with '()' and 'new'
// because they can cause invocation, and '=' because it can cause mutation.
// But just to be safe, we want to reject all unexpected forms.

// We split the second stage into 4 regexp operations in order to work around
// crippling inefficiencies in IE's and Safari's regexp engines. First we
// replace the JSON backslash pairs with '@' (a non-JSON character). Second, we
// replace all simple value tokens with ']' characters. Third, we delete all
// open brackets that follow a colon or comma or that begin the text. Finally,
// we look to see that the remaining characters are only whitespace or ']' or
// ',' or ':' or '{' or '}'. If that is so, then the text is safe for eval.

            if (/^[\],:{}\s]*$/
                .test(text.replace(/\\(?:["\\\/bfnrt]|u[0-9a-fA-F]{4})/g, '@')
                    .replace(/"[^"\\\n\r]*"|true|false|null|-?\d+(?:\.\d*)?(?:[eE][+\-]?\d+)?/g, ']')
                    .replace(/(?:^|:|,)(?:\s*\[)+/g, ''))) {

// In the third stage we use the eval function to compile the text into a
// JavaScript structure. The '{' operator is subject to a syntactic ambiguity
// in JavaScript: it can begin a block or an object literal. We wrap the text
// in parens to eliminate the ambiguity.

                j = eval('(' + text + ')');

// In the optional fourth stage, we recursively walk the new structure, passing
// each name/value pair to a reviver function for possible transformation.

                return typeof reviver === 'function'
                    ? walk({'': j}, '')
                    : j;
            }

// If the text is not JSON parseable, then a SyntaxError is thrown.

            throw new SyntaxError('JSON.parse');
        };
    }
}());;
/**
 * Moduleæ˜¯JavaScriptæ¨¡å—åŠ è½½ç®¡ç†å™¨ï¼ˆæ¯”è¾ƒæŽ¥è¿‘CMDè§„èŒƒçš„CommonJSå®žçŽ°ï¼‰
 *
 * æ¨¡å—åŠ è½½ç®¡ç†å®žçŽ°åŠ›æ±‚ç®€å•ï¼Œä¸åšæ¨¡å—uriæ ‡å‡†åŒ–å¤„ç†ï¼Œç•™ç»™å…·ä½“ä½¿ç”¨è€…å®žçŽ°
 * å¦å¤–æä¾›äº†å¸¸ç”¨çš„Ecma5æ–¹æ³•(polyfill)ï¼Œå¦‚ï¼šindexOf, forEach, trimç­‰
 * é…åˆDomå·¥å…·åº“jQueryå¯ä»¥æ»¡è¶³åŸºæœ¬çš„webå¼€å‘éœ€æ±‚ï¼Œå¯ä»¥åŸºäºŽè¯¥æ¨¡å—åŠ è½½ç®¡ç†å™¨å®žçŽ°å¾ˆå¤šåŸºæœ¬æ¨¡å—
 *
 * @author shufenghua@gmail.com
 */
/* jshint -W030 */
/* global M */
/*jslint nomen: true*/
(function(global, undefined) {


    /**
     * prevent re-define
     */
    if(global.M && global.M.Module) {
        return;
    }


    /**
     * expose to global
     */
    var M = global.M = {};



    /**
     *  local closure variable and proto link
     */
    var
        TRUE = true,
        FALSE = false,

        gid = 0,

        MODULE_STATUS_UNKNOWN = 0,
        MODULE_STATUS_WAITING = 1,
        MODULE_STATUS_LOADED = 2,

        stringPrototype = String.prototype,
        arrayPrototype = Array.prototype,
        objectPrototype = Object.prototype,
        functionPrototype = Function.prototype,

        nativeStringTrim = stringPrototype.trim,
        nativeArrayMap = arrayPrototype.map,
        nativeArraySome = arrayPrototype.some,
        nativeArrayEvery = arrayPrototype.every,
        nativeArraySlice = arrayPrototype.slice,
        nativeArrayFilter = arrayPrototype.filter,
        nativeArrayForEach = arrayPrototype.forEach,
        nativeArrayIndexOf = arrayPrototype.indexOf,
        nativeArrayLastIndexOf = arrayPrototype.lastIndexOf,
        nativeFunctionBind = functionPrototype.bind;



    /**
     *  error log and debug
     */
    M.log = function() {
        if('console' in global && typeof global.console.log == 'function') {
            return global.console.log.apply(global.console, arguments);
        }
    };
    M.info = function() {
        if('console' in global) {
            if(typeof global.console.info == 'function') {
                return global.console.info.apply(global.console, arguments);
            } else if(typeof global.console.log == 'function') {
                return global.console.log.apply(global.console, arguments);
            }
        }
    };
    M.debug = function() {
        if(M.config.debug) {
            return M.log.apply(M, arguments);
        }
    };
    M.warning = function(msg) {
        if(M.config.debug) {
            M.info('Error:'+msg);
        }
    };
    M.error = function(msg) {
        if(M.config.debug) {
            throw new TypeError(msg);
        } else {
            M.info('Error:'+msg);
        }
    };


    /**
     * util functions
     */
    var
        noop = function() {},
        genId = function() {
            gid++;
            return gid;
        },
        is = function(obj, type) { // ç±»åž‹æ£€æµ‹ï¼Œtypeæ”¯æŒbuild in function and native functionss
            type = type.substr(0, 1).toUpperCase() + type.substr(1);
            return {}.toString.call(obj) == '[object '+type+']';
        },
        isNull = function(obj) {
            return obj === null;
        },
        isUndefined = function(obj) {
            return obj === undefined;
        },
        isArray = function(obj) {
            return is(obj, 'Array');
        },
        isObject = function(obj) {
            return typeof obj == "object" && !isNull(obj);
        },
        isFunction = function(obj) {
            return typeof obj === "function";
        },
        isEmptyObject = function(obj) {
            if(!isObject(obj)) {
                return FALSE;
            }
            for(var i in obj) {
                if(obj.hasOwnProperty(i)) {
                    return FALSE;
                }
            }
            return TRUE;
        },
        isEmpty = function(v) { // empty string, empty array, empty object
            return v === "" || (isArray(v) && v.length === 0) || isEmptyObject(v);
        },
        keys = function(obj) {
            var keys = [];
            if(isObject(obj)) {
                for(var i in obj) {
                    if(obj.hasOwnProperty(i)) {
                        keys.push(i);
                    }
                }
            }
            return keys;
        },

// ECMAScript 6th Edition implementation
// String part
        trim = function(str) {
            if(nativeStringTrim) {
                return nativeStringTrim.call(str);
            } else {
                return str.replace(/^\s+|\s+$/g, '');
            }
        },
// Array part
        map = function(arr, func, thisArg) {
            if(nativeArrayMap) {
                return nativeArrayMap.call(arr, func, thisArg);
            } else {
                if(isNull(arr) || isUndefined(arr)) {
                    M.error("Array.prototype.map called on null or undefined");
                } else if(!isFunction(func)) {
                    M.error(func+" is not a function");
                }

                var O = Object(arr),
                    len = O.length >>> 0,
                    A = new Array(len),
                    k = 0;

                while(k < len) {
                    if (k in O) {
                        A[k] = func.call(thisArg, O[k], k, O);
                    }
                    k++;
                }
                return A;
            }
        },
        some = function(arr, func, thisArg) {
            if(nativeArraySome) {
                return nativeArraySome.call(arr, func, thisArg);
            } else {
                if(isNull(arr) || isUndefined(arr)) {
                    M.error("Array.prototype.some called on null or undefined");
                } else if(!isFunction(func)) {
                    M.error(func+" is not a function");
                }

                var O = Object(arr),
                    len = O.length >>> 0,
                    A = new Array(len),
                    k = 0;

                while(k < len) {
                    if (k in O && func.call(thisArg, O[k], k, O)) {
                        return TRUE;
                    }
                    k++;
                }
                return FALSE;
            }
        },
        every = function(arr, func, thisArg) {
            if(nativeArrayEvery) {
                return nativeArrayEvery.call(arr, func, thisArg);
            } else {
                if(isNull(arr) || isUndefined(arr)) {
                    M.error("Array.prototype.every called on null or undefined");
                } else if(!isFunction(func)) {
                    M.error(func+" is not a function");
                }

                var O = Object(arr),
                    len = O.length >>> 0,
                    A = new Array(len),
                    k = 0;

                while(k < len) {
                    if (k in O && !func.call(thisArg, O[k], k, O)) {
                        return FALSE;
                    }
                    k++;
                }
                return TRUE;
            }
        },
        filter = function(arr, func, thisArg) {
            if(nativeArrayFilter) {
                return nativeArrayFilter.call(arr, func, thisArg);
            } else {
                if(isNull(arr) || isUndefined(arr)) {
                    M.error("Array.prototype.filter called on null or undefined");
                } else if(!isFunction(func)) {
                    M.error(func+" is not a function");
                }

                var O = Object(arr),
                    len = O.length >>> 0,
                    k = 0,
                    ret = [],
                    item;

                while(k < len) {
                    if (k in O) {
                        item = O[k];
                        if(func.call(thisArg, item, k, O)) {
                            ret.push(item);
                        }
                    }
                    k++;
                }
                return ret;
            }
        },
        indexOf = function(arr, searchVal/*, fromIndex*/) {
            if(nativeArrayIndexOf) {
                var args = nativeArraySlice.call(arguments, 1);
                return nativeArrayIndexOf.apply(arr, args);
            } else {
                var len = arr.length,
                    fromIndex = 0;

                if(arguments.length > 2) {
                    fromIndex = parseInt(arguments[2], 10);
                    fromIndex = isNaN(fromIndex) ? 0 : fromIndex;
                }

                if(len === 0 || fromIndex > len) {
                    return -1;
                }

                if(fromIndex < 0) {
                    fromIndex += len;
                }

                for(; fromIndex<len; fromIndex++) {
                    if(arr[fromIndex] === searchVal) {
                        return fromIndex;
                    }
                }
                return -1;
            }
        },
        lastIndexOf = function(arr, searchVal/*, fromIndex*/) {
            if(nativeArrayLastIndexOf) {
                var args = nativeArraySlice.call(arguments, 1);
                return nativeArrayLastIndexOf.apply(arr, args);
            } else {
                var len = arr.length,
                    fromIndex = len;

                if(len === 0) {
                    return -1;
                }

                if(arguments.length > 2) {
                    fromIndex = parseInt(arguments[2], 10);
                    fromIndex = isNaN(fromIndex) ? len : fromIndex;
                }

                if(fromIndex < 0) {
                    fromIndex += len;
                }

                for(; fromIndex >= 0; fromIndex--) {
                    if(arr[fromIndex] === searchVal) {
                        return fromIndex;
                    }
                }
                return -1;
            }
        },
// Function part
        bind = function(func, thisArg) {
            if(nativeFunctionBind) {
                var aArgs = nativeArraySlice.call(arguments, 2);
                return nativeFunctionBind.apply(func, [thisArg].concat(aArgs));
            } else {
                if (!isFunction(func)) {
                    // closest thing possible to the ECMAScript 5 internal IsCallable function
                    M.error("Function.prototype.bind - what is trying to be bound is not callable");
                }

                var aArgs = nativeArraySlice.call(arguments, 2),
                    fToBind = func,
                    fNOP = function () {},
                    fBound = function () {
                        return fToBind.apply(func instanceof fNOP && thisArg ? func : thisArg || global, aArgs.concat(nativeArraySlice.call(arguments, 0)));
                    };

                fNOP.prototype = func.prototype;
                fBound.prototype = new fNOP();

                return fBound;
            }
        },
// Other utils
        mix = function(srcObj/*, targetobj1, targetobj2, xxx, overlay*/) {
            var targetObjs = nativeArraySlice.call(arguments, 1),
                argsLen = arguments.length,
                overlay = TRUE;

            if(is(targetObjs[argsLen-2], "Boolean")) {
                overlay = targetObjs[argsLen-2];
                targetObjs = targetObjs.slice(0, argsLen-2);
            }
            forEach(targetObjs, function(obj, index) {
                if(isObject(obj)) {
                    for(var i in obj) {
                        if(!srcObj.hasOwnProperty(i) || overlay) {
                            srcObj[i] = obj[i];
                        }
                    }
                }
            });
            return srcObj;
        },
        extend = function(func, proto) {
            var f = function() {};
            f.prototype = proto.prototype;
            var originProto = func.prototype;
            func.prototype = new f();
            mix(func.prototype, originProto, TRUE);
            func.prototype.constructor = func;
            func.prototype.$parent = proto.prototype;
            func.$parent = proto;
            return func;
        },
        forEach = function(obj, handler, context) {
            var i, len;
            context = context || global;
            if(!isObject(obj)) {
                return;
            }
            if(nativeArrayForEach && (is(obj, 'Array') || is(obj, 'Arguments'))) { // native foreach supported
                var o = nativeArraySlice.call(obj, 0);
                nativeArrayForEach.call(o, handler, context);
            } else if(is(obj, 'Array') || is(obj, 'Arguments')) {
                var o = nativeArraySlice.call(obj, 0);
                for(i=0, len=o.length; i<len; i++) {
                    handler.call(context, o[i], i, o);
                }
            } else {
                for(i in obj) {
                    if(obj.hasOwnProperty(i)) {
                        handler.call(context, obj[i], i, obj);
                    }
                }
            }
        };

    mix(M, {
        is: is, isNull: isNull, isUndefined: isUndefined, isArray: isArray, isObject: isObject, isFunction: isFunction, isEmptyObject: isEmptyObject, isEmpty: isEmpty, keys: keys,
        trim: trim,
        bind: bind,
        mix: mix,
        extend: extend,
        map: map,
        some: some,
        every: every,
        filter: filter,
        forEach: forEach,
        indexOf: indexOf,
        lastIndexOf: lastIndexOf
    });



    /**
     * Event
     */
    var
        events = {},
        eventPrefixArgs = function(args, prefix) {
            var data = [];
            if(args.length > 1) {
                data = nativeArraySlice.call(args).slice(1);
            }
            data.unshift(prefix+'_'+args[0]);
            return data;
        },
        firedEventNames = {},
        innerEvent = {
            on: function(name, handler) {
                if(!(name in events)) {
                    events[name] = [];
                }
                events[name].push(handler);
            },
            off: function(name, handler) {
                if(!(name in events) || events[name].length === 0) {
                    return;
                }

                if(!handler) {
                    events[name] = [];
                } else {
                    forEach(events[name], function(item, index) {
                        if(item == handler) {
                            events[name][index] = null;
                        }
                    });
                }
            },
            once: function(name, handler) {
                var me = this,
                    onceHandler = function() {
                        me.off(name, onceHandler);
                        var args = nativeArraySlice.call(arguments);
                        handler.apply(null, args);
                    };

                return this.on(name, onceHandler);
            },
            fire: function(name/*, datas*/) {
                firedEventNames[name] = 1;
                if(!(name in events) || events[name].length === 0) {
                    return;
                }

                var data = [];
                if(arguments.length > 0) {
                    data = nativeArraySlice.call(arguments).slice(1);
                }
                forEach(events[name], function(item, index) {
                    if(isFunction(item)) {
                        item.apply(global, data);
                    }
                });
            },
            isFired: function(name) {
                if(name in firedEventNames) {
                    return true;
                }
                return false;
            }
        };
    var Event = M.Event = function(target) {
        if(!isObject(target) && !isFunction(target)) {

            M.error('only can bind event on object or function:'+target);
        }
        if(!target.__event_id) {
            target.__event_id = genId();
        }

        var evObj = {}, evId = target.__event_id;
        forEach(innerEvent, function(func, key) {
            evObj[key] = function() {
                return func.apply(innerEvent, eventPrefixArgs(arguments, 'objectevent_'+evId));
            };
        });

        return evObj;
    };
    var normalEvent = {};
    forEach(innerEvent, function(func, key) {
        normalEvent[key] = function() {
            return func.apply(innerEvent, eventPrefixArgs(arguments, 'normalevent'));
        };
    });
    mix(M.Event, normalEvent);
    M.events = events;



    /**
     * Module
     */
    var Modules = M.Modules = {};
    function Module(options) {
        this.id = "";
        this.depends = [];
        this.factory = null;
        this.status = MODULE_STATUS_WAITING;
        this.instantiated = FALSE;
        mix(this, options);

        this.instance = this.instantiated ? this.factory : null;

        //M.debug(this.id+" defined.");
    }
    Module.prototype = {
        load: function() {
            this.status = MODULE_STATUS_LOADED;
            Event.fire(this.id+" loaded");

            //M.debug(this.id+" loaded.");
        },

        getInstance: function() {
            if(!this.instantiated) {
                var id = this.id,
                    module = {
                        exports: {},
                        getId: function() {
                            return id;
                        }
                    },
                    ret = this.factory.call(global, Require, module.exports, module);

                if(isEmptyObject(module.exports)) {
                    module.exports = ret;
                }
                this.instance = module.exports;
                this.instantiated = true;
            }
            return this.instance;
        }
    };

    function Require(moduleId) {
        if(!(moduleId in Modules) || Modules[moduleId].status !== MODULE_STATUS_LOADED) {
            M.error("can not require an unloaded module:"+moduleId);
        }
        return Modules[moduleId].getInstance();
    }
    Require.async = function(moduleIds, handler) {
        if(is(moduleIds, 'String')) {
            moduleIds = moduleIds.split(",");
        }
        if(!is(moduleIds, 'Array')) {
            M.error('module async require invalid:'+moduleIds);
        }

        // ç­‰å¾…å¼‚æ­¥åŠ è½½æ¨¡å—å®Œæˆ
        wait(moduleIds, function() {
            var requireModules = map(moduleIds, function(moduleId) {
                return Require(moduleId);
            });
            handler.apply(global, requireModules);
        });

        M.fetchModules(moduleIds);
    };

    var define = global.define = M.define = function(id, factory) { // factory can be object or array
        // params check
        if(!is(id, 'String')) { // æ¨¡å—è¿˜æ˜¯é‡‡ç”¨äº†å¿…å¡«idçš„æ–¹å¼ï¼Œä¸å¡«å†™idçš„æ¨¡å—ä¸æ˜¯ä¸€ä¸ªå¥½æ¨¡å—
            M.error('module id invalid:'+id);
        }

        if(!isFunction(factory) && !isObject(factory)) { // éžå¯¹è±¡æˆ–å‡½æ•°å¼çš„æ¨¡å—ä¸å…è®¸å®šä¹‰ï¼Œå­—é¢é‡å¦‚éœ€è¦æˆä¸ºæ¨¡å—ä¸»è¦åŽŸå› æ˜¯ä¸ºäº†å…±äº«æ•°æ®ï¼Œå¯ä»¥åœ¨é¡µé¢ä¸­è¾“å‡ºåˆ°domå…ƒç´ ä¸­
            M.error('module '+id+' factory invalid');
        }

        if(id in Modules) {
            M.warning('module '+id+' has been defined');
            return;
        }

        var depends = [];
        if(isFunction(factory)) {
            depends = extractDepends(factory);
        }

        var module = new Module({
            id: id,
            depends: depends,
            factory: factory,
            status: depends.length ? MODULE_STATUS_WAITING : MODULE_STATUS_LOADED,
            instantiated: isFunction(factory) ? FALSE : TRUE
        });
        Modules[id] = module;
        if(module.status === MODULE_STATUS_WAITING) {
            var loaded = TRUE;
            forEach(depends, function(depend) {
                // è®¾ç½®ä¾èµ–äº‹ä»¶
                if(!(depend in Modules) || (Modules[depend].status !== MODULE_STATUS_LOADED && !loopDepends(id, depend))) {
                    Event.on(depend+" loaded", function() {
                        checkStatus(module);
                    });
                    loaded = FALSE;
                }
            });
            if(loaded) {
                module.load();
            }
        } else {
            module.load();
        }
    };
// extract depends from function
    var extractDepends = function(func) {
        var funcString = trim(func.toString()),
            firstParenthesisPosition = funcString.indexOf(')'),
            funcHead = funcString.substr(0, firstParenthesisPosition+1), // get 'function xxxx(arg1, arg2, xxxx)' part
            argsMatch = funcHead.match(/\(\s*([^\)]*)\s*\)/);

        if(!isNull(argsMatch)) {
            var argsString = trim(argsMatch[1]);
            if(argsString.length > 0) {
                var argsSplit = argsString.split(','),
                    requireArg = trim(argsSplit[0]),
                    requireReg = new RegExp("\\b"+requireArg+"\\s*\\(\\s*['\"]([^\\)]+)['\"]\\s*\\)", 'g');

                var matchRet, depends = [];
                while((matchRet = requireReg.exec(funcString)) !== null) {
                    depends.push(trim(matchRet[1]));
                }
                return depends;
            }
        }

        return [];
    };
// check id loop depend dependId
    var loopDepends = function(id, dependId) {
        var dependModule = Modules[dependId],
            dependModuleSubDepends = dependModule.depends,
            dependLen = dependModuleSubDepends.length;

        if(dependLen === 0) {
            return FALSE;
        } else if(indexOf(dependModuleSubDepends, id) != -1) {
            return TRUE;
        } else {
            for(var i=0; i<dependLen; i++) {
                if((dependModuleSubDepends[i] in Modules) && loopDepends(id, dependModuleSubDepends[i])) {
                    return TRUE;
                }
            }
            return FALSE;
        }
    };
// check module status to decide load
    var checkStatus = function(module) {
        var loaded = TRUE,
            depends = module.depends;
        forEach(depends, function(depend) {
            if(!(depend in Modules) || Modules[depend].status !== MODULE_STATUS_LOADED) {
                loaded = FALSE;
            }
        });
        if(loaded) {
            module.load();
        }
    };

    Module.waiting = function() {
        var waiting = [];
        forEach(Modules, function(module, index) {
            if(module.status === MODULE_STATUS_WAITING) {
                var waitingItem = {id: index, wait: []}, dependId, dependItem;
                for(var i=0, len=module.depends.length; i<len; i++) {
                    dependId = module.depends[i];
                    if(dependId in Modules) {
                        if(Modules[dependId].status === MODULE_STATUS_WAITING) {
                            waitingItem.wait.push({id: dependId, status: MODULE_STATUS_WAITING});
                        }
                    } else {
                        waitingItem.wait.push({id: dependId, status: MODULE_STATUS_UNKNOWN});
                    }
                }
                waiting.push(waitingItem);
            }
        });
        return waiting;
    };

    Module.loaded = function() {
        var loaded = [];
        forEach(Modules, function(module, index) {
            if(module.status === MODULE_STATUS_LOADED) {
                loaded.push({id: index, depends: module.depends});
            }
        });
        return loaded;
    };

    M.Module = Module;

    M.closure = function(handler, activeMode) {
        var unknownModules = [];
        if(!isFunction(handler)) {
            M.error('M.closure is for function execution.');
        }

        var modules = extractDepends(handler);

        // wait modules loaded to trigger handler
        if(isEmptyObject(modules)) {
            handler(Require);
        } else {
            wait(modules, function() {
                handler(Require);
            });
        }

        // get unknown modules
        forEach(modules, function(moduleId) {
            if(!(moduleId in Modules)) {
                unknownModules.push(moduleId);
            }
        });

        // ä¸»åŠ¨æ¨¡å¼ï¼ˆä¸»åŠ¨æ¨¡å¼ä¸‹ä¼šä¸»åŠ¨åŠ è½½æ‰€éœ€æ¨¡å—è€Œéžåªç­‰å¾…æ¨¡å—åŠ è½½å®Œæ¯•ï¼‰
        if(activeMode && unknownModules.length > 0) {
            M.fetchModules(unknownModules);
        }
    };

// wait module util function
    var waitProcessList = [];
    var wait = function(moduleIds, callback) {
        if(!isFunction(callback)) {
            return FALSE;
        }

        var loaded = TRUE,
            waitProcess = {moduleIds:{}, callback:callback};
        forEach(moduleIds, function(moduleId) {
            if(!(moduleId in Modules) || Modules[moduleId].status !== MODULE_STATUS_LOADED) {
                waitProcess.moduleIds[moduleId] = TRUE;
                Event.on(moduleId+" loaded", function() {
                    clearWaitProcessList(moduleId);
                });
            }
        });

        if(!isEmptyObject(waitProcess.moduleIds)) {
            waitProcessList.push(waitProcess);
        } else {
            callback();
        }
    };
    var clearWaitProcessList = function(moduleId) {
        forEach(waitProcessList, function(waitProcess, index) {
            if(waitProcess) {
                if(moduleId in waitProcess.moduleIds) {
                    delete waitProcess.moduleIds[moduleId];
                }
                if(isEmptyObject(waitProcess.moduleIds)) {
                    delete(waitProcessList[index]);
                    waitProcess.callback();
                }
            }
        });
    };
    Module.closureWaiting = function() {
        return waitProcessList;
    };
    Module.wait = wait;

// initiative fetch module
    var fetchModules = [];
    M.fetchModules = function(moduleIds) {
        var needFetchModules = [];
        forEach(moduleIds, function(moduleId) {
            if(indexOf(fetchModules, moduleId) == -1 && !(moduleId in Modules)) {
                needFetchModules.push(moduleId);
                fetchModules.push(moduleId);
            }
        });
        if(needFetchModules.length > 0) {
            M.config.fetchModules(needFetchModules);
        }
    };

    M.fetching = function() {
        var fetchingModules = [];
        forEach(fetchModules, function(moduleId) {
            if(!(moduleId in Modules)) {
                fetchingModules.push(moduleId);
            }
        });
        return fetchingModules;
    };


    /**
     * config
     */
    M.config = {
        debug: FALSE,
        fetchModules: function() {
            M.error('You must implement fetchModules method!');
        }
    };

} (window));
;
/* global M,JSON */
/* jshint -W030 */
/* jslint nomen: true */
(function(global) {

// based on M and $(jquery or jquery like(etc, zepto) lib)
    if(!global.M || !global.$) {
        return;
    }

    var M = global.M,
        $ = global.$;

    var Env = window.Env || {},
        WWW_HOST = Env.WWW_HOST || 'www.mafengwo.cn',
        JS_HOST = Env.JS_HOST || 'js.mafengwo.net',
        PAGELET_HTTP = Env.PAGELET_HTTP || location.protocol+'//pagelet.mafengwo.cn';

    M.config.debug = Env.debug || false;

    /**
     * åˆ¤æ–­window focusçŠ¶æ€
     */
    function onWindowFocus(){
        M.windowFocused = true;
    }
    function onWindowBlur(){
        M.windowFocused = false;
    }
    M.windowFocused = true;
    if('addEventListener' in window) {
        window.addEventListener( 'focus', onWindowFocus, false );
        window.addEventListener( 'blur', onWindowBlur, false );
    } else if('attachEvent' in document){
        document.attachEvent( 'onfocusin', onWindowFocus);
        document.attachEvent( 'onfocusout', onWindowBlur);
    }


    /**
     * å®žçŽ°jsfä¸­å¼‚æ­¥åŠ è½½æ¨¡å—åŠŸèƒ½
     */
    M.config.fetchModules = function(modules, callback) {
        return M.config.fetchJS(modules, callback);
    };
// åŠ è½½jså’Œcss(ç”±äºŽéœ€è¦ç‰ˆæœ¬å·å’Œä¾èµ–ï¼Œæ‰€ä»¥è¯·æ±‚ä¸€ä¸ªç»Ÿä¸€æŽ¥å£æ¥èŽ·å¾—)
    M.config.fetchJS = function(jsList, callback) {
        M.loadCSSJS(jsList, function(data) {
            if('js_list' in data) {
                M.loadResource(data.js_list, callback);
            }
        });
    };
    M.config.fetchCSS = function(cssList, callback) {
        M.loadCSSJS(cssList, function(data) {
            if('css_list' in data) {
                M.loadResource(data.css_list, callback);
            }
        });
    };


// å‰ç«¯åŠ è½½cssjsçš„æ–¹æ³•åŸºç¡€
    M.loadCSSJS = function(cssJsList, callback) {
        if(M.is(cssJsList, 'String')) {
            cssJsList = [cssJsList];
        }
        var cssList = [],
            jsList = [];

        M.forEach(cssJsList, function(item) {
            if(isCSS(item)) {
                cssList.push(item);
            } else {
                jsList.push(item);
            }
        });
        if(!cssList.length && !jsList.length) {
            typeof callback == 'function' && callback({});
        } else {
            var loadedModules = M.map(M.Module.loaded(), function(item) {
                return item.id;
            });

            $.ajax({
                dataType: 'jsonp',
                url: location.protocol+'//'+WWW_HOST+'/ajax/ajax_fetch_cssjs.php',
                data: {css_list: cssList, js_list: jsList, loaded_modules: loadedModules.join(',')},
                success: function(res) {
                    typeof callback == 'function' && callback(res);
                }
            }, 'json');
        }
    };


    /**
     * css js è„šæœ¬åŠ è½½æŽ§åˆ¶éƒ¨åˆ†
     */
    var
        doc = global.document,
        docHead = doc.getElementsByTagName("head")[0] || doc.documentElement,
        isOldWebKit = +navigator.userAgent.replace(/.*AppleWebKit\/(\d+)\..*/, "$1") < 536,
        processResource = []; // å¾…å¤„ç†çš„åŠ è½½æµç¨‹

// èŽ·å¾—èµ„æºç»å¯¹åœ°å€
    var
        isCSS = function(url) {
            return url.search(/\.css(\?[^\.\?]*)?$/) !== -1;
        },
// åˆ¤æ–­cssåŠ è½½å®Œæ¯•ï¼ˆfrom:seajsï¼‰
        pollCSS = function(node, href) {
            var sheet = node.sheet, isLoaded = false;

            if (isOldWebKit && sheet) { // for WebKit < 536
                isLoaded = true;
            } else if (sheet) { // for Firefox < 9.0
                try {
                    if (sheet.cssRules) {
                        isLoaded = true;
                    }
                } catch (ex) {
                    if (ex.name === "NS_ERROR_DOM_SECURITY_ERR") {
                        isLoaded = true;
                    }
                }
            }

            setTimeout(function() {
                if (isLoaded) {
                    complete(href);
                } else {
                    pollCSS(node, href);
                }
            }, 20);
        },
// ç”Ÿæˆèµ„æºèŠ‚ç‚¹
        createResourceNode = function(url, isCSSURL) {
            var node = doc.createElement(isCSSURL ? "link" : "script");
            if (isCSSURL) {
                node.rel = "stylesheet";
                node.href = url;
            } else {
                node.async = true;
                node.src = url;
                if (!Env.disable_cors && (url.indexOf('http://'+JS_HOST) === 0 || url.indexOf('https://'+JS_HOST) === 0)) {
                    node.setAttribute('crossorigin','anonymous');
                }
            }
            docHead.appendChild(node);
            return node;
        },
// åŠ è½½èµ„æº
        load = function(urls, callback) {
            if(!urls || (M.is(urls, 'Array') && urls.length === 0)) {
                if(typeof callback == 'function') {
                    callback();
                }
            } else {
                if(!M.is(urls, 'Array')) {
                    urls = [urls];
                }
                if(typeof callback == 'function') {
                    processResource.push({urls:urls, callback:callback});
                }
                M.forEach(urls, function(url) {
                    var isCSSURL = isCSS(url);

                    // æ£€æŸ¥é¡µé¢æ˜¯å¦å·²ç»åŒ…å«äº†è¯¥è„šæœ¬
                    if(pageContainsResource(url, isCSSURL)) {
                        complete(url);
                        return;
                    }

                    var node = createResourceNode(url, isCSSURL),
                        supportOnload = 'onload' in node;
                    if(isCSSURL && (isOldWebKit || !supportOnload)) {
                        setTimeout(function() {
                            pollCSS(node, url);
                        }, 1);
                    } else {
                        if(supportOnload) {
                            node.onload = function() {
                                node.onload = null;
                                complete(url);
                            };
                        } else {
                            node.onreadystatechange = function() {
                                if(/loaded|complete/.test(node.readyState)) {
                                    node.onreadystatechange = null;
                                    complete(url);
                                }
                            };
                        }
                    }
                });
            }
        },
        loadCssJsListSeq = function(data, callback) {
            // å…ˆåŠ è½½cssï¼Œä¿è¯å‰ç«¯æ ·å¼æ­£ç¡®
            if('css_list' in data) {
                M.loadResource(data.css_list, function() {
                    if('js_list' in data) {
                        M.loadResource(data.js_list, callback);
                    } else if(typeof callback == 'function') {
                        callback();
                    }
                });
            } else if('js_list' in data) {
                M.loadResource(data.js_list, callback);
            } else {
                if(typeof callback == 'function') {
                    callback();
                }
            }
        },
// æ£€æŸ¥é¡µé¢æ˜¯å¦å·²ç»åŒ…å«äº†ä¸€ä¸ªè„šæœ¬
        pageContainsResource = function(url, isCSSURL) {
            var contains = false;
            if(isCSSURL) {
                $('link').each(function() {
                    var href = this.href;
                    if(href.length && isSame(url, href, isCSSURL)) {
                        contains = true;
                        return false;
                    }
                });
            } else {
                $('script').each(function() {
                    var src = this.src;
                    if(src.length && isSame(url, src, isCSSURL)) {
                        contains = true;
                        return false;
                    }
                });
            }
            return contains;
        },
// æ£€æŸ¥resource urlæ˜¯å¦ç›¸ç­‰(æ ¹æ®ç‰ˆæœ¬å·ç­–ç•¥éœ€è¦åšä¸åŒçš„è°ƒæ•´)
        isSame = function(url1, url2, isCSSURL) {
            var pattern = isCSSURL ? /(\.css)(\?\d*)?$/ : /(\.js)(\?\d*)?$/;
            url1 = url1.replace(pattern, '$1');
            url2 = url2.replace(pattern, '$1');
            return url1 === url2;
        },
// èµ„æºåŠ è½½å®Œæˆæ—¶çš„å¤„ç†
        complete = function(url) {
            M.forEach(processResource, function(item, index) {
                if(item) {
                    var urls = item.urls,
                        callback = item.callback;
                    for(var i=0; i<urls.length; i++) {
                        if(url == urls[i]) {
                            urls.splice(i, 1);
                            i--;
                        }
                    }
                    if(!urls.length) {
                        delete(processResource[index]);
                        if(typeof callback == 'function') {
                            callback();
                        }
                    }
                }
            });
        };
    M.loadResource = load;
// export for other css
    M.fetchCSSJS = function(cssJsList, callback) {
        M.loadCSSJS(cssJsList, function(data) {
            loadCssJsListSeq(data, callback);
        });
    };
    M.loadIMG = function(src, callback, errHandler) {
        var image = new Image();
        callback = typeof callback === 'function' ? callback : function() {};
        image.onload = function() {
            image.onload = null;
            callback.call( null, image );
        };
        if (image.readyState == "complete") {
            callback.call(null, image);
        }
        // å¢žåŠ å›¾ç‰‡èŽ·å–å¤±è´¥æ—¶çš„å¼‚å¸¸å¤„ç†
        if(errHandler && typeof errHandler === 'function') {
            image.onerror = errHandler;
        }
        image.src = src;
    };
    M.loadCssJsListSeq = loadCssJsListSeq;
    M.addStyle = function(styleText) {
        var styleElement = document.createElement("style");
        styleElement.type = "text/css";
        document.getElementsByTagName("head")[0].appendChild(styleElement);
        if (styleElement.styleSheet) {
            styleElement.styleSheet.cssText = styleText;
        } else {
            styleElement.appendChild(document.createTextNode(styleText));
        }
    };
    var cssStyles = null;
    M.cssSupport = function(featurename) {
        var support = false, i, len;
        featurename = '' + featurename;

        if(featurename.length) {
            // get support styles
            if(!cssStyles) {
                var elm = document.createElement('div');
                cssStyles = elm.style;
            }

            // xxx-xxx -> xxxXxx
            var featurenameArr = featurename.split('-');
            if(featurenameArr.length > 1) {
                for(i=0, len=featurenameArr.length; i<len; i++) {
                    featurenameArr[i] = featurenameArr[i].toLowerCase();
                    if(i > 0) {
                        var nameI = featurenameArr[i];
                        featurenameArr[i] = nameI.charAt(0).toUpperCase() + nameI.substr(1);
                    }
                }
                featurename = featurenameArr.join('');
            }

            // check direct and private with prefix
            if(featurename in cssStyles) {
                support = featurename;
            } else {
                var domPrefixes = 'webkit moz ms o'.split(' ');
                featurename = featurename.charAt(0).toUpperCase() + featurename.substr(1);
                for(i=0, len=domPrefixes.length; i<len; i++) {
                    if((domPrefixes[i] + featurename) in cssStyles) {
                        support = domPrefixes[i] + featurename;
                        break;
                    }
                }
            }
        }
        return support;
    };



    /**
     * csrf for ajax(jquery or zepto)
     */
    if(Env.CSTK) {
        if(typeof $.ajaxSetup == 'function') {
            $.ajaxSetup({
                beforeSend: function(xhr, settings) {
                    if(settings.data) {
                        if(M.isObject(settings.data)) {
                            if(settings.data._need_cstk) {
                                settings.data = $.extend(settings.data, {'__ctk__': Env.CSTK});
                            }
                        } else if(M.is(settings.data, 'String')) {
                            if(settings.data.indexOf('_need_cstk') != -1) {
                                settings.data = settings.data + '&' + $.param({'__ctk__': Env.CSTK});
                            }
                        }
                    }
                    return true;
                }
            });
        }
    }



    /**
     * util function to M.Utils
     */
    M.Utils = {};



    /**
     * app and japp support
     */
    M.loadAppRaw = function(appName, appConf, params, callback) {
        var loadedModules = M.map(M.Module.loaded(), function(item) {
            return item.id;
        });

        // load app
        var data = {'app': appName, 'loaded_modules': loadedModules.join(','), 'params': JSON.stringify(params)};
        if(appConf) {
            data.app_conf = appConf;
        }
        $.ajax({
            dataType: 'jsonp',
            url: location.protocol+'//'+WWW_HOST+'/ajax/ajax_japp.php',
            data: data,
            success: function(res) {
                typeof callback == 'function' && callback(res);
            }
        }, 'json');
    };
    M.loadApp = function(appName, appConf, params, callback) {
        M.loadAppRaw(appName, appConf, params, function(res) {
            if(!M.isEmpty(res)) {
                var cssJsList = {'css_list': res.css || [], 'js_list': res.js || []};
                loadCssJsListSeq(cssJsList, function() {
                    if(typeof callback == 'function') {
                        callback(res);
                    }
                });
            }
        });
    };
// é¡µé¢ç‚¹å‡»åŠ è½½appå®žçŽ°ï¼ˆjappï¼‰
    M.JAppController = {
        'loadedList': {},
        'isLoaded': function(appName, appConf) {
            return (appConf ? appConf+':'+appName : appName) in this.loadedList;
        },

        'getJApp': function(appName, appConf) {
            return appConf ? this.loadedList[appConf+':'+appName] : this.loadedList[appName];
        },
        'onload': function(appName, appConf, callback) {
            appName = appConf ? appConf+':'+appName : appName;
            M.Event.on('app ' + appName + ' loaded', M.bind(function() {
                callback.call(global, this.loadedList[appName]);
            }, this));
        }
    };
    M.JApp = function(appName, app) {
        if(!M.JAppController.isLoaded(appName)) {
            if(!M.is(appName, 'String')) {
                M.error('app can not be defined without name');
            }
            if(!app || typeof app != 'function' && typeof app.run != 'function') {
                M.error('invalid app:' + appName);
            }
            if(typeof app == 'function') {
                app = {'run':app};
            }
            M.JAppController.loadedList[appName] = app;
            M.Event.fire('app ' + appName + ' loaded');
        }
    };
    M.loadJApp = function(appName, target, appConf, params) {
        target = $(target);
        if(!M.JAppController.isLoaded(appName, appConf)) {
            if(!target.data('locking')) {
                target.data('locking', true);
                target.css('cursor', 'wait');

                M.JAppController.onload(appName, appConf, function(app) {
                    target.data('locking', false);
                    target.css('cursor', '');
                    app.run(target);
                });

                M.loadAppRaw(appName, appConf, params, function(res) {
                    if(!M.isEmpty(res)) {
                        M.loadResource(res.css, function() {
                            if(res.html) {
                                $('body').append(res.html);
                                M.Event.fire('new html appended');
                            }
                            if(res.js && res.js.length) {
                                M.loadResource(res.js);
                            }
                        });
                    }
                });
            }
        } else {
            M.JAppController.getJApp(appName, appConf).run(target);
        }
    };

    var needOpenWindowJApp = ['activity_share', 'sns_share'];
    $(document).on('click', '[data-japp]', function(ev) {
        var target = $(ev.currentTarget);
        if((target.get(0).tagName.toLowerCase() == 'a' && target.attr('href') == '#') ||
            target.hasClass('_j_pvd')) {
            ev.preventDefault();
        }
        handleJAppTrigger(target);
    });

// tap on mobile browser
    if('ontouchstart' in document.documentElement) {
        if($.event && $.event.special &&'tap' in $.event.special) {
            $(document).on('tap', '[data-japp]', function(ev) {
                ev.preventDefault();
                handleJAppTrigger($(ev.currentTarget));
            });
        }
    }

    function handleJAppTrigger(target) {
        var appName = target.data('japp'),
            appConf = target.data('jappconf');

        var needOpenWindow = M.indexOf(needOpenWindowJApp, appName) != -1;
        if(typeof target.data('openwindow') != 'undefined') {
            needOpenWindow = !!target.data('openwindow');
        }
        if(needOpenWindow) {
            var windowSetting = target.data('windowsetting')
                || 'width=700,height=680,left=75,top=20,scrollbars=no,status=no,resizable=no,menubar=no,toolbar=no,scrollbars=no,location=yes';
            target.data('openwindow', window.open('', target.data('openwindow'), windowSetting));
        }

        // get params
        var datas = target.data(),
            jappFeData = target.data('jappfedata'),
            params = {};

        if(!M.isUndefined(jappFeData) && jappFeData.length > 0) {
            jappFeData = jappFeData.split(',');
        }

        if(M.isUndefined(jappFeData) || jappFeData.length > 0) {
            for(var index in datas) {
                if(datas.hasOwnProperty(index)) {
                    if(M.indexOf(['japp', 'jappconf', 'jappfedata', 'openwindow'], index) == -1) {
                        if(M.isUndefined(jappFeData) || M.indexOf(jappFeData, index) != -1) {
                            params[index] = datas[index];
                        }
                    }
                }
            }
        }

        M.loadJApp(appName, target, appConf, params);
    }


    /**
     * Pagelet support
     */
    var PageletInstances = [],
        pageletBlockClass = Env.pagelet_block_class || 'pagelet-block',
        pageletBlockLoadingClass = Env.pagelet_block_loading_class || 'pagelet-block-asyncloading';

    function addPageletInstance(pageletId, ins) {
        if(pageletId in PageletInstances) {
            M.error('pagelet id already defined');
        }
        PageletInstances[pageletId] = ins;
    }

    function Pagelet(options) {
        M.mix(this, options);
        if(this.container.length) {
            !M.isEmptyObject(this.events) && Pagelet.createEvents(this.container, this.events, this);
            typeof this.init == 'function' && this.init();
        }
    }

    M.mix(Pagelet.prototype, {
        syncXHR: null,
        autoAbortPrevSync: true,
        getSyncParams: function(key) {
            return key ? this.__private_data.sync_params[key] : this.__private_data.sync_params;
        },
        setSyncParams: function(params, sync) {
            M.mix(this.__private_data.sync_params, params);
            if(sync) {
                this.sync();
            }
        },
        getSyncApi: function() {
            return this.__private_data.sync_api;
        },
        setSyncApi: function(api) {
            this.__private_data.sync_api = api;
        },
        sync: function() {
            var api = this.getSyncApi();
            if(api) {
                if(this.autoAbortPrevSync) {
                    try {
                        this.syncXHR && this.syncXHR.abort();
                    } catch(e) {}
                }
                M.Event(this).fire('before content sync');
                this.syncXHR = Pagelet.loadContent(api, this.getSyncParams(), this.container, $.proxy(function(data) {
                    this.syncHtml(data.html);
                    this.syncData(data.controller_data);
                    M.Event(this).fire('content sync success');
                }, this), $.proxy(function(error) {
                    M.Event(this).fire('content sync fail', error);
                }, this), $.proxy(function() {
                    M.Event(this).fire('content sync complete');
                }, this));
            }
        },
        abortSync: function() {
            try {
                this.syncXHR && this.syncXHR.abort();
            } catch(e) {}
        },
        syncHtml: function(html) {
            this.container.html(html);
        },
        syncData: function(controllerData) {
            M.mix(this.data, controllerData);
        }
    });

    M.mix(Pagelet, {
        createInstance: function(container, controller) {
            var params = container.data('params');
            params = M.isObject(params) && !M.isEmptyObject(params) ? params : {};
            var pagelet = new Pagelet(M.mix({
                '__private_data': {
                    'sync_api': container.data('api'),
                    'sync_params': params
                },
                'data': M.mix({}, container.data('controller_data')),
                'container': container
            }, controller));
            M.Event.fire('pagelet loaded', {'id': container.attr('id'), 'pagelet': pagelet});
            M.Event.fire('pagelet ' + container.attr('id') + ' loaded', {'pagelet': pagelet});
            return pagelet;
        },
        createEvents: function(container, events, context) {
            M.forEach(events, function(eventHandler, eventKey) {
                var handler = typeof eventHandler == 'function' ? $.proxy(eventHandler, context) :
                    (eventHandler in context ? $.proxy(context[eventHandler], context) : null);
                if(handler) {
                    var eventArr = eventKey.split(',');
                    if(eventArr.length == 1) {
                        container.on(eventArr[0], handler);
                    } else if(eventArr.length == 2) {
                        container.on(eventArr[0], eventArr[1], handler);
                    } else {
                        M.error('invalid pagelet event key:', eventKey);
                    }
                } else {
                    M.error('can not find event handler:', eventHandler);
                }
            });
        },
        loadContent: function(api, params, container, successCallback, failCallback, completeCallback) {
            // get request url for api
            var apiArr = api.split(':'),
                busi = '',
                apiPath = '';
            if(apiArr.length > 2) {
                if(apiArr[0] == 'apps') {
                    busi = apiArr[1];
                    apiPath = apiArr.slice(2);
                    apiPath.unshift('apps');
                } else if(apiArr[0] === "") {
                    busi = apiArr[1];
                    apiPath = apiArr.slice(2);
                }
            }

            if(apiPath.length) {
                params = M.isObject(params) && !M.isEmptyObject(params) ? params : {};
                container.addClass(pageletBlockLoadingClass);
                return $.ajax({
                    dataType: 'jsonp',
                    data: {'params': JSON.stringify(params)},
                    url: PAGELET_HTTP+'/'+busi+'/'+apiPath.join('/'),
                    success: function(res) {
                        if(res && res.data) {
                            typeof successCallback == 'function' && successCallback(res.data);
                        } else {
                            var errObj = {'type': 'business_error', 'error': res && res.error || {}};
                            typeof failCallback == 'function' && failCallback(errObj);
                        }
                    },
                    error: function(jqXHR, textStatus, errorThrown) {
                        var errObj = {'type': 'http_error', 'error': {'xhr': jqXHR, 'status': textStatus}};
                        typeof failCallback == 'function' && failCallback(errObj);
                    },
                    complete: function() {
                        container.removeClass(pageletBlockLoadingClass);
                        typeof completeCallback == 'function' && completeCallback();
                    }
                });
            }
        },
        loadAsyncContent: function(containerId) {
            var container = $('#'+containerId);
            if(container.length && container.data('async') && container.data('api')) {
                Pagelet.loadContent(container.data('api'), container.data('params'), container, function(data) {
                    loadCssJsListSeq({'css_list': data.css}, function() {
                        if(data.js && data.js.length) {
                            M.loadResource(data.js, function() {
                                Pagelet.finishLoadAsyncContent(container, data);
                            });
                        } else {
                            Pagelet.finishLoadAsyncContent(container, data);
                        }
                    });
                }, function(errObj) {
                    M.error(errObj);
                });
            }
        },
        finishLoadAsyncContent: function(container, data) {
            var containerId = container.attr('id');
            data.html && container.html(data.html);
            data.controller_data && container.data('controller_data', data.controller_data);
            M.Event.fire('pagelet '+containerId+' async content loaded');
            M.Event.fire('new html appended');
        },
        runPagelet: function(block) {
            block.removeAttr('data-pagelet');
            block.addClass(pageletBlockClass);
            var pageletId = block.attr('id');
            if(block.data('async')) {
                if(M.Event.isFired('pagelet '+pageletId+' async content loaded')) {
                    Pagelet.runPageletBlock(block);
                } else {
                    M.Event.on('pagelet '+pageletId+' async content loaded', function() {
                        Pagelet.runPageletBlock(block);
                    });
                }
                Pagelet.loadAsyncContent(pageletId);
            } else {
                Pagelet.runPageletBlock(block);
            }
        },
        runPageletBlock: function(block) {
            var controller = block.data('controller'),
                pageletId = block.attr('id');
            if(controller) {
                M.Module.wait([controller], function() {
                    M.closure(function(require) {
                        addPageletInstance(pageletId, Pagelet.createInstance(block, require(controller)));
                    });
                });
            } else {
                addPageletInstance(pageletId, Pagelet.createInstance(block, {}));
            }
        }
    });

    M.Pagelet = {
        getInstance: function(containerId) {
            return PageletInstances[containerId] || null;
        },
        wait: function(containerId, callback) {
            if(M.Event.isFired('pagelet '+ containerId + ' loaded')) {
                typeof callback == 'function' && callback(PageletInstances[containerId]);
            } else {
                M.Event.on('pagelet '+ containerId + ' loaded', function(args) {
                    typeof callback == 'function' && callback(args.pagelet);
                });
            }
        },
        createInstance: Pagelet.createInstance,
        createFromContainer: function(containerId, controller) {
            var container = $('#'+containerId),
                style = $.trim(container.data('style')),
                styleList = style.length ? style.split(',') : [],
                params = container.data('params') || {},
                api = container.data('api'),
                controller = controller || {};
            if(container.length) {
                M.fetchCSSJS(styleList, function() {
                    if(api) {
                        Pagelet.loadContent(api, params, container, function(data) {
                            loadCssJsListSeq({'css_list': data.css}, function() {
                                if(data.js && data.js.length) {
                                    M.loadResource(data.js, function() {
                                        Pagelet.finishLoadAsyncContent(container, data);
                                        addPageletInstance(containerId, Pagelet.createInstance(container, controller));
                                    });
                                } else {
                                    Pagelet.finishLoadAsyncContent(container, data);
                                    addPageletInstance(containerId, Pagelet.createInstance(container, controller));
                                }
                            });
                        }, function(errObj) {
                            M.error(errObj);
                        });
                    } else {
                        addPageletInstance(containerId, Pagelet.createInstance(container, controller));
                    }
                });
            } else {
                M.error('invalid pagelet container id');
            }
        },
        runAllPagelet: function() {
            $('[data-pagelet]').each(function() {
                Pagelet.runPagelet($(this));
            });
        }
    };


    /**
     * document ready actions
     */
    $(function() {

        // run pagelet
        M.Pagelet.runAllPagelet();
        M.Event.on('new html appended', function() {
            M.Pagelet.runAllPagelet();
        });
    });


} (window));
;
!function(){if(!window.MFWMA){function r(t,n){return u.syncParameters(t,n,["_sFromMA"])}function i(t,n){var a,e,o=t;return o&&0!==o.indexOf("#")&&0!==o.indexOf("javascript:")&&(o=o.replace(/^http:\/\//,"https://"),o=r(o,location.href),!p||0!==o.indexOf("https://")&&0!==o.indexOf("//")||(a=(e=o.split("/"))[2].split("#")[0].split("?")[0],n?p+"-"+a===location.host&&(e[2]=p+"-"+e[2],o=e.join("/")):-1<["m.mafengwo.cn","www.mafengwo.cn","play.fenyucn.com"].indexOf(a)&&!a.match(l)&&(e[2]=p+"-"+e[2],o=e.join("/")))),o}var u={parseUrl:function(t){var n,a,e,o,r=t,i="",c="";return-1<(e=r.indexOf("#"))&&(i=r.substring(e),r=r.substring(0,e)),-1<(o=r.indexOf("?"))&&(c=r.substring(o),r=r.substring(0,o)),a=(n=0===r.indexOf("https://")||0===r.indexOf("http://")||0===r.indexOf("//")?r.split("/")[2]:location.host).split(".").slice(-2).join("."),{path:r,host:n,search:c,hash:i,mainHost:a}},getParameter:function(t,n){var a,e,o,r=new RegExp("(^"+n+"=([^&]*))|(&"+n+"=[^&]*)","g");return"?"===(t=t||"")[0]&&(t=t.substring(1)),(a=t.match(r))&&(o=(e=a[a.length-1]).substring("&"==e[0]?n.length+2:n.length+1)),o},lazyJump:function(t){t!=location.href&&("function"==typeof s?(c.log("lazyJump/replaceState",t),s.apply(history,[null,null,t])):c.warn("history.replaceState not supported!",t))},syncParameters:function(t,n,a,e){var o,r,i,c=u.parseUrl(n),s=u.parseUrl(t);e="function"==typeof e?e:function(){};for(var l=0;a.length,o=a[l];l++)(i=u.getParameter(c.search,o))&&!1!==e(o,i,s,c)&&((r=u.getParameter(s.search,o))||(null==r?s.search+=(s.search?"&":"?")+o+"="+i:s.search=s.search.replace(o+"="+r,o+"="+i),t=s.path+s.search+s.hash));return t}},c={logEnabled:!1,log:function(){if(this.logEnabled)try{console.log.apply(null,arguments)}catch(t){}},warn:function(){try{console.warn.apply(null,arguments)}catch(t){}}},o=history.pushState,s=history.replaceState,e={},t=navigator.userAgent,l=new RegExp(/^(group\d+)\-([^.]+)\.((mafengwo\.cn)|(fenyucn\.com))/),n=location.host.match(l),p=n&&n[1];if(window.QBJSCore?e.platform="qb":t.match(/miniprogram/i)||"miniprogram"===window.__wxjs_environment?e.platform="wx":t.match(/swan\//i)&&(e.platform="swan"),e.platform){try{c.logEnabled=".mfwdev.com"==location.host.slice(-11)||-1<document.cookie.indexOf("branpub=")||document.cookie.match(/m[^.;=]+(\.[^.;=]+)+=/)}catch(t){}try{var a=r(location.href,document.referrer);u.lazyJump(a);var f=u.getParameter(location.search,"_sFromMA");(f=f&&f.split("_"))&&f[0]==e.platform&&(e.appid=f[1]),(e.appid||p)&&(history.pushState=function(t,n,a){var e=i(a,!0);c.log("pushState",a,e),o.apply(history,[t,n,e])},history.replaceState=function(t,n,a){var e=i(a,!0);c.log("replaceState",a,e),s.apply(history,[t,n,e])},document.addEventListener("ontouchstart"in document?"touchstart":"click",function(t){for(var n,a,e,o=t.target;o;){if(o.tagName&&"a"===o.tagName.toLowerCase()){n=o;break}o=o.parentNode}n&&(a=n.getAttribute("href"))&&(e=i(a))!=a&&(c.log("update href",a,e),n.setAttribute("href",e),n.getAttribute("_ma_init_href")||n.setAttribute("_ma_init_href",a))},!1))}catch(t){c.warn("Env init error",t)}}function h(t){m(e.platform,function(){t(e)})}var d,g,m=(d={},g={wx:"https://res.wx.qq.com/open/js/jweixin-1.4.0.js",qb:"https://res.wx.qq.com/open/js/jweixin-1.4.0.js",swan:"https://b.bdstatic.com/searchbox/icms/searchbox/js/swan-2.0.18.js"},function(a,t){var e;a&&(w(a)?t():(e=g[a])&&(d[e]=d[e]||{loadingStatus:0,callbacks:[]},3==d[e].loadingStatus||9==d[e].loadingStatus?t():0==d[e].loadingStatus?(c.log(e+" waiting for domReady"),d[e].loadingStatus=1,d[e].callbacks.push(t),document.addEventListener("DOMContentLoaded",function(t){if(w(a))c.log(e+" load canceled"),d[e].loadingStatus=9,d[e].callbacks.forEach(function(t){t()});else{c.log(e+" loading"),d[e].loadingStatus=2;var n=document.createElement("script");n.type="text/javascript",n.charset="utf-8",n.async=!0,n.onerror=function(t){c.warn(e+" load error",t),d[e].loadingStatus=4},n.onload=function(){c.log(e+" load success"),d[e].loadingStatus=3,d[e].callbacks.forEach(function(t){t()})},n.src=e,document.head.appendChild(n)}})):0<d[e].loadingStatus&&d[e].callbacks.push(t)))});h(function(){c.log(e)}),window.MFWMA={getEnv:function(t){"function"==typeof t&&t(e)},invoke:function(){var t,n,a=[];0<arguments.length&&(t=arguments[0],a=Array.prototype.slice.call(arguments,1),c.log("invoke "+t,a),"string"==typeof t&&(t=t.split("."))&&h(function(){(n=window[e.platform])&&((n=2==t.length?("swan"==e.platform&&"miniProgram"==t[0]&&(t[0]="webView"),(n=n[t[0]])&&n[t[1]]):n[t[0]])?n.apply(null,a):c.warn(e.platform+"."+t.join(".")+" not supported"))}))},apiReady:h,transUrl:i}}function w(t){if("wx"==t){if(window.wx){if(window.wx.miniProgram)return!0;delete window.jWeixin}return!1}if("swan"==t)return window.swan}}();;
/**
 * æ—¥å¿—è®°å½• clickstat, opLog
 */
/* global M */
/*jshint -W030 */
(function() {

    var Env = window.Env || {};

// click stat log
    $(document)
        .delegate('[data-cs-t] .clickstat', 'click', clickStat) // clickstat log
        .delegate('[data-cs-t] a', 'click', clickStat); // clickstat log

    function clickStat(ev) {
        var self = $(ev.currentTarget),
            cst = self.closest('[data-cs-t]').data('cs-t'),
            csp = self.closest('[data-cs-p]').data('cs-p'),
            target = (self.attr('target') || '').toLowerCase(),
            csl = self.data('cs-l'),
            csd = self.data('cs-d'),
            cslflag = true;

        if(!cst || cst.length === 0 || !csp || csp.length === 0) {
            return;
        }

        if(self.is('a')) {
            if (!csl || csl.length === 0) {
                cslflag = false;
                csl = self.get(0).href || self.get(0).getAttribute('href', 2) || '';
            }
            if (!csd || csd.length === 0) {
                csd =   self.attr('title') || '';
                csd = csd.replace(new RegExp("\n|\r", "g"), "");
                csd = $.trim(csd.replace(new RegExp("</?.+?>", "g"), ""));
            }

            var wname = window.name.toLowerCase();
            if ('' === target || '_self' == target || '_parent' == target || '_top' == target) {
                aClickStat(cst, csp, csl, csd, cslflag ? null : self);
            } else if ('_blank' == target || wname != target) {
                aClickStat(cst, csp, csl, csd, null);
            } else {
                aClickStat(cst, csp, csl, csd, cslflag ? null : self);
            }
        } else {
            if (!csl || csl.length === 0) {
                if (self.is('input')) {
                    csl = $.trim(self.val());
                }
            }
            aClickStat(cst, csp, csl, csd, null);
        }
    }
    function aClickStat(cst, csp, csl, csd, obj) {
        if (!obj) {
            var logUrl = (Env.WWW_HOST ? location.protocol+'//' + Env.WWW_HOST : '') + '/cs.php';
            $.ajax({
                'url': logUrl,
                'dataType': 'jsonp',
                'data': {t:cst, p:csp, l:csl, d:csd},
                'jsonp': 'cb'
            });
        } else if ('/' == csl.substr(0, 1) || location.protocol+'//' == csl.substr(0, 7).toLowerCase()) {
            var host = Env.WWW_HOST ? location.protocol+'//' + Env.WWW_HOST : '',
                logLinkPrefix = host + '/cs.php',
                logLinkPrefixLength = logLinkPrefix.length;
            if (logLinkPrefix != csl.substr(0, logLinkPrefixLength)) {
                obj.attr('href', host + '/cs.php?t=' + encodeURIComponent(cst) + '&p=' + encodeURIComponent(csp) + '&l=' + encodeURIComponent(csl) + '&d=' + encodeURIComponent(csd));
                obj.attr('data-href',csl);
            }
        } else {
            aClickStat(cst, csp, csl, csd, null);
        }
    }
    if(window.M && window.M.Utils) {
        M.Utils.clickStat = aClickStat;
    }


// op log
    function addOpLog(logParams) {
        if(!('action' in logParams)) {
            logParams.action = 'add_op_logs';
        }

        var logUrl = (Env.WWW_HOST ? location.protocol+'//' + Env.WWW_HOST : '') + '/ajax/ajax_logs.php';
        $.ajax({
            'url': logUrl,
            'dataType': 'jsonp',
            'data': logParams
        });
    }

// export to M.Utils
    if(window.M && window.M.Utils) {
        M.Utils.opLog = addOpLog;
    }
} ());
;
/**
 * @mfw/insight sdk v3.1.30
 */
"use strict";window.Env||(window.Env={}),window.console||(window.console.log=function(){},window.console.warn=function(){}),window.mfwCheckLogData=function(){var t=encodeURIComponent,e=parseInt(+new Date/1e3,10),i=document.URL,n=document.referrer,o={t:e,u:t(i),r:t(n),pid:InSight.config.pageGuid};return JSON.stringify(o)};var mfwCommonEnv={aIncludes:function(t,e){return-1!==t.indexOf(e)},getDevice:function(t){return/Windows Phone/i.test(t)||/WPDesktop/.test(t)?"Windows Phone":/iPad/.test(t)?"iPad":/iPod/.test(t)?"iPod Touch":/iPhone/.test(t)?"iPhone":/(BlackBerry|PlayBook|BB10)/i.test(t)?"BlackBerry":/Android/.test(t)?"Android":"unknown"},getOs:function(t){return/Windows/i.test(t)?/Phone/.test(t)||/WPDesktop/.test(t)?"Windows Phone":"Windows":/(iPhone|iPad|iPod)/.test(t)?"iOS":/Android/.test(t)?"Android":/(BlackBerry|PlayBook|BB10)/i.test(t)?"BlackBerry":/Mac/i.test(t)?"Mac OS X":/Linux/.test(t)?"Linux":"unknown"},getBrowser:function(t,e,i){return e=e||"",i||this.aIncludes(t," OPR/")?this.aIncludes(t,"Mini")?"Opera Mini":"Opera":/(BlackBerry|PlayBook|BB10)/i.test(t)?"BlackBerry":this.aIncludes(t,"IEMobile")||this.aIncludes(t,"WPDesktop")?"Internet Explorer Mobile":this.aIncludes(t,"Edge")?"Microsoft Edge":this.aIncludes(t,"FBIOS")?"Facebook Mobile":this.aIncludes(t,"Chrome")?"Chrome":this.aIncludes(t,"CriOS")?"Chrome iOS":this.aIncludes(t,"FxiOS")?"Firefox iOS":this.aIncludes(e,"Apple")?this.aIncludes(t,"Mobile")?"Mobile Safari":"Safari":this.aIncludes(t,"Android")?"Android Mobile":this.aIncludes(t,"Konqueror")?"Konqueror":this.aIncludes(t,"Firefox")?"Firefox":this.aIncludes(t,"MSIE")||this.aIncludes(t,"Trident/")?"Internet Explorer":this.aIncludes(t,"Gecko")?"Mozilla":"unknown"},getOsVersion:function(t){var e="unknow";if(/Windows/i.test(t))e=/Phone/.test(t)?t.substr(t.indexOf("Phone")+6,t.indexOf(";",t.indexOf("Phone"))-t.indexOf("Phone")-6):/WPDesktop/.test(t)?"WPDesktop_unknow":"Windows_unknow";else if(/(iPhone|iPad|iPod)/.test(t)){e=(t.match(/OS [\d._]*/gi)+"").replace(/[^0-9|_.]/gi,"").replace(/_/gi,".")}else if(/Android/.test(t))e=t.substr(t.indexOf("Android")+8,t.indexOf(";",t.indexOf("Android"))-t.indexOf("Android")-8);else if(/(BlackBerry|PlayBook|BB10)/i.test(t))e=/BB10/.test(t)?t.substr(t.indexOf("BB10")+5,t.indexOf(";",t.indexOf("BB10"))-t.indexOf("BB10")-5):"BlackBerry_unknow";else if(/Mac OS X/i.test(t)){e=(t.match(/OS X [\d._]*/gi)+"").replace(/[^0-9|_.]/gi,"").replace(/_/gi,".")}else e="Linux_unknow";return e},getBrowserVersion:function(t,e,i){var n={"Internet Explorer Mobile":/rv:(\d+(\.\d+)?)/,"Microsoft Edge":/Edge\/(\d+(\.\d+)?)/,Chrome:/Chrome\/(\d+(\.\d+)?)/,"Chrome iOS":/CriOS\/(\d+(\.\d+)?)/,Safari:/Version\/(\d+(\.\d+)?)/,"Mobile Safari":/Version\/(\d+(\.\d+)?)/,Opera:/(Opera|OPR)\/(\d+(\.\d+)?)/,Firefox:/Firefox\/(\d+(\.\d+)?)/,"Firefox iOS":/FxiOS\/(\d+(\.\d+)?)/,Konqueror:/Konqueror:(\d+(\.\d+)?)/,BlackBerry:/BlackBerry (\d+(\.\d+)?)/,"Android Mobile":/android\s(\d+(\.\d+)?)/,"Internet Explorer":/(rv:|MSIE )(\d+(\.\d+)?)/,Mozilla:/rv:(\d+(\.\d+)?)/}[this.getBrowser(t,e,i)];if(void 0===n)return"unknown";var o=t.match(n);return o?parseFloat(o[o.length-2]):"unknown"},getCliInfo:function(){var t=t||{},e=window.navigator,i=e.userAgent;return t.brn=this.getBrowser(i,e.vendor,window.opera),t.brv=this.getBrowserVersion(i,e.vendor,window.opera),t.dev=this.getDevice(i),t.os_name=this.getOs(i),t.os_ver=this.getOsVersion(i),t}};window.mfwPageEvent=function(t,e,i,n){"product"!==InSight.config.env&&console.warn("WARNING! è€ç‰ˆè‡ªå®šä¹‰åŸ‹ç‚¹æŽ¥å£(mfwPageEvent)åœ¨æœªæ¥ç‰ˆæœ¬å°†åšä¸‹çº¿å¤„ç†ï¼Œè¯·ç§»æ­¥æ–°ç‰ˆSDKä½¿ç”¨æ–‡æ¡£ https://mdp.mafengwo.cn/help/#/sdk/insight?id=config ï¼Œæ”¹ç”¨æ–°ç‰ˆä¸ŠæŠ¥æŽ¥å£");var o=encodeURIComponent,r=document.URL,a=document.referrer,s=parseInt(+new Date/1e3,10);t=o(t),e=o(e),r=o(r),a=o(a),i=o(JSON.stringify(i));var h=mfwCommonEnv.getCliInfo();h=o(JSON.stringify(h));var c=Math.floor(2443463648*Math.random()),l=InSight.config.pageGuid;if(t&&e){var d={sdk_ver:InSight.version,ac:t,ec:e,u:r,r:a,ex:h,ar:i,t:s,pid:l,rn:c};d=InSight.utils.__setChannel(d);var u=InSight.reportHost+"/track_event.gif";InSight.reporter.send(u,d,n)}};var InSight={version:"3.1.30",reportHost:(0===location.protocol.indexOf("http:")?"http:":"https:")+"//"+(window.Env.TONGJI_HOST?window.Env.TONGJI_HOST:"tongji.mafengwo.cn"),config:{op:"",devMode:!1,debug:!1,throttle:!1,auto:!0,env:"product",pageGuid:"",mfwChild:"",childData:"",ignoreRule:{stat:[],monitor:[],error:[],ajax:[],resource:[]},mddId:null,pageDetailId:0,keyword:"",info:null,ab:null},userConfig:{},_cookieStatus:1,started:!1,reporter:{},utils:{},stat:{},mini:{},monitor:{}};function InSightInit(){function t(t){var e=t||window.inConfig,i=window.Env||{};InSight.userConfig=e,InSight.config=InSight.utils.deepMerge({},InSight.config,i,e),function(){if(InSight.config.devMode)InSight.config.env="dev";else try{if(InSight.utils.getCookie("branpub"))return void(InSight.config.env="prepub");for(var t=document.cookie.split(";"),e=0;e<t.length;++e){var i=t[e].split("=")[0];if(/msrule.[\d\w]+.[\d\w]+.product/.test(i))return void(InSight.config.env="prepub")}}catch(t){InSight.config.env="product"}}(),InSight._cookieStatus=InSight.utils.getCookieStatus(),"dev"===InSight.config.env&&(InSight.reportHost=InSight.reportHost.replace("tongji.mafengwo.cn","tongji.mfwdev.com"))}InSight.reporter={_mLogImg:[],_mLogPost:[],postDataFormat:function(t){if("function"==typeof FormData){var e=new FormData;for(var i in t)e.append(i,t[i]);return e}var n=[];for(var o in t)n.push(o+"="+t[o]);return n.join("&")},getDataFormat:function(t){var e=[];for(var i in t)e.push(i+"="+t[i]);return e.join("&")},sendByImg:function(t,e,i){var n=new Image(1,1),o="mfw_"+Math.floor(2147483648*Math.random()).toString(36);this._mLogImg[o]=n,n.onload=n.onerror=function(){n.onload=n.onerror=null,n=InSight.reporter._mLogImg[o]=null,"function"==typeof i&&i()};var r=String((new Date).getTime())+String(Math.random()),a=e||{};a._nocache=r,a._method="img";var s=t+"?"+this.getDataFormat(a);return n.src=s,!0},sendByBeacon:function(t,e,i){var n=String((new Date).getTime())+String(Math.random()),o=e||{};return o._nocache=n,o._method="beacon","function"==typeof FormData?!!window.navigator.sendBeacon&&(!!window.navigator.sendBeacon(t,this.postDataFormat(o))&&(i(),!0)):!!window.navigator.sendBeacon&&(!!window.navigator.sendBeacon(t+"?"+this.getDataFormat(o))&&(i(),!0))},sendByPost:function(t,e,i){var n=window.XMLHttpRequest,o=String((new Date).getTime())+String(Math.random());if(!n)return!1;var r=new n;if(this._mLogPost[o]=r,!("withCredentials"in r))return!1;var a=e||{};return a._nocache=o,a._method="post",r.open("POST",t,!0),r.withCredentials=!0,r.setRequestHeader("Content-Type","application/x-www-form-urlencoded"),r.onreadystatechange=function(){4==r.readyState&&(i(),r=InSight.reporter._mLogPost[o]=null)},r.send(this.getDataFormat(a)),!0},sendByApp:function(t,e){return!(!window.MFWAPP||!MFWAPP.sdk||"hybrid"!==MFWAPP.sdk.type)&&(!(!MFWAPP||!MFWAPP.hybrid||"function"!=typeof MFWAPP.hybrid.sendHttpRequest)&&(MFWAPP.hybrid.sendHttpRequest({path:"!"+t,params:e,method:"POST",cache:"no-cache"}),!0))},send:function(t,e,i){i=i||function(){},"file:"===location.protocol&&/mfwappcode/i.test(navigator.userAgent)?this.sendByApp(t,e)||this.sendByPost(t,e,i):/(baiduboxapp)/.test(navigator.userAgent)?this.sendByImg(t,e,i)||this.sendByPost(t,e,i)||this.sendByBeacon(t,e,i):this.sendByBeacon(t,e,i)||this.sendByPost(t,e,i)||this.sendByImg(t,e,i)}},InSight.utils={protoString:function(t){return Object.prototype.toString.call(t)},deepMerge:function t(){for(var e={},i=function(t,e){return void 0===t?[].concat(e):"[object Array]"===Object.prototype.toString.call(t)?t.concat(e):[].concat(t,e)},n=function(n){for(var o in n)n.hasOwnProperty(o)&&("[object Object]"===Object.prototype.toString.call(n[o])?e[o]=t(e[o],n[o]):"[object Array]"===Object.prototype.toString.call(n[o])?e[o]=i(e[o],n[o]):e[o]=n[o])},o=0;o<arguments.length;o++)"[object Object]"===Object.prototype.toString.call(arguments[o])&&n(arguments[o]);return e},isEmptyObject:function(t){if(!t||"[object Object]"!==this.protoString(t))return!0;var e=0;for(var i in t)t.hasOwnProperty(i)&&e++;return 0===e},cleanObj:function(t){if("[object Object]"!==Object.prototype.toString.call(t))return{};for(var e in t)t.hasOwnProperty(e)&&(""!==t[e]&&null!==t[e]&&void 0!==t[e]||delete t[e],"[object Object]"===this.protoString(t[e])&&this.isEmptyObject(t[e])&&delete t[e],"[object Array]"===this.protoString(t[e])&&0===t[e].length&&delete t[e]);return t},isRuleMatched:function(t,e){if("[object Array]"!==this.protoString(t)||"string"!=typeof e)return!1;for(var i=!1,n=0;n<t.length;n++)if("[object RegExp]"===this.protoString(t[n])&&new RegExp(t[n]).test(e)){i=!0;break}return i},stringify:function(t){for(var e in t)t.hasOwnProperty(e)&&("[object Object]"===this.protoString(t[e])&&(t[e]=JSON.stringify(t[e])),"[object Array]"===this.protoString(t[e])&&(t[e]=JSON.stringify(t[e])));return t},getCookie:function(t,e){for(var i={},n=document.cookie?document.cookie.split("; "):[],o=0;o<n.length;o++){var r=n[o].split("="),a=r.slice(1).join("=");e||'"'!==a.charAt(0)||(a=a.slice(1,-1));try{var s=decodeURIComponent(r[0]);if(a=decodeURIComponent(a),e)try{a=JSON.parse(a)}catch(t){}if(i[s]=a,t===s)break}catch(t){}}return t?i[t]:i},setCookie:function(t,e,i){var n="";i&&(n="; expires="+new Date((new Date).getTime()+36e5*i).toUTCString());var o="",r=window.location.hostname,a=r.replace(/\.(com|net|org|cn$)\.?.*/,"");-1===a.lastIndexOf(".")?o="."+r:(a=a.substring(a.lastIndexOf(".")),o=r.substring(r.lastIndexOf(a))),document.cookie=t+"="+encodeURIComponent(e)+n+";domain="+o+";path=/; "},removeCookie:function(t){this.setCookie(t,"",-1)},addEvent:function(t,e,i){document.addEventListener?t?t.addEventListener(e,i,!0):window.addEventListener(e,i,!0):document.attachEvent&&(t?t.attachEvent("on"+e,i):window.attachEvent("on"+e,i))},getXpath:function(t){for(var e=[];t&&1===t.nodeType;t=t.parentNode){for(var i=0,n=t.previousSibling;n;n=n.previousSibling)n.tagName===t.tagName&&++i;var o=t.tagName.toLowerCase(),r=i?"["+(i+1)+"]":"";e.splice(0,0,o+r)}return e.length?"/"+e.join("/")+"/":null},traverseParent:function(t,e,i){var n=0;for(e=e||function(t){return"html"===t.tagName.toLowerCase()},i=i||5;t.parentNode;){if(e(t)||"html"===t.tagName.toLowerCase()||n>=i)return t;n++,t=t.parentNode}return null},getBrowserSize:function(){var t=-1,e=-1;return"number"==typeof window.innerWidth?(t=window.innerWidth,e=window.innerHeight):(t=document.documentElement.clientWidth,e=document.documentElement.clientHeight),t+"x"+e},getLang:function(){return navigator.userLanguage?navigator.userLanguage:navigator.language?navigator.language:navigator.browserLanguage?navigator.browserLanguage:"unknown"},getChartset:function(){return document.characterSet||document.charset||"unknown"},guid:function(){function t(){return(65536*(1+Math.random())|0).toString(16).substring(1)}return t()+t()+"-"+t()+"-"+t()+"-"+t()+"-"+t()+t()+t()},createSession:function(){function t(){return(65536*(1+Math.random())|0).toString(16).substring(1)}return t()+t()+t()},getRandom:function t(e){var i=e>16?16:e,n=Math.random().toString();return"0"===n.substr(n.length-i,1)||"."===n.substr(n.length-i,1)?t(i):n.substring(n.length-e)},getCookieStatus:function(){try{var t=navigator.cookieEnabled;return document.cookie="cookietest=1",t=-1!==document.cookie.indexOf("cookietest="),document.cookie="cookietest=1; expires=Thu, 01-Jan-1970 00:00:01 GMT",t?1:0}catch(t){return 0}},getExtDomain:function(t){var e=/^https?:\/\/([^\/]+)\/?/i.exec(document.referrer),i="direct";return e&&e[1]&&-1===e[1].search(/(mafengwo|mfwdev|imfw)/)&&(i=e[1],t&&(i=(i=i.replace(/\.(com|net|org|cn$)\.?.*/,"")).replace(/[^.]+\./,""))),i},getUri:function(){var t=location.hash;location.hash.indexOf("?")>=0&&(t=t.substr(0,location.hash.indexOf("?")));var e=location.host+location.pathname+t;return encodeURIComponent(e)},getQuery:function(t){if(!t)return{};var e={};try{for(var i=t.split("&"),n=0;n<i.length;n++){var o=i[n].substring(0,i[n].indexOf("=")),r=i[n].substring(i[n].indexOf("=")+1);e[o]||(e[o]=r)}}catch(t){console.warn("ã€SDKã€‘parse query error",i)}return e},parseError:function(t,e){if("[object Error]"===InSight.utils.protoString(t)){var i=t.stack.split("\n"),n=i[1]&&i[1].indexOf("at ")<0?i[0]:i[1],o=(n=n?n.replace(/\s*at\s*/,""):"").match(/\(([^)]*)\)/),r=(n=o?o[1]:n).split(":"),a=r[r.length-2]||"0",s=r[r.length-1]||"0",h=n;return"0"!==a&&"0"!==s&&(h=n.slice(0,-a.length-s.length-2)),{etype:e+"error",lno:a,cno:s,url:h,msg:t.message.replace(/"/g,"'"),stack:t.stack?t.stack.replace(/"/g,"'"):null}}return"[object Object]"===InSight.utils.protoString(t)?{etype:e+"object",msg:("string"==typeof t.message?t.message:JSON.stringify(t)).replace(/"/g,"'")}:{etype:e+"other",msg:("string"==typeof t?t:JSON.stringify(t)).replace(/"/g,"'")}},getCommonParams:function(){var t=encodeURIComponent,e=document.querySelector('meta[property="mfw:pagename"]'),i=e?t(e.getAttribute("content")):"";return{env:InSight.config.env,op:InSight.config.op,sv:InSight.version,sr:screen?screen.width+"x"+screen.height:"-1x-1",br:this.getBrowserSize(),u:t(location.href.substring(0,2048))||"-",ru:t(document.referrer.substring(0,2048))||"direct",pid:InSight.config.pageGuid,mc:InSight.config.mfwChild,cd:InSight.config.childData,mi:InSight.config.mddId,pn:i,pt:t(document.title),ic:InSight._cookieStatus}},__getCommonParams:function(){var t=encodeURIComponent,e=document.querySelector('meta[property="mfw:pagename"]'),i=e?t(e.getAttribute("content")):"",n=mfwCommonEnv.getCliInfo(),o={};return o.sdk_ver=InSight.version,o.t=parseInt(+new Date/1e3,10),o.hn=t(window.location.host)||"-",o.u=t(location.href||"-"),o.uri=this.getUri()||"-",o.r=t(document.referrer)||"direct",o.lv=this.__getVisitlv(),o.vn=this.__getVisitn()||"1",o.ws=this.getBrowserSize(),o.sc=screen?screen.width+"x"+screen.height:"-1x-1",o.dt=t(document.title),o.sts=this.__getTimeOnPage()||"0",o.pid=InSight.config.pageGuid,o.brn=n.brn,o.brv=n.brv,o.dev=n.dev,o.os=n.os_name,o.os_ver=n.os_ver,o.sid=window.Env.salesId||"0",o.rdm=this.__getRandomInt(32),o.op=InSight.config.op,o.protocol=window.location.protocol.replace(":",""),o.pn=i,o=this.__setChannel(o)},__getVisitlv:function(){var t=this.getCookie("__mfwlv"),e=this.__getVisitn();return isNaN(t)&&(t=0),+new Date/1e3-t>7200&&(t=parseInt(+new Date/1e3,10),e++,this.setCookie("__mfwlv",t,8760),this.setCookie("__mfwvn",e,8760)),t},__getVisitn:function(){var t=this.getCookie("__mfwvn");return isNaN(t)&&(t=0),t},__getTimeOnPage:function(){var t=this.getCookie("__mfwlt"),e=parseInt(+new Date/1e3,10);isNaN(t)&&(t=0);var i=parseInt(e-t);return this.setCookie("__mfwlt",e,8760),i},__getRandomInt:function(t){return 0>t?NaN:30>=t?0|Math.random()*(1<<t):53>=t?(0|1073741824*Math.random())+1073741824*(0|Math.random()*(1<<t-30)):NaN},__setChannel:function(t){var e=this.getCookie("__mfwchid"),i=this.getCookie("__mfwothchid");return e?t.mfw_chid=e:t.oth_chid=i||"direct",t}},InSight.stat={_checkTimer:null,_reportTimer:null,_eventQueue:[],_COOKIEA:"__mfwa",_COOKIEB:"__mfwb",_COOKIEC:"__mfwc",init:function(){this.__initChannel(),this._initChannel(),this._initPageEvent(),this._saveUnstaged(),this._initMarkup(),window.mfwClick=function(t,e){InSight.stat.behavioralEvent("click",t,e)},window.mfwShow=function(t){InSight.stat.behavioralEvent("show",t)},window.mfwState=function(t){InSight.stat.behavioralEvent("state",t)},window.mfwPage=function(t){InSight.stat.pageEvent(t)}},__initChannel:function(){var t=InSight.utils.getQuery(location.search.substring(1)),e=document.referrer;try{e&&(e=(e=e.split("://")[1]).split("/")[0]),t.mfw_chid?(InSight.utils.setCookie("__mfwchid",t.mfw_chid,168),InSight.utils.setCookie("__mfwothchid",""),InSight.utils.setCookie("__omc_chl",t.mfw_chid,168)):(e&&!InSight.utils.getCookie("__mfwchid")&&-1===e.indexOf(".mafengwo.")&&-1===e.indexOf(".imfw.")&&InSight.utils.setCookie("__mfwothchid","referrer|"+e,168),-1===e.indexOf(".mafengwo.")&&-1===e.indexOf(".imfw.")&&InSight.utils.setCookie("__omc_chl","",168)),-1===e.indexOf(".mafengwo.")&&-1===e.indexOf(".imfw.")&&InSight.utils.setCookie("__omc_r",e,168)}catch(t){console.warn("ã€SDKã€‘referrer error",e)}},_initChannel:function(){try{var t=InSight.utils.getCookie(this._COOKIEC),e=InSight.utils.getQuery(location.search.substring(1)),i=InSight.utils.getExtDomain();if(InSight._cookieStatus){var n="";if(t){var o=t.split("||");if(n="","direct"===t)e.mfw_chid?(n+=e.mfw_chid,n+=e.oth_chid_data?"||"+e.oth_chid_data:""):n="direct"===i?i:"referrer|"+i,InSight.utils.setCookie(this._COOKIEC,n,168);else if(0===o[0].indexOf("referrer|")){var r=o[0].replace("referrer|","");e.mfw_chid&&r!==e.mfw_chid?(n+=e.mfw_chid,n+=e.oth_chid_data?"||"+e.oth_chid_data:"",InSight.utils.setCookie(this._COOKIEC,n,168)):"direct"!==i&&r!==i&&(n="referrer|"+i,InSight.utils.setCookie(this._COOKIEC,n,168))}else e.mfw_chid&&(n+=e.mfw_chid,n+=e.oth_chid_data?"||"+e.oth_chid_data:"",InSight.utils.setCookie(this._COOKIEC,n,168))}else n="",e.mfw_chid?(n+=e.mfw_chid,n+=e.oth_chid_data?"||"+e.oth_chid_data:""):n="direct"===i?i:"referrer|"+i,InSight.utils.setCookie(this._COOKIEC,n,168);if(t=InSight.utils.getCookie(this._COOKIEC)){var a=t.split("||");InSight.config.mfwChild=a[0],InSight.config.childData=a[1]?a[1]:""}}else e.mfw_chid?(InSight.config.mfwChild=e.mfw_chid,InSight.config.childData=e.oth_chid_data?e.oth_chid_data:""):InSight.config.mfwChild="direct"===i?i:"referrer|"+i}catch(t){InSight.monitor.trackSDKError({msg:t.message,type:"init_channel_error"})}},_updateCookie:function(){if(InSight._cookieStatus)try{var t=(new Date).getTime(),e=InSight.utils.getCookie(this._COOKIEA),i="";e||(i="",i+=t+".",i+=InSight.utils.getRandom(5)+".",i+="1.",i+=t+".",i+=t+"",InSight.utils.setCookie(this._COOKIEA,i,8760));var n=InSight.utils.getCookie(this._COOKIEB),o=InSight.utils.getExtDomain(!0),r="";if(n&&n.split(".").length>=3){var a=n.split("."),s={session:a[0],currSteps:a[1],extDomain:a.slice(2).join(".")};r="",r+=s.session+".",r+=Number(s.currSteps)+1+".",r+=o+"",InSight.utils.setCookie(this._COOKIEB,r,.5)}else if(r="",r+=InSight.utils.createSession()+".",r+="1.",r+=o+"",InSight.utils.setCookie(this._COOKIEB,r,.5),e&&5===e.split(".").length){var h=e.split("."),c={firstVisit:h[0],random:h[1],totalSteps:h[2],lastVisit:h[3],currVisit:h[4]};i="",i+=c.firstVisit+".",i+=c.random+".",i+=Number(c.totalSteps)+1+".",i+=c.currVisit+".",i+=t+"",InSight.utils.setCookie(this._COOKIEA,i,8760)}}catch(t){InSight.monitor.trackSDKError({msg:t.message,type:"update_cookie_error"})}},_checkCookie:function(){if(InSight._cookieStatus){var t=(new Date).getTime(),e=InSight.utils.getCookie(this._COOKIEA),i=InSight.utils.getCookie(this._COOKIEB),n=InSight.utils.getCookie(this._COOKIEC),o="",r="",a="";if(e||(o="",o+=t+".",o+=InSight.utils.getRandom(5)+".",o+="1.",o+=t+".",o+=t+"",InSight.utils.setCookie(this._COOKIEA,o,8760)),!i&&(r="",r+=InSight.utils.createSession()+".",r+="1.",r+=InSight.utils.getExtDomain(!0)+"",InSight.utils.setCookie(this._COOKIEB,r,.5),e&&5===e.split(".").length)){var s=e.split("."),h={firstVisit:s[0],random:s[1],totalSteps:s[2],lastVisit:s[3],currVisit:s[4]};o="",o+=h.firstVisit+".",o+=h.random+".",o+=Number(h.totalSteps)+1+".",o+=h.currVisit+".",o+=t+"",InSight.utils.setCookie(this._COOKIEA,o,8760)}if(!n){var c=InSight.utils.getQuery(location.search.substring(1));if(a="",c.mfw_chid)a+=c.mfw_chid,a+=c.oth_chid_data?"||"+c.oth_chid_data:"";else{var l=InSight.utils.getExtDomain();a="direct"===l?l:"referrer|"+l}if(InSight.utils.setCookie(this._COOKIEC,a,168),n=InSight.utils.getCookie(this._COOKIEC)){var d=n.split("||");InSight.config.mfwChild=d[0],InSight.config.childData=d[1]?d[1]:""}}}},_initPageEvent:function(){if(InSight.config.auto){var t=function(t){var e=history[t];return function(){var i=e.apply(this,arguments),n=new Event(t);return n.arguments=arguments,window.dispatchEvent(n),i}};history.pushState=t("pushState"),history.replaceState=t("replaceState"),InSight.utils.addEvent(window,"pushState",this._pageEvent),InSight.utils.addEvent(window,"replaceState",this._pageEvent),InSight.utils.addEvent(window,"popState",this._pageEvent),InSight.utils.addEvent(window,"hashchange",this._pageEvent),this.pageEvent()}},_initMarkup:function(){document.addEventListener("click",function(t){var e=t.target;"HTML"!==e.tagName&&"BODY"!==e.tagName&&(function(t){var e=InSight.utils.traverseParent(t,function(t){return"a"===t.tagName.toLowerCase()}),i="",n=[],o="",r="";if(e)/^(?:([A-Za-z]+):)?(\/{0,3})([0-9.\-A-Za-z]+)(?::(\d+))?(?:\/([^?#]*))?(?:\?([^#]*))?(?:#(.*))?$/.test(e.getAttribute("href")||"")&&(n=(e.getAttribute("data-in-values")||e.getAttribute("data-ine-values")||"").split("|"),o=e.getAttribute("data-in-pos")||n[0],r=e.getAttribute("data-in-prm")||n[1],(i=function(t,e,i){var n="",o="",r=e?"tpos="+e:"",a=i?"tprm="+i:"";if(r&&-1===t.indexOf("tpos=")||a&&-1===t.indexOf("tprm="))if(o=(o+=r)?a?o+"&"+a:o:a,t.indexOf("#")>=0)if(t.indexOf("?")>=0&&t.indexOf("?")<t.indexOf("#")){var s=[t.slice(0,t.indexOf("?")),t.slice(t.indexOf("?")+1)];n=s[0]+"?"+o+"&"+s[1]}else{var h=[t.slice(0,t.indexOf("#")),t.slice(t.indexOf("#")+1)];n=h[0]+"?"+o+"#"+h[1]}else if(t.indexOf("?")>=0){var c=[t.slice(0,t.indexOf("?")),t.slice(t.indexOf("?")+1)];n=c[0]+"?"+o+"&"+c[1]}else n=t+"?"+o;return n}(e.getAttribute("href"),o,r))&&e.setAttribute("href",i))}(e),function(t){var e=InSight.utils.traverseParent(t,function(t){var e=t.getAttribute("data-in-values")||t.getAttribute("data-ine-values"),i=t.getAttribute("data-in-pos")||t.getAttribute("data-ine-pos"),n=t.getAttribute("data-in-prm")||t.getAttribute("data-ine-prm"),o=t.getAttribute("data-in-mn")||t.getAttribute("data-ine-mn"),r=t.getAttribute("data-in-in")||t.getAttribute("data-ine-in"),a=t.getAttribute("data-in-is")||t.getAttribute("data-ine-is"),s=t.getAttribute("data-in-kw")||t.getAttribute("data-ine-kw"),h=t.getAttribute("data-in-it")||t.getAttribute("data-ine-it"),c=t.getAttribute("data-in-ii")||t.getAttribute("data-ine-ii"),l=t.getAttribute("data-in-ec")||t.getAttribute("data-ine-ec"),d=t.getAttribute("data-in-iu")||t.getAttribute("data-ine-iu");return Boolean(e||i||n||o||r||a||s||h||c||l||d)});if(e){var i=(e.getAttribute("data-in-values")||e.getAttribute("data-ine-values")||"").split("|"),n=e.getAttribute("data-in-pos")||e.getAttribute("data-ine-pos")||i[0],o=e.getAttribute("data-in-prm")||e.getAttribute("data-ine-prm")||i[1],r=e.getAttribute("data-in-mn")||e.getAttribute("data-ine-mn")||i[2],a=e.getAttribute("data-in-in")||e.getAttribute("data-ine-in")||i[3],s=e.getAttribute("data-in-is")||e.getAttribute("data-ine-is")||i[4],h=e.getAttribute("data-in-kw")||e.getAttribute("data-ine-kw")||i[5],c=e.getAttribute("data-in-it")||e.getAttribute("data-ine-it")||i[6],l=e.getAttribute("data-in-ii")||e.getAttribute("data-ine-ii")||i[7],d=e.getAttribute("data-in-ec")||e.getAttribute("data-ine-ec")||i[8],u=e.getAttribute("data-in-iu")||e.getAttribute("data-ine-iu")||i[9];if(n||o||r||a||s||h||c||l||d||u){var g={posId:n,prmId:o,moduleName:r,itemName:a,itemSource:s,keyword:h,itemType:c,itemId:l,itemUri:u,eventCode:"string"==typeof d?/^click_/i.test(d)?d:/^show_/i.test(d)?d.replace(/^show_/i,"click_"):"click_"+d:void 0};InSight.stat.behavioralEvent("click",g)}}}(e))},!1)},_getPageParams:function(){return InSight.utils.cleanObj({et:"page",t:(new Date).getTime(),eg:InSight.utils.guid(),pdi:InSight.config.pageDetailId,kw:encodeURIComponent(InSight.config.keyword||""),info:InSight.config.info,ab:InSight.config.ab})},_getCustomPageParams:function(t){if(!t)return{};var e=encodeURIComponent;return InSight.utils.cleanObj({mi:t.mddId,pn:e(t.pageName||""),kw:e(t.keyword||""),info:t.info,ab:t.ab})},_getBehavioralParams:function(t){return InSight.utils.cleanObj({u:encodeURIComponent(location.href.substring(0,2048))||"-",pid:InSight.config.pageGuid,et:t||"click",t:(new Date).getTime(),eg:InSight.utils.guid(),pdi:InSight.config.pageDetailId,kw:encodeURIComponent(InSight.config.keyword||""),info:InSight.config.info||null,ab:InSight.config.ab||null})},_transformParams:function(t,e){if("[object Object]"!==Object.prototype.toString.call(e))throw new Error("è¯·ä¼ å…¥å¯¹è±¡ç±»åž‹è¡Œä¸ºäº‹ä»¶å‚æ•°");if(("click"===t||"show"===t)&&InSight.utils.isEmptyObject(InSight.utils.cleanObj(e)))throw new Error("è¯·ä¼ å…¥æ­£ç¡®çš„äº‹ä»¶å‚æ•°");if(!("state"!==t||e.statusType&&e.statusCode))throw new Error("çŠ¶æ€äº‹ä»¶è¯·ä¼ å…¥çŠ¶æ€ç±»åž‹(status_type)åŠçŠ¶æ€ç (status_code)å‚æ•°");var i=function(t){return"[object Array]"===Object.prototype.toString.call(t)};e.itemType=i(e.itemType)?e.itemType.join(";"):e.itemType,e.itemId=i(e.itemId)?e.itemId.join(";"):e.itemId;var n=encodeURIComponent;return InSight.utils.cleanObj({pdi:e.pageDetailId,sci:e.showCycleId,pos:e.posId,mn:n(e.moduleName||""),inm:n(e.itemName||""),is:n(e.itemSource||""),it:n(e.itemType||""),ii:n(e.itemId||""),iu:n((e.itemUri||"").substring(0,2048)),prm:e.prmId,ec:e.eventCode,kw:n(e.keyword||""),info:e.info,ab:e.ab,st:e.statusType,sc:e.statusCode,ct:e.consumeTime})},_checkUrl:function(){clearTimeout(this._checkTimer),this._checkTimer=setTimeout(function(){var t=document.querySelector('meta[property="mfw:pagename"]'),e="";t&&(e=t.getAttribute("content"));var i={pageName:e||"",url:window.location.href},n=new window.XMLHttpRequest;n.open("POST","https://mdp.mafengwo.cn/api/pageresources/release/url/match"),n.onreadystatechange=function(){if(4===this.readyState&&200===this.status){var t=JSON.parse(this.response);0!==t.code&&-1!==t.code&&alert(t.msg)}},n.send(InSight.reporter.postDataFormat(i))},500)},pageEvent:function(t){"prepub"===InSight.config.env&&this._checkUrl();try{if(InSight.utils.isRuleMatched(InSight.config.ignoreRule.stat,location.host+location.pathname+location.hash))return;InSight.config.pageGuid=InSight.utils.guid(),this._updateCookie(),this._checkCookie();var e=InSight.utils.deepMerge({},InSight.utils.getCommonParams(),this._getPageParams(),this._getCustomPageParams(t));InSight.mini.syncEvent(e),e=InSight.utils.stringify(e);var i=InSight.reportHost+"/page_event.gif";InSight.reporter.send(i,e),this.__pageEvent()}catch(t){InSight.monitor.trackSDKError({type:"page_event_error",msg:t.message,stack:t&&t.stack?t.stack:""}),"product"!==InSight.config.env&&console.error(t)}},_pageEvent:function(){InSight.stat.pageEvent()},__pageEvent:function(){var t=InSight.utils.__getCommonParams(),e=InSight.reportHost+"/stat_click.gif";InSight.reporter.send(e,t)},_saveUnstaged:function(){function t(){InSight.stat._behavioralEvent()}InSight.utils.addEvent(window,"beforeunload",t),InSight.utils.addEvent(window,"unload",t),InSight.utils.addEvent(document,"pagehide",t)},behavioralEvent:function(t,e,i){if(!InSight.utils.isRuleMatched(InSight.config.ignoreRule.stat,location.host+location.pathname+location.hash))try{if(this._checkCookie(),"[object Array]"===InSight.utils.protoString(e))for(var n=0;n<e.length;n++){var o=InSight.utils.deepMerge({},this._getBehavioralParams(t),this._transformParams(t,e[n]));this._eventQueue.push(InSight.utils.stringify(o))}else{var r=InSight.utils.deepMerge({},this._getBehavioralParams(t),this._transformParams(t,e));this._eventQueue.push(InSight.utils.stringify(r))}!0===i?this._behavioralEvent():(clearTimeout(this._reportTimer),this._reportTimer=setTimeout(function(){this._behavioralEvent()}.bind(this),500))}catch(t){InSight.monitor.trackSDKError({type:"behavioral_event_error",msg:t.message,stack:t&&t.stack?t.stack:""}),"product"!==InSight.config.env&&console.error(t)}},_behavioralEvent:function(){if(this._eventQueue.length){var t={ar:this._eventQueue};t=InSight.utils.deepMerge({},InSight.utils.getCommonParams(),t);for(var e=0;e<this._eventQueue.length;++e){var i=InSight.utils.deepMerge({},t,this._eventQueue[e]);delete i.ar,InSight.mini.syncEvent(i)}t=InSight.utils.stringify(t);var n=InSight.reportHost+"/behavioral_event.gif";InSight.reporter.send(n,t),this._eventQueue=[]}},otherEvent:function(){if(!InSight.utils.isRuleMatched(InSight.config.ignoreRule.stat,location.host+location.pathname+location.hash))try{this._checkCookie();var t=InSight.utils.deepMerge({},InSight.utils.getCommonParams()),e=InSight.reportHost+"/other_event.gif";InSight.reporter.send(e,t)}catch(t){"product"!==InSight.config.env&&console.error(t)}}},InSight.mini={platform:null,platformName:"",webviewSdk:{wx:"https://res.wx.qq.com/open/js/jweixin-1.6.0.js",swan:"https://b.bdstatic.com/searchbox/icms/searchbox/js/swan-2.0.18.js",my:"https://appx/web-view.min.js",tt:"https://s3.pstatp.com/toutiao/tmajssdk/jssdk-1.0.1.js"},_inMiniWebview:!1,_eventQueue:[],_maxLenth:50,init:function(){window.addEventListener("load",function(){/miniProgram/.test(navigator.userAgent)&&/MicroMessenger/.test(navigator.userAgent)?(this._inMiniWebview=!0,window.wx&&wx.miniProgram?this.setPlatform("wx"):this.loadWebviewSdk("wx")):/swan\//.test(navigator.userAgent)?(this._inMiniWebview=!0,window.swan&&swan.webView?this.setPlatform("swan"):this.loadWebviewSdk("swan")):/AlipayClient/.test(navigator.userAgent)?(this._inMiniWebview=!0,window.my?this.setPlatform("my"):this.loadWebviewSdk("my")):/toutiao/.test(navigator.userAgent)&&(this._inMiniWebview=!0,window.tt&&tt.miniProgram?this.setPlatform("tt"):this.loadWebviewSdk("tt"))}.bind(this))},loadWebviewSdk:function(t){var e=document.createElement("script");e.src=this.webviewSdk[t],e.crossorigin="anonymous",e.onload=function(){InSight.mini.setPlatform(t)};var i=document.getElementsByTagName("script")[0];i.parentNode.insertBefore(e,i)},setPlatform:function(t){this.platformName=t,"wx"===t?this.platform=wx.miniProgram:"swan"===t?this.platform=swan.webView:"my"===t?this.platform=my:"tt"===t&&(this.platform=tt.miniProgram),this.dispatchEventQ()},dispatchEventQ:function(){try{for(var t=0;t<this._eventQueue.length;++t)this.platform.postMessage({data:this._eventQueue[t]});this.clearEventQ()}catch(t){InSight.monitor.trackSDKError({type:"mini_queue_error",msg:t.message,stack:t&&t.stack?t.stack:""}),"product"!==InSight.config.env&&console.error(t)}},clearEventQ:function(){this._eventQueue.splice(0)},syncEvent:function(t){var e=decodeURIComponent,i=InSight.utils.cleanObj({esrc:"h5_sdk",u:e(t.u||""),ru:e(t.ru||""),et:t.et,pid:t.pid,eg:t.eg,t:t.t,mi:t.mi,pt:e(t.pt||""),kw:e(t.kw||""),info:t.info,ab:t.ab,ec:t.ec,pos:t.pos,mn:e(t.mn||""),inm:e(t.inm||""),is:e(t.is||""),it:e(t.it||""),ii:e(t.ii||""),iu:e(t.iu||""),prm:t.prm,sci:t.sci,st:t.st,sc:t.sc,ct:t.ct});this._eventQueue.push(i),this._eventQueue.length>this._maxLenth&&this.clearEventQ(),this._inMiniWebview&&this.dispatchEventQ()}},InSight.monitor={_reportTimer:null,_eventQueue:[],init:function(){this.addEvent(window,"error",this.httpError),this.addEvent(window,"beforeunload",this.save),this.addEvent(document,"pagehide",this.save),this.addEvent(window,"unload",this.save),this.addEvent(window,"load",this.savePagePerfTime),this.saveJSError(),this.addEvent(window,"unhandledrejection",this.savePromiseError),InSight.addError=this.saveCustomError,window.mfwSendLog={addError:this.saveCustomError},window.mfwPerformance=this.savePagePerfTime,this.ajaxInterceptor(),this.fetchInterceptor(),this.hybridInterceptor()},handleAjaxEvent:function(t,e){!e&&0==t.status&&t.duration<1500||""!==t.url&&-1===t.url.indexOf(InSight.reportHost)&&this.pushMonitorEvent("default","ajax",t)},getApiUri:function(t){try{var e={url:t,uri:t.split("?")[0]};if(t.indexOf("//")>=0)e.uri=e.uri.split("//")[1];else{var i=window.location.host;"/"!=t[0]&&(i+="/"),e.url=window.location.protocol+"//"+i+t,e.uri=i+e.uri}return e}catch(t){this.trackSDKError({msg:t.message,type:"getApiUri"})}return{url:"",uri:""}},ajaxInterceptor:function(){if("file:"!==window.location.protocol&&window.XMLHttpRequest){var t={},e=window.XMLHttpRequest,i=e.prototype.open,n=e.prototype.send;e.prototype.open=function(e,n){try{t.method=e.toUpperCase();var o=InSight.monitor.getApiUri(n);t.url=o.url,t.uri=o.uri,t.duration=(new Date).getTime()}catch(t){InSight.monitor.trackSDKError({msg:t.message,type:"getApiUri"})}i.apply(this,arguments)},e.prototype.send=function(){try{InSight.monitor.addEvent(this,"readystatechange",function(t){4===this.readyState&&(t.status=this.status,t.duration=(new Date).getTime()-t.duration,InSight.monitor.handleAjaxEvent(t))}.bind(this,JSON.parse(JSON.stringify(t))))}catch(t){InSight.monitor.trackSDKError({msg:t.message,type:"getApiUri"})}n.apply(this,arguments)}}},fetchInterceptor:function(){if(window.fetch){var t=window.fetch;window.fetch=function(){var e="GET";arguments[1]&&arguments[1].method&&(e=arguments[1].method.toUpperCase());var i={method:e},n=arguments[0],o=InSight.monitor.getApiUri(n);return i.url=o.url,i.uri=o.uri,i.duration=(new Date).getTime(),t.apply(this,arguments).then(function(t){return i.status=t.status,i.duration=(new Date).getTime()-i.duration,InSight.monitor.handleAjaxEvent(i),t}).catch(function(t){throw i.message=t.message,i.duration=(new Date).getTime()-i.duration,InSight.monitor.handleAjaxEvent(i),t})}}},hybridInterceptor:function(){if(window.MFWAPP&&MFWAPP.sdk&&"hybrid"===MFWAPP.sdk.type&&MFWAPP&&MFWAPP.hybrid&&"function"==typeof MFWAPP.hybrid.sendHttpRequest){var t=window.MFWAPP.hybrid.sendHttpRequest;window.MFWAPP.hybrid.sendHttpRequest=function(e){var i={method:e.method,url:e.path,uri:e.path,duration:(new Date).getTime()};var n=e.path.indexOf("https://")>=0?e.path:'https://mapi.mafengwo.cn'+e.path,o=InSight.monitor.getApiUri(n);i.url=o.url,i.uri=o.uri;var r=e.onFinish;r?t.call(this,{path:e.path,cache:e.cache,method:e.method,params:e.params,timeout:e.timeout?e.timeout:60,onFinish:function(t){i.status=t.error?t.error:0,i.duration=(new Date).getTime()-i.duration,InSight.monitor.handleAjaxEvent(i,!0),r.call(this,t)}}):t.call(this,e)}}},httpError:function(t){if(!/YisouSpider/i.test(navigator.userAgent)){var e=null,i=t.target||t.srcElement;(i instanceof HTMLScriptElement||i instanceof HTMLImageElement||i instanceof HTMLLinkElement)&&(e={url:i.src||i.href,type:i.nodeName}),e&&InSight.monitor.pushMonitorEvent("default","resource",e)}},saveJSError:function(){window.onerror=function(t,e,i,n,o){var r={etype:"jserror",lno:i,cno:n,url:e,msg:t||"",stack:o&&o.stack?o.stack:""};InSight.monitor.pushMonitorEvent("default","js_error",r)}},savePromiseError:function(t){var e=t.reason;if(e)try{var i=InSight.utils.parseError(e,"promise ");InSight.monitor.pushMonitorEvent("default","js_error",i)}catch(t){InSight.monitor.trackSDKError({msg:t.message,type:"parse_promise_error"})}},saveCustomError:function(t){if(t)try{var e=InSight.utils.parseError(t,"custom ");InSight.monitor.pushMonitorEvent("default","js_error",e)}catch(t){InSight.monitor.trackSDKError({msg:t.message,type:"parse_custom_error"})}},save:function(){InSight.monitor.sendMonitorEvent(!0)},addEvent:function(t,e,i){document.addEventListener?t?t.addEventListener(e,i,!0):window.addEventListener(e,i,!0):document.attachEvent&&(t?t.attachEvent("on"+e,i):window.attachEvent("on"+e,i))},savePagePerfTime:function(){var t=window.performance||window.msPerformance||window.webkitPerformance||window.mozPerformance,e={};if(t&&t.timing){var i=t.timing;e.onload=i.domComplete-i.navigationStart,e.dom_ready=i.domContentLoadedEventStart-i.domLoading,e.dom_resolve=i.domComplete-i.domLoading,e.first_paint=i.responseEnd-i.navigationStart,e.request=i.domContentLoadedEventStart-i.responseEnd,e.connect=i.connectEnd-i.connectStart,e.dns=i.domainLookupEnd-i.domainLookupStart,e.onload=e.onload>1e5||e.onload<0?0:e.onload,e.dom_ready=e.dom_ready>1e5||e.dom_ready<0?0:e.dom_ready,e.first_paint=e.first_paint>1e5||e.first_paint<0?0:e.first_paint,e.dom_resolve=e.dom_resolve>1e5||e.dom_resolve<0?0:e.dom_resolve,e.request=e.request>1e5||e.request<0?0:e.request,e.connect=e.connect>1e5||e.connect<0?0:e.connect,e.dns=e.dns>1e5||e.dns<0?0:e.dns,e.navigationStart=i.navigationStart,e.redirectStart=i.redirectStart,e.redirectEnd=i.redirectEnd,e.fetchStart=i.fetchStart,e.domainLookupStart=i.domainLookupStart,e.domainLookupEnd=i.domainLookupEnd,e.connectStart=i.connectStart,e.connectEnd=i.connectEnd,e.requestStart=i.requestStart,e.requestEnd=i.requestEnd,e.responseStart=i.responseStart,e.responseEnd=i.responseEnd,e.domLoading=i.domLoading,e.domInteractive=i.domInteractive,e.domContentLoad=i.domContentLoad,e.domComplete=i.domComplete,e.loadEventStart=i.loadEventStart,e.loadEventEnd=i.loadEventEnd,InSight.monitor.pushMonitorEvent("default","performance",e)}},sendMonitorEvent:function(t){var e=InSight.reportHost+"/fe_monitor.gif";this._eventQueue.length&&t?InSight.reporter.send(e,{value:JSON.stringify(this._eventQueue)}):this._reportTimer>0||(this._reportTimer=setTimeout(function(){this._reportTimer=0,this._eventQueue.length&&(InSight.reporter.send(e,{value:JSON.stringify(this._eventQueue)}),this._eventQueue=[])}.bind(this),2e3))},pushMonitorEvent:function(t,e,i){if(!InSight.utils.isRuleMatched(InSight.config.ignoreRule.monitor,location.host+location.pathname+location.hash)&&("js_error"!==e||!InSight.utils.isRuleMatched(InSight.config.ignoreRule.error,i.msg))&&("ajax"!==e||!InSight.utils.isRuleMatched(InSight.config.ignoreRule.ajax,i.uri))&&("resource"!==e||!InSight.utils.isRuleMatched(InSight.config.ignoreRule.resource,i.url))&&t&&e){var n=InSight.utils.deepMerge({},this.getMonitorParams(),{app_code:t,event_code:e,attr:JSON.stringify(i)});this._eventQueue.push(n),this.sendMonitorEvent()}},getMonitorParams:function(t){var e=encodeURIComponent,i=document.querySelector('meta[property="mfw:pagename"]'),n=i?e(i.getAttribute("content")):"";return{op:InSight.config.op,sdk_ver:InSight.version,protocol:window.location.protocol.replace(":",""),url:e(location.href||"-"),uri:InSight.utils.getUri()||"-",refer:e(document.referrer)||"direct",pid:InSight.config.pageGuid,pn:n,ws:InSight.utils.getBrowserSize(),sc:screen?screen.width+"x"+screen.height:"-1x-1",system_language:InSight.utils.getLang(),flash:"Not enabled",charset:InSight.utils.getChartset(),title:e(document.title),event_time:parseInt(+new Date/1e3,10),event_guid:InSight.utils.guid()}},trackSDKError:function(t){var e=InSight.reportHost+"/fe_monitor.gif",i=InSight.utils.deepMerge({},this.getMonitorParams(),{app_code:"default",event_code:"sdk_js_error",attr:JSON.stringify(t)});InSight.reporter.send(e,{value:JSON.stringify([i])})}},InSight.start=function(e){try{(function(){try{return!!(window&&document&&navigator&&screen)}catch(t){return!1}})()&&!InSight.started&&(t(e),InSight.monitor.init(),InSight.stat.init(),InSight.mini.init(),InSight.started=!0)}catch(t){console.warn("ã€SDKã€‘init error",t)}},window.inConfig||window.Env&&"string"==typeof window.Env.op?InSight.start():setTimeout(function(){InSight.start()},10)}InSightInit(),/mfwappcode/i.test(navigator.userAgent)||function(){var t=document.createElement("script");t.crossorigin="anonymous",t.src="https://hm.baidu.com/hm.js?8288b2ed37e5bc9b4c9f7008798d2de0";var e=document.getElementsByTagName("script")[0];e.parentNode.insertBefore(t,e)}();var __assign=function(){return(__assign=Object.assign||function(t){for(var e,i=1,n=arguments.length;i<n;i++)for(var o in e=arguments[i])Object.prototype.hasOwnProperty.call(e,o)&&(t[o]=e[o]);return t}).apply(this,arguments)};function createCommonjsModule(t,e){return t(e={exports:{}},e.exports),e.exports}for(var rngBrowser=createCommonjsModule(function(t){var e="undefined"!=typeof crypto&&crypto.getRandomValues&&crypto.getRandomValues.bind(crypto)||"undefined"!=typeof msCrypto&&"function"==typeof window.msCrypto.getRandomValues&&msCrypto.getRandomValues.bind(msCrypto);if(e){var i=new Uint8Array(16);t.exports=function(){return e(i),i}}else{var n=new Array(16);t.exports=function(){for(var t,e=0;e<16;e++)0==(3&e)&&(t=4294967296*Math.random()),n[e]=t>>>((3&e)<<3)&255;return n}}}),byteToHex=[],i=0;i<256;++i)byteToHex[i]=(i+256).toString(16).substr(1);function bytesToUuid(t,e){var i=e||0,n=byteToHex;return[n[t[i++]],n[t[i++]],n[t[i++]],n[t[i++]],"-",n[t[i++]],n[t[i++]],"-",n[t[i++]],n[t[i++]],"-",n[t[i++]],n[t[i++]],"-",n[t[i++]],n[t[i++]],n[t[i++]],n[t[i++]],n[t[i++]],n[t[i++]]].join("")}var bytesToUuid_1=bytesToUuid;function v4(t,e,i){var n=e&&i||0;"string"==typeof t&&(e="binary"===t?new Array(16):null,t=null);var o=(t=t||{}).random||(t.rng||rngBrowser)();if(o[6]=15&o[6]|64,o[8]=63&o[8]|128,e)for(var r=0;r<16;++r)e[n+r]=o[r];return e||bytesToUuid_1(o)}var v4_1=v4;function throttle(t,e,i){var n=0,o=0;return function(){for(var r=[],a=0;a<arguments.length;a++)r[a]=arguments[a];var s=this,h=r,c=+new Date;n&&clearTimeout(n),o&&(o=c),i&&c-o>=e?(t.apply(s,h),o=c):n=setTimeout(function(){t.apply(s,h)},e)}}function checkeNodesIsOverlap(t,e){for(var i=0;i<t.length-1;i++)for(var n=t[i].getBoundingClientRect(),o=i+1;o<t.length;o++){var r=t[o].getBoundingClientRect();(isRectInParent(n,r,1)||isRectInParent(r,n,1))&&console.error([t[i]],[t[o]],"these two nodes are overlap each other,if its a alert frame you need lock other element .\n                if not you need change your css too avoid overlap")}}function isNodeShow(t,e,i,n,o){if(t.getAttribute("data-ine-phase-id")===e)return!1;if(t==document.body||t==document.documentElement)return!1;var r=t.getBoundingClientRect();if(0==r.width||0==r.height)return!1;var a={bottom:window.innerHeight,height:window.innerHeight,left:0,right:window.innerWidth,top:0,width:window.innerWidth,x:0,y:0};return i&&addScrollToRect(a,i),!!isExceedWindow(r,a)||!!isRectInParentComplete(r,a)}function addScrollToRect(t,e){e.scrollTop>0?t.bottom+=e.scrollTop:t.top+=e.scrollTop,e.scrollLeft>0?t.right+=e.scrollLeft:t.left+=e.scrollLeft}function isRectInParentComplete(t,e,i){return void 0===i&&(i=0),isPointInRect(e,{x:t.x,y:t.y},i)&&isPointInRect(e,{x:t.x+t.width,y:t.y},i)&&isPointInRect(e,{x:t.x,y:t.y+t.height},i)&&isPointInRect(e,{x:t.x+t.width,y:t.y+t.height},i)}function isRectInParent(t,e,i){return void 0===i&&(i=0),isPointInRect(e,{x:t.x,y:t.y},i)||isPointInRect(e,{x:t.x+t.width,y:t.y},i)||isPointInRect(e,{x:t.x,y:t.y+t.height},i)||isPointInRect(e,{x:t.x+t.width,y:t.y+t.height},i)}function isPointInRect(t,e,i){return void 0===i&&(i=5),t.left+i<=e.x&&t.right-i>=e.x&&t.bottom-i>=e.y&&t.top+i<=e.y}function isExceedWindow(t,e){var i=t.x,n=t.y,o=t.width,r=t.height,a=n<=0&&n+r>=e.height,s=i>=0&&i+o<=e.width;return a&&s}function logError(t,e){console.error([t],""+e)}function myThrottle(t,e){var i,n,o=0;return function(){var r=Date.now();i=this,n=arguments,r-o>e&&(t.apply(i,n),o=r)}}var FAST_SCROLL_CRITIAL_SPEED=1500,MAX_DELAY_BETWEEN_TWO_SCROLL_EVENT=400,MAX_DELAY_BETWEEN_SCROLL_AND_TOUCHMOVE=40,UPLOAD_CALCULATE_TIME=300,Show=function(){function t(t){this.debug=t.debug,this.onItemShow=t.onItemShow,this.typeName=t.typeName,this.attrsName=t.attrsName,this.attrsType=t.attrsType,this.lockName=t.lockName,this.keyName=t.keyName,this.scrollName=t.scrollName,this.hasInit=!1,this.isTransform=!1,this.lastScrollTime=0,this.scrollTimeInterval=0,this.calculateDomScrollAsync=function(){},throttle(this.calculateDomScroll,300,!0),this.getPhaseId=t.getPhaseId,this.setPhaseId=t.setPhaseId,this.getShowHash=t.getShowHash,this.setShowHash=t.setShowHash,this.hasShowHash={}}return t.prototype.init=function(){var t=this;this.hasInit||(this.hasInit=!0,["touchend","webkitTransitionEnd","transitionend"].forEach(function(e){document.addEventListener(e,t.eventHandler.bind(t),!0)}),document.addEventListener("scroll",myThrottle(this.scrollHandler.bind(this),UPLOAD_CALCULATE_TIME),!0),document.addEventListener("touchmove",this.touchmoveHandler.bind(this),!0),document.addEventListener("touchstart",this.touchstartHandler.bind(this),!0),document.addEventListener("touchend",this.touchendHandler.bind(this),!0),document.addEventListener("touchecancel",this.touchendHandler.bind(this),!0),document.addEventListener("click",this.clickHandler.bind(this),!0)),this.setShowHash({});var e=this;window.addEventListener("load",function(){setTimeout(function(){e.emit()},1e3)})},t.prototype.clickHandler=function(t){var e=0;this.hasShowHash=this.getShowHash();var i=window.event||t,n=i.path||i.composedPath&&i.composedPath();if(n){for(var o=0;o<n.length-3;o++){var r=n[o];if(r&&r.getAttribute){if(r.getAttribute("data-ine-phase-id")===this.getPhaseId())return;var a=this.collectParam(r);if(r&&a){var s=r.getAttribute(this.keyName)||"";s?this.hasShowHash[s]||(this.hasShowHash[s]=!0,this.onItemShow(a,r,!0)):this.onItemShow(a,r,!0),this.setExposureAttr(r),e++,this.debug&&e>1&&logError(t.path[o],"nesting element using show type which may cause data mistake")}}}this.setShowHash(this.hasShowHash)}},t.prototype.scrollHandler=function(t){!this.lastScrollTime||Date.now()-this.lastScrollTime>500?(this.lastScrollTime=Date.now(),this.scrollTimeInterval=.3):(this.scrollTimeInterval=(Date.now()-this.lastScrollTime)/1e3,this.lastScrollTime=Date.now());var e=this.getScrollNode(t.target),i={scrollTop:e.scrollTop,scrollLeft:e.scrollLeft,timeStamp:t.timeStamp};this.scrollTimer&&clearTimeout(this.scrollTimer),this.beforeEvent&&t.target!=this.beforeEvent&&this.scrollTimer?this.scrollTimer=0:this.beforeEvent&&t.target==this.beforeEvent&&(this.diffCalculateDomScroll(i),this.setScrollEnd()),this.startEventScroll||(this.startEventScroll=i),this.beforeEvent=t.target,this.beforeEventScroll=i},t.prototype.setScrollEnd=function(){this.scrollTimer=setTimeout(this.endScroll.bind(this),MAX_DELAY_BETWEEN_TWO_SCROLL_EVENT)},t.prototype.endScroll=function(){this.emit(),this.scrollTimer=0,this.startEventScroll=void 0,this.beforeEvent=void 0},t.prototype.diffCalculateDomScroll=function(t){if(this.beforeEvent&&this.beforeEventScroll&&this.startEventScroll){var e={scrollLeft:this.startEventScroll.scrollLeft-this.beforeEventScroll.scrollLeft,scrollTop:this.startEventScroll.scrollTop-this.beforeEventScroll.scrollTop,timeStamp:this.startEventScroll.timeStamp-this.beforeEventScroll.timeStamp},i=Math.abs(t.scrollTop-this.beforeEventScroll.scrollTop)/this.scrollTimeInterval,n=Math.abs(t.scrollLeft-this.beforeEventScroll.scrollLeft)/this.scrollTimeInterval;(i<FAST_SCROLL_CRITIAL_SPEED&&0!==i||n<FAST_SCROLL_CRITIAL_SPEED&&0!==n)&&this.calculateDomScroll(this.beforeEvent,e,this.getScrollNode(this.beforeEvent).getBoundingClientRect()),this.startEventScroll=this.beforeEventScroll}},t.prototype.touchstartHandler=function(){this.isTransform=!1,this.scrollTimer&&clearTimeout(this.scrollTimer)},t.prototype.touchendHandler=function(t){this.isTransform=!1,this.beforeTransformEventScroll=void 0,this.transformTarget=void 0},t.prototype.touchmoveHandler=function(t){var e=window.event||t,i=e.path||e.composedPath&&e.composedPath();if(i)if(!this.isTransform&&e&&this.beforeEventScroll&&e.timeStamp-this.beforeEventScroll.timeStamp>MAX_DELAY_BETWEEN_SCROLL_AND_TOUCHMOVE){this.isTransform=!0;for(var n=0;n<i.length;n++){i[n].attributes[this.scrollName]&&(this.transformTarget=i[n]);break}}else if(this.isTransform&&this.transformTarget){var o=this.splitTransform(getComputedStyle(this.transformTarget).transform||""),r={scrollTop:o.x,scrollLeft:o.y,timeStamp:t.timeStamp};this.beforeTransformEventScroll&&this.isScrollSlow(this.beforeEventScroll,r)&&this.calculateDomScrollAsync(this.transformTarget),this.beforeTransformEventScroll=r}},t.prototype.splitTransform=function(t){var e=t.split("(")[1].split(")")[0].split(",");return{x:parseFloat(e[e.length-2]),y:parseFloat(e[e.length-1])}},t.prototype.isScrollSlow=function(t,e){return this.calculateScrollSpeed(t,e)<=FAST_SCROLL_CRITIAL_SPEED},t.prototype.calculateScrollSpeed=function(t,e){return t&&e?Math.max(Math.abs(e.scrollLeft-t.scrollLeft),Math.abs(e.scrollTop-t.scrollTop))/(e.timeStamp-t.timeStamp)*1e3:0},t.prototype.calculateDomScroll=function(t,e,i){var n="[data-ine-pos], [data-ine-prm], [data-ine-mn], [data-ine-in], [data-ine-is], [data-ine-kw], [data-ine-it], [data-ine-ii], [data-ine-values]",o=t.querySelectorAll(n),r=o,a=t.querySelectorAll("["+this.lockName+"]"),s=[],h=0,c=0;this.hasShowHash=this.getShowHash();for(var l=t;l!=document.body&&l!=document&&l!=document.documentElement;){if(l.parentElement&&l.parentElement.getAttribute(this.lockName))return;if(!l.parentElement)break;l=l.parentElement}if(a.length>0){var d=a;for(a=[],h=0;h<d.length;h++){var u=d[h].querySelectorAll(n);u.length>0&&-1==a.indexOf(u[0])&&(a=a.concat(Array.prototype.slice.call(u,0)))}if(a.length>0)for(r=[],h=0,c=0;h<=o.length&&c<=a.length;void 0)o[h]==a[h]?c++:r.push(o[h]),++h==o.length&&c!=a.length&&(this.debug&&logError(a,"it seems something wrong in the lock element"),c=a.length)}for(var g=0;g<r.length;g++)if(e&&i?isNodeShow(r[g],this.getPhaseId(),e,i,this.debug):isNodeShow(r[g],this.getPhaseId())){s.push(r[g]),this.debug&&(r[g].getAttribute(this.typeName)&&r[g].getAttribute(this.attrsName)&&r[g].getAttribute(this.attrsType)||logError(r[g],"attribute "+this.typeName+" "+this.attrsName+" "+this.attrsType+" must all be required"));var m=r[g].getAttribute(this.keyName)||"",p=this.collectParam(r[g]);m?this.hasShowHash[m]||(this.onItemShow(p,r[g]),this.hasShowHash[m]=!0):this.onItemShow(p,r[g]),this.setExposureAttr(r[g])}this.setShowHash(this.hasShowHash),this.debug&&s.length>1&&checkeNodesIsOverlap(s,this.debug)},t.prototype.getScrollNode=function(t){return t==document?document.documentElement:t},t.prototype.eventHandler=function(){var t=this;setTimeout(function(){t.calculateDomScroll(document.body)},0)},t.prototype.setExposureAttr=function(t){t.setAttribute("data-ine-phase-id",this.getPhaseId())},t.prototype.collectParam=function(t){var e=(t.getAttribute("data-ine-values")||"").split("|"),i=t.getAttribute("data-ine-pos")||e[0],n=t.getAttribute("data-ine-prm")||e[1],o=t.getAttribute("data-ine-mn")||e[2],r=t.getAttribute("data-ine-in")||e[3],a=t.getAttribute("data-ine-is")||e[4],s=t.getAttribute("data-ine-kw")||e[5],h=t.getAttribute("data-ine-it")||e[6],c=t.getAttribute("data-ine-ii")||e[7],l=t.getAttribute("data-ine-ec")||e[8],d=t.getAttribute("data-ine-iu")||e[9];return i||n||o||r||a||s||h||c||l||d?{posId:i,prmId:n,moduleName:o,itemName:r,itemSource:a,keyword:s,itemType:h,itemId:c,itemUri:d,eventCode:"string"==typeof l?/^show_/i.test(l)?l:"show_"+l:void 0}:null},t.prototype.emit=function(){this.calculateDomScroll(document.body)},t}(),Dispatch=function(){function t(t){this.debug=t.debug,this.eventQueue=[],this.getPhaseId=t.getPhaseId,this.uploadEventAsync=throttle(this.uploadEvent,1e3)}return t.prototype.reportEvent=function(t,e,i,n){try{e.showCycleId=this.getPhaseId(),n?this.uploadEvent(t,e):(this.eventQueue.push({eventType:t,params:e}),this.uploadEventAsync())}catch(t){this.debug&&(console.log(t),logError(i,"data must be json like"))}},t.prototype.uploadEvent=function(t,e){if(t)this.mfwBehavioralEvent(t,e);else{for(var i={},n=0,o=this.eventQueue;n<o.length;n++){var r=o[n];i[r.eventType]||(i[r.eventType]=[]),i[r.eventType].push(r.params)}for(var a in this.eventQueue=[],i)i.hasOwnProperty(a)&&i[a]&&i[a].length>1?this.mfwBehavioralEvent(a,i[a]):this.mfwBehavioralEvent(a,i[a][0])}},t.prototype.mfwBehavioralEvent=function(t,e){window.mfwClick&&window.mfwShow?("click"===t?window.mfwClick:window.mfwShow)(e):console.error("æ²¡æœ‰æ‰¾åˆ°"+t=="click"?"mfwClick":"mfwShow")},t}(),defaultInit={click:!1,show:!0,hasId:!0},Exposure=function(){function t(t){this.debug=!!t.debug,this.projectName=t.projectName||"sales";var e=this;this.hasShowHash={},this.dispatch=new Dispatch({debug:this.debug,getPhaseId:e.getPhaseId.bind(e)}),this.show=new Show({debug:this.debug,keyName:"data-exp-key",lockName:"data-exp-display-lock",scrollName:"data-exp-display-scroll",typeName:t.showModuleName||"data-exp-display-module",attrsName:t.showParamsName||"data-exp-display-params",attrsType:t.showModuleName||"data-exp-display-module",getPhaseId:e.getPhaseId.bind(e),setPhaseId:e.setPhaseId.bind(e),getShowHash:e.getShowHash.bind(e),setShowHash:e.setShowHash.bind(e),onItemShow:function(t,i,n){e.dispatch.reportEvent("show",t,i,n)}})}return t.prototype.init=function(t){void 0===t&&(t=defaultInit);var e=t.show,i=void 0===e||e,n=t.hasId,o=void 0===n||n;this.generateId(o),i&&this.show.init(),this.enterBackgroundListener()},t.prototype.getPhaseId=function(){return this.phaseId},t.prototype.setPhaseId=function(){this.phaseId=v4_1()},t.prototype.generateId=function(t){void 0===t&&(t=!0),this.phaseId=t?v4_1():"0"},t.prototype.getShowHash=function(){return this.hasShowHash},t.prototype.setShowHash=function(t){this.hasShowHash=__assign({},t)},t.prototype.enterBackgroundListener=function(){var t=this;if("MFWAPP"in window){var e=window.MFWAPP;e.sdk&&e.sdk.has("webview.event_addBrowserDidEnterBackgroundListener")&&e.webview.event_addBrowserDidEnterBackgroundListener(function(){t.setPhaseId(),t.setShowHash({})})}},t.prototype.emit=function(){this.show.emit()},t}();new Exposure({showModuleName:"data-ine-display-module",showParamsName:"data-ine-display-params"}).init(),function(t){var e={};function i(n){if(e[n])return e[n].exports;var o=e[n]={i:n,l:!1,exports:{}};return t[n].call(o.exports,o,o.exports,i),o.l=!0,o.exports}i.m=t,i.c=e,i.d=function(t,e,n){i.o(t,e)||Object.defineProperty(t,e,{enumerable:!0,get:n})},i.r=function(t){"undefined"!=typeof Symbol&&Symbol.toStringTag&&Object.defineProperty(t,Symbol.toStringTag,{value:"Module"}),Object.defineProperty(t,"__esModule",{value:!0})},i.t=function(t,e){if(1&e&&(t=i(t)),8&e)return t;if(4&e&&"object"==typeof t&&t&&t.__esModule)return t;var n=Object.create(null);if(i.r(n),Object.defineProperty(n,"default",{enumerable:!0,value:t}),2&e&&"string"!=typeof t)for(var o in t)i.d(n,o,function(e){return t[e]}.bind(null,o));return n},i.n=function(t){var e=t&&t.__esModule?function(){return t.default}:function(){return t};return i.d(e,"a",e),e},i.o=function(t,e){return Object.prototype.hasOwnProperty.call(t,e)},i.p="",i(i.s=0)}([function(t,e,i){Object.defineProperty(e,"__esModule",{value:!0});var n=i(1),o=i(2),r=i(3),a=i(4),s=i(5),h={click:!0,show:!0,hasId:!0},c=function(){function t(t){this.debug=!!t.debug,this.projectName=t.projectName||"sales";var e=this;this.hasShowHash={},this.click=new o.default({onItemClick:function(t,i,n){e.reportEvent(t,i,n,!0)},typeName:t.clickParamsName||"data-exp-click-params",attrsName:t.clickParamsName||"data-exp-click-params",attrsType:t.clickModuleName||"data-exp-click-module",debug:this.debug}),this.show=new a.default({onItemShow:function(t,i,n,o){e.reportEvent(t,i,n,o)},typeName:t.showModuleName||"data-exp-display-module",attrsName:t.showParamsName||"data-exp-display-params",attrsType:t.showModuleName||"data-exp-display-module",scrollName:"data-exp-display-scroll",lockName:"data-exp-display-lock",keyName:"data-exp-key",debug:this.debug,getPhaseId:e.getPhaseId.bind(e),setPhaseId:e.setPhaseId.bind(e),getShowHash:e.getShowHash.bind(e),setShowHash:e.setShowHash.bind(e)}),this.dispatch=new r.default({projectName:this.projectName,getPhaseId:e.getPhaseId.bind(e)})}return t.prototype.reportEvent=function(t,e,i,o){var r;try{r=JSON.parse(e),this.dispatch.reportEvent(t,r,o)}catch(t){this.debug&&(console.log(t),n.logError(i,"data must be json like"))}},t.prototype.init=function(t){void 0===t&&(t=h);var e=t.click,i=void 0===e||e,n=t.show,o=void 0===n||n,r=t.hasId,a=void 0===r||r;this.generateId(a),i&&this.click.init(),o&&this.show.init(),this.enterBackgroundListener()},t.prototype.emit=function(){this.show.emit()},t.prototype.getPhaseId=function(){return this.phaseId},t.prototype.setPhaseId=function(){this.phaseId=s()},t.prototype.generateId=function(t){void 0===t&&(t=!0),this.phaseId=t?s():"0"},t.prototype.enterBackgroundListener=function(){var t=this;if("MFWAPP"in window){var e=window.MFWAPP;e.sdk&&e.sdk.has("webview.event_addBrowserDidEnterBackgroundListener")&&e.webview.event_addBrowserDidEnterBackgroundListener(function(){t.setPhaseId(),t.setShowHash({})})}},t.prototype.getShowHash=function(){return this.hasShowHash},t.prototype.setShowHash=function(t){this.hasShowHash=Object.assign({},t)},t.prototype.activeExposure=function(t,e,i){void 0===t&&(t=""),void 0===e&&(e=""),void 0===i&&(i={}),this.dispatch.emitMfwPageEvent(t,e,i)},t}();window&&(window.Exposure=c),e.default=c},function(t,e,i){function n(t){return 0==t.width&&0==t.height}function o(t,e,i,n,o){if(t.getAttribute("exposure_phase_id")===e)return!1;if(t==document.body||t==document.documentElement)return!1;var r=t.getBoundingClientRect();if(0==r.width||0==r.height)return!1;var h={bottom:window.innerHeight,height:window.innerHeight,left:0,right:window.innerWidth,top:0,width:window.innerWidth,x:0,y:0};return i&&a(h,i),!!l(r,h)||!!s(r,h)}function r(t){return!!(t.transform&&"none"!=t.transform||t.webkitTransform&&"none"!=t.webkitTransform)}function a(t,e){0<e.scrollTop?t.bottom+=e.scrollTop:t.top+=e.scrollTop,0<e.scrollLeft?t.right+=e.scrollLeft:t.left+=e.scrollLeft}function s(t,e,i){return void 0===i&&(i=0),c(e,{x:t.x,y:t.y},i)&&c(e,{x:t.x+t.width,y:t.y},i)&&c(e,{x:t.x,y:t.y+t.height},i)&&c(e,{x:t.x+t.width,y:t.y+t.height},i)}function h(t,e,i){return void 0===i&&(i=0),c(e,{x:t.x,y:t.y},i)||c(e,{x:t.x+t.width,y:t.y},i)||c(e,{x:t.x,y:t.y+t.height},i)||c(e,{x:t.x+t.width,y:t.y+t.height},i)}function c(t,e,i){return void 0===i&&(i=5),t.left+i<=e.x&&t.right-i>=e.x&&t.bottom-i>=e.y&&t.top+i<=e.y}function l(t,e){var i=t.x,n=t.y,o=t.width,r=t.height,a=n<=0&&n+r>=e.height,s=0<=i&&i+o<=e.width;return!(!a||!s)}function d(t){return void 0===t&&(t=12),Math.round(9*Math.random())+Math.random().toString().slice(2,t+1)}function u(t,e){console.error([t],""+e)}Object.defineProperty(e,"__esModule",{value:!0}),e.throttle=function(t,e,i){var n=0,o=0;return function(){for(var r=[],a=0;a<arguments.length;a++)r[a]=arguments[a];var s=this,h=r,c=+new Date;n&&clearTimeout(n),o&&(o=c),i&&e<=c-o?(t.apply(s,h),o=c):n=setTimeout(function(){t.apply(s,h)},e)}},e.isHidden=n,e.checkeNodesIsOverlap=function(t,e){for(var i=0;i<t.length-1;i++)for(var n=t[i].getBoundingClientRect(),o=i+1;o<t.length;o++){var r=t[o].getBoundingClientRect();(h(n,r,1)||h(r,n,1))&&console.error([t[i]],[t[o]],"these two nodes are overlap each other,if its a alert frame you need lock other element .\n                if not you need change your css too avoid overlap")}},e.isNodeShow=o,e.isNodeShowWithOverFlow=function(t,e){if(t==document.body||t==document.documentElement)return!1;var i=t.getBoundingClientRect();if(0==i.width||0==i.height)return!1;if(!h(i,{bottom:window.innerHeight,height:window.innerHeight,left:0,right:window.innerWidth,top:0,width:window.innerWidth,x:0,y:0}))return!1;var n=getComputedStyle(t),o=[],a=[],s=[];if("absolute"==n.position&&o.push(t),"fixed"==n.position&&s.push(t),0!=s.length&&e)for(var c=t;c.parentElement!=document.body;){if(r(n)){u(c,"is fixed element that use transform,that may cause fiexd invalid in ios");break}c.parentElement&&(c=c.parentElement)}for(;0==s.length&&t.parentElement!=document.body;){if(t=t.parentElement,n=getComputedStyle(t),0!=o.length&&(("relative"==n.position||"absolute"==n.position||r(n))&&a.push(t),0!=a.length&&"visible"!=n.overflow&&!h(i,l=t.getBoundingClientRect())&&!h(l,i)))return!1;if("fixed"==n.position?s.push(t):"absolute"==n.position&&o.push(t),0!=s.length){if(e)for(;t.parentElement!=document.body;){if(r(n)){u(t,"is fixed element that use transform,that may cause fiexd invalid in ios");break}t.parentElement&&(t=t.parentElement)}var l;if("visible"!=n.overflow&&!h(i,l=t.getBoundingClientRect())&&!h(l,i))return!1;break}if("visible"!=n.overflow&&0==o.length&&!h(i,l=t.getBoundingClientRect())&&!h(l,i))return!1}return!0},e.addScrollToRect=a,e.isRectInParentComplete=s,e.isRectInParent=h,e.isPointInRect=c,e.isExceedWindow=l,e.produceId=d,e.logError=u,e.myThrottle=function(t,e){var i,n,o=0;return function(){var r=Date.now();i=this,n=arguments,e<r-o&&(t.apply(i,n),o=r)}},e.default={isHidden:n,produceId:d,isNodeShow:o,logError:u}},function(t,e,i){Object.defineProperty(e,"__esModule",{value:!0});var n=i(1),o=function(){function t(t){this.onItemClick=t.onItemClick,this.typeName=t.typeName,this.attrsName=t.attrsName,this.attrsType=t.attrsType,this.debug=!!t.debug}return t.prototype.init=function(){document.addEventListener("click",this.clickHandler.bind(this),!0)},t.prototype.clickHandler=function(t){var e=window.event||t,i=e.path||e.composedPath&&e.composedPath(),o=e.target,r=0;this.checkClickedAndReport(o)&&r++;for(var a=1;a<i.length;a++)this.checkClickedAndReport(i[a])&&(r++,this.debug&&1<r&&n.logError(i[a],"nesting element using click type which may cause data mistake"))},t.prototype.checkClickedAndReport=function(t){return!!(t&&t.attributes&&t.attributes[this.typeName]&&""!=t.attributes[this.typeName].textContent)&&(t.attributes[this.attrsType]&&t.attributes[this.attrsType].textContent&&t.attributes[this.attrsName]&&t.attributes[this.attrsName].textContent?this.onItemClick(t.attributes[this.attrsType].textContent,t.attributes[this.attrsName].textContent,t):this.debug&&n.logError(t,"attribute "+this.typeName+" "+this.attrsName+" "+this.attrsType+" must all be required"),!0)},t.prototype.emit=function(t){this.clickHandler(t)},t}();e.Click=o,e.default=o},function(t,e,i){var n=this&&this.__assign||function(){return(n=Object.assign||function(t){for(var e,i=1,n=arguments.length;i<n;i++)for(var o in e=arguments[i])Object.prototype.hasOwnProperty.call(e,o)&&(t[o]=e[o]);return t}).apply(this,arguments)};Object.defineProperty(e,"__esModule",{value:!0});var o=i(1),r=function(){function t(t){this.eventQueue=[],this.projectName=t.projectName,this.getPhaseId=t.getPhaseId,this.uploadEventAsync=o.throttle(this.uploadEvent,1e3)}return t.prototype.reportEvent=function(t,e,i){e=n({},e,{show_cycle_id:this.getPhaseId()}),i?this.uploadEvent(t,e):(this.eventQueue.push({eventName:t,params:e}),this.uploadEventAsync())},t.prototype.uploadEvent=function(t,e){if(t)this.emitMfwPageEvent(this.projectName,t,e);else{for(var i={},n=0,o=this.eventQueue;n<o.length;n++){var r=o[n];i[r.eventName]||(i[r.eventName]=[]),i[r.eventName].push(r.params)}for(var a in this.eventQueue=[],i)i[a]&&1<i[a].length?this.emitMfwPageEvent(this.projectName,a,i[a]):this.emitMfwPageEvent(this.projectName,a,i[a][0])}},t.prototype.emitMfwPageEvent=function(t,e,i){window.mfwPageEvent?window.mfwPageEvent(t,e,i):console.error("æ²¡æœ‰mfwPageEvent")},t}();e.Dispatch=r,e.default=r},function(t,e,i){Object.defineProperty(e,"__esModule",{value:!0});var n=i(1),o=function(){function t(t){this.onItemShow=t.onItemShow,this.typeName=t.typeName,this.attrsName=t.attrsName,this.attrsType=t.attrsType,this.lockName=t.lockName,this.keyName=t.keyName,this.debug=!!t.debug,this.scrollName=t.scrollName,this.hasInit=!1,this.isTransform=!1,this.lastScrollTime=0,this.scrollTimeInterval=0,this.calculateDomScrollAsync=function(){},n.throttle(this.calculateDomScroll,300,!0),this.getPhaseId=t.getPhaseId,this.setPhaseId=t.setPhaseId,this.getShowHash=t.getShowHash,this.setShowHash=t.setShowHash,this.hasShowHash={}}return t.prototype.init=function(){var t=this;this.hasInit||(this.hasInit=!0,["touchend","webkitTransitionEnd","transitionend"].forEach(function(e){document.addEventListener(e,t.eventHandler.bind(t),!0)}),document.addEventListener("scroll",n.myThrottle(this.scrollHandler.bind(this),300),!0),document.addEventListener("touchmove",this.touchmoveHandler.bind(this),!0),document.addEventListener("touchstart",this.touchstartHandler.bind(this),!0),document.addEventListener("touchend",this.touchendHandler.bind(this),!0),document.addEventListener("touchecancel",this.touchendHandler.bind(this),!0),document.addEventListener("click",this.clickHandler.bind(this),!0)),this.setShowHash({}),this.emit()},t.prototype.clickHandler=function(t){var e=0;this.hasShowHash=this.getShowHash();for(var i=window.event||t,o=i.path||i.composedPath&&i.composedPath(),r=0;r<o.length-3;r++){var a=o[r];if(a.getAttribute("exposure_phase_id")===this.getPhaseId())return;if(a&&a&&a.getAttribute(this.typeName)){var s=a.getAttribute(this.keyName)||"";s?this.hasShowHash[s]||(this.hasShowHash[s]=!0,this.onItemShow(a.getAttribute(this.attrsType),a.getAttribute(this.attrsName),a,!0)):this.onItemShow(a.getAttribute(this.attrsType),a.getAttribute(this.attrsName),a,!0),this.setExposureAttr(a),e++,this.debug&&1<e&&n.logError(t.path[r],"nesting element using show type which may cause data mistake")}}this.setShowHash(this.hasShowHash)},t.prototype.scrollHandler=function(t){!this.lastScrollTime||500<Date.now()-this.lastScrollTime?(this.lastScrollTime=Date.now(),this.scrollTimeInterval=.3):(this.scrollTimeInterval=(Date.now()-this.lastScrollTime)/1e3,this.lastScrollTime=Date.now());var e=this.getScrollNode(t.target),i={scrollTop:e.scrollTop,scrollLeft:e.scrollLeft,timeStamp:t.timeStamp};this.scrollTimer&&clearTimeout(this.scrollTimer),this.beforeEvent&&t.target!=this.beforeEvent&&this.scrollTimer?this.scrollTimer=0:this.beforeEvent&&t.target==this.beforeEvent&&(this.diffCalculateDomScroll(i),this.setScrollEnd()),this.startEventScroll||(this.startEventScroll=i),this.beforeEvent=t.target,this.beforeEventScroll=i},t.prototype.setScrollEnd=function(){this.scrollTimer=setTimeout(this.endScroll.bind(this),400)},t.prototype.endScroll=function(){this.emit(),this.scrollTimer=0,this.startEventScroll=void 0,this.beforeEvent=void 0},t.prototype.diffCalculateDomScroll=function(t){if(this.beforeEvent&&this.beforeEventScroll&&this.startEventScroll){var e={scrollLeft:this.startEventScroll.scrollLeft-this.beforeEventScroll.scrollLeft,scrollTop:this.startEventScroll.scrollTop-this.beforeEventScroll.scrollTop,timeStamp:this.startEventScroll.timeStamp-this.beforeEventScroll.timeStamp},i=Math.abs(t.scrollTop-this.beforeEventScroll.scrollTop)/this.scrollTimeInterval,n=Math.abs(t.scrollLeft-this.beforeEventScroll.scrollLeft)/this.scrollTimeInterval;(i<1500&&0!==i||n<1500&&0!==n)&&this.calculateDomScroll(this.beforeEvent,e,this.getScrollNode(this.beforeEvent).getBoundingClientRect()),this.startEventScroll=this.beforeEventScroll}},t.prototype.touchstartHandler=function(){this.isTransform=!1,this.scrollTimer&&clearTimeout(this.scrollTimer)},t.prototype.touchendHandler=function(t){this.isTransform=!1,this.beforeTransformEventScroll=void 0,this.transformTarget=void 0},t.prototype.touchmoveHandler=function(t){var e=window.event||t,i=e.path||e.composedPath&&e.composedPath();if(!this.isTransform&&t&&this.beforeEventScroll&&40<t.timeStamp-this.beforeEventScroll.timeStamp){this.isTransform=!0;for(var n=0;n<i.length;n++){t.path[n].attributes[this.scrollName]&&(this.transformTarget=t.path[n]);break}}else if(this.isTransform&&this.transformTarget){var o=this.splitTransform(getComputedStyle(this.transformTarget).transform||""),r={scrollTop:o.x,scrollLeft:o.y,timeStamp:t.timeStamp};this.beforeTransformEventScroll&&this.isScrollSlow(this.beforeEventScroll,r)&&this.calculateDomScrollAsync(this.transformTarget),this.beforeTransformEventScroll=r}},t.prototype.splitTransform=function(t){var e=t.split("(")[1].split(")")[0].split(",");return{x:parseFloat(e[e.length-2]),y:parseFloat(e[e.length-1])}},t.prototype.isScrollSlow=function(t,e){return this.calculateScrollSpeed(t,e)<=1500},t.prototype.calculateScrollSpeed=function(t,e){return t&&e?Math.max(Math.abs(e.scrollLeft-t.scrollLeft),Math.abs(e.scrollTop-t.scrollTop))/(e.timeStamp-t.timeStamp)*1e3:0},t.prototype.calculateDomScroll=function(t,e,i){var o=t.querySelectorAll("["+this.typeName+"]"),r=o,a=t.querySelectorAll("["+this.lockName+"]"),s=[],h=0,c=0;this.hasShowHash=this.getShowHash();for(var l=t;l!=document.body&&l!=document&&l!=document.documentElement;){if(l.parentElement&&l.parentElement.getAttribute(this.lockName))return;if(!l.parentElement)break;l=l.parentElement}if(0<a.length){var d=a;for(a=[],h=0;h<d.length;h++){var u=d[h].querySelectorAll("["+this.typeName+"]");0<u.length&&-1==a.indexOf(u[0])&&(a=a.concat(Array.prototype.slice.call(u,0)))}if(0<a.length)for(r=[],c=h=0;h<=o.length&&c<=a.length;void 0)o[h]==a[h]?c++:r.push(o[h]),++h==o.length&&c!=a.length&&(this.debug&&n.logError(a,"it seems something wrong in the lock element"),c=a.length)}for(var g=0;g<r.length;g++)if(e&&i?n.isNodeShow(r[g],this.getPhaseId(),e,i,this.debug):n.isNodeShow(r[g],this.getPhaseId())){s.push(r[g]),this.debug&&(r[g].getAttribute(this.typeName)&&r[g].getAttribute(this.attrsName)&&r[g].getAttribute(this.attrsType)||n.logError(r[g],"attribute "+this.typeName+" "+this.attrsName+" "+this.attrsType+" must all be required"));var m=r[g].getAttribute(this.keyName)||"";m?this.hasShowHash[m]||(this.onItemShow(r[g].getAttribute(this.attrsType),r[g].getAttribute(this.attrsName),r[g]),this.hasShowHash[m]=!0):this.onItemShow(r[g].getAttribute(this.attrsType),r[g].getAttribute(this.attrsName),r[g]),this.setExposureAttr(r[g])}this.setShowHash(this.hasShowHash),this.debug&&1<s.length&&n.checkeNodesIsOverlap(s,this.debug)},t.prototype.getScrollNode=function(t){return t==document?document.documentElement:t},t.prototype.eventHandler=function(t){var e=this;setTimeout(function(){e.calculateDomScroll(document.body)},0)},t.prototype.emit=function(){this.calculateDomScroll(document.body)},t.prototype.setExposureAttr=function(t){t.setAttribute("exposure_phase_id",this.getPhaseId())},t}();e.Show=o,e.default=o},function(t,e,i){var n=i(6),o=i(7);t.exports=function(t,e,i){var r=e&&i||0;"string"==typeof t&&(e="binary"===t?new Array(16):null,t=null);var a=(t=t||{}).random||(t.rng||n)();if(a[6]=15&a[6]|64,a[8]=63&a[8]|128,e)for(var s=0;s<16;++s)e[r+s]=a[s];return e||o(a)}},function(t,e){var i="undefined"!=typeof crypto&&crypto.getRandomValues&&crypto.getRandomValues.bind(crypto)||"undefined"!=typeof msCrypto&&"function"==typeof window.msCrypto.getRandomValues&&msCrypto.getRandomValues.bind(msCrypto);if(i){var n=new Uint8Array(16);t.exports=function(){return i(n),n}}else{var o=new Array(16);t.exports=function(){for(var t,e=0;e<16;e++)0==(3&e)&&(t=4294967296*Math.random()),o[e]=t>>>((3&e)<<3)&255;return o}}},function(t,e){for(var i=[],n=0;n<256;++n)i[n]=(n+256).toString(16).substr(1);t.exports=function(t,e){var n=e||0,o=i;return[o[t[n++]],o[t[n++]],o[t[n++]],o[t[n++]],"-",o[t[n++]],o[t[n++]],"-",o[t[n++]],o[t[n++]],"-",o[t[n++]],o[t[n++]],"-",o[t[n++]],o[t[n++]],o[t[n++]],o[t[n++]],o[t[n++]],o[t[n++]]].join("")}}]);
;
/**
 * CPMå¹¿å‘Šç›‘æŽ§è„šæœ¬
 * @author jinbo@mafengwo.com
 * @date 2017.04.24
 */

(function () {

    //åŸºæœ¬é…ç½®
    var oConf = {
        reportImage:'https://topic.mafengwo.cn/ad/c.php?',
        // reportImage:'http://topic.kongming.dev/ad/c.php?',
        posList:[]
    };

    //å±å¹•å®½åº¦
    var iWinWidth = 0;
    //å±å¹•é«˜åº¦
    var iWinHeight = 0;

    var sDataAttrPrefix = 'acm';

    var sClassId = 'ads-output-block-w-m';


    //é’ˆå¯¹ä½ŽäºŽIE9çš„document.getElementsByClassNameå¤„ç†
    if(!document.getElementsByClassName){
        document.getElementsByClassName = function(className, element){
            var children = (element || document).getElementsByTagName('*');
            var elements = new Array();
            for (var i=0; i<children.length; i++){
                var child = children[i];
                var classNames = child.className.split(' ');
                for (var j=0; j<classNames.length; j++){
                    if (classNames[j] == className){
                        elements.push(child);
                        break;
                    }
                }
            }
            return elements;
        };
    }


    /**
     * èŽ·å–domçš„dataå±žæ€§
     * @param oDom
     * @param sName
     * @returns {*|string}
     */
    function getDataAttribute(oDom, sName) {
        var sVal = oDom.getAttribute('data-' + sDataAttrPrefix + sName) || (oDom.dataset)[sDataAttrPrefix + sName];
        return ((typeof sVal == 'undefined')||(null == sVal)) ? '':sVal;
    }


    /**
     * èŽ·å–å…ƒç´ æ°´å¹³åç§»é‡
     * @param oEle
     */
    function getElementLeft(oEle){
        var iActualLeft = oEle.offsetLeft;
        var oCurrent = oEle.offsetParent;
        while (oCurrent !== null){
            iActualLeft += oCurrent.offsetLeft;
            oCurrent = oCurrent.offsetParent;
        }
        return iActualLeft;
    }


    /**
     * èŽ·å–å…ƒç´ åž‚ç›´åç§»é‡
     * @param oEle
     */
    function getElementTop(oEle){
        var iActualTop = oEle.offsetTop;
        var oCurrent = oEle.offsetParent;
        while (oCurrent !== null){
            iActualTop += oCurrent.offsetTop;
            oCurrent = oCurrent.offsetParent;
        }
        return iActualTop;
    }


    /**
     * èŽ·å–å…ƒç´ å®žé™…å®½åº¦
     * @param oEle
     * @returns {*|number}
     */
    function getElementWidth(oEle) {
        return oEle.offsetWidth;
    };


    /**
     * èŽ·å–å…ƒç´ å®žé™…é«˜åº¦
     * @param oEle
     * @returns {*|number}
     */
    function getElementHeight (oEle) {
        return oEle.offsetHeight;
    };


    /**
     * èŽ·å–å±å¹•å®½é«˜
     */
    function getWinSize (){
        if (window.innerWidth){
            iWinWidth = window.innerWidth;
        }else if((document.body) && (document.body.clientWidth)){
            iWinWidth = document.body.clientWidth;
        }
        if (window.innerHeight) {
            iWinHeight = window.innerHeight;
        }else if ((document.body) && (document.body.clientHeight)) {
            iWinHeight = document.body.clientHeight;
        }
        if (document.documentElement && document.documentElement.clientHeight && document.documentElement.clientWidth){
            iWinHeight = document.documentElement.clientHeight;
            iWinWidth = document.documentElement.clientWidth;
        }
    }


    /**
     * èŽ·å–æ•°æ®
     * @returns {string}
     */
    function getQuery (iPosIndex) {
        var sQuery = '';
        var oAd = oConf.posList[iPosIndex].dom;
        sQuery += '&task='+ getDataAttribute(oAd, 'task') + '&type='+ getDataAttribute(oAd, 'type');
        return sQuery;
    };


    /**
     * æ›å…‰å¤„ç†é€»è¾‘
     */
    function exposedProcess (iPosIndex) {
        if(!oConf.posList[iPosIndex].beingExposed){
            oConf.posList[iPosIndex].beingExposed = true;
            if(oConf.posList[iPosIndex].exposedTimes<1){
                var oReportImage = new Image();
                oReportImage.src = oConf.reportImage + 't=' + ( + new Date()) + getQuery(iPosIndex);
                oConf.posList[iPosIndex].exposedTimes++;
            }
        }
    };


    /**
     * å¹¿å‘Šæ›å…‰ç»Ÿè®¡
     */
    function adExposedListen(){
        var iScrollTop = window.pageYOffset || document.documentElement.scrollTop || document.body.scrollTop || 0;
        var iRealOffsetTop = iWinHeight  + iScrollTop;
        for(var i=0; i<oConf.posList.length; i++){
            var oAd = oConf.posList[i].dom;
            if(oAd){
                var iEleOffsetTop = getElementTop(oAd);
                var iEleHeight = getElementHeight(oAd);
                if((iRealOffsetTop > iEleOffsetTop) && (iScrollTop < (iEleOffsetTop + iEleHeight))){
                    exposedProcess(i);
                }else{
                    oConf.posList[i].beingExposed = false;
                }
            }
        }
    };


    /**
     * èŠ‚æµæœºåˆ¶
     * @param fCallback
     * @param iDelay
     * @param iMustRunDelay
     * @returns {Function}
     */
    function throttle (fCallback, iDelay, iMustRunDelay) {
        var oTimer = null;
        var oTimeStart;
        return function () {
            var oContext = this;
            var aArgs = arguments;
            var oTimeCurrent = +new Date();
            clearTimeout(oTimer);
            if (!oTimeStart) {
                oTimeStart = oTimeCurrent;
            }
            if (oTimeCurrent - oTimeStart >= iMustRunDelay) {
                fCallback.apply(oContext, aArgs);
                oTimeStart = oTimeCurrent;
            } else {
                oTimer = setTimeout(function () {
                    fCallback.apply(oContext, aArgs);
                }, iDelay);
            }
        };
    };


    /**
     * äº‹ä»¶ç›‘å¬
     * 1.Chromeã€FireFoxã€Operaã€Safariã€IE9.0åŠå…¶ä»¥ä¸Šç‰ˆæœ¬addEventListener
     * 2.IE8.0åŠå…¶ä»¥ä¸‹ç‰ˆæœ¬attachEvent
     * 3.æ—©æœŸæµè§ˆå™¨on
     * @param oObj
     * @param sType
     * @param fHandle
     */
    function addEvent (oObj,sType,fHandle){
        try{
            oObj.addEventListener(sType,fHandle,false);
        }catch(e){
            try{
                oObj.attachEvent('on' + sType,fHandle);
            }catch(e){
                oObj['on' + sType] = fHandle;
            }
        }
    };


    /**
     * åˆ¤æ–­æ˜¯å¦æ˜¯æ•°ç»„
     * @param obj
     * @returns {boolean}
     */
    var isArray = function(obj) {
        return Object.prototype.toString.call(obj) === '[object Array]';
    }


    /**
     * æ›å…‰ä½ç½®æ˜¯å¦è¢«æ·»åŠ è¿‡
     * @param iExpId
     * @returns {boolean}
     */
    function bItemAdded(iExpId){
        for(var i = 0; i<oConf.posList.length;i++){
            if(oConf.posList[i].id == iExpId){
                return true;
            }
        }
        return false;
    };


    /**
     * èŽ·å–å¹¿å‘Šåœ°å€
     * @returns {boolean}
     */
    function getCpmPos() {
        var aElements = document.getElementsByClassName(sClassId);
        for(var i=0;i<aElements.length;i++) {
            var iTaskId = getDataAttribute(aElements[i], 'task');
            var sType = getDataAttribute(aElements[i], 'type');
            if(('' != iTaskId) && (!bItemAdded(iTaskId))){
                oConf.posList.push({
                    id: iTaskId,
                    type: sType,
                    beingExposed:false,
                    exposedTimes:0,
                    dom:aElements[i]
                })
            }
        }
        if(oConf.posList.length > 0){
            adExposedListen();
        }
    }


    /**
     * å®žçŽ°Document Ready
     * @param fCallback
     */
    function ready (fCallback){
        if ((document.readyState == "complete")||(document.readyState == "interactive")) {
            fCallback();
        }else{
            if(document.addEventListener){
                //æ ‡å‡†æµè§ˆå™¨
                document.addEventListener('DOMContentLoaded',function(){
                    //æ³¨é”€äº‹ä»¶ï¼Œé¿å…åå¤è§¦å‘
                    document.removeEventListener('DOMContentLoaded', arguments.callee, false);
                    fCallback();
                },false);
            }else if(document.attachEvent){
                //IEæµè§ˆå™¨
                document.attachEvent('onreadystatechange',function(){
                    if(document.readyState == 'complete'){
                        document.detachEvent('onreadystatechange',arguments.callee);
                        fCallback();
                    }
                });
            }else{
                window.onload = fCallback;
            }
        }

    };


    var iDetectTimes = 0;

    /**
     * é’ˆå¯¹è¯†åˆ«ä¸åˆ°bodyç­–ç•¥
     */
    function addBodyListener() {
        var oBody = document.getElementsByTagName("body");
        if(oBody.length < 1){
            if(20 > ++iDetectTimes){
                setTimeout(addBodyListener, 500);
            }
        }else{
            addEvent(oBody[0], 'DOMNodeInserted', getCpmPos);
        }
    }


    /**
     * å…¥å£
     */
    function init() {
        getWinSize();
        getCpmPos();
        addEvent(window, 'resize', getWinSize);
        addEvent(window, 'scroll', throttle(adExposedListen, 50, 100));
        addBodyListener();
    };


    ready(init);
})();;
