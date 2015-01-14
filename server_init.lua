local Point3=_radiant.csg.Point3
local Point2=_radiant.csg.Point2
local Cube3=_radiant.csg.Cube3

local startupscript = class()

function startupscript:init()
	radiant.events.listen(radiant, 'radiant:modules_loaded', self, function()
		radiant.events.listen(radiant,'stonehearth:generate_world_progress',function(e)
			if e.progress==100 then

				radiant.set_realtime_timer(500, function () 

					local pt = Point3(105,105,105)
					stonehearth.world_generation:set_starting_location(Point2(pt.x,pt.z))
    				local town=stonehearth.town:get_town('player_1')
    				local pop=stonehearth.population:get_population('player_1')
    				local random_town_name=town:get_town_name()
    				local location=Point3(pt.x,pt.y,pt.z)
    				local banner_entity=radiant.entities.create_entity('stonehearth:camp_standard')
    				radiant.terrain.place_entity(banner_entity,location,
    				{
						force_iconic=false
        			})
        			town:set_banner(banner_entity)
        			radiant.entities.turn_to(banner_entity,180)

        			local camp_y = banner_entity:add_component('mob'):get_grid_location().y;

        			local camp_x=pt.x
        			local camp_z=pt.z

        			self:place_item(pop,'stonehearth:firepit',camp_x,camp_z+3,
       				{
               			force_iconic=false
            		})

        			self:place_citizen(pop, camp_x + 2, camp_z + 2)
        			self:place_citizen(pop, camp_x + 2, camp_z - 2)
        			self:place_citizen(pop, camp_x - 2, camp_z + 2)
        			self:place_citizen(pop, camp_x - 2, camp_z - 2)

        			for i = 6, 7 do
            			local offset = i % 6 +6
            			self:place_citizen(pop, camp_x-offset,camp_z-offset)
            			self:place_citizen(pop, camp_x+0,camp_z-3)
            			self:place_citizen(pop, camp_x+offset,camp_z-offset)
            			self:place_citizen(pop, camp_x-offset,camp_z+offset)
            		 	self:place_citizen(pop, camp_x+offset,camp_z+offset)
            			self:place_citizen(pop, camp_x-offset,camp_z+0)
            			self:place_citizen(pop, camp_x+offset,camp_z+0)
        			end

        			self:create_stockpile( Point3(camp_x +11, pt.y, camp_z), 12, 10)

        			self:place_citizen_with_job(pop, Point3(camp_x +12, pt.y, camp_z +12), 
        				"stonehearth:jobs:carpenter", 
        				"stonehearth:carpenter:talisman", 
        				"stonehearth:carpenter:workbench",
        				 Point3(camp_x+11, pt.y, camp_z +11))

        			self:place_citizen_with_job(pop, Point3(camp_x +16, pt.y, camp_z +12), 
        				"stonehearth:jobs:weaver", 
        				"stonehearth:weaver:talisman", 
        				"stonehearth:weaver:workbench",
        				 Point3(camp_x+18, pt.y, camp_z +11))

        			self:place_citizen_with_job(pop, Point3(camp_x +20, pt.y, camp_z +12), 
        				"stonehearth:jobs:trapper", 
        				"stonehearth:trapper:talisman")

					for i = 0, 6 do
						self:place_item(pop, "stonehearth:resources:wood:oak_log", camp_x +11, camp_z+9)
					end

					self:place_item(pop, 'stonehearth:resources:fiber:silkweed_bundle', camp_x+12 , camp_z+9)

					self:place_item(pop, 'beehivemod:apiarist:outfit', camp_x+25 , camp_z+9)
					self:place_item(pop, 'beehivemod:beehive:testing', camp_x+24 , camp_z+9)

					--local radius = 1;
					--local terrianedit = Point3(camp_x + 4 , camp_y, camp_z)
					--local cube=Cube3(terrianedit+Point3(-radius,-1,-radius),terrianedit+Point3(radius+1,1+1,radius+1))
					--radiant.terrain.add_cube(cube)
					--210

					radiant.terrain.add_point(Point3(camp_x + 8 , camp_y+10, camp_z), 300)
					radiant.terrain.add_point(Point3(camp_x + 8 , camp_y+11, camp_z), 300)
					radiant.terrain.add_point(Point3(camp_x + 8 , camp_y+12, camp_z), 300)
					radiant.terrain.add_point(Point3(camp_x + 8 , camp_y+13, camp_z), 300)

					radiant.terrain.add_point(Point3(camp_x + 9 , camp_y+10, camp_z), 300)
					radiant.terrain.add_point(Point3(camp_x + 9 , camp_y+11, camp_z), 300)
					radiant.terrain.add_point(Point3(camp_x + 9 , camp_y+12, camp_z), 300)
					radiant.terrain.add_point(Point3(camp_x + 9 , camp_y+13, camp_z), 300)

					--radiant.terrain.add_point(Point3(camp_x + 10 , camp_y+10, camp_z), 300)
					radiant.terrain.add_point(Point3(camp_x + 10 , camp_y+11, camp_z), 300)
					radiant.terrain.add_point(Point3(camp_x + 10 , camp_y+12, camp_z), 300)
					--radiant.terrain.add_point(Point3(camp_x + 10 , camp_y+13, camp_z), 300)

					radiant.terrain.add_point(Point3(camp_x + 7 , camp_y+10, camp_z), 300)
					radiant.terrain.add_point(Point3(camp_x + 7 , camp_y+11, camp_z), 300)
					radiant.terrain.add_point(Point3(camp_x + 7 , camp_y+12, camp_z), 300)
					radiant.terrain.add_point(Point3(camp_x + 7 , camp_y+13, camp_z), 300)

					--radiant.terrain.add_point(Point3(camp_x + 6 , camp_y+10, camp_z), 300)
					radiant.terrain.add_point(Point3(camp_x + 6 , camp_y+11, camp_z), 300)
					radiant.terrain.add_point(Point3(camp_x + 6 , camp_y+12, camp_z), 300)
					--radiant.terrain.add_point(Point3(camp_x + 6 , camp_y+13, camp_z), 300)

					-- arms

					radiant.terrain.add_point(Point3(camp_x + 9 , camp_y+7, camp_z), 210)
					radiant.terrain.add_point(Point3(camp_x + 10 , camp_y+7, camp_z), 210)
					radiant.terrain.add_point(Point3(camp_x + 11 , camp_y+7, camp_z), 101)

					radiant.terrain.add_point(Point3(camp_x + 7 , camp_y+7, camp_z), 210)
					radiant.terrain.add_point(Point3(camp_x + 6 , camp_y+7, camp_z), 210)
					radiant.terrain.add_point(Point3(camp_x + 5 , camp_y+7, camp_z), 101)

					-- body
					radiant.terrain.add_point(Point3(camp_x + 8 , camp_y+9, camp_z), 210)
					radiant.terrain.add_point(Point3(camp_x + 8 , camp_y+8, camp_z), 210)
					radiant.terrain.add_point(Point3(camp_x + 8 , camp_y+7, camp_z), 210)
					radiant.terrain.add_point(Point3(camp_x + 8 , camp_y+6, camp_z), 210)
					radiant.terrain.add_point(Point3(camp_x + 8 , camp_y+5, camp_z), 210)
					radiant.terrain.add_point(Point3(camp_x + 8 , camp_y+4, camp_z), 210)
					radiant.terrain.add_point(Point3(camp_x + 8 , camp_y+3, camp_z), 210)


					--legs
					radiant.terrain.add_point(Point3(camp_x + 7 , camp_y+2, camp_z), 210)					
					radiant.terrain.add_point(Point3(camp_x + 9 , camp_y+2, camp_z), 210)

					radiant.terrain.add_point(Point3(camp_x + 6 , camp_y+1, camp_z), 210)
					radiant.terrain.add_point(Point3(camp_x + 10 , camp_y+1, camp_z), 210)

					radiant.terrain.add_point(Point3(camp_x + 5 , camp_y, camp_z), 101)
					radiant.terrain.add_point(Point3(camp_x + 11 , camp_y, camp_z), 101)


					--stonehearth.mining:mine_point(Point3(camp_x + 4, camp_y, camp_z))
					--stonehearth.mining:mine_point(Point3(camp_x + 4, camp_y+1, camp_z))
					--stonehearth.mining:mine_point(Point3(camp_x + 4, camp_y-1, camp_z))
					--stonehearth.mining:mine_point(Point3(camp_x + 5, camp_y, camp_z))
				end)

				return radiant.events.UNLISTEN
			end
		end)
	end)
