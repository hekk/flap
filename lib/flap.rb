require "flap/version"

module Flap
  def flap(&block)
    self.instance_eval &block if block_given?
    self
  end
end

Object.include Flap
