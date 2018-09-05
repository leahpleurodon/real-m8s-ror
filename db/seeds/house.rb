houses = [
    {
        house_type: "House",
        address: "13 Robb st Reservoir",
        state: "VIC",
        country: "AUS",
        rent: 403.4,
        join_code: "EEEEEEEE",
        bio: "Our house, is a very fine house..."
    },
    {
        house_type: "House",
        address: "23 Hall Street Epping",
        state: "VIC",
        country: "AUS",
        rent: 403.4,
        join_code: "FFFFFFFF",
        bio: "Our house, is a very fine house..."
    },
    {
        house_type: "Apartment",
        address: "4/1 Lambeth Pace St Kilda",
        state: "VIC",
        country: "AUS",
        rent: 403.4,
        join_code: "GGGGGGGG",
        bio: "Our house, is a very fine house..."
    }
]

houses.each do |h|
    House.create(h)
end