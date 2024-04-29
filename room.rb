class Room
    def initialize(attributes = {})
        @capacity = attributes[:capacity]        # Integer
        @patients = attributes[:patients] || []  # Array of Patients
    end

    def full?
        @capacity == @patients.count
    end

    def admit_patient(patient)
        unless self.full?
            # associating patient to room
            @patients << patient

            # associating room to patient
            patient.room = self
        end
    end 
end