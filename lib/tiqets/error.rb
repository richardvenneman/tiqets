module Tiqets
  class Error < Exception
    attr_reader :code, :message

    def initialize(code, error)
      @code = code
      @error = error

      super(message)
    end

    def message
      "Tiqets API error: #{@error}"
    end
  end
end
