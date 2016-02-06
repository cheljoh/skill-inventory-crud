require_relative '../test_helper'

class UserEditsSkillTest < FeatureTest 

  def test_user_edits_skill
    data = {
          title: "some skill",
          description: "some description"
        }

    skill_inventory.create(data)

    id = skill_inventory.all.last.id

    visit '/skills'

    within '#skills' do
      assert page.has_content?("some skill")
    end

    click_link("Edit")
    assert_equal "/skills/#{id}/edit", current_path

    fill_in('skill[title]', with: "karate")
    fill_in('skill[description]', with: "do it")
    click_button("Submit")

    assert_equal '/skills', current_path

    within '#skills' do
      assert page.has_content?("karate")
    end

  end


end
