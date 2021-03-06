// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require jquery
//= require jquery_ujs
//= require nested_form_fields
//= require bootstrap-sprockets
//= require_tree .

// フラッシュメッセージ

$(function(){
	setTimeout(function(){
	$('.notice').fadeOut()}, 3000)
});

$(function(){
	setTimeout(function(){
	$('.alert').fadeOut()}, 10000)
});

// Datetime Picker
// 使用したいtext_fieldに、id: "datepicker" を付与
$(function() {
    $( "#datetimepicker" ).datetimepicker();
  });

// jpPostal
$(function () {
  $('#user_postal_code').jpostal({
    postcode : [
      '#user_postal_code'
    ],
    address : {
      '#user_address' : '%3%4%5'
    }
  });
});

// $('.fartist-menu').on({
// 	'mouseenter': function(){
// 		$(this)
// 			.addClass('is-active')
// 			.find('.f-list-wrapper').velocity('slideDown',{
// 				duration: 300
// 			});
// 	},
// 	'mouseleave': function(){
// 		$(this)
// 			.removeClass('is-active')
// 			.find('.f-list-wrapper').velocity('slideUp',{
// 				duration: 300
// 			});
// 	}
// });

$(function() {
    $('.stock-btn').numberSpinner({
    	upButtonText: '＋',
    	downButtonText: 'ー'
    });
});
$(function() {
    $('.item_amount').Spinner({
    	upButtonText: '＋',
    	downButtonText: 'ー'
    });
});

