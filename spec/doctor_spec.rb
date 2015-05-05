require "spec_helper"


describe(Doctor) do
  describe('.all') do
    it ('is empty at first') do
      expect(Doctor.all()).to(eq([]))
    end
  end
end
