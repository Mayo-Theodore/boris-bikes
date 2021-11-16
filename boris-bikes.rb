As a person,
So that I can use a bike,
I'd like a docking station to release a bike.

As a person,
So that I can use a good bike,
I'd like to see if a bike is working


Objects - Messages
---------------------
Person
Bike - is_working
DockingStation - release_bike

Nouns
---------
person
bike

Verbs
---------
release
working

class Bike
  def docking_station
  end

  def is_working
    # return true if working, else false
  end
end

class Person
  def get_bike
    # docking station
  end

  def see_if_working
    #is_working
  end
end

class Docking_station
end

Person.get_bike
Person.see_if_working
