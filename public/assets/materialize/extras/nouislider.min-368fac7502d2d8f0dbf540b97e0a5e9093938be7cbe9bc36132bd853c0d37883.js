!function(){function t(t){return t.split("").reverse().join("")}function e(t,e,n){if((t[e]||t[n])&&t[e]===t[n])throw Error(e)}function n(e,n,r,i,o,s,a,u,l,c,p,f){a=f;var d,h=p="";return s&&(f=s(f)),!("number"!=typeof f||!isFinite(f))&&(e&&0===parseFloat(f.toFixed(e))&&(f=0),0>f&&(d=!0,f=Math.abs(f)),e&&(s=Math.pow(10,e),f=(Math.round(f*s)/s).toFixed(e)),f=f.toString(),-1!==f.indexOf(".")&&(e=f.split("."),f=e[0],r&&(p=r+e[1])),n&&(f=t(f).match(/.{1,3}/g),f=t(f.join(t(n)))),d&&u&&(h+=u),i&&(h+=i),d&&l&&(h+=l),h=h+f+p,o&&(h+=o),c&&(h=c(h,a)),h)}function r(t,e,n,r,i,o,s,a,u,l,c,p){var f;return t="",c&&(p=c(p)),!(!p||"string"!=typeof p)&&(a&&p.substring(0,a.length)===a&&(p=p.replace(a,""),f=!0),r&&p.substring(0,r.length)===r&&(p=p.replace(r,"")),u&&p.substring(0,u.length)===u&&(p=p.replace(u,""),f=!0),i&&p.slice(-1*i.length)===i&&(p=p.slice(0,-1*i.length)),e&&(p=p.split(e).join("")),n&&(p=p.replace(n,".")),f&&(t+="-"),t=Number((t+p).replace(/[^0-9\.\-.]/g,"")),s&&(t=s(t)),!("number"!=typeof t||!isFinite(t))&&t)}function i(t){var n,r,i,o={};for(n=0;n<a.length;n+=1)r=a[n],i=t[r],void 0===i?o[r]="negative"!==r||o.negativeBefore?"mark"===r&&"."!==o.thousand&&".":"-":"decimals"===r?0<i&&8>i&&(o[r]=i):"encoder"===r||"decoder"===r||"edit"===r||"undo"===r?"function"==typeof i&&(o[r]=i):"string"==typeof i&&(o[r]=i);return e(o,"mark","thousand"),e(o,"prefix","negative"),e(o,"prefix","negativeBefore"),o}function o(t,e,n){var r,i=[];for(r=0;r<a.length;r+=1)i.push(t[a[r]]);return i.push(n),e.apply("",i)}function s(t){return this instanceof s?void("object"==typeof t&&(t=i(t),this.to=function(e){return o(t,n,e)},this.from=function(e){return o(t,r,e)})):new s(t)}var a="decimals thousand mark prefix postfix encoder decoder negativeBefore negative edit undo".split(" ");window.wNumb=s}(),function(t){"function"==typeof define&&define.amd?define([],t):"object"==typeof exports?module.exports=t():window.noUiSlider=t()}(function(){"use strict";function t(t,e){var n=document.createElement("div");return l(n,e),t.appendChild(n),n}function e(t){return t.filter(function(t){return!this[t]&&(this[t]=!0)},{})}function n(t,e){return Math.round(t/e)*e}function r(t,e){var n=t.getBoundingClientRect(),r=t.ownerDocument,i=r.documentElement,o=f();return/webkit.*Chrome.*Mobile/i.test(navigator.userAgent)&&(o.x=0),e?n.top+o.y-i.clientTop:n.left+o.x-i.clientLeft}function i(t){return"number"==typeof t&&!isNaN(t)&&isFinite(t)}function o(t,e,n){n>0&&(l(t,e),setTimeout(function(){c(t,e)},n))}function s(t){return Math.max(Math.min(t,100),0)}function a(t){return Array.isArray(t)?t:[t]}function u(t){t=String(t);var e=t.split(".");return e.length>1?e[1].length:0}function l(t,e){t.classList?t.classList.add(e):t.className+=" "+e}function c(t,e){t.classList?t.classList.remove(e):t.className=t.className.replace(new RegExp("(^|\\b)"+e.split(" ").join("|")+"(\\b|$)","gi")," ")}function p(t,e){return t.classList?t.classList.contains(e):new RegExp("\\b"+e+"\\b").test(t.className)}function f(){var t=void 0!==window.pageXOffset,e="CSS1Compat"===(document.compatMode||"");return{x:t?window.pageXOffset:e?document.documentElement.scrollLeft:document.body.scrollLeft,y:t?window.pageYOffset:e?document.documentElement.scrollTop:document.body.scrollTop}}function d(){return window.navigator.pointerEnabled?{start:"pointerdown",move:"pointermove",end:"pointerup"}:window.navigator.msPointerEnabled?{start:"MSPointerDown",move:"MSPointerMove",end:"MSPointerUp"}:{start:"mousedown touchstart",move:"mousemove touchmove",end:"mouseup touchend"}}function h(t,e){return 100/(e-t)}function m(t,e){return 100*e/(t[1]-t[0])}function g(t,e){return m(t,t[0]<0?e+Math.abs(t[0]):e-t[0])}function v(t,e){return e*(t[1]-t[0])/100+t[0]}function b(t,e){for(var n=1;t>=e[n];)n+=1;return n}function w(t,e,n){if(n>=t.slice(-1)[0])return 100;var r,i,o,s,a=b(n,t);return r=t[a-1],i=t[a],o=e[a-1],s=e[a],o+g([r,i],n)/h(o,s)}function S(t,e,n){if(n>=100)return t.slice(-1)[0];var r,i,o,s,a=b(n,e);return r=t[a-1],i=t[a],o=e[a-1],s=e[a],v([r,i],(n-o)*h(o,s))}function x(t,e,r,i){if(100===i)return i;var o,s,a=b(i,t);return r?(o=t[a-1],s=t[a],i-o>(s-o)/2?s:o):e[a-1]?t[a-1]+n(i-t[a-1],e[a-1]):i}function y(t,e,n){var r;if("number"==typeof e&&(e=[e]),"[object Array]"!==Object.prototype.toString.call(e))throw new Error("noUiSlider: 'range' contains invalid value.");if(r="min"===t?0:"max"===t?100:parseFloat(t),!i(r)||!i(e[0]))throw new Error("noUiSlider: 'range' value isn't numeric.");n.xPct.push(r),n.xVal.push(e[0]),r?n.xSteps.push(!isNaN(e[1])&&e[1]):isNaN(e[1])||(n.xSteps[0]=e[1]),n.xHighestCompleteStep.push(0)}function E(t,e,n){if(!e)return!0;n.xSteps[t]=m([n.xVal[t],n.xVal[t+1]],e)/h(n.xPct[t],n.xPct[t+1]);var r=(n.xVal[t+1]-n.xVal[t])/n.xNumSteps[t],i=Math.ceil(Number(r.toFixed(3))-1),o=n.xVal[t]+n.xNumSteps[t]*i;n.xHighestCompleteStep[t]=o}function C(t,e,n,r){this.xPct=[],this.xVal=[],this.xSteps=[r||!1],this.xNumSteps=[!1],this.xHighestCompleteStep=[],this.snap=e,this.direction=n;var i,o=[];for(i in t)t.hasOwnProperty(i)&&o.push([t[i],i]);for(o.length&&"object"==typeof o[0][0]?o.sort(function(t,e){return t[0][0]-e[0][0]}):o.sort(function(t,e){return t[0]-e[0]}),i=0;i<o.length;i++)y(o[i][1],o[i][0],this);for(this.xNumSteps=this.xSteps.slice(0),i=0;i<this.xNumSteps.length;i++)E(i,this.xNumSteps[i],this)}function N(t,e){if(!i(e))throw new Error("noUiSlider: 'step' is not numeric.");t.singleStep=e}function U(t,e){if("object"!=typeof e||Array.isArray(e))throw new Error("noUiSlider: 'range' is not an object.");if(void 0===e.min||void 0===e.max)throw new Error("noUiSlider: Missing 'min' or 'max' in 'range'.");if(e.min===e.max)throw new Error("noUiSlider: 'range' 'min' and 'max' cannot be equal.");t.spectrum=new C(e,t.snap,t.dir,t.singleStep)}function M(t,e){if(e=a(e),!Array.isArray(e)||!e.length)throw new Error("noUiSlider: 'start' option is incorrect.");t.handles=e.length,t.start=e}function P(t,e){if(t.snap=e,"boolean"!=typeof e)throw new Error("noUiSlider: 'snap' option must be a boolean.")}function k(t,e){if(t.animate=e,"boolean"!=typeof e)throw new Error("noUiSlider: 'animate' option must be a boolean.")}function O(t,e){if(t.animationDuration=e,"number"!=typeof e)throw new Error("noUiSlider: 'animationDuration' option must be a number.")}function V(t,e){var n,r=[!1];if("lower"===e?e=[!0,!1]:"upper"===e&&(e=[!1,!0]),!0===e||!1===e){for(n=1;n<t.handles;n++)r.push(e);r.push(!1)}else{if(!Array.isArray(e)||!e.length||e.length!==t.handles+1)throw new Error("noUiSlider: 'connect' option doesn't match handle count.");r=e}t.connect=r}function L(t,e){switch(e){case"horizontal":t.ort=0;break;case"vertical":t.ort=1;break;default:throw new Error("noUiSlider: 'orientation' option is invalid.")}}function A(t,e){if(!i(e))throw new Error("noUiSlider: 'margin' option must be numeric.");if(0!==e&&(t.margin=t.spectrum.getMargin(e),!t.margin))throw new Error("noUiSlider: 'margin' option is only supported on linear sliders.")}function F(t,e){if(!i(e))throw new Error("noUiSlider: 'limit' option must be numeric.");if(t.limit=t.spectrum.getMargin(e),!t.limit||t.handles<2)throw new Error("noUiSlider: 'limit' option is only supported on linear sliders with 2 or more handles.")}function j(t,e){if(!i(e))throw new Error("noUiSlider: 'padding' option must be numeric.");if(0!==e){if(t.padding=t.spectrum.getMargin(e),!t.padding)throw new Error("noUiSlider: 'padding' option is only supported on linear sliders.");if(t.padding<0)throw new Error("noUiSlider: 'padding' option must be a positive number.");if(t.padding>=50)throw new Error("noUiSlider: 'padding' option must be less than half the range.")}}function z(t,e){switch(e){case"ltr":t.dir=0;break;case"rtl":t.dir=1;break;default:throw new Error("noUiSlider: 'direction' option was not recognized.")}}function H(t,e){if("string"!=typeof e)throw new Error("noUiSlider: 'behaviour' must be a string containing options.");var n=e.indexOf("tap")>=0,r=e.indexOf("drag")>=0,i=e.indexOf("fixed")>=0,o=e.indexOf("snap")>=0,s=e.indexOf("hover")>=0;if(i){if(2!==t.handles)throw new Error("noUiSlider: 'fixed' behaviour must be used with 2 handles");A(t,t.start[1]-t.start[0])}t.events={tap:n||o,drag:r,fixed:i,snap:o,hover:s}}function D(t,e){if(!1!==e)if(!0===e){t.tooltips=[];for(var n=0;n<t.handles;n++)t.tooltips.push(!0)}else{if(t.tooltips=a(e),t.tooltips.length!==t.handles)throw new Error("noUiSlider: must pass a formatter for all handles.");t.tooltips.forEach(function(t){if("boolean"!=typeof t&&("object"!=typeof t||"function"!=typeof t.to))throw new Error("noUiSlider: 'tooltips' must be passed a formatter or 'false'.")})}}function q(t,e){if(t.format=e,"function"==typeof e.to&&"function"==typeof e.from)return!0;throw new Error("noUiSlider: 'format' requires 'to' and 'from' methods.")}function T(t,e){if(void 0!==e&&"string"!=typeof e&&!1!==e)throw new Error("noUiSlider: 'cssPrefix' must be a string or `false`.");t.cssPrefix=e}function R(t,e){if(void 0!==e&&"object"!=typeof e)throw new Error("noUiSlider: 'cssClasses' must be an object.");if("string"==typeof t.cssPrefix){t.cssClasses={};for(var n in e)e.hasOwnProperty(n)&&(t.cssClasses[n]=t.cssPrefix+e[n])}else t.cssClasses=e}function B(t,e){if(!0!==e&&!1!==e)throw new Error("noUiSlider: 'useRequestAnimationFrame' option should be true (default) or false.");t.useRequestAnimationFrame=e}function X(t){var e={margin:0,limit:0,padding:0,animate:!0,animationDuration:300,format:_},n={step:{r:!1,t:N},start:{r:!0,t:M},connect:{r:!0,t:V},direction:{r:!0,t:z},snap:{r:!1,t:P},animate:{r:!1,t:k},animationDuration:{r:!1,t:O},range:{r:!0,t:U},orientation:{r:!1,t:L},margin:{r:!1,t:A},limit:{r:!1,t:F},padding:{r:!1,t:j},behaviour:{r:!0,t:H},format:{r:!1,t:q},tooltips:{r:!1,t:D},cssPrefix:{r:!1,t:T},cssClasses:{r:!1,t:R},useRequestAnimationFrame:{r:!1,t:B}},r={connect:!1,direction:"ltr",behaviour:"tap",orientation:"horizontal",cssPrefix:"noUi-",cssClasses:{target:"target",base:"base",origin:"origin",handle:"handle",handleLower:"handle-lower",handleUpper:"handle-upper",horizontal:"horizontal",vertical:"vertical",background:"background",connect:"connect",ltr:"ltr",rtl:"rtl",draggable:"draggable",drag:"state-drag",tap:"state-tap",active:"active",tooltip:"tooltip",pips:"pips",pipsHorizontal:"pips-horizontal",pipsVertical:"pips-vertical",marker:"marker",markerHorizontal:"marker-horizontal",markerVertical:"marker-vertical",markerNormal:"marker-normal",markerLarge:"marker-large",markerSub:"marker-sub",value:"value",valueHorizontal:"value-horizontal",valueVertical:"value-vertical",valueNormal:"value-normal",valueLarge:"value-large",valueSub:"value-sub"},useRequestAnimationFrame:!0};Object.keys(n).forEach(function(i){if(void 0===t[i]&&void 0===r[i]){if(n[i].r)throw new Error("noUiSlider: '"+i+"' is required.");return!0}n[i].t(e,void 0===t[i]?r[i]:t[i])}),e.pips=t.pips;var i=[["left","top"],["right","bottom"]];return e.style=i[e.dir][e.ort],e.styleOposite=i[e.dir?0:1][e.ort],e}function Y(n,i,u){function h(e,n){var r=t(e,i.cssClasses.origin),o=t(r,i.cssClasses.handle);return o.setAttribute("data-handle",n),0===n?l(o,i.cssClasses.handleLower):n===i.handles-1&&l(o,i.cssClasses.handleUpper),r}function m(e,n){return!!n&&t(e,i.cssClasses.connect)}function g(t,e){et=[],nt=[],nt.push(m(e,t[0]));for(var n=0;n<i.handles;n++)et.push(h(e,n)),at[n]=n,nt.push(m(e,t[n+1]))}function v(e){l(e,i.cssClasses.target),0===i.dir?l(e,i.cssClasses.ltr):l(e,i.cssClasses.rtl),0===i.ort?l(e,i.cssClasses.horizontal):l(e,i.cssClasses.vertical),tt=t(e,i.cssClasses.base)}function b(e,n){return!!i.tooltips[n]&&t(e.firstChild,i.cssClasses.tooltip)}function w(){var t=et.map(b);K("update",function(e,n,r){if(t[n]){var o=e[n];!0!==i.tooltips[n]&&(o=i.tooltips[n].to(r[n])),t[n].innerHTML="<span>"+o+"</span>"}})}function S(t,e,n){if("range"===t||"steps"===t)return lt.xVal;if("count"===t){var r,i=100/(e-1),o=0;for(e=[];(r=o++*i)<=100;)e.push(r);t="positions"}return"positions"===t?e.map(function(t){return lt.fromStepping(n?lt.getStep(t):t)}):"values"===t?n?e.map(function(t){return lt.fromStepping(lt.getStep(lt.toStepping(t)))}):e:void 0}function x(t,n,r){function i(t,e){return(t+e).toFixed(7)/1}var o={},s=lt.xVal[0],a=lt.xVal[lt.xVal.length-1],u=!1,l=!1,c=0;return r=e(r.slice().sort(function(t,e){return t-e})),r[0]!==s&&(r.unshift(s),u=!0),r[r.length-1]!==a&&(r.push(a),l=!0),r.forEach(function(e,s){var a,p,f,d,h,m,g,v,b,w,S=e,x=r[s+1];if("steps"===n&&(a=lt.xNumSteps[s]),a||(a=x-S),!1!==S&&void 0!==x)for(a=Math.max(a,1e-7),p=S;p<=x;p=i(p,a)){for(d=lt.toStepping(p),h=d-c,v=h/t,b=Math.round(v),w=h/b,f=1;f<=b;f+=1)m=c+f*w,o[m.toFixed(5)]=["x",0];g=r.indexOf(p)>-1?1:"steps"===n?2:0,!s&&u&&(g=0),p===x&&l||(o[d.toFixed(5)]=[p,g]),c=d}}),o}function y(t,e,n){function r(t,e){var n=e===i.cssClasses.value,r=n?f:d,o=n?c:p;return e+" "+r[i.ort]+" "+o[t]}function o(t,e,n){return'class="'+r(n[1],e)+'" style="'+i.style+": "+t+'%"'}function s(t,r){r[1]=r[1]&&e?e(r[0],r[1]):r[1],u+="<div "+o(t,i.cssClasses.marker,r)+"></div>",r[1]&&(u+="<div "+o(t,i.cssClasses.value,r)+">"+n.to(r[0])+"</div>")}var a=document.createElement("div"),u="",c=[i.cssClasses.valueNormal,i.cssClasses.valueLarge,i.cssClasses.valueSub],p=[i.cssClasses.markerNormal,i.cssClasses.markerLarge,i.cssClasses.markerSub],f=[i.cssClasses.valueHorizontal,i.cssClasses.valueVertical],d=[i.cssClasses.markerHorizontal,i.cssClasses.markerVertical];return l(a,i.cssClasses.pips),l(a,0===i.ort?i.cssClasses.pipsHorizontal:i.cssClasses.pipsVertical),Object.keys(t).forEach(function(e){s(e,t[e])}),a.innerHTML=u,a}function E(t){var e=t.mode,n=t.density||1,r=t.filter||!1,i=t.values||!1,o=t.stepped||!1,s=S(e,i,o),a=x(n,e,s),u=t.format||{to:Math.round};return ot.appendChild(y(a,r,u))}function C(){var t=tt.getBoundingClientRect(),e="offset"+["Width","Height"][i.ort];return 0===i.ort?t.width||tt[e]:t.height||tt[e]}function N(t,e,n,r){var o=function(e){return!ot.hasAttribute("disabled")&&!p(ot,i.cssClasses.tap)&&!!(e=U(e,r.pageOffset))&&!(t===it.start&&void 0!==e.buttons&&e.buttons>1)&&(!r.hover||!e.buttons)&&(e.calcPoint=e.points[i.ort],void n(e,r))},s=[];return t.split(" ").forEach(function(t){e.addEventListener(t,o,!1),s.push([t,o])}),s}function U(t,e){t.preventDefault();var n,r,i=0===t.type.indexOf("touch"),o=0===t.type.indexOf("mouse"),s=0===t.type.indexOf("pointer");if(0===t.type.indexOf("MSPointer")&&(s=!0),i){if(t.touches.length>1)return!1;n=t.changedTouches[0].pageX,r=t.changedTouches[0].pageY}return e=e||f(),(o||s)&&(n=t.clientX+e.x,r=t.clientY+e.y),t.pageOffset=e,t.points=[n,r],t.cursor=o||s,t}function M(t){var e=t-r(tt,i.ort),n=100*e/C();return i.dir?100-n:n}function P(t){var e=100,n=!1;return et.forEach(function(r,i){if(!r.hasAttribute("disabled")){var o=Math.abs(st[i]-t);o<e&&(n=i,e=o)}}),n}function k(t,e,n,r){var i=n.slice(),o=[!t,t],s=[t,!t];r=r.slice(),t&&r.reverse(),r.length>1?r.forEach(function(t,n){var r=D(i,t,i[t]+e,o[n],s[n]);!1===r?e=0:(e=r-i[t],i[t]=r)}):o=s=[!0];var a=!1;r.forEach(function(t,r){a=B(t,n[t]+e,o[r],s[r])||a}),a&&r.forEach(function(t){O("update",t),O("slide",t)})}function O(t,e,n){Object.keys(pt).forEach(function(r){var o=r.split(".")[0];t===o&&pt[r].forEach(function(t){t.call(rt,ct.map(i.format.to),e,ct.slice(),n||!1,st.slice())})})}function V(t,e){"mouseout"===t.type&&"HTML"===t.target.nodeName&&null===t.relatedTarget&&A(t,e)}function L(t,e){if(-1===navigator.appVersion.indexOf("MSIE 9")&&0===t.buttons&&0!==e.buttonsProperty)return A(t,e);var n=(i.dir?-1:1)*(t.calcPoint-e.startCalcPoint);k(n>0,100*n/e.baseSize,e.locations,e.handleNumbers)}function A(t,e){ut&&(c(ut,i.cssClasses.active),ut=!1),t.cursor&&(document.body.style.cursor="",document.body.removeEventListener("selectstart",document.body.noUiListener)),document.documentElement.noUiListeners.forEach(function(t){document.documentElement.removeEventListener(t[0],t[1])}),c(ot,i.cssClasses.drag),R(),e.handleNumbers.forEach(function(t){O("set",t),O("change",t),O("end",t)})}function F(t,e){if(1===e.handleNumbers.length){var n=et[e.handleNumbers[0]];if(n.hasAttribute("disabled"))return!1;ut=n.children[0],l(ut,i.cssClasses.active)}t.preventDefault(),t.stopPropagation();var r=N(it.move,document.documentElement,L,{startCalcPoint:t.calcPoint,baseSize:C(),pageOffset:t.pageOffset,handleNumbers:e.handleNumbers,buttonsProperty:t.buttons,locations:st.slice()}),o=N(it.end,document.documentElement,A,{handleNumbers:e.handleNumbers}),s=N("mouseout",document.documentElement,V,{handleNumbers:e.handleNumbers});if(document.documentElement.noUiListeners=r.concat(o,s),t.cursor){document.body.style.cursor=getComputedStyle(t.target).cursor,et.length>1&&l(ot,i.cssClasses.drag);var a=function(){return!1};document.body.noUiListener=a,document.body.addEventListener("selectstart",a,!1)}e.handleNumbers.forEach(function(t){O("start",t)})}function j(t){t.stopPropagation();var e=M(t.calcPoint),n=P(e);return!1!==n&&(i.events.snap||o(ot,i.cssClasses.tap,i.animationDuration),B(n,e,!0,!0),R(),O("slide",n,!0),O("set",n,!0),O("change",n,!0),O("update",n,!0),void(i.events.snap&&F(t,{handleNumbers:[n]})))}function z(t){var e=M(t.calcPoint),n=lt.getStep(e),r=lt.fromStepping(n);Object.keys(pt).forEach(function(t){"hover"===t.split(".")[0]&&pt[t].forEach(function(t){t.call(rt,r)})})}function H(t){t.fixed||et.forEach(function(t,e){N(it.start,t.children[0],F,{handleNumbers:[e]})}),t.tap&&N(it.start,tt,j,{}),t.hover&&N(it.move,tt,z,{hover:!0}),t.drag&&nt.forEach(function(e,n){if(!1!==e&&0!==n&&n!==nt.length-1){var r=et[n-1],o=et[n],s=[e];l(e,i.cssClasses.draggable),t.fixed&&(s.push(r.children[0]),s.push(o.children[0])),s.forEach(function(t){N(it.start,t,F,{handles:[r,o],handleNumbers:[n-1,n]})})}})}function D(t,e,n,r,o){return et.length>1&&(r&&e>0&&(n=Math.max(n,t[e-1]+i.margin)),o&&e<et.length-1&&(n=Math.min(n,t[e+1]-i.margin))),et.length>1&&i.limit&&(r&&e>0&&(n=Math.min(n,t[e-1]+i.limit)),o&&e<et.length-1&&(n=Math.max(n,t[e+1]-i.limit))),i.padding&&(0===e&&(n=Math.max(n,i.padding)),e===et.length-1&&(n=Math.min(n,100-i.padding))),n=lt.getStep(n),(n=s(n))!==t[e]&&n}function q(t){return t+"%"}function T(t,e){st[t]=e,ct[t]=lt.fromStepping(e);var n=function(){et[t].style[i.style]=q(e),Y(t),Y(t+1)};window.requestAnimationFrame&&i.useRequestAnimationFrame?window.requestAnimationFrame(n):n()}function R(){at.forEach(function(t){var e=st[t]>50?-1:1,n=3+(et.length+e*t);et[t].childNodes[0].style.zIndex=n})}function B(t,e,n,r){return!1!==(e=D(st,t,e,n,r))&&(T(t,e),!0)}function Y(t){if(nt[t]){var e=0,n=100;0!==t&&(e=st[t-1]),t!==nt.length-1&&(n=st[t]),nt[t].style[i.style]=q(e),nt[t].style[i.styleOposite]=q(100-n)}}function I(t,e){null!==t&&!1!==t&&("number"==typeof t&&(t=String(t)),!1===(t=i.format.from(t))||isNaN(t)||B(e,lt.toStepping(t),!1,!1))}function _(t,e){var n=a(t),r=void 0===st[0];e=void 0===e||!!e,n.forEach(I),i.animate&&!r&&o(ot,i.cssClasses.tap,i.animationDuration),at.forEach(function(t){B(t,st[t],!0,!1)}),R(),at.forEach(function(t){O("update",t),null!==n[t]&&e&&O("set",t)})}function W(t){_(i.start,t)}function $(){var t=ct.map(i.format.to);return 1===t.length?t[0]:t}function G(){for(var t in i.cssClasses)i.cssClasses.hasOwnProperty(t)&&c(ot,i.cssClasses[t]);for(;ot.firstChild;)ot.removeChild(ot.firstChild);delete ot.noUiSlider}function J(){return st.map(function(t,e){var n=lt.getNearbySteps(t),r=ct[e],i=n.thisStep.step,o=null;!1!==i&&r+i>n.stepAfter.startValue&&(i=n.stepAfter.startValue-r),o=r>n.thisStep.startValue?n.thisStep.step:!1!==n.stepBefore.step&&r-n.stepBefore.highestStep,100===t?i=null:0===t&&(o=null);var s=lt.countStepDecimals();return null!==i&&!1!==i&&(i=Number(i.toFixed(s))),null!==o&&!1!==o&&(o=Number(o.toFixed(s))),[o,i]})}function K(t,e){pt[t]=pt[t]||[],pt[t].push(e),"update"===t.split(".")[0]&&et.forEach(function(t,e){O("update",e)})}function Q(t){var e=t&&t.split(".")[0],n=e&&t.substring(e.length);Object.keys(pt).forEach(function(t){var r=t.split(".")[0],i=t.substring(r.length);e&&e!==r||n&&n!==i||delete pt[t]})}function Z(t,e){var n=$(),r=["margin","limit","padding","range","animate","snap","step","format"];r.forEach(function(e){void 0!==t[e]&&(u[e]=t[e])});var o=X(u);r.forEach(function(e){void 0!==t[e]&&(i[e]=o[e])}),o.spectrum.direction=lt.direction,lt=o.spectrum,i.margin=o.margin,i.limit=o.limit,i.padding=o.padding,st=[],_(t.start||n,e)}var tt,et,nt,rt,it=d(),ot=n,st=[],at=[],ut=!1,lt=i.spectrum,ct=[],pt={};if(ot.noUiSlider)throw new Error("Slider was already initialized.");return v(ot),g(i.connect,tt),rt={destroy:G,steps:J,on:K,off:Q,get:$,set:_,reset:W,__moveHandles:function(t,e,n){k(t,e,st,n)},options:u,updateOptions:Z,target:ot,pips:E},H(i.events),_(i.start),i.pips&&E(i.pips),i.tooltips&&w(),rt}function I(t,e){if(!t.nodeName)throw new Error("noUiSlider.create requires a single element.");void 0===e.tooltips&&(e.tooltips=!0);var n=X(e,t),r=Y(t,n,e);return t.noUiSlider=r,r}C.prototype.getMargin=function(t){var e=this.xNumSteps[0];if(e&&t/e%1!=0)throw new Error("noUiSlider: 'limit', 'margin' and 'padding' must be divisible by step.");return 2===this.xPct.length&&m(this.xVal,t)},C.prototype.toStepping=function(t){return t=w(this.xVal,this.xPct,t)},C.prototype.fromStepping=function(t){return S(this.xVal,this.xPct,t)},C.prototype.getStep=function(t){return t=x(this.xPct,this.xSteps,this.snap,t)},C.prototype.getNearbySteps=function(t){var e=b(t,this.xPct);return{stepBefore:{startValue:this.xVal[e-2],step:this.xNumSteps[e-2],highestStep:this.xHighestCompleteStep[e-2]},thisStep:{startValue:this.xVal[e-1],step:this.xNumSteps[e-1],highestStep:this.xHighestCompleteStep[e-1]},stepAfter:{startValue:this.xVal[e-0],step:this.xNumSteps[e-0],highestStep:this.xHighestCompleteStep[e-0]}}},C.prototype.countStepDecimals=function(){var t=this.xNumSteps.map(u);return Math.max.apply(null,t)},C.prototype.convert=function(t){return this.getStep(this.toStepping(t))};var _={to:function(t){return void 0!==t&&t.toFixed(2)},from:Number};return{create:I}});