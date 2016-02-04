require_relative '../test_helper'

class UserDeletesSkillTest< Minitest::Test
  include Capybara::DSL
  include TestHelpers

  def test_user_deletes_skill
    data = {
          id: 1,
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
