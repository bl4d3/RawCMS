module ContainersHelper
  def sexy_link_to (value ="", img = "tick", status = "standard", options = {}, html_options = {})
	    html_options[:class] = status
	    link_to (image_tag("icon_set/24x24/"+img+".png", :alt => "") + value), options, html_options
	end
	
	
	def link_to_container(container, owner)
		ret = render :partial => 'containers/row', :locals => { :container => container }
	end

	def display_containers(owner = 0)
		containers = Container.find(:all, :order => :order_show)
		if owner == 3
			containers = Container.find(:all, :conditions => {:user_id => current_user.id, :name => PRODUCT_ROOT}, :order => :order_show)  
		end
		
		unless containers.empty?

			ret = "<ul id=\"root\">"
			for container in containers
				if container.parent_id.nil?
					ret += "<li id=\"c_#{container.id}\">"+link_to_container(container,owner)
					subContainer = find_all_subcontainers(container,owner)
					unless subContainer.nil?
						ret += subContainer
						ret += "</li>"
					end
				end
			end
			ret += "</ul>"
		else
			ret = "Nessuna categoria disponibile"
		end
	end

  def find_all_subcontainers(container,owner)
  	if container.children.size > 0
  		  ret = "<ul id=\"p_#{container.id}\">"
  		  Container.find(:all, :conditions => {:parent_id => container.id}, :order => :order_show).each{ |subcat|
  			if subcat.children.size > 0
  			  ret += "<li id=\"c_#{subcat.id}\">"+link_to_container(subcat,owner)
  			  ret += find_all_subcontainers(subcat,owner)
  			  ret += '</li>'
  			else
  			  ret += "<li id=\"c_#{subcat.id}\">"+link_to_container(subcat,owner)+"</li>"
  			end
  			}
  		  ret += '</ul>'
  	end
  end
  
  def root_node(name,container, _class="")
		r = "<ul class='#{_class}'>"
		places = Place.where(:name => name)
		unless places.blank?
			places.first.containers.order("order_show ASC").each do |node|
			  
			  if node.is_public.to_i==1
  				r += "<li>"
  				r += link_to node.name.upcase, frontend_path(node), :class => gimmie_class(node, container, "active")
  				r += "</li>"
			  end
			end
		end
		r += "</ul>"
	end
	
	def gimmie_class(node, container, class_name)
	  unless container.blank?  	 
  	 if node.name.downcase==container.name.downcase
  	  class_name
  	 end
	  end
	end
	
	# fix text...
	def fix_text(text)
	  return text.html_safe
  end
  
  def difference_date(date,type="f")
    type=="f" ? r="inserita " : r="inserito "
		d = Date.today-date.to_date
		if d.to_i == 0
			r += "oggi"
		else
		  d.to_i==1 ? r += "#{d.to_i} giorno fa" : r += "#{d.to_i} giorni fa"
		end
    return r
  end
  
  def f_date(date)
    date.strftime("%m/%d/%Y")
  end
  
  def link_container(po)
    container_path(Container.where(:place_holder => po).first).to_s
  end
end
