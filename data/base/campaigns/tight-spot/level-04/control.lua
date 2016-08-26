require "util"
require "story"
require "tightspot"

level =
{
  level_number = 4,
  time = 11 * 60 * 60,
  money = 10000,
  required_balance =
  {
    easy = 2000,
    normal = 5000,
    hard = 9000
  },
  center = {x = 0, y = 0},
  starting_land_prize = 10,
  price_increase = 2,
  area = {{-40, -40}, {40, 40}},
  recipes =
  {
    "iron-plate",
    "copper-plate",
    "copper-cable",
    "electronic-circuit",
    "iron-gear-wheel",
    "rocket",
    "sulfur",
    "explosives",
    "basic-oil-processing",
  },
  items =
  {
    "coal",
    "transport-belt",
    "underground-belt",
    "fast-transport-belt",
    "fast-underground-belt",
    "splitter",
    "fast-splitter",
    "burner-inserter",
    "inserter",
    "long-handed-inserter",
    "stack-inserter",
    "stack-filter-inserter",
    "wooden-chest",
    "stone-furnace",
    "steel-furnace",
    "offshore-pump",
    "pipe",
    "pipe-to-ground",
    "boiler",
    "steam-engine",
    "small-electric-pole",
    "medium-electric-pole",
    "assembling-machine-1",
    "assembling-machine-2",
    "electric-mining-drill",
    "burner-mining-drill",
    "pumpjack",
    "oil-refinery",
    "chemical-plant",
    "storage-tank",
    "small-pump"
  },
  demand =
  {
    {
      item = "rocket",
      price = 150
    }
  }
}

level.offers = {}
for _, item in ipairs(level.items) do
  level.offers[#level.offers + 1] = tightspot_make_offer(item)
end

script.on_init(function()
  global.story = story_init(story_table)
  global.tightspot = tightspot_init(level)
  game.players[1].surface.always_day = true
  game.players[1].force.disable_research()
end)

script.on_event(defines.events, function(event)
  story_update(global.story, event, "level-05")
end)
