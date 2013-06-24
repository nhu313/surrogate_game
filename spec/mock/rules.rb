require 'surrogate/rspec'

class MockRules

  Surrogate.endow(self)
  define(:tied?)
  define(:winner)

  define(:winner?) do |player|
    #do something?
  end

end
