def leet_classes
  (0..1336).map do |i|
    ass = i
    class_name = "Klass#{ass}"
    class_itself = Class.new do
      define_method("method#{ass}") do
        Random.rand
      end

      self.define_singleton_method("function#{ass}") do
        Random.rand
      end
    end
    Object.const_set class_name, class_itself
    class_itself
  end
end
