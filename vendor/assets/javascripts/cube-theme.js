//= require jquery
//= require jquery_ujs
//= require jquery.maskMoney
//= require bootstrap-sprockets
//= require cube/lib/jquery.nanoscroller
//= require cube/lib/scripts.js
//= require cube/lib/pace.min.js
//= require cube/lib/select2.min.js
//= require_self


// drop down in responsive table
(function () {
    $('.table-responsive').on('shown.bs.dropdown', function (e) {
        var $table = $(this),
            $menu = $(e.target).find('.dropdown-menu'),
            tableOffsetHeight = $table.offset().top + $table.height(),
            menuOffsetHeight = $menu.offset().top + $menu.outerHeight(true);

        if (menuOffsetHeight > tableOffsetHeight)
            $table.css("padding-bottom", menuOffsetHeight - tableOffsetHeight);
    });

    $('.table-responsive').on('hide.bs.dropdown', function () {
        $(this).css("padding-bottom", 0);
    })
})();
