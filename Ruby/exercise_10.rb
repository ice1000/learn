require 'tk'

root = TkRoot.new do
  title 'test'
end

TkLabel.new(root) do
  text 'Hello World!'
  pack do
    padx 50
    pady 50
    side 'left'
  end
end

TkButton.new(root) do
  text '打开新世界的大门吧！'
  pack do
    padx 50
    pady 50
    side 'right'
  end
end
Tk.mainloop
