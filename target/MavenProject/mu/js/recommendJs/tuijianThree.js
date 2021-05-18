(function() {

    var engine={    //å‘ˆçŽ°å¼•æ“Ž
        trident:0,
        gecko:0,
        webkit:0,
        khtml:0,
        presto:0,
        ver:null     //å…·ä½“çš„ç‰ˆæœ¬å·
    };
    var browser={   //æµè§ˆå™¨
        ie:0,
        firefox:0,
        safari:0,
        konq:0,
        opera:0,
        chrome:0,
        ver:null     //å…·ä½“çš„ç‰ˆæœ¬å·
    };
    var system={    //æ“ä½œç³»ç»Ÿ
        win:false,
        mac:false,
        x11:false
    };

    var ua=navigator.userAgent;
    if(/AppleWebKit\/(\S+)/.test(ua)){        //åŒ¹é…Webkitå†…æ ¸æµè§ˆå™¨ï¼ˆChromeã€Safariã€æ–°Operaï¼‰
        engine.ver=RegExp["$1"];
        engine.webkit=parseFloat(engine.ver);
        if(/OPR\/(\S+)/.test(ua)){             //ç¡®å®šæ˜¯ä¸æ˜¯å¼•ç”¨äº†Webkitå†…æ ¸çš„Opera
            browser.ver=RegExp["$1"];
            browser.opera=parseFloat(browser.ver);
        }else if(/Chrome\/(\S+)/.test(ua)){    //ç¡®å®šæ˜¯ä¸æ˜¯Chrome
            browser.ver=RegExp["$1"];
            browser.chrome=parseFloat(browser.ver);
        }else if(/Version\/(\S+)/.test(ua)){   //ç¡®å®šæ˜¯ä¸æ˜¯é«˜ç‰ˆæœ¬ï¼ˆ3+ï¼‰çš„Safari
            browser.ver=RegExp["$1"];
            browser.safari=parseFloat(browser.ver);
        }else{                                 //è¿‘ä¼¼åœ°ç¡®å®šä½Žç‰ˆæœ¬Safafiç‰ˆæœ¬å·
            var SafariVersion=1;
            if(engine.webkit<100){
                SafariVersion=1;
            }else if(engine.webkit<312){
                SafariVersion=1.2;
            }else if(engine.webkit<412){
                SafariVersion=1.3;
            }else{
                SafariVersion=2;
            }
            browser.safari=browser.ver=SafariVersion;
        }
    }else if(window.opera){                 //åªåŒ¹é…æ‹¥æœ‰Prestoå†…æ ¸çš„è€ç‰ˆæœ¬Opera 5+(12.15-)
        engine.ver=browser.ver=window.opera.version();
        engine.presto=browser.opera=parseFloat(engine.ver);
    }else if(/Opera[\/\s](\S+)/.test(ua)){  //åŒ¹é…ä¸æ”¯æŒwindow.operaçš„Opera 5-æˆ–ä¼ªè£…çš„Opera
        engine.ver=browser.ver=RegExp["$1"];
        engine.presto=browser.opera=parseFloat(engine.ver);
    }else if(/KHTML\/(\S+)/.test(ua)||/Konqueror\/([^;]+)/.test(ua)){
        engine.ver=browser.ver=RegExp["$1"];
        engine.khtml=browser.konq=parseFloat(engine.ver);
    }else if(/rv:([^\)]+)\) Gecko\/\d{8}/.test(ua)){ //åˆ¤æ–­æ˜¯ä¸æ˜¯åŸºäºŽGeckoå†…æ ¸
        engine.ver=RegExp["$1"];
        engine.gecko=parseFloat(engine.ver);
        if(/Firefox\/(\S+)/.test(ua)){                //ç¡®å®šæ˜¯ä¸æ˜¯Firefox
            browser.ver=RegExp["$1"];
            browser.firefox=parseFloat(browser.ver);
        }
    }else if(/Trident\/([\d\.]+)/.test(ua)){         //ç¡®å®šæ˜¯å¦æ˜¯Tridentå†…æ ¸çš„æµè§ˆå™¨ï¼ˆIE8+ï¼‰
        engine.ver=RegExp["$1"];
        engine.trident=parseFloat(engine.ver);
        if(/rv\:([\d\.]+)/.test(ua)||/MSIE ([^;]+)/.test(ua)){   //åŒ¹é…IE8-11+
            browser.ver=RegExp["$1"];
            browser.ie=parseFloat(browser.ver);
        }
    }else if(/MSIE ([^;]+)/.test(ua)){               //åŒ¹é…IE6ã€IE7
        browser.ver=RegExp["$1"];
        browser.ie=parseFloat(browser.ver);
        engine.ver=browser.ie-4.0;                    //æ¨¡æ‹ŸIE6ã€IE7ä¸­çš„Tridentå€¼
        engine.trident=parseFloat(engine.ver);
    }

    var p=navigator.platform;                        //åˆ¤æ–­æ“ä½œç³»ç»Ÿ
    system.win=p.indexOf("Win")==0;
    system.mac=p.indexOf("Mac")==0;
    system.x11=(p.indexOf("X11")==0)||(p.indexOf("Linux")==0);
    if(system.win){
        if(/Win(?:dows )?([^do]{2})\s?(\d+\.\d+)?/.test(ua)){
            if(RegExp["$1"]=="NT"){
                system.win = ({
                    "5.0" : "2000",
                    "5.1" : "XP",
                    "6.0" : "Vista",
                    "6.1" : "7",
                    "6.2" : "8",
                    "6.3" : "8.1",
                    "10" : "10"
                })[RegExp["$2"]] || "NT";
            }else if(RegExp["$1"]=="9x"){
                system.win="ME";
            }else{
                system.win=RegExp["$1"];
            }
        }
    }

    var clientInfo = {'browser': 'unknown', 'browser_ver': ua, 'engine': 'unknown', 'engine_ver': 'unknown', 'system': 'unknown', 'system_ver': 'unknown'};

    for(var i in engine) {
        if(engine.hasOwnProperty(i)) {
            if(i == 'ver') {
                if(engine[i]) {
                    clientInfo.engine_ver = engine[i];
                }
            } else if(engine[i] !== 0) {
                clientInfo.engine = i;
            }
        }
    }

    for(var i in browser) {
        if(browser.hasOwnProperty(i)) {
            if(i == 'ver') {
                if(browser[i]) {
                    clientInfo.browser_ver = browser[i];
                }
            } else if(browser[i] !== 0) {
                clientInfo.browser = i;
            }
        }
    }

    for(var i in system) {
        if(system.hasOwnProperty(i)) {
            if(system[i]){
                clientInfo.system = i;
                clientInfo.system_ver = system[i];
            }
        }
    }

    if(window.mfwPageEvent) {
        window.mfwPageEvent('test', 'browser_stat', clientInfo);
        if(/\/i\/\d+\.html/.test(window.location.href)) {
            window.mfwPageEvent('test', 'note_browser_test', clientInfo);
        }
    }
}());
