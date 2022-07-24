# frozen_string_literal: true

require "test_helper"

class New::Asker::GuiTest < Test::Unit::TestCase
  test "VERSION" do
    assert do
      ::New::Asker::Gui.const_defined?(:VERSION)
    end
  end

  test "something useful" do
    assert_equal("expected", "actual")
  end
end
