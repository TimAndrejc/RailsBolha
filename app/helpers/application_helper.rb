module ApplicationHelper
    def display_notice
        content_tag(:div, flash[:notice], class: "notice") if flash[:notice]
    end
    def display_alert
        content_tag(:div, flash[:alert], class: "alert") if flash[:alert]
    end


def display_navbar_options
    if user_signed_in?
        render 'loggedInNav'
    else
        render 'loggedOutNav'
    end
end

def display_active_class(link_path)
    "active" if current_page?(link_path)
end

end
