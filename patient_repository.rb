require "csv"
require_relative "patient"

class PatientsRepository
    def initialize(csv_filepath)
        @csv_filepath = csv_filepath
        @patients     = []
        @next_id      = 1

        load_csv()
    end

    def all
        @patients
    end

    def create(patient)
        patient.id = @next_id
        @next_id += 1
        
        @patients << patient

        save_csv()
    end

    private

    def save_csv
        CSV.open(@csv_filepath, "wb") do |csv|
            csv << [ "id", "name", "cured" ]

            @patients.each do |patient|
                csv << [ patient.id, patient.name, patient.cured ]
            end
        end
    end

    def load_csv
        CSV.foreach(@csv_filepath, headers: :first_row, header_converters: :symbol) do |row|
            # { id:"1" name:"francesca" cured:"true" }

            # conversions
            row[:id]    = row[:id].to_i
            row[:cured] = (row[:cured] == "true")

            patient = Patient.new(row)

            @patients << patient
        end

        # increment the next used id

        # if @patients.empty?
        #     @next_id = 1
        # else
        #     @next_id = @patients.last.id + 1
        # end

        @next_id = @patients.empty? ? 1 : @patients.last.id + 1
    end
end

# test_repo = PatientRepository.new("patients.csv")

# test_patient = Patient.new(name: "roel")
# test_repo.create(test_patient)

# p test_repo.all