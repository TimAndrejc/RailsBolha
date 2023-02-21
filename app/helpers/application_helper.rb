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
def on_file_autoloaded(file)
    cref  = autoloads.delete(file)
    cpath = cpath(*cref)

    Zeitwerk::Registry.unregister_autoload(file)

    if cdef?(*cref)
      log("constant #{cpath} loaded from file #{file}") if logger
      to_unload[cpath] = [file, cref] if reloading_enabled?
      run_on_load_callbacks(cpath, cget(*cref), file) unless on_load_callbacks.empty?
    else
      msg = "expected file #{file} to define constant #{cpath}, but didn't"
      log(msg) if logger
      crem(*cref)
      to_unload[cpath] = [file, cref] if reloading_enabled?
      raise Zeitwerk::NameError.new(msg, cref.last)
    end
end

def display_active_class(link_path)
    "active" if current_page?(link_path)
end

end
