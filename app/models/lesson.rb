class Lesson < ActiveRecord::Base
    before_save :default_level
    
    protected
    
    def default_level
        self.level ||= Lesson.all.length + 1
    end
end
