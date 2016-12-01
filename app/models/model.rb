class Model < ActiveRecord::Base

	mount_uploader :file, ModelUploader
	attr_acccessible :file

end
