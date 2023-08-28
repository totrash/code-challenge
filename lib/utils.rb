module Utils
  def camelize(input)
    input.split(/[\s_]/).map(&:capitalize).join
  end

  def classify(input)
    camelize(input).sub(/^(.)/) { $1.upcase }
  end

  def constantize(class_name)
    Object.const_get(class_name)
  end

  def blank?(obj)
    obj.respond_to?(:empty?) ? !!obj.empty? : !obj
  end

  def present?(obj)
    !Utils.blank?(obj)
  end

  module_function :camelize, :classify, :constantize, :present?, :blank?
end