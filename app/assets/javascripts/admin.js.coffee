$ ->
  $('#route_occurrence_attributes_recurs').change toggleRecurrenceDetails
  toggleRecurrenceDetails()

toggleRecurrenceDetails = () ->
  if $('#route_occurrence_attributes_recurs').val() == 'true'
    $('#recurrence_details').show()
  else
    $('#recurrence_details').hide()