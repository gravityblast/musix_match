module MusixMatch
  module Models    
    module Model
      def self.included(base)
        base.send(:extend, ClassMethods)
        ModelBuilder.build_constructor(self)
      end            
            
      module ClassMethods
        def model_with_attributes(*attributes)
          attr_accessor(*attributes)
          ModelBuilder.build_constructor(self, *attributes)
        end
        
        def search(options={})
          API::Search.send("search_#{self.name.split('::').last.downcase}", options)
        end
        
        def get(item_id)
          API::Finder.send("find_#{self.name.split('::').last.downcase}", item_id)
        end                
      end
    end
    
    module ModelBuilder            
      def self.build_constructor(base, *attributes)        
        initialize_method = Proc.new do |*params|
          model_params = params.first || {}
          attributes.each do |attribute|
            instance_variable_set("@#{attribute}", model_params.delete(attribute.to_s))
          end
        end      
        base.send(:define_method, :initialize, &initialize_method)
      end            
    end        
  end
end