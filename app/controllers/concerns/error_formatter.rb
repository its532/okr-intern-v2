module ErrorFormatter
  def self.format(model)
    model.errors.full_messages.join("\n")
  end
end
