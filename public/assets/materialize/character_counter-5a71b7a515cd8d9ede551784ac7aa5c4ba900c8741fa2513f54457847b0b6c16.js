!function(n){function t(){var t=+n(this).attr("data-length"),a=+n(this).val().length,r=a<=t;n(this).parent().find('span[class="character-counter"]').html(a+"/"+t),s(r,n(this))}function a(t){var a=t.parent().find('span[class="character-counter"]');a.length||(a=n("<span/>").addClass("character-counter").css("float","right").css("font-size","12px").css("height",1),t.parent().append(a))}function r(){n(this).parent().find('span[class="character-counter"]').html("")}function s(n,t){var a=t.hasClass("invalid");n&&a?t.removeClass("invalid"):n||a||(t.removeClass("valid"),t.addClass("invalid"))}n.fn.characterCounter=function(){return this.each(function(){var s=n(this);s.parent().find('span[class="character-counter"]').length||s.attr("data-length")!==undefined&&(s.on("input",t),s.on("focus",t),s.on("blur",r),a(s))})},n(document).on("turbolinks:load",function(){n("input, textarea").characterCounter()})}(jQuery);