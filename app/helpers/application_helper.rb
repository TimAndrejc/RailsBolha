module ApplicationHelper 

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
