require "flap/version"

module Flap
  def self.included(base)
    Module.__send__ :include, ModuleMethods
  end

  # Public: tap + instance_eval
  #
  # block - call in receiver's context
  #
  # Examples
  #   hash = {a: 1, b: 2}
  #   hash.instance_tap_eval { delete :a } #=> {:b => 2}
  #
  # Returns self
  def instance_tap_eval(&block)
    self.instance_eval &block if block_given?
    self
  end

  # Deprecated: same as instance_tap_eval
  def flap(&block)
    warn "[deprecated] this method will be removed."
    instance_tap_eval &block
  end

  module ModuleMethods
    # Public: tap + class_eval
    #
    # block - call in class context
    #
    # Examples
    #   Klass = Class.new.class_tap_eval { include Awesome }
    #   Klass.new.awesome_method
    #
    # Returns self
    def class_tap_eval(&block)
      class_eval &block if block_given?
      self
    end
  end

  # Public: define alias methods itap/ctap.
  #
  # Returns self
  def self.enable_short_methods!
    Object.__send__ :include, ShortMethods
  end

  module ShortMethods
    def self.included(base)
      base.class_eval do
        alias_method :itap, :instance_tap_eval
        Module.class_eval do
          alias_method :ctap, :class_tap_eval
        end
      end
    end
  end
end

Object.__send__ :include, Flap
