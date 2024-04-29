class Patient
    def initialize(attributes = {})
        @name  = attributes[:name]            # String
        @cured = attributes[:cured] || false  # Boolean
        @id    = attributes[:id]
    end

    attr_reader :name, :cured
    attr_accessor :room, :id

    def cured?
        @cured
    end

    def cure!
        @cured = true
    end
end
