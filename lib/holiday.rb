require 'pry'
holiday_supplies = {
  :winter => {
    :christmas => ["Lights", "Wreath"],
    :new_years => ["Party Hats"]
  },
  :summer => {
    :fourth_of_july => ["Fireworks", "BBQ"]
  },
  :fall => {
    :thanksgiving => ["Turkey"]
  },
  :spring => {
    :memorial_day => ["BBQ"]
  }
}

def second_supply_for_fourth_of_july(holiday_hash)
  holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)  
  holiday_supplies[:winter].each do |holiday, items|
    items << supply
  end
end

def add_supply_to_memorial_day(holiday_hash, supply)
  holiday_supplies[:spring][:memorial_day] << supply
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  holiday_hash[season][holiday_name] = supply_array
  holiday_hash
end

def all_winter_holiday_supplies(holiday_hash)
  winter_supplies = []
  holiday_hash[:winter].each do |holiday, things|
    winter_supplies << things
  end
  winter_supplies.flatten!
end

def all_supplies_in_holidays(holiday_hash)
  holiday_hash.each do |season, data|
    puts "#{season.capitalize}:"
    data.each do |holiday, things|
      formatted_holiday = holiday.to_s.split('_').each{|word| word.capitalize!}.join(' ')
      formatted_things = things.join(', ')
      puts "  #{formatted_holiday}: #{formatted_things}"
    end
  end
end

def all_holidays_with_bbq(holiday_hash)
  bbq_array = []
  holiday_hash.each do |season, data|
    data.each do |holiday, things|
      if things.include?("BBQ")
        bbq_array << holiday
      end
    end
  end
  bbq_array
end