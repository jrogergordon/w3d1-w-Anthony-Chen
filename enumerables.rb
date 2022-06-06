require "byebug"
class Array
    def my_each(&prc)
        j = 0
        while j != 2
            i = 0
            while i < self.length 
                prc.call(self[i])
                i += 1
            end
            j += 1
            self
        end
    end

    def my_select(&prc)
        new_arr = []
        self.my_each { |ele| new_arr << ele if prc.call(ele) && !new_arr.include?(ele) }
            # if prc.call(ele) && !new_arr.include?(ele)
            #     new_arr << ele
            # end
        new_arr
    end

    def my_reject(&prc)
        new_arr = []
        self.my_each { |ele| new_arr << ele if !prc.call(ele) && !new_arr.include?(ele) }
        new_arr
    end

    def my_any?(&prc)
        self.my_each { |ele| return true if prc.call(ele) == true}
        false
    end

    def my_all?(&prc)
        self.my_each { |ele| return false if prc.call(ele) == false}
        true
    end

    def my_flatten(results = [])
            self.each do |element|
              if element.class == Array
                element.my_flatten(results)
              else
                results << element
              end
            end
            results
    end

    def my_zip(*args)
        new_arr_1 = []
        i = 0
        self.length.times do
            sub_arr = []
            sub_arr << self[i]
                args.each do |ele|
                    sub_arr << ele[i]
                end
                i += 1
        new_arr_1 << sub_arr
        end
        new_arr_1
    end

    def my_rotate(n = 1)
        if n > 0
            (0...n).each do |idx| #b,c,d,a
                ele = self.shift # ele = b
                self.push(ele) # c,d,a,b
            end
        else
            j = n * -1
            j.times do
                ele = self.pop
                self.unshift(ele)
            end
        end
    self
    end

    def my_join(arg = "")
        ret_string = []
        self.each_with_index do |ele, idx| 
            ret_string << ele 
        end
        ret_string.join(arg)
    end

    def my_rev
        new_arr = []
        i = -1
        self.each do |ele|
            new_arr << self[i]
            i -= 1
        end
        new_arr 
    end
end

# p a = [ "a", "b", "c", "d" ]
# p a.my_join         # => "abcd"
# p a.my_join("$")    # => "a$b$c$d"

p [ "a", "b", "c" ].my_rev   #=> ["c", "b", "a"]
p [ 1 ].my_rev               #=> [1]