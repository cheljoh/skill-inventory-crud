require_relative '../test_helper'

class UserDeletesSkillTest < FeatureTest 

  def test_user_deletes_skill
    data = {
          title: "some skill",
          description: "some description"
        }

    skill_inventory.create(data)

    visit '/skills'

    within '#skills' do
      assert page.has_content?("some skill")
    end

    click_button("Delete")

    within '#skills' do
      refute page.has_content?("some skill")
    end
  end


end
