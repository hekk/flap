require "flap/version"

module Flap
  def flap(&block)
    self.instance_eval &block if block_given?
    self
  end
end

Object.__send__ :include, Flap
