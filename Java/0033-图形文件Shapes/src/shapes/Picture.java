package shapes;

import java.awt.Graphics;
import java.util.ArrayList;

import javax.swing.JFrame;
import javax.swing.JPanel;

public class Picture extends JFrame {
	private static final long serialVersionUID = 1L;
	private int width;
	private int height;
	
	private ArrayList<Shape> listShape = new ArrayList<Shape>();
	
	private class ShapesPanel extends JPanel {
		private static final long serialVersionUID = 1L;

		@Override
		protected void paintComponent(Graphics g) {
			super.paintComponent(g);
			for ( Shape s : listShape )
			{
				s.draw(g);
			}			
		}
		
	}
	
	public void add(Shape s)
	{
		listShape.add(s);
	}

	public Picture(int width, int height)
	{
		add(new ShapesPanel());
		this.setDefaultCloseOperation(EXIT_ON_CLOSE);
		this.width = width;
		this.height = height;
	}
	
	public void draw()
	{
		setLocationRelativeTo(null);
		setSize(width, height);
		setVisible(true);
	}
}