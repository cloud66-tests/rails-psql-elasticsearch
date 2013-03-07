$(document).ready(function () {
    $('#typeahead').typeahead({
        minLength: 3,
        items: 10,
        source: function (query, process) {
            $.ajax({
                type: "GET",
                url: "/documents/auto_complete.json",
                data: {query: query},
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (result) {
                    process(result);
                }
            });
        }, updater: function (item) {
            $('#typeahead').val(item);
            $('.navbar-search').submit();
        }
    });
});

