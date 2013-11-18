module Robokassa
  mattr_accessor :interface_class

  # this allow use custom class for handeling api responces
  # === Example
  #   Robokassa.interface_class = MyCustomInterface
  #   Robokassa.interface_class.new(options)
  def self.interface_class
    @@interface_class || ::Robokassa::Interface
  end
end
