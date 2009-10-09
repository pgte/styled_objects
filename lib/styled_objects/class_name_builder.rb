class StyledObjects::ClassNameBuilder
  def self.build_class_name_from_partial_path(partial_path)
     "so-#{partial_path.gsub(/-/, '--').gsub(/\//, '-').gsub(/_|\.css|\/\/|\.\./, '')}"
  end
end