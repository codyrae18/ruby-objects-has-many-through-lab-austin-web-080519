require_relative 'patient'
require_relative 'appointment'

class Doctor
attr_reader :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end


    def self.all
        @@all
    end

    def new_appointment(patient, date)
       appointment = Appointment.new(date, patient, self)
    end

    def appointments
        Appointment.all.select {|appointment| appointment.doctor == self}
    end
    
    def patients
        appointments.collect {|app| app.patient}
    end

        
end
