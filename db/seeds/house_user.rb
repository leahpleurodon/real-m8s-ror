house_users = [
    {
        house: House.where(address: "23 Hall Street Epping").first,
        user: User.where(last_name: "Ketel").first,
        is_admin: true,
        active: true
    },
    {
        house: House.where(address: "23 Hall Street Epping").first,
        user: User.where(last_name: "Attard").first,
        is_admin: false,
        active: true
    },
    {
        house: House.where(address: "13 Robb st Reservoir").first,
        user: User.where(last_name: "Bullard").first,
        is_admin: false,
        active: true
    },
    {
        house: House.where(address: "13 Robb st Reservoir").first,
        user: User.where(last_name: "Jackson").first,
        is_admin: false,
        active: false
    },
    {
        house: House.where(address: "13 Robb st Reservoir").first,
        user: User.where(last_name: "Murnane").first,
        is_admin: false,
        active: true
    }

]

house_users.each do |hu|
    HouseUser.create(hu)
end