admin = User.new(
  email: "admin@admin.com",
  password: "adminadmin",
  password_confirmation: "adminadmin"
)
admin.add_role :admin
admin.save!

vendor = User.new(
  email: "vendor@vendor.com",
  password: "vendorvendor",
  password_confirmation: "vendorvendor"
)
vendor.add_role :vendor
vendor.save!

worker = User.new(
  email: "worker@worker.com",
  password: "workerworker",
  password_confirmation: "workerworker"
)
worker.add_role :worker
worker.save!

for i..15
  Client.create!( name: "Cliente #{i}" )
  i++
end
