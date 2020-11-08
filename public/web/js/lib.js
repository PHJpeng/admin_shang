// 前端模板
! function(a) {
    "use strict";
    var b = function(a, c) {
        var d = /[^\w\-\.:]/.test(a) ? new Function(b.arg + ",tmpl", "var _e=tmpl.encode" + b.helper + ",_s='" + a.replace(b.regexp, b.func) + "';return _s;") : b.cache[a] = b.cache[a] || b(b.load(a));
        return c ? d(c, b) : function(a) {
            return d(a, b)
        }
    };
    b.cache = {}, b.load = function(a) {
        return document.getElementById(a).innerHTML
    }, b.regexp = /([\s'\\])(?!(?:[^{]|\{(?!%))*%\})|(?:\{%(=|#)([\s\S]+?)%\})|(\{%)|(%\})/g, b.func = function(a, b, c, d, e, f) {
        return b ? {
            "\n": "\\n",
            "\r": "\\r",
            "	": "\\t",
            " ": " "
        } [b] || "\\" + b : c ? "=" === c ? "'+_e(" + d + ")+'" : "'+(" + d + "==null?'':" + d + ")+'" : e ? "';" : f ? "_s+='" : void 0
    }, b.encReg = /[<>&"'\x00]/g, b.encMap = {
        "<": "&lt;",
        ">": "&gt;",
        "&": "&amp;",
        '"': "&quot;",
        "'": "&#39;"
    }, b.encode = function(a) {
        return (null == a ? "" : "" + a).replace(b.encReg, function(a) {
            return b.encMap[a] || ""
        })
    }, b.arg = "o", b.helper = ",print=function(s,e){_s+=e?(s==null?'':s):_e(s);},include=function(s,d){_s+=tmpl(s,d);}", "function" == typeof define && define.amd ? define(function() {
        return b
    }) : a.tmpl = b
}(this);
// 迷你发布订阅系统
(function($) {
    var o = $({});
    $.subscribe = function() {
        o.on.apply(o, arguments);
    };
    $.unsubscribe = function() {
        o.off.apply(o, arguments);
    };
    $.publish = function() {
        o.trigger.apply(o, arguments);
    };
}($));

$(function() {
    'use strict';
    var win = window;
    win.GLOBAL = win.GLOBAL || {};
    win.hr = win.hr || {};

    win.hr.version = '1.0.0';
    win.hr.page = win.hr.page || {};
    win.hr.component = win.hr.component || {};

    /**
     * @description 注册组件
     * @param {String} 组件名字
     * @param {Object} 组件 Javascript 逻辑，JSON 格式
     * @return {Object} 返回 window.hr.component 对象
     * @example
     * hr.regComponent('组件名', {
     *     init: function () { // 此 init 方法为必需，组件注册后会执行的方法
     *         this.someAction();
     *     },
     *     someAction: function () {
     *         // 组件 Javascript 逻辑，可以根据需要写多个 Function
     *     }
     * })
     * 组件注册后如果要再次调用，可以用 hr.component.组件名 获取组件对象
     */
    win.hr.regComponent = function(name, obj) {
        var obj = obj || {
            init: function() {}
        };
        var parts = name.split('.');
        var parent = win.hr.component;
        var i = 0;
        if (parts[0] === 'hr') {
            parts = parts.slice(1);
        }
        for (i = 0; i < parts.length; i++) {
            if (typeof parent[parts[i]] == 'undefined') {
                parent[parts[i]] = obj;
                // 组件注册后执行
                obj.init();
            }
            parent = parent[parts[i]];
        }
        return parent;
    };

    win.hr.util = {
        /**
         * @description 渲染模板
         * @param {JSON} opt 包含以下内容
         *     @param {String} tmpl 模板区域的 ID 名
         *     @param {Object} data 要渲染的 JSON 数据
         *     @param {Object} to 要追加进的 jQuery DOM 对象
         *     @param {Object} insertTo 要插入到其之前或之后的 jQuery DOM 对象
         *     @param {String} method 渲染的方式，包括 replace、append 和 prepend，当同时有 insertTo 时，是以 insertTo 为基准
         *     @param {Function} callbackFn 回调函数
         */
        renderTmpl: function(opt) {
            var strTargetTmpl = opt.tmpl || '';
            var jsonData = opt.data || {};
            var $target = opt.to;
            var method = opt.method || 'append';
            var $insertTo = opt.insertTo || null;
            if ($target) {
                var tmpled = tmpl(strTargetTmpl, jsonData);
                switch (method) {
                    case 'replace':
                        $target.html(tmpled);
                        break;
                    case 'append':
                        if ($insertTo) {
                            $(tmpled).insertAfter($insertTo);
                        } else {
                            $target.append(tmpled);
                        }
                        break;
                    case 'prepend':
                        if ($insertTo) {
                            $(tmpled).insertBefore($insertTo);
                        } else {
                            $target.prepend(tmpled);
                        }
                        break;
                    default:
                        break;
                }
            }
            $.isFunction(opt.callbackFn) && opt.callbackFn();
        },
        /**
         * @description 从 URL 中获取指定参数值
         * @param {String} str 要从 URL 中获取的参数值
         */
        getUrlParam: function(str) {
            var s = location.search;
            var tmp = [];
            var value = '';
            if (s) {
                tmp = s.substr(1).split('&');
            }
            for (var i = 0; i < tmp.length; i++) {
                if (tmp[i].substring(0, tmp[i].indexOf('=')) === str) {
                    value = tmp[i].substr(tmp[i].indexOf('=') + 1);
                    break;
                }
            }
            return value;
        },
        /**
         * @description 使用 rem 单位时自动计算 html 初始字体尺寸
         */
        resizePage: function(baseWidth) {
            !(function(doc, win) {
                var baseWidth = baseWidth || 375;
                var docEl = doc.documentElement,
                    resizeEvt = 'orientationchange' in window ? 'orientationchange' : 'resize',
                    recalc = function() {
                        var clientWidth = docEl.clientWidth;
                        if (!clientWidth) return;
                        if (clientWidth > baseWidth) {
                            clientWidth = baseWidth;
                        }
                        docEl.style.fontSize = 100 * (clientWidth / baseWidth) + 'px';
                    };
                if (!doc.addEventListener) return;
                win.addEventListener(resizeEvt, recalc, false);
                recalc();
            })(document, window);
        },
        inputInit: function() {
            var bfscrolltop = document.body.scrollTop;
            $("input").focus(function () {
                document.body.scrollTop = document.body.scrollHeight;
                //console.log(document.body.scrollTop);
            }).blur(function () {
                document.body.scrollTop = bfscrolltop;
                //console.log(document.body.scrollTop);
            });
        }
    };

    win.hr.init = function() {

        // TODO 这里放页面初始化时需要执行的代码
        win.hr.util.inputInit();

    };

    win.hr.init();
});