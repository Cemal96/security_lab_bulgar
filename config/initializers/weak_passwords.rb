begin
  RESTRICTED_PASSWORDS = IO.read(Rails.root + "config/weak_passwords").split
rescue
  puts "DICTIONARY WITH WEAK PASSWORD IS UNAVAILABLE! PLEASE CHECK 'config/weak_passwords' TO PROCEED"
  RESTRICTED_PASSWORDS = []
end