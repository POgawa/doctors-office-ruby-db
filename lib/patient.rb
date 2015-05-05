class Patient
  attr_reader(:name, :birthday, :id, :dr_id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @birthday = attributes.fetch(:birthday)
    @dr_id = attributes.fetch(:dr_id)
    @id = attributes.fetch(:id)
  end


  def save
    DB.exec("INSERT into patients (name, birthday, id, dr_id) VALUES ('#{@name}', '#{@birthday}', #{@id}, #{@dr_id});")
  end

  def self.all
    returned_patients = DB.exec("SELECT * FROM patients;")
    patients = []
    returned_patients.each() do |patient|
      name = patient.fetch("name")
      birthday = patient.fetch("birthday")
      id = patient.fetch("id").to_i
      dr_id = patient.fetch("dr_id")
      patients<<(Patient.new({:name => name, :birthday => birthday, :id => id, :dr_id => dr_id}))
    end
    patients
  end

  define_method(:==) do |another_person|
    self.id().==(another_person.id())
  end

  def assign_doctor dr_id
    # patients = DB.exec("SELECT * FROM patients where id = #{self.id};")
    @dr_id = dr_id
    doctor_id = DB.exec("UPDATE patients SET dr_id = #{@dr_id} WHERE id = #{self.id()};")

  end


end
