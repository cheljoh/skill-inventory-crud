require_relative '../test_helper'

#need to make git ignore for tmp

class UserCreatesSkillTest< Minitest::Test
  include Capybara::DSL
  include TestHelpers #teardown db after you test

  def test_does_it_read_page_contents
    visit '/'
    assert page.has_content?("Skill Inventory Palooza!")
  end

  def test_can_user_create_skill

    visit '/'
    click_link("New skill")

    assert_equal '/skills/new', current_path
    fill_in('skill[title]', with: "karate")
    fill_in('skill[description]', with: "do it")
    click_button("Submit")

    assert_equal '/skills', current_path

    within '#skills' do
      assert page.has_content?("karate")
    end

  end

end
