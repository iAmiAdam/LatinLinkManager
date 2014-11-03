# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


`$(document).ready(function(){
  $('[data-behaviour~=datepicker]').datepicker({
  	format: "yyyy/mm/dd"
  });
})`

`$(document).ready(function() {

	var d = new Date();

	$('#project_time').datetimepicker({
		pickDate: false,
		format: "HH:mm",
		minuteStepping: 15,
	});

})`

`$(document).ready(function() {

	$('#project_translator_time').datetimepicker({
		pickDate: false,
		format: "HH:mm",
		minuteStepping: 15
	});

})`