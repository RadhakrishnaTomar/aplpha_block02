class Article < ApplicationRecord
	# self.table_name = "my_acticles"
	belongs_to :user
	validates :title, presence: true   ,length:{minimum:5,maximum:7}
    validates :description, presence: true  , length:{minimum:10,maximum:15}
    # has_secure_password
end
