!function(t){var e={init:function(e){var i={indicators:!0,height:400,transition:500,interval:6e3};return e=t.extend(i,e),this.each(function(){function i(t,e){t.hasClass("center-align")?t.velocity({opacity:0,translateY:-100},{duration:e,queue:!1}):t.hasClass("right-align")?t.velocity({opacity:0,translateX:100},{duration:e,queue:!1}):t.hasClass("left-align")&&t.velocity({opacity:0,translateX:-100},{duration:e,queue:!1})}function n(t){t>=o.length?t=0:t<0&&(t=o.length-1),(l=u.find(".active").index())!=t&&(a=o.eq(l),$caption=a.find(".caption"),a.removeClass("active"),a.velocity({opacity:0},{duration:e.transition,queue:!1,easing:"easeOutQuad",complete:function(){o.not(".active").velocity({opacity:0,translateX:0,translateY:0},{duration:0,queue:!1})}}),i($caption,e.transition),e.indicators&&r.eq(l).removeClass("active"),o.eq(t).velocity({opacity:1},{duration:e.transition,queue:!1,easing:"easeOutQuad"}),o.eq(t).find(".caption").velocity({opacity:1,translateX:0,translateY:0},{duration:e.transition,delay:e.transition,queue:!1,easing:"easeOutQuad"}),o.eq(t).addClass("active"),e.indicators&&r.eq(t).addClass("active"))}var a,r,s,c=t(this),u=c.find("ul.slides").first(),o=u.find("> li"),l=u.find(".active").index();-1!=l&&(a=o.eq(l)),c.hasClass("fullscreen")||(e.indicators?c.height(e.height+40):c.height(e.height),u.height(e.height)),o.find(".caption").each(function(){i(t(this),0)}),o.find("img").each(function(){var e="data:image/gif;base64,R0lGODlhAQABAIABAP///wAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==";t(this).attr("src")!==e&&(t(this).css("background-image","url("+t(this).attr("src")+")"),t(this).attr("src",e))}),e.indicators&&(r=t('<ul class="indicators"></ul>'),o.each(function(){var i=t('<li class="indicator-item"></li>');i.click(function(){n(u.parent().find(t(this)).index()),clearInterval(s),s=setInterval(function(){l=u.find(".active").index(),o.length==l+1?l=0:l+=1,n(l)},e.transition+e.interval)}),r.append(i)}),c.append(r),r=c.find("ul.indicators").find("li.indicator-item")),a?a.show():(o.first().addClass("active").velocity({opacity:1},{duration:e.transition,queue:!1,easing:"easeOutQuad"}),l=0,a=o.eq(l),e.indicators&&r.eq(l).addClass("active")),a.find("img").each(function(){a.find(".caption").velocity({opacity:1,translateX:0,translateY:0},{duration:e.transition,queue:!1,easing:"easeOutQuad"})}),s=setInterval(function(){l=u.find(".active").index(),n(l+1)},e.transition+e.interval);var d=!1,v=!1,f=!1;c.hammer({prevent_default:!1}).bind("pan",function(t){if("touch"===t.gesture.pointerType){clearInterval(s);var e=t.gesture.direction,i=t.gesture.deltaX,n=t.gesture.velocityX,a=t.gesture.velocityY;$curr_slide=u.find(".active"),Math.abs(n)>Math.abs(a)&&$curr_slide.velocity({translateX:i},{duration:50,queue:!1,easing:"easeOutQuad"}),4===e&&(i>c.innerWidth()/2||n<-.65)?f=!0:2===e&&(i<-1*c.innerWidth()/2||n>.65)&&(v=!0);var r;v&&(r=$curr_slide.next(),0===r.length&&(r=o.first()),r.velocity({opacity:1},{duration:300,queue:!1,easing:"easeOutQuad"})),f&&(r=$curr_slide.prev(),0===r.length&&(r=o.last()),r.velocity({opacity:1},{duration:300,queue:!1,easing:"easeOutQuad"}))}}).bind("panend",function(t){"touch"===t.gesture.pointerType&&($curr_slide=u.find(".active"),d=!1,curr_index=u.find(".active").index(),!f&&!v||o.length<=1?$curr_slide.velocity({translateX:0},{duration:300,queue:!1,easing:"easeOutQuad"}):v?(n(curr_index+1),$curr_slide.velocity({translateX:-1*c.innerWidth()},{duration:300,queue:!1,easing:"easeOutQuad",complete:function(){$curr_slide.velocity({opacity:0,translateX:0},{duration:0,queue:!1})}})):f&&(n(curr_index-1),$curr_slide.velocity({translateX:c.innerWidth()},{duration:300,queue:!1,easing:"easeOutQuad",complete:function(){$curr_slide.velocity({opacity:0,translateX:0},{duration:0,queue:!1})}})),v=!1,f=!1,clearInterval(s),s=setInterval(function(){l=u.find(".active").index(),o.length==l+1?l=0:l+=1,n(l)},e.transition+e.interval))}),c.on("sliderPause",function(){clearInterval(s)}),c.on("sliderStart",function(){clearInterval(s),s=setInterval(function(){l=u.find(".active").index(),o.length==l+1?l=0:l+=1,n(l)},e.transition+e.interval)}),c.on("sliderNext",function(){l=u.find(".active").index(),n(l+1)}),c.on("sliderPrev",function(){l=u.find(".active").index(),n(l-1)})})},pause:function(){t(this).trigger("sliderPause")},start:function(){t(this).trigger("sliderStart")},next:function(){t(this).trigger("sliderNext")},prev:function(){t(this).trigger("sliderPrev")}};t.fn.slider=function(i){return e[i]?e[i].apply(this,Array.prototype.slice.call(arguments,1)):"object"!=typeof i&&i?void t.error("Method "+i+" does not exist on jQuery.tooltip"):e.init.apply(this,arguments)}}(jQuery);