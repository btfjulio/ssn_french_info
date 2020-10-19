require "date"
require "yaml"

PATTERN = /(?<gender>[1-2]) (?<year>\d{2}) (?<month>[0-1][0-9]) (?<department>\d{2}) (?<digits6>\d{3} \d{3}) (?<digit2>\d{2})/

def french_ssn_info(ss_number)
  # 1 84 12 76 451 089 46
  data_match = ss_number.match(PATTERN)
  if data_match && is_valid?(ss_number, data_match)
    gender = set_gender(data_match)
    year = data_match[:year]
    month = find_month(data_match)
    department = find_department(data_match)
    "a #{gender}, born in #{month}, 19#{year} in #{department}."
  else
    "The number is invalid"
  end
end

def is_valid?(ss_number, data_match)
  ss_first_num = ss_number.gsub(/ /, "")[0...-2].to_i
  data_match[:digit2].to_i == (97 - ss_first_num) % 97
end

def find_department(data_match)
  yaml_file = YAML::load_file("data/french_departments.yml")
  yaml_file[data_match[:department]]
end

def set_gender(data_match)
  data_match[:gender] == "1" ? "Masculin" : "Feminin"
end

def find_month(data_match)
  Date::MONTHNAMES[data_match[:month].to_i]
end