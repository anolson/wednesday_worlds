// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

document.observe("dom:loaded", function() {
  $('route_occurrence_attributes_recurs').observe('change', toggleRecurrenceDetails);

  toggleRecurrenceDetails();
});

function toggleRecurrenceDetails() {
  if($('route_occurrence_attributes_recurs').value == 'true') {
    $('recurrence_details').show();
  }
  else {
    $('recurrence_details').hide();
  }
}


