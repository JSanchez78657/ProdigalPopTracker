-- put logic functions here using the Lua API: https://github.com/black-sliver/PopTracker/blob/master/doc/PACKS.md#lua-interface
-- don't be afraid to use custom logic functions. it will make many things a lot easier to maintain, for example by adding logging.
-- to see how this function gets called, check: locations/locations.json
-- example:
function has_more_than_n_item(n, item)
    local count = Tracker:ProviderCountForCode(item)
    local val = (count > tonumber(n))
    if ENABLE_DEBUG_LOG then
        print(string.format("called has_more_than_n_item: item: $s, count: %s, n: %s, val: %s", item, count, n, val))
    end
    if val then
        return 1 -- 1 => access is in logic
    end
    return 0 -- 0 => no access
end

function prodigal_can_hit()
    local pick = Tracker:FindObjectForCode("ProgressivePick")
    local knuckle = Tracker:FindObjectForCode("ProgressiveKnuckle")
    local val = (pick.CurrentStage > 0 or knuckle.CurrentStage > 0)
    if val then
        return 1
    end
    return 0
end

function prodigal_can_hit_fire()
    local pick = Tracker:FindObjectForCode("ProgressivePick")
    local knuckle = Tracker:FindObjectForCode("ProgressiveKnuckle")
    local val = (pick.CurrentStage > 0 or knuckle.CurrentStage > 1)
    if val then
        return 1
    end
    return 0
end

-- TODO: Skips stuff to be added later
function prodigal_can_reach_zaegul()
    return 0
end

-- TODO: function prodigal_has_key

-- TODO: function prodigal_has_ice_key

-- TODO: function prodigal_skips

-- TODO: Skips stuff to be added later
function prodigal_can_long_jump()
    local knuckle = Tracker:FindObjectForCode("ProgressiveKnuckle")
    local val = (knuckle.CurrentStage > 1)
    if val then
        return 1
    end
    return 0
end

-- TODO: Skips stuff to be added later
function prodigal_can_remove_boulders()
    local knuckle = Tracker:FindObjectForCode("ProgressiveKnuckle")
    local val = (knuckle.CurrentStage > 0)
    if val then
        return 1
    end
    return 0
end

function prodigal_has_cleats()
    local cleats = Tracker:FindObjectForCode("CleatedBoots")
    local graile = Tracker:FindObjectForCode("BootsOfGraile")
    local val = (cleats.Active or graile.Active)
    if val then
        return 1
    end
    return 0
end

-- TODO: I don't think I need prodigal_has_crest

function prodigal_time_out_1_open()
    return prodigal_has_colors(2)
end

function prodigal_time_out_2_open()
    return prodigal_has_colors(2)
end

-- TODO: I don't think I need prodigal_has_coins

function prodigal_has_enough_blessings()
    return prodigal_has_blessings(2)
end

function prodigal_has_colors(n)
    local shattered_soul = Tracker:FindObjectForCode("ShatteredSoul").Active and 1 or 0
    local fury_heart = Tracker:FindObjectForCode("FuryHeart").Active and 1 or 0
    local frozen_heart = Tracker:FindObjectForCode("FrozenHeart").Active and 1 or 0
    local red_crystal = Tracker:FindObjectForCode("RedCrystal").Active and 1 or 0
    local sunset_painting = Tracker:FindObjectForCode("SunsetPainting").Active and 1 or 0
    local val = (shattered_soul + fury_heart + frozen_heart + red_crystal + sunset_painting) > n
    if val then
        return 1
    end
    return 0
end

function prodigal_has_blessings(n)
    local life_blessing = Tracker:FindObjectForCode("LifeBlessing").Active and 1 or 0
    local light_blessing = Tracker:FindObjectForCode("LightBlessing").Active and 1 or 0
    local storm_blessing = Tracker:FindObjectForCode("StormBlessing").Active and 1 or 0
    local earth_blessing = Tracker:FindObjectForCode("EarthBlessing").Active and 1 or 0
    local water_blessing = Tracker:FindObjectForCode("WaterBlessing").Active and 1 or 0
    local val = (life_blessing + light_blessing + storm_blessing + earth_blessing + water_blessing) > n
    if val then
        return 1
    end
    return 0
end

-- TODO: prodigal_can_kill_grelins

-- TODO: prodigal_has_tar