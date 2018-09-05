FactoryBot.define do
    factory :auth_user, class: User do
      first_name { 'leah' }
      last_name { 'eramo' }
      gender { 'female' }
      username { 'authy' }
      dob { '13/03/1991' }
      active { true }
      email { 'authymcauthface@email.com' }
      password { 'pudding' }
    end
end
  