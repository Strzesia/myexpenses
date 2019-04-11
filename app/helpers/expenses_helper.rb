module ExpensesHelper

  @pattern = Regexp.new(/^(\[0-9]{1,3})+(\,\[0-9]{2})$/).freeze

  def datepicker(form, field)
    form.text_field(field, data: {provide: "datepicker",
                                  'date-format': "dd/mm/yyyy",
                                  'date-weekStart': 1,
                                  'date-maxViewMode': 2,
                                  'date-orientation': "bottom right",
                                  'date-autoclose': true},
                    'data-date-today-highlight': true,
                    'data-date-today-btn': 'linked',
                    'data-date-clear-btn': 'true',
                    'autocomplete': 'off',
                    class: 'form-control').html_safe
  end

  def sortable(column, title = nil)

    title ||= column.titleize

    direction = (column == sort_column && sort_direction == "asc") ? "desc" : "asc"
    css_class = (column == sort_column) ? "current #{sort_direction}" : nil

    icon = sort_direction == "asc" ? "fa fa-sort-up" : "fa fa-sort-down"
    icon = column == sort_column ? icon : "fa fa-sort"

    "<a class='#{css_class}' onclick='sortColumn(\"#{column}\", \"#{direction}\")'>#{title}<span class='#{icon}'></span></a>".html_safe
  end
end
