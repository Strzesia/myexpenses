module ExpensesHelper

    @pattern = Regexp.new(/^(\[0-9]{1,3})+(\,\[0-9]{2})$/)

    def datepicker(form, field)
        form.text_field(field, data: { provide: "datepicker",
                                       'date-format': "dd/mm/yyyy",
                                       'date-weekStart': 1,
                                       'date-maxViewMode': 2,
                                       'date-orientation': "bottom right",
                                       'date-autoclose': true },
                        'data-date-today-highlight': true,
                        'data-date-today-btn': 'linked',
                        'data-date-clear-btn': 'true',
                        'autocomplete': 'off',
                        class: 'form-control form-control-sm').html_safe
    end

end
