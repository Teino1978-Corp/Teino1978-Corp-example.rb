new_values = { 10 => "test1", 20 => "test2" }
value = new_values.map { |product_id, value| "(#{product_id}, #{value})" }.join(",")
ActiveRecord::Base.connection.execute(%(
  UPDATE products AS p SET value = v.value
  FROM (values #{values}) AS v(id, value)
  WHERE p.id = v.id
))