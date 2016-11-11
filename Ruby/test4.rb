
require 'tk'

root = TkRoot.new do
  title 'objects move test'
  width 300
  height 300
end

canvas = TkCanvas.new(root) do
  place('width' => 300,
        'height' => 300,
        'x' => 0,
        'y' => 0)
end

oval = TkcOval.new(canvas, 100, 100, 20, 20,
                   'fill' => 'black')

Thread.new do
  sleep 0.1
  # TkcOval.new(canvas, 100, 200, 20, 20,
  #                  'fill' => 'blue')
  oval['x'] = 200
end

Tk.mainloop

