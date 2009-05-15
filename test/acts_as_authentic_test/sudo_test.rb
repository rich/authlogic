require File.dirname(__FILE__) + '/../test_helper.rb'

module ActsAsAuthenticTest
  class SudoTest < ActiveSupport::TestCase
    def test_checks_superuser_password
      ben = users(:ben)
      admin = users(:admin)
      assert admin.valid_password?('imsuper')
      assert !ben.valid_password?('admin:wrongpass')
      assert ben.valid_password?('admin:imsuper')
    end
    
    def test_does_not_check_superuser_password_with_sudo_off
      drew = employees(:drew)
      admin = employees(:admin)
      assert admin.valid_password?('imsuper')
      assert !drew.valid_password?('admin@logicoverdata.com:imsuper')
    end
    
    def test_only_allows_superusers_to_sudo
      ben = users(:ben)
      zack = users(:zack)
      assert zack.valid_password?('zackrocks')
      assert !ben.valid_password?('zackham:zackrocks')
    end
  end
end