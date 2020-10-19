# french_ssn_info("1 84 12 76 451 089 46")
# => "a man, born in December, 1984 in Seine-Maritime."

# french_ssn_info("123")
# => "The number is invalid"

require_relative "../interface"

describe "#french_ssn_info" do
  it "should not pass for invalid number" do
    result = french_ssn_info("123")
    expected = "The number is invalid"

    expect(result).to eq(expected)
  end

    it "should return ssn information" do
    result = french_ssn_info("1 84 12 76 451 089 46")
    expected = "a Masculin, born in December, 1984 in Seine-Maritime."

    expect(result).to eq(expected)
  end
end