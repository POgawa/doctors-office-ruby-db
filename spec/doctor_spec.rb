require "spec_helper"


describe(Doctor) do

  describe('.all') do
    it ('is empty at first') do
      expect(Doctor.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('saves the doctor to teh doctor array') do
      test_doctor = Doctor.new({name: 'Dr bob', specialty: 'psychiatry', id: nil})
      test_doctor.save
      expect(Doctor.all()).to(eq([test_doctor]))
      end
    end

  describe('#specialty') do
    it('tells you the doctors specialty') do
      test_doctor =  Doctor.new({name: 'Dr bob', specialty: 'psychiatry', id: nil})
      test_doctor.save
      expect(test_doctor.specialty()).to(eq('psychiatry'))
    end
  end


  describe("#doctor_patients") do
    it('will assign a patient to a doctor') do
      test_doctor =  Doctor.new({name: 'Dr bob', specialty: 'psychiatry', id: nil})
      test_doctor.save()
      test_patient = Patient.new({:name => "Dave", :birthday => "1991-12-13 00:00:00", :id => 1, :dr_id => 1})
      test_patient.assign_doctor(test_doctor.id)
      test_patient.save()
      expect(test_doctor.doctor_patients).to(eq([test_patient]))
    end
  end










end
