class Item < ActiveRecord::Base
	after_save :guardar_archivo
	ITEMS = File.join Rails.root, 'public', 'archivo_store'
	def archivo=(file_data)
		unless file_data.blank?
			@file_data = file_data
			self.formato = file_data.original_filename.split('.').last.downcase
			self.peso = 20 # File.size(archivo_filename)
		end
	end
	def archivo_filename
		File.join ITEMS, "#{id}.#{formato}"
	end
	def archivo_path
		"/archivo_store/#{id}.#{formato}"
	end
	def has_archivo?
		File.exists? archivo_filename
	end

	private
	def guardar_archivo
		if @file_data
			FileUtils.mkdir_p ITEMS
			File.open(archivo_filename, 'wb') do |f|
				f.write(@file_data.read)
			end
			@file_data=nil
		end
	end
end
