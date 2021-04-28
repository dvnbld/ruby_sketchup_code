SKETCHUP_CONSOLE.clear
model = Sketchup.active_model
starting = Process.clock_gettime(Process::CLOCK_MONOTONIC)

def time_calc(starting)
    ending = Process.clock_gettime(Process::CLOCK_MONOTONIC)
    elapsed = ending - starting
    puts format("Elapsed: %0.3f",elapsed)
end

def count_connected_ents(arr_with_edges_and_faces)
    t = []
    arr_with_edges_and_faces.each do |el|
        t << el.all_connected
    end
    
    return t.uniq!
end
    

def iterate_entities(entities, arrc, arrg)
	arr = []
	entities.each do | entity |
		case entity
		when Sketchup::Edge, Sketchup::Face
			arr << entity
		when Sketchup::ComponentInstance, Sketchup::Group
		    arr << iterate_entities(entity.definition.entities, arrc, arrg)
		    if entity.is_a?Sketchup::ComponentInstance
		        arrc << entity
		    else entity.is_a? Sketchup::Group
		        arrg << entity
		    end
		end
	end
	
	
	return arr.flatten
end

arr_c = []
arr_g = []
arr_1 = iterate_entities(model.entities.entries, arr_c, arr_g)
arr_2 = count_connected_ents(arr_1)
puts format("Connected elements overall: %i\nGroups: %i\nComponents: %i(unique: %i)", arr_2.length, arr_g.length, arr_c.length, arr_c.uniq.length)

time_calc(starting)
