require 'test_helper'
require 'User'

class UserTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "user saving" do
 assert User.create(:username=>'Mihai',:password=>'kinky')
 @users=User.find(:all,:conditions => "username='Mihai'");
 assert @users.size==1
  end
  test "user not saving" do
 User.create(:username=>'Mihai')
 @users=User.find(:all,:conditions => "username='Mihai'");
 assert @users.size==0
  end
  test "user authenticate" do
  user= User.authenticate 'dave','secret'
  assert_not_nil(user)
  end
  test "user authenticate fail" do
   user= User.authenticate 'edi','di'
   assert_nil(user)
  end
end
