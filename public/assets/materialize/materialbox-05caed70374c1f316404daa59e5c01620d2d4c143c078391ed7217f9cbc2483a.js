!function(e){e.fn.materialbox=function(){return this.each(function(){function t(){n=!1;var t=s.parent(".material-placeholder"),o=(window.innerWidth,window.innerHeight,s.data("width")),l=s.data("height");s.velocity("stop",!0),e("#materialbox-overlay").velocity("stop",!0),e(".materialbox-caption").velocity("stop",!0),e("#materialbox-overlay").velocity({opacity:0},{duration:d,queue:!1,easing:"easeOutQuad",complete:function(){a=!1,e(this).remove()}}),s.velocity({width:o,height:l,left:0,top:0},{duration:d,queue:!1,easing:"easeOutQuad",complete:function(){t.css({height:"",width:"",position:"",top:"",left:""}),s.removeAttr("style"),s.attr("style",r),s.removeClass("active"),n=!0,i&&i.css("overflow","")}}),e(".materialbox-caption").velocity({opacity:0},{duration:d,queue:!1,easing:"easeOutQuad",complete:function(){e(this).remove()}})}if(!e(this).hasClass("initialized")){e(this).addClass("initialized");var i,o,a=!1,n=!0,l=275,d=200,s=e(this),c=e("<div></div>").addClass("material-placeholder"),r=s.attr("style");s.wrap(c),s.on("click",function(){var d=s.parent(".material-placeholder"),c=window.innerWidth,r=window.innerHeight,u=s.width(),p=s.height();if(!1===n)return t(),!1;if(a&&!0===n)return t(),!1;n=!1,s.addClass("active"),a=!0,d.css({width:d[0].getBoundingClientRect().width,height:d[0].getBoundingClientRect().height,position:"relative",top:0,left:0}),i=undefined,o=d[0].parentNode;for(;null!==o&&!e(o).is(document);){var h=e(o);"visible"!==h.css("overflow")&&(h.css("overflow","visible"),i=i===undefined?h:i.add(h)),o=o.parentNode}s.css({position:"absolute","z-index":1e3,"will-change":"left, top, width, height"}).data("width",u).data("height",p);var f=e('<div id="materialbox-overlay"></div>').css({opacity:0}).click(function(){!0===n&&t()});s.before(f);var v=f[0].getBoundingClientRect();if(f.css({width:c,height:r,left:-1*v.left,top:-1*v.top}),f.velocity({opacity:1},{duration:l,queue:!1,easing:"easeOutQuad"}),""!==s.data("caption")){var m=e('<div class="materialbox-caption"></div>');m.text(s.data("caption")),e("body").append(m),m.css({display:"inline"}),m.velocity({opacity:1},{duration:l,queue:!1,easing:"easeOutQuad"})}var g=0,w=u/c,y=p/r,b=0,x=0;w>y?(g=p/u,b=.9*c,x=.9*c*g):(g=u/p,b=.9*r*g,x=.9*r),s.hasClass("responsive-img")?s.velocity({"max-width":b,width:u},{duration:0,queue:!1,complete:function(){s.css({left:0,top:0}).velocity({height:x,width:b,left:e(document).scrollLeft()+c/2-s.parent(".material-placeholder").offset().left-b/2,top:e(document).scrollTop()+r/2-s.parent(".material-placeholder").offset().top-x/2},{duration:l,queue:!1,easing:"easeOutQuad",complete:function(){n=!0}})}}):s.css("left",0).css("top",0).velocity({height:x,width:b,left:e(document).scrollLeft()+c/2-s.parent(".material-placeholder").offset().left-b/2,top:e(document).scrollTop()+r/2-s.parent(".material-placeholder").offset().top-x/2},{duration:l,queue:!1,easing:"easeOutQuad",complete:function(){n=!0}})}),e(window).scroll(function(){a&&t()}),e(document).keyup(function(e){27===e.keyCode&&!0===n&&a&&t()})}})},e(document).on("turbolinks:load",function(){e(".materialboxed").materialbox()})}(jQuery);