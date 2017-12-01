module Logging
  extend ActiveSupport::Concern
  
  included do 
    before_save :generate_activities, :unless => :new_record?

    def generate_activities
      log_string = prepare_statements
      if self.class.get_logable_attr.map{ |a| self.send("#{a.to_s}_changed?") }.include? true
        self.activity_logs.create(changes_text: log_string)
      end
    end

    def prepare_statements
      log_string = ''
      self.class.get_logable_attr.each do |attribute|
        next if self.changes[attribute].blank?
        param1 = self.changes[attribute][0]
        param2 = self.changes[attribute][1]
        log_string += "#{attribute.to_s.humanize} has changed from #{param1} to #{param2} \n "
      end
      log_string
    end
  end


  module ClassMethods

    def logable_attr(*attr_names)
      @@logable_attr =attr_names 
    end

    def get_logable_attr
      @@logable_attr || []  
    end

  end
end