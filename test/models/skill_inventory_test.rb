require_relative '../test_helper'

class SkillInventoryTest < Minitest::Test
  include TestHelpers

  def test_view_all_skills
    data = {
          id: 1,
          title: "some skill",
          description: "some description"
        }
    skill_inventory.create(data)
    assert_equal 1, skill_inventory.all.length

  end

  def test_find_a_skill
    data1 = {
          id: 1,
          title: "some skill",
          description: "some description"
        }
    data2 = {
          id: 2,
          title: "jumping",
          description: "a lot"
        }
    skill_inventory.create(data1)
    skill_inventory.create(data2)
    assert_equal "jumping", skill_inventory.find(2).title
  end

  def test_update_skill
    data1 = {
          id: 1,
          title: "some skill",
          description: "some description"
        }
    skill_inventory.create(data1)

    assert_equal "some skill", skill_inventory.all.last.title

    updated = {
          "title" => "karate",
          "description" => "fun"
        }
    skill_inventory.update(updated, 1)
    assert_equal "karate", skill_inventory.all.last.title

  end

  def test_delete_skill
    data1 = {
          id: 1,
          title: "some skill",
          description: "some description"
        }
    data2 = {
          id: 2,
          title: "jumping",
          description: "a lot"
        }
    skill_inventory.create(data1)
    skill_inventory.create(data2)
    assert_equal "jumping", skill_inventory.all.last.title
    skill_inventory.delete(2)
    assert_equal "some skill", skill_inventory.all.last.title

  end

end
