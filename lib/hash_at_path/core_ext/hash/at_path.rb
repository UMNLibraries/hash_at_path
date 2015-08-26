module HashAtPath
  module CoreExt
    module Hash
      module AtPath
        # Returns a value at the end of an xpath-like/lite path
        def at_path(path)
          out = {}
          if path == '/'
              self
          else
            extract(self, path)
          end
        end

        private

        def extract(val, path_string)
          predicate = nil
          Path.parse(path_string).each do |path_parts|
            return nil if val.nil?
            predicate = path_parts[:predicate] unless predicate == '*'
            val, predicate = get_value_at_path(predicate, path_parts[:path], val)
            val = val[predicate.to_i] unless is_blank?(predicate) || predicate == '*' || !issa(val, 'Array')
          end
          val
        end

        def get_value_at_path(predicate, path, val)
          if predicate == '*' && issa(val, 'Array') && !is_blank?(path)
            val = val.map {|item| unwind_path(item, path)}
            predicate = nil
          elsif !is_blank?(path) && issa(val, 'Hash')
            val = unwind_path(val, path)
          end
          [val, predicate]
        end

        def issa(item, classname)
          item.class.to_s == classname
        end

        def unwind_path(val, path)
          path_keys(path).inject(val) { |item, path_key| (issa(item, 'Hash')) ? item.fetch(path_key, nil) : nil}
        end

        # Be nice: remove empty path items (e.g. when we get a leading slash)
        def path_keys(path)
          path.split("/").reject { |c| c.empty? }
        end

        # Stolen from activesupport/lib/active_support/core_ext/object/blank.rb
        def is_blank?(object)
          object.respond_to?(:empty?) ? !!object.empty? : !object
        end
      end
    end
  end
end