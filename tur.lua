-----ADVANCED TURTLE API------
--Slot 1 is reserved for fuel.

local function printerr(text)

  term.setTextColor(colors.red)
  
  print(text)
  
  term.setTextColor(colors.white)
  
end

-----REFUEL-----
function refuel()
  
  if turtle.getFuelLevel() == 0 then
    
    for i = 1, 16, 1 do
    
      turtle.select(i)
    
      if turtle.refuel() then
    
        return true
    
      end
      
      return false
      
    end
  
  end
  
  return true
  
end

-----MOVE UP-----
function up()
  
  while not turtle.up() do
  
    if not refuel() then
    
      printerr("error: NO FUEL")
      
      return false
      
    end
    
    if not turtle.digUp() then
    
      printerr("error: SOMETHING BLOCK")
      
      return false
      
    end
  
  end
  
  return true
  
end

-----MOVE DOWN-----
function down()

  while not turtle.down() do
  
    if not refuel() then
  
      printerr("error: NO FUEL")
    
      return false
  
    end
  
    if not turtle.digDown() then
  
      printerr("error: SOMETHIG BLOCK")
    
      return false
    
    end
    
  end    
  
  return true

end

-----MOVE FORWARD-----
function forw()
  
  while not turtle.forward() do
    
    if not refuel() then
    
      printerr("error: NO FUEL")
      
      return false
    
    end
    
    if not turtle.dig() then
      
      printerr("error: SOMETHING BLOCK")
      
      return false
    
    end
    
    os.sleep(0.5)
  
  end
  
  return true
  
end

-----MOVE BACKWARD-----
function back()

  while not turtle.back() do
    
    if not refuel() then
      
      printerr("error: NO FUEL")
      
      return false
      
    end
    
    --if block behinde
    turtle.turnLeft()
    turtle.turnLeft()
    
    if not turtle.dig() then
        
      printerr("error: SOMETHING BLOCK")
        
      turtle.turnLeft()
      turtle.turnLeft()
        
      return false
        
    end
    
    turtle.turnLeft()
    turtle.turnLeft()
    
    os.sleep(0.5)
    
  end
  
  return true
  
end

-----DIG AROUND-----
function digAround()

  turtle.digUp()
  
  turtle.dig()
  
  turtle.digDown()
  
end

-----TURN LEFT-----
function tLeft()

  turtle.turnLeft()

end

-----TURN RIGHT-----
function tRight()
  
  turtle.turnRight()
  
end

-----MOVE LEFT-----
function left()

  tLeft()
  
  if not forw() then
  
    printerr("error: CANT MOVE LEFT")
    
    return false
    
  end
  
  tRight()
  
  return false
  
end

-----MOVE RIGHT-----
function right()

  tRight()
  
  if not forw() then
  
    printerr("error: CANT MOVE RIGHT")
    
    return false
    
  end
  
  tLeft()
  
  return true
  
end

-----DROP ALL-----
function dropAll(from)
  
  for i=from, 16, 1 do

    turtle.select(i)
    
    turtle.drop()
  
  end

end

function dropAll()
  
  --Slot 1 is reserved for fuel.
  dropAll(2)

end

-----PLACE-----
function place(cell)
  
  if not turtle.select(cell) then
    
    printerr("error: WRONG SELECTED CELL")
    
    return false
    
  end
  
  if turtle.getItemCount() == 0 then
  
    printerr("error: NO ITEMS TO PLACE")
    
    return false
    
  end
  
  if not turtle.place() then
  
    printerr("error: CANT PLACE THIS ITEM")
    
    return false
    
  end
  
  return true
  
end

-----PLACE ANY-----
function placeAny()

  --Slot 1 is reserved for fuel.
  for i=2, 16, 1 do
  
    if place(i) then
      
      return true
      
    end
    
  end
    
  return false
  
end
