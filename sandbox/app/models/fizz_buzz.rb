class FizzBuzz
    def execute
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
