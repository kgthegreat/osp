require 'test_helper'

class SchoolTest < ActiveSupport::TestCase

  fixtures :schools

  test "name cannot be blank" do
    school = schools(:invalid_school_without_name)
    assert !school.valid?
    assert school.errors.invalid?(:name)
  end

  test "description cannot be blank" do
    school = schools(:invalid_school_without_description)
    assert !school.valid?
    assert school.errors.invalid?(:description)
  end

  test "can save school valid with name and description" do
    school = schools(:valid_school_with_name_description)
    assert school.valid?
    assert school.save
  end

  test "cannot save invalid school" do
    school = schools(:invalid_school_without_name)
    assert !school.valid?
    assert school.errors.invalid?(:name)
    assert !school.save
  end

end
