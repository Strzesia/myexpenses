$(document).on('turbolinks:load', function () {
    renderExpensesTable();

});
$(document).on('click', '.filter-expenses', function () {
    renderExpensesTable();
});

function sortColumn(column, direction) {
    console.log(direction);
    renderExpensesTable(column, direction);
}

function renderExpensesTable(column, direction) {
    let month = $('#date_month').val();
    let year = $('#date_year').val();
    let categoryId = $('#category').val();
    let keyword = $('#keyword').val();
    let amountFrom = $('#amount1').val();
    let amountTo = $('#amount2').val();

    $.ajax({
        type: "GET",
        url: `/expenses-data`,
        data: {
            month: month,
            year: year,
            category_id: categoryId,
            description: keyword,
            amountFrom: amountFrom,
            amountTo: amountTo,
            sort: column,
            direction: direction
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
