require "spec_helper"

describe(Patient) do
  describe(".all") do
    it("is empty at first") do
      expect(Patient.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("adds a patient to the array of saved pateints") do
      test_patient = Patient.new({:name => "Dave", :birthday => "1991-12-13 00:00:00", :id => 1, :dr_id => 1})
      test_patient.save()
      expect(Patient.all()).to(eq([test_patient]))
    end
  end

  describe('#doctor') do
    it("assigns a patient to a doctor") do
      test_patient = Patient.new({:name => "Dave", :birthday => "1991-12-13 00:00:00", :id => 1, :dr_id => 0})
      test_patient.save()
      test_patient.assign_doctor(1)
      expect(test_patient.dr_id()).to(eq(1))
    end
  end

end
