require "strict_return/version"

module StrictReturn
  def void(method_name)
    self.prepend(Module.new do
      eval "
        def #{method_name}(*args)
          super
          nil
        end
      "
    end)
  end
end
