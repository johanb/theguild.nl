module LetAll
  def let_all(name, &block)
    ivar = "@#{name}"
    before(:all) { instance_variable_set(ivar, instance_eval(&block)) }
    after(:all)  { instance_variable_get(ivar).destroy }
    let(name)    { instance_variable_get(ivar) }
  end
end
