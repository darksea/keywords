module ApplicationHelper
  
  def partial(name, locals = {})
    render :partial => name, :locals => locals
  end
  
  def loading_icon
		image_tag('loading.gif', :class => 'loading none')
	end
  
  def bootstrap_form_for(object, options = {}, &block)
    options[:builder] = BootstrapFormBuilder
    form_for(object, options, &block)
  end
  
  def search_state_class(search)
    case search.state
    when Search::STATES[:started]
      "warning"
    when Search::STATES[:finished]
      "success"
    when Search::STATES[:error]
      "important error"
    when Search::STATES[:following]
      "notice"
    else
      ""
    end
  end
  
  def search_state_label(search, right = true)
    klass = search_state_class(search)
    klass << " pull-right" if right
    content_tag :span, :class => "#{klass} label" do
      t("searches.states.#{search.state}")
    end
  end
end