Place.create!([
  {owner_id: 1, title: "New York's House", kind: "", max_guest: 5, price: nil, bed_type: "", num_bathrooms: "4", num_beds: "", country: "", city: "New York", neighborhood: "", address: "", picture: "http://goo.gl/Mfmevh"},
  {owner_id: 1, title: "Chicago's House", kind: "nice", max_guest: 5, price: nil, bed_type: "", num_bathrooms: "", num_beds: "", country: "", city: "Chicago", neighborhood: "", address: "", picture: "http://goo.gl/6IajKV"},
  {owner_id: 1, title: "SF's House", kind: "", max_guest: 5, price: nil, bed_type: "", num_bathrooms: "", num_beds: "", country: "", city: "San Francisco", neighborhood: "", address: "", picture: "http://goo.gl/2KHzuw"},
  {owner_id: 1, title: "Seattle's House", kind: "", max_guest: 5, price: 545, bed_type: "", num_bathrooms: "", num_beds: "", country: "", city: "Seattle", neighborhood: "", address: "", picture: "http://goo.gl/2W31Ot"}
])
Request.create!([
  {place_id: 3, applicant_id: 3, start_date: "2014-06-27", end_date: "2014-07-04", message: "", approved: true},
  {place_id: 3, applicant_id: 2, start_date: "2014-06-25", end_date: "2014-06-30", message: "", approved: false}
])
ReservedDate.create!([
  {place_id: 3, day: "2014-06-27"},
  {place_id: 3, day: "2014-06-28"},
  {place_id: 3, day: "2014-06-29"},
  {place_id: 3, day: "2014-06-30"},
  {place_id: 3, day: "2014-07-01"},
  {place_id: 3, day: "2014-07-02"},
  {place_id: 3, day: "2014-07-03"},
  {place_id: 3, day: "2014-07-04"}
])
User.create!([
  {email: "jorar91@gmail.com", password_digest: "$2a$10$lRyAQJZICyfUp5vv09lAQOWijYhQoX2yycmQhcnTtCMZBkXNzJVam", session_token: "MiGSZTUyNprs1QcE4zVpuQ", fname: "Teo", lname: "", education: "gives hand", job: "none", sex: "", picture: "http://goo.gl/gCttuv"},
  {email: "quira@gmail.com", password_digest: "$2a$10$5UmJ0go1gqkSOyCttaNpauUAi8VT.29Na4H2Ll.6i/SokcWBWZvTi", session_token: "a-g-pgV4vXecWpGJZEIHzA", fname: "quira", lname: "", education: nil, job: nil, sex: nil, picture: nil},
  {email: "lolo@gmail.com", password_digest: "$2a$10$9QxAtW5iIO9/QwdVH8DCR.sIgct13G4At.xOEssCGlJREdHvp360e", session_token: "jIqswYASf9K8tT9fdrN3eQ", fname: "Lolo", lname: "", education: nil, job: nil, sex: nil, picture: nil}
])
