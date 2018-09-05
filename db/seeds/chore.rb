chores = [
    {
        name: "Vaccuuming",
        outdoor: false,
        active: true
    },
    {
        name: "Dishes",
        outdoor: false,
        active: true
    },
    {
        name: "Mowing the Lawn",
        outdoor: true,
        active: true
    },
    {
        name: "Put the bins out",
        outdoor: true,
        active: true
    },
    {
        name: "Clean the bathroom",
        outdoor: false,
        active: true
    },
    {
        name: "Clean the kitchen",
        outdoor: false,
        active: true
    }
]

chores.each do |chore|
    Chore.create(chore)
end