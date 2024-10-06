module ApplicationHelper
    def sortable(column, title = nil)
      title ||= column.titleize
      direction = (column == sorting_column && sorting_direction == "asc") ? "desc" : "asc"
      arrow = column == sorting_column ? (sorting_direction == "asc" ? " ↑" : " ↓") : ""
      
      link_to "#{title}#{arrow}".html_safe, { sort: column, direction: direction }, { class: "sortable #{direction}" }
    end
  
    def sorting_column
      Movie.column_names.include?(params[:sort]) ? params[:sort] : "title"
    end
  
    def sorting_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
  end
  