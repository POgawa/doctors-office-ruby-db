class Doctor
    attr_reader(:name, :specialty, :id)

    define_method(:initialize) do |attributes|
      @name = attributes.fetch(:name)
      @specialty = attributes.fetch(:specialty)
      @id = attributes.fetch(:id)
    end

    define_singleton_method(:all) do
      returned_doctors = DB.exec("SELECT * from doctors;")
      doctors = []
      returned_doctors.each() do |doctor|
        name = doctor.fetch("name")
        specialty = doctor.fetch("specialty")
        id = doctor.fetch("id").to_i()
        doctors.push(Doctor.new({:name => name, :specialty => specialty, :id => id}))
      end
      doctors
    end

    define_method(:save) do
      result = DB.exec("INSERT INTO doctors (name, specialty) VALUES ('#{@name}', '#{@specialty}') RETURNING id;")
      @id = result.first().fetch("id").to_i()
    end

    define_method(:==) do |another_doctor|
      self.name().==(another_doctor.name()).&(self.specialty().==(another_doctor.specialty())).&(self.id().==(another_doctor.id()))
    end



    def doctor_patients
      output = []
      patients = DB.exec("SELECT * FROM patients WHERE dr_id = #{self.id()};")
      patients.each() do |patient|
        name = patient.fetch("name")
        birthday = patient.fetch("birthday")
        id = patient.fetch("id").to_i
        dr_id = patient.fetch("dr_id").to_i
        output.push(Patient.new({:name => name, :birthday => birthday, :id => id, :dr_id => dr_id}))
        end
      output
    end



end
