require_relative "patient"
require_relative "room"

francesca = Patient.new(name: "francesca")
nui       = Patient.new(name: "nui")
roel      = Patient.new(name: "roel")

room_1 = Room.new(capacity: 2)

# Associate Patient to Room
room_1.admit_patient(francesca)
room_1.admit_patient(nui)
# room_1.admit_patient(roel)

p room_1