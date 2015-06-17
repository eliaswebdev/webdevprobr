module PostsHelper	
	def s(status)
		case status
			when true then s = '<label class="label-success">Publicado</label>'.html_safe
			when false then s = '<label class="label-danger">Não Publicado</label>'.html_safe
		end
		return s
	end
end
