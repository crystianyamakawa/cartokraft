!function(t){t.fn.tooltip=function(e){var o=5,a={delay:350,tooltip:"",position:"bottom",html:!1};return"remove"===e?(this.each(function(){t("#"+t(this).attr("data-tooltip-id")).remove(),t(this).off("mouseenter.tooltip mouseleave.tooltip")}),!1):(e=t.extend(a,e),this.each(function(){var a=Materialize.guid(),n=t(this);n.attr("data-tooltip-id")&&t("#"+n.attr("data-tooltip-id")).remove(),n.attr("data-tooltip-id",a);var r,s,p,l,d,u,f=function(){r=n.attr("data-html")?"true"===n.attr("data-html"):e.html,s=n.attr("data-delay"),s=s===undefined||""===s?e.delay:s,p=n.attr("data-position"),p=p===undefined||""===p?e.position:p,l=n.attr("data-tooltip"),l=l===undefined||""===l?e.tooltip:l};f(),d=function(){var i=t('<div class="material-tooltip"></div>');return l=r?t("<span></span>").html(l):t("<span></span>").text(l),i.append(l).appendTo(t("body")).attr("id",a),u=t('<div class="backdrop"></div>'),u.appendTo(i),i}(),n.off("mouseenter.tooltip mouseleave.tooltip");var c,h=!1;n.on({"mouseenter.tooltip":function(){var t=function(){f(),h=!0,d.velocity("stop"),u.velocity("stop"),d.css({visibility:"visible",left:"0px",top:"0px"});var t,e,a,r=n.outerWidth(),s=n.outerHeight(),l=d.outerHeight(),c=d.outerWidth(),m="0px",v="0px",x=u[0].offsetWidth,y=u[0].offsetHeight,g=8,b=8,w=0;"top"===p?(t=n.offset().top-l-o,e=n.offset().left+r/2-c/2,a=i(e,t,c,l),m="-10px",u.css({bottom:0,left:0,borderRadius:"14px 14px 0 0",transformOrigin:"50% 100%",marginTop:l,marginLeft:c/2-x/2})):"left"===p?(t=n.offset().top+s/2-l/2,e=n.offset().left-c-o,a=i(e,t,c,l),v="-10px",u.css({top:"-7px",right:0,width:"14px",height:"14px",borderRadius:"14px 0 0 14px",transformOrigin:"95% 50%",marginTop:l/2,marginLeft:c})):"right"===p?(t=n.offset().top+s/2-l/2,e=n.offset().left+r+o,a=i(e,t,c,l),v="+10px",u.css({top:"-7px",left:0,width:"14px",height:"14px",borderRadius:"0 14px 14px 0",transformOrigin:"5% 50%",marginTop:l/2,marginLeft:"0px"})):(t=n.offset().top+n.outerHeight()+o,e=n.offset().left+r/2-c/2,a=i(e,t,c,l),m="+10px",u.css({top:0,left:0,marginLeft:c/2-x/2})),d.css({top:a.y,left:a.x}),g=Math.SQRT2*c/parseInt(x),b=Math.SQRT2*l/parseInt(y),w=Math.max(g,b),d.velocity({translateY:m,translateX:v},{duration:350,queue:!1}).velocity({opacity:1},{duration:300,delay:50,queue:!1}),u.css({visibility:"visible"}).velocity({opacity:1},{duration:55,delay:0,queue:!1}).velocity({scaleX:w,scaleY:w},{duration:300,delay:0,queue:!1,easing:"easeInOutQuad"})};c=setTimeout(t,s)},"mouseleave.tooltip":function(){h=!1,clearTimeout(c),setTimeout(function(){!0!==h&&(d.velocity({opacity:0,translateY:0,translateX:0},{duration:225,queue:!1}),u.velocity({opacity:0,scaleX:1,scaleY:1},{duration:225,queue:!1,complete:function(){u.css({visibility:"hidden"}),d.css({visibility:"hidden"}),h=!1}}))},225)}})}))};var i=function(i,e,o,a){var n=i,r=e;return n<0?n=4:n+o>window.innerWidth&&(n-=n+o-window.innerWidth),r<0?r=4:r+a>window.innerHeight+t(window).scrollTop&&(r-=r+a-window.innerHeight),{x:n,y:r}};t(document).on("turbolinks:load",function(){t(".tooltipped").tooltip()})}(jQuery);