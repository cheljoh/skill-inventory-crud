require_relative '../test_helper'

class SkillInventoryTest < Minitest::Test
  include TestHelpers

  def test_create_skill
    data = {
          "id" => 1,
          "title" => "some skill",
          "description" => "some description"
        }
    skill = Skill.new(data)
    assert_equal 1, skill.id
    assert_equal "some skill", skill.title
    assert_equal "some description", skill.description
  end

end
