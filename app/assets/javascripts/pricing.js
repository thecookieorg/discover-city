$('#myTabs a').click(function (e) {
  e.preventDefault()
  $(this).tab('hide')
})

$('#myTabs a[href="#monthly"]').tab('show') // Select tab by name
$('#myTabs a[href="#yearly"]').tab('show') // Select tab by name