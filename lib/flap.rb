require "flap/version"

module Flap
  def self.included(base)
    Module.__send__ :include, ModuleMethods
  end

  def instance_tap_eval(&block)
    self.instance_eval &block if block_given?
    self
  end

  def flap(&block)
    warn "[deprecated] this method will be removed."
    instance_tap_eval &block
  end

  module ModuleMethods
    def class_tap_eval(&block)
      class_eval &block if block_given?
      self
    end
  end

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
