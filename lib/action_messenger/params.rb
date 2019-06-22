module ActionMessenger
  # Provides uniform access to the default param values.
  class Params
    def self.defaults
      {
        mime_version: '1.0',
        charset: 'UTF-8',
        content_type: 'text/plain'
      }.freeze
    end
  end
end
