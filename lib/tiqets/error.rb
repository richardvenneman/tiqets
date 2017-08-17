module Tiqets
  class Error < Exception
    attr_reader :code, :error

    def initialize(code, error)
      @code = code
      @error = error

      super(message)
    end

    def message
      message = "Tiqets API Error: #{@error}"
      message += " (code: #{@code})" unless @code.nil?
      message
    end
  end
end
