class User < ActiveRecord::Base
    before_save :default_level
    has_secure_password
    
    protected
    
    def default_level
        self.level ||= '1'
    end
end
