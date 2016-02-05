require_relative '../test_helper'

class SkillInventoryTest < Minitest::Test
  include TestHelpers

  def test_create_a_skill
    data = {
           title: "some skill",
           description: "some description"
         }
    skill_inventory.create(data)
    assert_equal 'some skill', skill_inventory.all.last.title
    assert_equal 'some description', skill_inventory.all.last.description
  end

  def test_view_all_skills
    data = {
          title: "some skill",
          description: "some description"
        }
    skill_inventory.create(data)
    assert_equal 1, skill_inventory.all.length
  end

  def test_find_a_skill
    data1 = {
          title: "some skill",
          description: "some description"
        }
    data2 = {
          title: "jumping",
          description: "a lot"
        }
    skill_inventory.create(data1)
    skill_inventory.create(data2)
    id = skill_inventory.all.last.id
    assert_equal "jumping", skill_inventory.find(id).title
  end

  def test_update_skill
    data1 = {
          title: "some skill",
          description: "some description"
        }

    skill_inventory.create(data1)

    id = skill_inventory.all.last.id

    assert_equal "some skill", skill_inventory.all.last.title

    updated = {
          "title" => "karate",
          "description" => "fun"
        }
    skill_inventory.update(updated, id)
    assert_equal "karate", skill_inventory.all.last.title

  end

  def test_delete_skill
    data1 = {
          title: "some skill",
          description: "some description"
        }
    data2 = {
          title: "jumping",
          description: "a lot"
        }

    skill_inventory.create(data1)
    skill_inventory.create(data2)

    id = skill_inventory.all.last.id

    assert_equal "jumping", skill_inventory.all.last.title
    skill_inventory.delete(id)
    assert_equal "some skill", skill_inventory.all.last.title
  end

end
