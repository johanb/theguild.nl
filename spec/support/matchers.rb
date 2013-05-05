module Matchers
  RSpec::Matchers.define :assign_to do |ivar|
    match do |controller|
      !assigns(ivar).nil? &&
        (!@with || assigns(ivar) == @expected_object)
    end

    chain :with do |obj|
      @with = true
      @expected_object = obj
    end

    failure_message_for_should do |controller|
      if @with
        "Expected #{controller.class} to assign #{@expected_object.inspect} to #{ivar}, but it was #{assigns(ivar).inspect}"
      else
        "Expected #{controller.class} to assign to #{ivar}, but it didn't"
      end
    end

    failure_message_for_should_not do |controller|
      if @with
        "Expected #{controller.class} not to assign #{@expected_object.inspect} to #{ivar}, but it did"
      else
        "Expected #{controller.class} not to assign to #{ivar}, but it did"
      end
    end
  end
end
