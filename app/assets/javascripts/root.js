// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function(){
      $(function(){
        $("#searchbar-toggle").hide();
         $(".search-button").click(function(e){
             e.preventDefault();
             $("#navbar-toggle").hide();
             $("#searchbar-toggle").show();
         });
         $("#close-search").click(function(e){
             e.preventDefault();
             $("#navbar-toggle").show();
             $("#searchbar-toggle").hide();
         });
      })
});
