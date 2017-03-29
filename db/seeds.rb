Neighborhood.destroy_all
Proposal.destroy_all

nw_brooklyn_list = ["Brooklyn Heights",
"Brooklyn Navy Yard",
"Cadman Plaza",
"Clinton Hill",
"Downtown Brooklyn",
"Bridge Plaza",
"DUMBO",
"Fort Greene",
"Fulton Ferry",
"Pacific Park-Atlantic Yards",
"Prospect Heights",
"Vinegar Hill",
"Boerum Hill",
"Carroll Gardens",
"Columbia Street Waterfront District",
"Cobble Hill",
"Gowanus",
"Park Slope",
"South Park Slope",
"Greenwood Heights",
"Red Hook"]


nw_brooklyn_list.each do | name |
  p = Neighborhood.new
  p.name = name
  p.save
end

users_list = {
    "EPK5" => {
      :email => "epk5@gmail.com",
      :password_digest => "Riley1",
      :neighborhood_id => 5
    },
    "NHowie" => {
      :email => "nhowie@gmail.com",
      :password_digest  => "Nemo2",
      :neighborhood_id => 5
    },
    "Delaney7" => {
      :email => "delaneym@gmail.com",
      :password_digest  => "Martin10",
      :neighborhood_id => 8
    },
    "Jacks1010" => {
      :email => "jackson@gmail.com",
      :password_digest  => "MartinDog",
      :neighborhood_id => 8
    },
    "MarkyMark" => {
      :email => "canadian@gmail.com",
      :password_digest  => "maplesyrup",
      :neighborhood_id => 4
    },
    "LocalCurmudgeon" => {
      :email => "crankey@gmail.com",
      :password_digest  => "ihatethis",
      :neighborhood_id => 7
    },
  }

users_list.each do |username, details|
  p = User.new
  p.username = username
  details.each do |attribute, value|
      p[attribute] = value
  end
  p.save
end


proposals_list = {
    "A new dog park" => {
      :content => "The population of downtown Brooklyn is exploding. With so many new dog-friendly buildings, it would be wonderful to have a dog park in the downtown area.",
      :user_id => 13,
      :neighborhood_id => 89
    },
    "More bike lanes" => {
      :content => "More bike lanes would make it easier to get around the neighborhood.",
      :user_id => 15,
      :neighborhood_id => 91
    },
  }

  proposals_list.each do |title, details|
    p = Proposal.new
    p.title = title
    details.each do |attribute, value|
        p[attribute] = value
    end
    p.save
  end


p "Created #{Neighborhood.count} Neighborhoods"
p "Created #{User.count} Neighbors"
p "Created #{Proposal.count} Proposals"
