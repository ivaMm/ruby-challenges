# frozen_string_literal: true

def password_generator(size)
  chars = [*('a'..'z'), *('A'..'Z'), *(0..9), '#', '$', '%', '&', '@', '?', '!']
  chars.sample(size).join
end
