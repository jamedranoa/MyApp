Place.create!([
  {owner_id: 1, title: "fadfa", kind: "nice", max_guest: 5, price: 545, bed_type: "dfadf", num_bathrooms: "", num_beds: "", country: "", city: "", neighborhood: "", address: "", picture: "http://goo.gl/2W31Ot"},
  {owner_id: 1, title: "primero ", kind: "", max_guest: 5, price: nil, bed_type: "", num_bathrooms: "", num_beds: "", country: "", city: "", neighborhood: "", address: "", picture: "http://goo.gl/Mfmevh"}
])
Request.create!([
  {place_id: 3, applicant_id: 1, start_date: "2014-07-06", end_date: "2014-07-08", approved: nil}
])
ReservedDate.create!([
  {place_id: 3, day: "2014-06-27"}
])
User.create!([
  {email: "jorar91@gmail.com", password_digest: "$2a$10$lRyAQJZICyfUp5vv09lAQOWijYhQoX2yycmQhcnTtCMZBkXNzJVam", session_token: "wRao3g95GSFrhXp_wA042w", fname: "Teo", lname: "", education: "gives hand", job: "none", sex: "", picture: "http://goo.gl/gCttuv"}
])
