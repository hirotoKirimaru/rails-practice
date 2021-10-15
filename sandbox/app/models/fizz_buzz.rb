class FizzBuzz
    def execute
      (1..100).each {
        |n| p convert(n) 
      }
    end

    def convert(value)
      rtn = ""
      if value % 3 == 0 then
        rtn += "Fizz"
      end

      if value % 5 == 0 then
        rtn += "Buzz"
      end      

      if rtn == "" then
        return value.to_s
      else
        return rtn
      end
    end
end
