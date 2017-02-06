# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $(document).on 'change', '#property-owner-select', (evt) ->
    $.ajax "/properties_list",
      type: 'POST'
      dataType: 'script'
      data: {
        owner_id: $("#property-owner-select option:selected").val()
      }
      error: (jqXHR, textStatus, errorThrown) ->
        console.log("AJAX Error: #{textStatus}")
      success: (data, textStatus, jqXHR) ->
        console.log("Dynamic properties select OK!")
