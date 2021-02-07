class User < ApplicationRecord
    has_many :documents
    has_secure_password
end
