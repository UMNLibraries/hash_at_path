module HashAtPath
  class Path
    class << self
      def parse(path_string)
        path_string = replace_predicates(path_string)
        extract_path_data(path_string)
      end

      def replace_predicates(path_string)
        path_string.gsub!(/first\(\)/, "0")
        path_string.gsub!(/last\(\)/, "-1")
        path_string
      end

      # Extracts paths and predicates from the provide full path
      def extract_path_data(path_string)
        results = array_wrap(path_string.scan(/([^\[]*)(\[)*(\d|\-\d|\*)*(\])*/i))
        results.map {|match| {:path => match[0], :predicate => match[2]}}
      end

      private
      # Stolen from activesupport/lib/active_support/core_ext/array/wrap.rb
      def array_wrap(object)
        if object.nil?
          []
        elsif object.respond_to?(:to_ary)
          object.to_ary || [object]
        else
          [object]
        end
      end
    end
  end
end