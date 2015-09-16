class CreatePassword
  class << self
    CHARACTERS = {
      numbers: [*0..9],
      alpha_bigs: [*'A'..'Z'],
      alpha_smalls: [*'a'..'z'],
      symbols: %w(~ ! @ # $ % ^ & * ( ) _ - + = { } [ ] ¥ | : ; " ' < > , . ? /)
    }
    LENGTH = 8

    def create
      password = []
      CHARACTERS.each { |_, value| password << value.sample }
      while password.uniq.length != LENGTH
        password =  password.uniq + (CHARACTERS[:numbers] + CHARACTERS[:alpha_bigs] + CHARACTERS[:alpha_smalls] + CHARACTERS[:symbols]).sample(LENGTH - password.length)
      end
      puts password.shuffle.join
    end
  end
end

CreatePassword.create if $0 == __FILE__
