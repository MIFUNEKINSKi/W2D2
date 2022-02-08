require "employee"


class Startup
    attr_reader :name, :funding, :salaries, :employees
    def initialize(name,funding,salaries)
        @name = name
        @funding = funding
        @salaries = salaries
        @employees = []
    end 
    def valid_title?(title)
        salaries.has_key?(title)
    end 
    
    def >(o_startup)
        if funding < o_startup.funding
        return false
        else return true
        end
    end 

    def hire(employee, title)
        if valid_title?(title)
            @employees << Employee.new(employee,title)
        else 
            raise "title does not exist"
        end 
    end 
    
    def size
        employees.length
    end

    def pay_employee(employee)
        amount = salaries[employee.title]
        raise "not enough funding" if amount > @funding
        employee.pay(amount) 
        @funding -= amount
    end 

    def payday
        employees.each {|employee| pay_employee(employee)}
    end 

    def average_salary
        final = employees.map {|employee| salaries[employee.title]}
        final.sum / final.length
    end 

    def close
        @employees = []
        @funding = 0
    end 

    def acquire(another_startup)
        @funding += another_startup.funding
       another_startup.salaries.each do |k,v|
            if !@salaries.has_key?(k)
                @salaries[k] = v
            end 
       end 
   @employees = @employees + another_startup.employees
    another_startup.close()
    end 



end
