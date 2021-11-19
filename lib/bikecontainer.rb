module BikeContainer
    
    def fixed_bike(storer,final_bike)
        if storer[0].working? == false
          broke_bike = storer.shift
          storer << broke_bike
          if final_bike == broke_bike
            raise "All bikes are broken!"
          end
          fixed_bike(storer,final_bike)
        end
      end
    
      def broken_bike(storer,final_bike)
        if storer[0].working? == true
          broke_bike = storer.shift
          storer << broke_bike
          if final_bike == broke_bike
            raise "All bikes are good!"
          end
          broken_bike(storer,final_bike)
        else
          storer.shift
        end
      end

end