end


function startupscript:do_action_over_time(time, action)
	radiant.set_realtime_timer(time, function() action.func(action.args) end)
end

function startupscript:place_item(pop,uri,x,z,options)
	local entity=radiant.entities.create_entity(uri)
	radiant.terrain.place_entity(entity,Point3(x,1,z),options)
	entity:add_component('unit_info'):set_player_id(pop:get_player_id())
	return entity
end

function startupscript:place_citizen(pop,x,z,job,talisman)
		local citizen=pop:create_new_citizen()
		if not job then
			job='stonehearth:jobs:worker'
		end
		pop:promote_citizen(citizen,job,talisman)
		radiant.terrain.place_entity(citizen,Point3(x,1,z))
	return citizen
end

function  startupscript:place_citizen_with_job(pop, location, job_uri, talisman_uri, workbench_uri, workbenchlocation)
	local citizen=pop:create_new_citizen()
	if not job_uri then
		job_uri='stonehearth:jobs:worker'
	end

	local talisman = radiant.entities.create_entity(talisman_uri);

	pop:promote_citizen(citizen,job_uri,talisman)
	radiant.terrain.place_entity(citizen,Point3(location.x,1,location.z))

	if workbench_uri then
		if workbenchlocation then
			local workbench=radiant.entities.create_entity(workbench_uri)
			local entity_forms=workbench:get_component('stonehearth:entity_forms')
			local ghost_entity=entity_forms:get_ghost_entity()
			ghost_entity:add_component('stonehearth:commands'):remove_command('move_item')
			radiant.terrain.place_entity(ghost_entity,location)
			citizen:get_component('stonehearth:crafter'):create_workshop(ghost_entity,location)
		end
	end

	return citizen
end


function startupscript:create_stockpile(location, width, length)
	local size = 
	{
		x = width,
		y = length
	}

	local inventory=stonehearth.inventory:get_inventory('player_1')
	local stockpile=inventory:create_stockpile(location,size)
end

startupscript:init()

return startupscript