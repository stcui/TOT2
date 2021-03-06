# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

oldRootUserArray = User.where(:email => "tot@tot.com")
oldUser = oldRootUserArray.first
if oldUser
	oldUser.password = 'totadmin'
	oldUser.set_role(USER_ROLE_SYSTEM_ADMIN)
	oldUser.save
else
	newRootUser = User.new(
		:email => "tot@tot.com",
		:password => 'totadmin',
	)
	newRootUser.set_role(USER_ROLE_SYSTEM_ADMIN)
	newRootUser.save!(:validate => false)
end
