package field;

import java.awt.Dimension;
import java.awt.Graphics;

import javax.swing.JFrame;
import javax.swing.JPanel;

import cell.Cell;

public class View extends JPanel {
	private static final long serialVersionUID = -5258995676212660595L;
	private static final int GRID_SIZE = 16;
	private Field theField;
	
	public View(Field field) {
		theField = field;
	}

	@Override
	public void paint(Graphics g) {
		super.paint(g);
		for ( int row = 0; row<theField.getHeight(); row++ ) {
			for ( int col = 0; col<theField.getWidth(); col++ ) {
				Cell cell = theField.get(row, col);
				if ( cell != null ) {
					cell.draw(g, col*GRID_SIZE, row*GRID_SIZE, GRID_SIZE);
				}
			}
		}
	}

	@Override
	public Dimension getPreferredSize() {
		return new Dimension(theField.getWidth()*GRID_SIZE+1, theField.getHeight()*GRID_SIZE+1);
	}

	public static void main(String[] args) {
		Field field = new Field(10,10);
		for ( int row = 0; row<field.getHeight(); row++ ) {
			for ( int col = 0; col<field.getWidth(); col++ ) {
				field.place(row, col, new Cell());
			}
		}
		View view = new View(field);
		JFrame frame = new JFrame();
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.setResizable(false);
		frame.setTitle("Cells");
		frame.add(view);
		frame.pack();
		frame.setVisible(true);
	}

}
