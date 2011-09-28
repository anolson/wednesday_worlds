//= require prototype
//= require_self
//= require_tree .

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