(function($) {
    "use strict";
    /* Mobile Navigation */
    function fixNavigationMobileView() {
        var $_winW = $(window).width();
        var $_mmenu = $('#em-mheader-menu-content');
        var elem = $('#em-mheader-menu-content');
        var $_parent = $('#em-mheader-wrapper-menu');
        var $_iconNav = $('#em-mheader-menu-icon');
        if (!isPhone || $_winW > 767) {
            $_mmenu.removeClass();
            $_iconNav.removeClass('active');
            elem.removeClass('show');
            $_parent.removeClass('active');
        }
    };

    function fixNavOverFlow() {
        var $_iconNav = $('#em-mheader-menu-icon');
        var elem = $('#em-mheader-menu-content');
        var $_parent = $('#em-mheader-wrapper-menu');
        $_iconNav.click(function(e) {
            e.preventDefault();
            var self = $(this);
            var isSkipContentOpen = elem.hasClass('show') ? 1 : 0;
            self.removeClass('active');
            elem.removeClass('show');
            $_parent.removeClass('active');
            if (isSkipContentOpen) {
                self.removeClass('active');
                $_parent.removeClass('active');
            } else {
                self.addClass('active');
                elem.addClass('show');
                $_parent.addClass('active');
            }
        });
        if (isPhone) {
            $_parent.on("swipeleft", function() {
                var self = $(this);
                if (self.hasClass('active')) {
                    elem.removeClass('show');
                    $_iconNav.removeClass('active');
                    self.removeClass('active');
                }
            });
        }
    };

    jQuery(document).ready(function() {

        if (EM.SETTING.DISABLE_RESPONSIVE != 0) {
            fixNavigationMobileView();
            fixNavOverFlow();
        }

        /* Main Slider */
        var sync1 = $('#em_owlcarousel_6_6767_sync1');
        sync1.owlCarousel({
            singleItem: true,
            responsiveRefreshRate: 200,
            paginationSpeed: 2000,
            rewindSpeed: 1000,
            lazyLoad: true,
            slideSpeed: 200,
            navigation: false,
            pagination: true,
            navigationText: ["Pre", "Next"],
            transitionStyle: 'fade',
            autoPlay: false,
        });

        /* Home auctions */
        var owl = $("#active-auctions.home-auctions").find('.owl-carousel');
        if (owl.length) {
            owl.owlCarousel({
                //Basic Speeds
                slideSpeed: 800,
                rewindSpeed: 800,

                //Autoplay
                autoPlay: false,
                lazyLoad: false,
                stopOnHover: false,
                mouseDrag: false,
                touchDrag: false,

                // Navigation
                navigation: false,
                navigationText: ["Previous", "Next"],
                pagination: false,
                paginationNumbers: false,

                // Responsive
                responsive: true,
                items: 4,
                /*items above 1200px browser width*/
                itemsDesktop: [1200, 4],
                /*//items between 1199px and 981px*/
                itemsDesktopSmall: [992, 3],
                itemsTablet: [768, 2],
                itemsMobile: [480, 1],

                // CSS Styles
                baseClass: "owl-carousel",
                theme: "owl-theme",
                transitionStyle: false,
                addClassActive: true,
                scrollPerPage: false,
                afterMove: function() {
                    var $_img = jQuery('#active-auctions.home-auctions').find('img.em-img-lazy');
                    if ($_img.length) {
                        var timeout = setTimeout(function() {
                            $_img.trigger("appear");
                        }, 200);
                    }
                },
            });
        }

        /* Auction Page - main auction*/
        var owl = $("#active-auctions.auction-page").find('.owl-carousel');
        if (owl.length) {
            owl.owlCarousel({
                //Basic Speeds
                slideSpeed: 800,
                rewindSpeed: 800,

                //Autoplay
                autoPlay: false,
                lazyLoad: false,
                stopOnHover: false,
                mouseDrag: false,
                touchDrag: false,

                // Navigation
                navigation: false,
                navigationText: ["Previous", "Next"],
                pagination: false,
                paginationNumbers: false,

                // Responsive
                responsive: true,
                items: 3,
                /*items above 1200px browser width*/
                itemsDesktop: [1200, 3],
                /*//items between 1199px and 981px*/
                itemsDesktopSmall: [992, 3],
                itemsTablet: [768, 3],
                itemsMobile: [480, 1],

                // CSS Styles
                baseClass: "owl-carousel",
                theme: "owl-theme",
                transitionStyle: false,
                addClassActive: true,
                scrollPerPage: false,
                afterMove: function() {
                    var $_img = jQuery('#active-auctions.auction-page').find('img.em-img-lazy');
                    if ($_img.length) {
                        var timeout = setTimeout(function() {
                            $_img.trigger("appear");
                        }, 200);
                    }
                },
            });
        }

        /* Auction Page - small auctions */
        var owl = $("#small-auctions").find('.owl-carousel');
        if (owl.length) {
            owl.owlCarousel({
                //Basic Speeds
                slideSpeed: 800,
                rewindSpeed: 800,

                //Autoplay
                autoPlay: false,
                lazyLoad: false,
                stopOnHover: false,
                mouseDrag: false,
                touchDrag: false,

                // Navigation
                navigation: false,
                navigationText: ["Previous", "Next"],
                pagination: false,
                paginationNumbers: false,

                // Responsive
                responsive: true,
                items: 3,
                /*items above 1200px browser width*/
                itemsDesktop: [1200, 3],
                /*//items between 1199px and 981px*/
                itemsDesktopSmall: [992, 3],
                itemsTablet: [768, 3],
                itemsMobile: [480, 3],

                // CSS Styles
                baseClass: "owl-carousel",
                theme: "owl-theme",
                transitionStyle: false,
                addClassActive: true,
                scrollPerPage: false,
                afterMove: function() {
                    var $_img = jQuery('#small-auctions').find('img.em-img-lazy');
                    if ($_img.length) {
                        var timeout = setTimeout(function() {
                            $_img.trigger("appear");
                        }, 200);
                    }
                },
            });
        }
    });
    $(window).resize($.throttle(300, function() {
        if (EM.SETTING.DISABLE_RESPONSIVE != 0) {
            fixNavigationMobileView();
        }
    }));
})(jQuery);

//<![CDATA[
var isMobile = /iPhone|iPod|iPad|Phone|Mobile|Android|hpwos/i.test(navigator.userAgent);
var isPhone = /iPhone|iPod|Phone|Android/i.test(navigator.userAgent);
var isWindowPhone = '';
var language = 'images/language/';
var layout = '2columns-left';
if (typeof EM == 'undefined') EM = {};
EM.SETTING = {
    USE_TAB: '1',
    DISABLE_VARIATION: '1',
    DISABLE_RESPONSIVE: '1',
    AJAXCART_AUTOCLOSE: '0',
    DISABLE_AJAX_ADDTO: '1',
    DISABLE_COLLAPSE: '1',
    STICKY_MENU_SEARCH_CART: '1',
    RIGHT_TO_LEFT: '0',
    COLOR_SWATCHES: '1',
};
//]]>
