SKETCHUP_CONSOLE.clear
starting = Process.clock_gettime(Process::CLOCK_MONOTONIC)

def time_calc(starting)
    ending = Process.clock_gettime(Process::CLOCK_MONOTONIC)
    elapsed = ending - starting
    puts format("Elapsed: %0.3f",elapsed)
end

def find_vertices(somedata)
    arr = []
    if somedata.respond_to?(:vertices)
        arr << somedata.vertices.map(&:position) ### faster
        # somedata.vertices.each {|vert| arr << vert.position}
    else
        t = somedata.definition.entities.entries
        t.each do |someinfo|
            return find_vertices(someinfo)
        end
    end
    return arr
end
skpents = Sketchup.active_model.entities.entries
arr = []
skpents.each do |somedata|
    arr << find_vertices(somedata).flatten
end
arr = arr.flatten
arr.each {|e| p e}
puts format("Points: %i", arr.count)

time_calc(starting)
