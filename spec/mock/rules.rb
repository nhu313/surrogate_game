require 'surrogate/rspec'

class MockRules

  Surrogate.endow(self)

  define(:tied?) do
    false
  end

  define(:winner)

end
