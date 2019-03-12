# inputs:
# - str
# outputs:
# - str
# reqs:
# - take a str as input
# - rtn a new str where each letter of the original str is shifted by 13 chars
# rules:
# - 'a'->'n', 'b'->'o',...,'m'->'z', 'n'->'a', 'o'->'b',...,'z'->'m'
# - if the char is in range 'a'..'m', replace w/ char that follows 13 letters after it
# - if the char is in range 'l'..'z', replace w/ char that precedes it by 13 letters
# struct:
# - arr
# algo:
# - split the str into an arr of chars
# - for each char in the arr
#   - find the ndx of the char in the alphabet
#   - map the replacement char from
#     - ndx + 13 if ndx < 13
#     - ndx - 13 if ndx >= 13
# - join the mapped chars to form a new str
# - rtn the str

ALPHABET = ('a'..'z').to_a

def rot13(str)
  arr = str.chars
  arr.map! do |char|
    lowercase_char = char.downcase
    if ALPHABET.include?(lowercase_char)
      ndx = ALPHABET.index(lowercase_char)
      new_char = ndx < 13 ? ALPHABET[ndx + 13] : ALPHABET[ndx - 13]
      char == lowercase_char ? new_char : new_char.upcase
    else
      char
    end
  end
  arr.join
end

names = [
  "Nqn Ybirynpr",
  # Tenpr Ubccre,
  # Nqryr Tbyqfgvar,
  # Nyna Ghevat,
  # Puneyrf Onoontr,
  "Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv",
  # Wbua Ngnanfbss,
  # Ybvf Unvog,
  # Pynhqr Funaaba,
  # Fgrir Wbof,
  # Ovyy Tngrf,
  # Gvz Orearef-Yrr,
  # Fgrir Jbmavnx,
  # Xbaenq Mhfr,
  # Fve Nagbal Ubner,
  # Zneiva Zvafxl,
  # Lhxvuveb Zngfhzbgb,
  # Unllvz Fybavzfxv,
  "Tregehqr Oynapu"
]
puts names.map { |name| rot13(name) }
