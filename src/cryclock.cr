require "crsfml"

window = SF::RenderWindow.new(SF::VideoMode.new(800, 170), "Crystal Clock")
clock = SF::Text.new("", SF::Font.from_file("font/AtomicClockRadio.ttf"), 140)

window.framerate_limit = 1

while window.open?
  
  clock.string = Time.utc.to_local.to_s("%H:%M:%S")
  
  window.clear(SF::Color::Black)  
  window.draw(clock)
  window.display
  
  while event = window.poll_event
    case event
    when SF::Event::Closed
      window.close
    end
  end
end
