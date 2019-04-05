$(document).on('turbolinks:load', function () {
    getExpensesByDate();
});
$(document).on('change', '.select-date', function () {
    getExpensesByDate();
});

function getExpensesByDate() {
    let month = $('#date_month').val();
    let year = $('#date_year').val();

    $.ajax({
        type: "GET",
        url: `/expenses-data`,
        data: {
            month: month,
            year: year
        },
        complete: function (response) {
            $("#expenses-table").html(response.responseText);
        }
    });
}

$('.input-group.date').datepicker({
    format: "dd/mm/yyyy",
    weekStart: 1,
    maxViewMode: 2,
    todayBtn: "linked",
    clearBtn: true,
    autoclose: true
});