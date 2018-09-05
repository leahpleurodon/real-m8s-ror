# frozen_string_literal: true

users = [
  {
    first_name: 'Erica',
    last_name: 'Murnane',
    gender: 'female',
    username: 'ricammm',
    dob: '07/03/1990',
    active: true,
    email: 'facehead@email.com',
    password: 'pudding'
  },
  {
    first_name: 'Dave',
    last_name: 'Jackson',
    gender: 'male',
    username: 'genocyyydal',
    dob: '14/06/1950',
    active: true,
    email: 'son@email.com',
    password: 'pudding'
  },
  {
    first_name: 'Amy',
    last_name: 'Bullard',
    gender: 'female',
    username: 'amy',
    dob: '19/04/1989',
    active: true,
    email: 'amyb@email.com',
    password: 'pudding'
  },
  {
    first_name: 'Paul',
    last_name: 'Attard',
    gender: 'male',
    username: 'paulipoo',
    dob: '17/06/1990',
    active: true,
    email: 'dsd@email.com',
    password: 'pudding'
  },
  {
    first_name: 'Sam',
    last_name: 'Ketel',
    gender: 'female',
    username: 'sammy',
    dob: '19/04/1993',
    active: true,
    email: 'samk@email.com',
    password: 'pudding'
  },
  {
    first_name: 'Leah',
    last_name: 'Eramo',
    gender: 'female',
    username: 'leelee',
    dob: '13/03/1991',
    active: true,
    email: 'sonofawesome@email.com',
    password: 'pudding'
  }
]

users.each do |u|
  
  user = User.new(u)
  user.save
  MateProfile.create(user: user)
end
