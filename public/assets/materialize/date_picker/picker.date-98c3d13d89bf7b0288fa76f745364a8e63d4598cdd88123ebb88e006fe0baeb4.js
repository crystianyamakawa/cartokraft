!function(e){"function"==typeof define&&define.amd?define(["picker","jquery"],e):"object"==typeof exports?module.exports=e(require("./picker.js"),require("jquery")):e(Picker,jQuery)}(function(e,t){function n(e,t){var n=this,a=e.$node[0],i=a.value,r=e.$node.data("value"),o=r||i,s=r?t.formatSubmit:t.format,l=function(){return a.currentStyle?"rtl"==a.currentStyle.direction:"rtl"==getComputedStyle(e.$root[0]).direction};n.settings=t,n.$node=e.$node,n.queue={min:"measure create",max:"measure create",now:"now create",select:"parse create validate",highlight:"parse navigate create validate",view:"parse create validate viewset",disable:"deactivate",enable:"activate"},n.item={},n.item.clear=null,n.item.disable=(t.disable||[]).slice(0),n.item.enable=-function(e){return!0===e[0]?e.shift():-1}(n.item.disable),n.set("min",t.min).set("max",t.max).set("now"),o?n.set("select",o,{format:s}):n.set("select",null).set("highlight",n.item.now),n.key={40:7,38:-7,39:function(){return l()?-1:1},37:function(){return l()?1:-1},go:function(e){var t=n.item.highlight,a=new Date(t.year,t.month,t.date+e);n.set("highlight",a,{interval:e}),this.render()}},e.on("render",function(){e.$root.find("."+t.klass.selectMonth).on("change",function(){var n=this.value;n&&(e.set("highlight",[e.get("view").year,n,e.get("highlight").date]),e.$root.find("."+t.klass.selectMonth).trigger("focus"))}),e.$root.find("."+t.klass.selectYear).on("change",function(){var n=this.value;n&&(e.set("highlight",[n,e.get("view").month,e.get("highlight").date]),e.$root.find("."+t.klass.selectYear).trigger("focus"))})},1).on("open",function(){var a="";n.disabled(n.get("now"))&&(a=":not(."+t.klass.buttonToday+")"),e.$root.find("button"+a+", select").attr("disabled",!1)},1).on("close",function(){e.$root.find("button, select").attr("disabled",!0)},1)}var a=7,i=e._;n.prototype.set=function(e,t,n){var a=this,i=a.item;return null===t?("clear"==e&&(e="select"),i[e]=t,a):(i["enable"==e?"disable":"flip"==e?"enable":e]=a.queue[e].split(" ").map(function(i){return t=a[i](e,t,n)}).pop(),"select"==e?a.set("highlight",i.select,n):"highlight"==e?a.set("view",i.highlight,n):e.match(/^(flip|min|max|disable|enable)$/)&&(i.select&&a.disabled(i.select)&&a.set("select",i.select,n),i.highlight&&a.disabled(i.highlight)&&a.set("highlight",i.highlight,n)),a)},n.prototype.get=function(e){return this.item[e]},n.prototype.create=function(e,n,a){var r,o=this;return n=n===undefined?e:n,n==-Infinity||n==Infinity?r=n:t.isPlainObject(n)&&i.isInteger(n.pick)?n=n.obj:t.isArray(n)?(n=new Date(n[0],n[1],n[2]),n=i.isDate(n)?n:o.create().obj):n=i.isInteger(n)||i.isDate(n)?o.normalize(new Date(n),a):o.now(e,n,a),{year:r||n.getFullYear(),month:r||n.getMonth(),date:r||n.getDate(),day:r||n.getDay(),obj:r||n,pick:r||n.getTime()}},n.prototype.createRange=function(e,n){var a=this,r=function(e){return!0===e||t.isArray(e)||i.isDate(e)?a.create(e):e};return i.isInteger(e)||(e=r(e)),i.isInteger(n)||(n=r(n)),i.isInteger(e)&&t.isPlainObject(n)?e=[n.year,n.month,n.date+e]:i.isInteger(n)&&t.isPlainObject(e)&&(n=[e.year,e.month,e.date+n]),{from:r(e),to:r(n)}},n.prototype.withinRange=function(e,t){return e=this.createRange(e.from,e.to),t.pick>=e.from.pick&&t.pick<=e.to.pick},n.prototype.overlapRanges=function(e,t){var n=this;return e=n.createRange(e.from,e.to),t=n.createRange(t.from,t.to),n.withinRange(e,t.from)||n.withinRange(e,t.to)||n.withinRange(t,e.from)||n.withinRange(t,e.to)},n.prototype.now=function(e,t,n){return t=new Date,n&&n.rel&&t.setDate(t.getDate()+n.rel),this.normalize(t,n)},n.prototype.navigate=function(e,n,a){var i,r,o,s,l=t.isArray(n),d=t.isPlainObject(n),c=this.item.view;if(l||d){for(d?(r=n.year,o=n.month,s=n.date):(r=+n[0],o=+n[1],s=+n[2]),a&&a.nav&&c&&c.month!==o&&(r=c.year,o=c.month),i=new Date(r,o+(a&&a.nav?a.nav:0),1),r=i.getFullYear(),o=i.getMonth();new Date(r,o,s).getMonth()!==o;)s-=1;n=[r,o,s]}return n},n.prototype.normalize=function(e){return e.setHours(0,0,0,0),e},n.prototype.measure=function(e,t){var n=this;return t?"string"==typeof t?t=n.parse(e,t):i.isInteger(t)&&(t=n.now(e,t,{rel:t})):t="min"==e?-Infinity:Infinity,t},n.prototype.viewset=function(e,t){return this.create([t.year,t.month,1])},n.prototype.validate=function(e,n,a){var r,o,s,l,d=this,c=n,u=a&&a.interval?a.interval:1,h=-1===d.item.enable,y=d.item.min,f=d.item.max,m=h&&d.item.disable.filter(function(e){if(t.isArray(e)){var a=d.create(e).pick;a<n.pick?r=!0:a>n.pick&&(o=!0)}return i.isInteger(e)}).length;if((!a||!a.nav)&&(!h&&d.disabled(n)||h&&d.disabled(n)&&(m||r||o)||!h&&(n.pick<=y.pick||n.pick>=f.pick)))for(h&&!m&&(!o&&u>0||!r&&u<0)&&(u*=-1);d.disabled(n)&&(Math.abs(u)>1&&(n.month<c.month||n.month>c.month)&&(n=c,u=u>0?1:-1),n.pick<=y.pick?(s=!0,u=1,n=d.create([y.year,y.month,y.date+(n.pick===y.pick?0:-1)])):n.pick>=f.pick&&(l=!0,u=-1,n=d.create([f.year,f.month,f.date+(n.pick===f.pick?0:1)])),!s||!l);)n=d.create([n.year,n.month,n.date+u]);return n},n.prototype.disabled=function(e){var n=this,a=n.item.disable.filter(function(a){return i.isInteger(a)?e.day===(n.settings.firstDay?a:a-1)%7:t.isArray(a)||i.isDate(a)?e.pick===n.create(a).pick:t.isPlainObject(a)?n.withinRange(a,e):void 0});return a=a.length&&!a.filter(function(e){return t.isArray(e)&&"inverted"==e[3]||t.isPlainObject(e)&&e.inverted}).length,-1===n.item.enable?!a:a||e.pick<n.item.min.pick||e.pick>n.item.max.pick},n.prototype.parse=function(e,t,n){var a=this,r={};return t&&"string"==typeof t?(n&&n.format||(n=n||{},n.format=a.settings.format),a.formats.toArray(n.format).map(function(e){var n=a.formats[e],o=n?i.trigger(n,a,[t,r]):e.replace(/^!/,"").length;n&&(r[e]=t.substr(0,o)),t=t.substr(o)}),[r.yyyy||r.yy,+(r.mm||r.m)-1,r.dd||r.d]):t},n.prototype.formats=function(){function e(e,t,n){var a=e.match(/\w+/)[0];return n.mm||n.m||(n.m=t.indexOf(a)+1),a.length}function t(e){return e.match(/\w+/)[0].length}return{d:function(e,t){return e?i.digits(e):t.date},dd:function(e,t){return e?2:i.lead(t.date)},ddd:function(e,n){return e?t(e):this.settings.weekdaysShort[n.day]},dddd:function(e,n){return e?t(e):this.settings.weekdaysFull[n.day]},m:function(e,t){return e?i.digits(e):t.month+1},mm:function(e,t){return e?2:i.lead(t.month+1)},mmm:function(t,n){var a=this.settings.monthsShort;return t?e(t,a,n):a[n.month]},mmmm:function(t,n){var a=this.settings.monthsFull;return t?e(t,a,n):a[n.month]},yy:function(e,t){return e?2:(""+t.year).slice(2)},yyyy:function(e,t){return e?4:t.year},toArray:function(e){return e.split(/(d{1,4}|m{1,4}|y{4}|yy|!.)/g)},toString:function(e,t){var n=this;return n.formats.toArray(e).map(function(e){return i.trigger(n.formats[e],n,[0,t])||e.replace(/^!/,"")}).join("")}}}(),n.prototype.isDateExact=function(e,n){var a=this;return i.isInteger(e)&&i.isInteger(n)||"boolean"==typeof e&&"boolean"==typeof n?e===n:(i.isDate(e)||t.isArray(e))&&(i.isDate(n)||t.isArray(n))?a.create(e).pick===a.create(n).pick:!(!t.isPlainObject(e)||!t.isPlainObject(n))&&a.isDateExact(e.from,n.from)&&a.isDateExact(e.to,n.to)},n.prototype.isDateOverlap=function(e,n){var a=this,r=a.settings.firstDay?1:0;return i.isInteger(e)&&(i.isDate(n)||t.isArray(n))?(e=e%7+r)===a.create(n).day+1:i.isInteger(n)&&(i.isDate(e)||t.isArray(e))?(n=n%7+r)===a.create(e).day+1:!(!t.isPlainObject(e)||!t.isPlainObject(n))&&a.overlapRanges(e,n)},n.prototype.flipEnable=function(e){var t=this.item;t.enable=e||(-1==t.enable?1:-1)},n.prototype.deactivate=function(e,n){var a=this,r=a.item.disable.slice(0);return"flip"==n?a.flipEnable():!1===n?(a.flipEnable(1),r=[]):!0===n?(a.flipEnable(-1),r=[]):n.map(function(e){for(var n,o=0;o<r.length;o+=1)if(a.isDateExact(e,r[o])){n=!0;break}n||(i.isInteger(e)||i.isDate(e)||t.isArray(e)||t.isPlainObject(e)&&e.from&&e.to)&&r.push(e)}),r},n.prototype.activate=function(e,n){var a=this,r=a.item.disable,o=r.length;return"flip"==n?a.flipEnable():!0===n?(a.flipEnable(1),r=[]):!1===n?(a.flipEnable(-1),r=[]):n.map(function(e){var n,s,l,d;for(l=0;l<o;l+=1){if(s=r[l],a.isDateExact(s,e)){n=r[l]=null,d=!0;break}if(a.isDateOverlap(s,e)){t.isPlainObject(e)?(e.inverted=!0,n=e):t.isArray(e)?(n=e,n[3]||n.push("inverted")):i.isDate(e)&&(n=[e.getFullYear(),e.getMonth(),e.getDate(),"inverted"]);break}}if(n)for(l=0;l<o;l+=1)if(a.isDateExact(r[l],e)){r[l]=null;break}if(d)for(l=0;l<o;l+=1)if(a.isDateOverlap(r[l],e)){r[l]=null;break}n&&r.push(n)}),r.filter(function(e){return null!=e})},n.prototype.nodes=function(e){var t=this,n=t.settings,r=t.item,o=r.now,s=r.select,l=r.highlight,d=r.view,c=r.disable,u=r.min,h=r.max,y=function(e,t){return n.firstDay&&(e.push(e.shift()),t.push(t.shift())),i.node("thead",i.node("tr",i.group({min:0,max:a-1,i:1,node:"th",item:function(a){return[e[a],n.klass.weekdays,'scope=col title="'+t[a]+'"']}})))}((n.showWeekdaysFull?n.weekdaysFull:n.weekdaysLetter).slice(0),n.weekdaysFull.slice(0)),f=function(e){return i.node("div"," ",n.klass["nav"+(e?"Next":"Prev")]+(e&&d.year>=h.year&&d.month>=h.month||!e&&d.year<=u.year&&d.month<=u.month?" "+n.klass.navDisabled:""),"data-nav="+(e||-1)+" "+i.ariaAttr({role:"button",controls:t.$node[0].id+"_table"})+' title="'+(e?n.labelMonthNext:n.labelMonthPrev)+'"')},m=function(a){var r=n.showMonthsShort?n.monthsShort:n.monthsFull;return"short_months"==a&&(r=n.monthsShort),n.selectMonths&&a==undefined?i.node("select",i.group({min:0,max:11,i:1,node:"option",item:function(e){return[r[e],0,"value="+e+(d.month==e?" selected":"")+(d.year==u.year&&e<u.month||d.year==h.year&&e>h.month?" disabled":"")]}}),n.klass.selectMonth+" browser-default",(e?"":"disabled")+" "+i.ariaAttr({controls:t.$node[0].id+"_table"})+' title="'+n.labelMonthSelect+'"'):"short_months"==a?null!=s?i.node("div",r[s.month]):i.node("div",r[d.month]):i.node("div",r[d.month],n.klass.month)},p=function(a){var r=d.year,o=!0===n.selectYears?5:~~(n.selectYears/2);if(o){var s=u.year,l=h.year,c=r-o,y=r+o;if(s>c&&(y+=s-c,c=s),l<y){var f=c-s,m=y-l;c-=f>m?m:f,y=l}if(n.selectYears&&a==undefined)return i.node("select",i.group({min:c,max:y,i:1,node:"option",item:function(e){return[e,0,"value="+e+(r==e?" selected":"")]}}),n.klass.selectYear+" browser-default",(e?"":"disabled")+" "+i.ariaAttr({controls:t.$node[0].id+"_table"})+' title="'+n.labelYearSelect+'"')}return"raw"==a?i.node("div",r):i.node("div",r,n.klass.year)};return createDayLabel=function(){return null!=s?i.node("div",s.date):i.node("div",o.date)},createWeekdayLabel=function(){var e;return e=null!=s?s.day:o.day,n.weekdaysFull[e]},i.node("div",i.node("div",createWeekdayLabel(),"picker__weekday-display")+i.node("div",m("short_months"),n.klass.month_display)+i.node("div",createDayLabel(),n.klass.day_display)+i.node("div",p("raw"),n.klass.year_display),n.klass.date_display)+i.node("div",i.node("div",(n.selectYears,m()+p()+f()+f(1)),n.klass.header)+i.node("table",y+i.node("tbody",i.group({min:0,max:5,i:1,node:"tr",item:function(e){var r=n.firstDay&&0===t.create([d.year,d.month,1]).day?-7:0;return[i.group({min:a*e-d.day+r+1,max:function(){return this.min+a-1},i:1,node:"td",item:function(e){e=t.create([d.year,d.month,e+(n.firstDay?1:0)]);var a=s&&s.pick==e.pick,r=l&&l.pick==e.pick,y=c&&t.disabled(e)||e.pick<u.pick||e.pick>h.pick,f=i.trigger(t.formats.toString,t,[n.format,e]);return[i.node("div",e.date,function(t){return t.push(d.month==e.month?n.klass.infocus:n.klass.outfocus),o.pick==e.pick&&t.push(n.klass.now),a&&t.push(n.klass.selected),r&&t.push(n.klass.highlighted),y&&t.push(n.klass.disabled),t.join(" ")}([n.klass.day]),"data-pick="+e.pick+" "+i.ariaAttr({role:"gridcell",label:f,selected:!(!a||t.$node.val()!==f)||null,activedescendant:!!r||null,disabled:!!y||null})),"",i.ariaAttr({role:"presentation"})]}})]}})),n.klass.table,'id="'+t.$node[0].id+'_table" '+i.ariaAttr({role:"grid",controls:t.$node[0].id,readonly:!0})),n.klass.calendar_container)+i.node("div",i.node("button",n.today,"btn-flat picker__today","type=button data-pick="+o.pick+(e&&!t.disabled(o)?"":" disabled")+" "+i.ariaAttr({controls:t.$node[0].id}))+i.node("button",n.clear,"btn-flat picker__clear","type=button data-clear=1"+(e?"":" disabled")+" "+i.ariaAttr({controls:t.$node[0].id}))+i.node("button",n.close,"btn-flat picker__close","type=button data-close=true "+(e?"":" disabled")+" "+i.ariaAttr({controls:t.$node[0].id})),n.klass.footer)},n.defaults=function(e){return{labelMonthNext:"Next month",labelMonthPrev:"Previous month",labelMonthSelect:"Select a month",labelYearSelect:"Select a year",monthsFull:["January","February","March","April","May","June","July","August","September","October","November","December"],monthsShort:["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"],weekdaysFull:["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"],weekdaysShort:["Sun","Mon","Tue","Wed","Thu","Fri","Sat"],weekdaysLetter:["S","M","T","W","T","F","S"],today:"Today",clear:"Clear",close:"Close",format:"d mmmm, yyyy",klass:{table:e+"table",header:e+"header",date_display:e+"date-display",day_display:e+"day-display",month_display:e+"month-display",year_display:e+"year-display",calendar_container:e+"calendar-container",navPrev:e+"nav--prev",navNext:e+"nav--next",navDisabled:e+"nav--disabled",month:e+"month",year:e+"year",selectMonth:e+"select--month",selectYear:e+"select--year",weekdays:e+"weekday",day:e+"day",disabled:e+"day--disabled",selected:e+"day--selected",highlighted:e+"day--highlighted",now:e+"day--today",infocus:e+"day--infocus",outfocus:e+"day--outfocus",footer:e+"footer",buttonClear:e+"button--clear",buttonToday:e+"button--today",buttonClose:e+"button--close"}}}(e.klasses().picker+"__"),e.extend("pickadate",n)});