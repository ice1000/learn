package foxnrabbit;

import java.awt.BorderLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.ArrayList;

import javax.swing.JButton;
import javax.swing.JFrame;

import animal.Animal;
import animal.Fox;
import animal.Rabbit;
import cell.Cell;
import field.Field;
import field.Location;
import field.View;

public class FoxAndRabbit {
	private Field theField;
	private View theView;
	
	public FoxAndRabbit(int size) {
		theField = new Field(size, size);
		for ( int row = 0; row<theField.getHeight(); row++ ) {
			for ( int col = 0; col<theField.getWidth(); col++ ) {
				double probability = Math.random();
				if ( probability < 0.05 ) {
					theField.place(row, col, new Fox());
				} else if ( probability < 0.15 ) {
					theField.place(row, col, new Rabbit());
				} 
			}
		}
		theView = new View(theField);
		JFrame frame = new JFrame();
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.setResizable(false);
		
		JButton button = new JButton("单击 下一步");
		frame.add(button,BorderLayout.NORTH);
		button.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent arg0) {
				// TODO Auto-generated method stub
				step();
				theView.repaint();
			}
		});
		
		frame.setTitle("Cells");
		frame.add(theView);
		frame.pack();
		frame.setVisible(true);
	}
	
	public void start(int steps) {
		for ( int i=0; i<steps; i++ ) {
			step();
			theView.repaint();
			try {
				Thread.sleep(200);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
	}
	
	public void step() {
		for ( int row = 0; row< theField.getHeight(); row++ ) {
			for ( int col = 0; col < theField.getWidth(); col++ ) {
				Cell cell = theField.get(row, col);
				if ( cell != null ) {
					Animal animal = (Animal)cell;
					animal.grow();
					if ( animal.isAlive() ) {
						//	move
						Location loc = animal.move(theField.getFreeNeighbour(row, col));
						if ( loc != null ) {
							theField.move(row, col, loc);
						}
						//	eat
//						animal.eat(theField);
						Cell[] neighbour = theField.getNeighbour(row, col);
						ArrayList<Animal> listRabbit = new ArrayList<Animal>();
						for ( Cell an : neighbour ) {
							if ( an instanceof Rabbit ) {
								listRabbit.add((Rabbit)an);
							}
						}
						if ( !listRabbit.isEmpty() ) {
							Animal fed = animal.feed(listRabbit);
							if ( fed != null ) {
								theField.remove((Cell)fed);
							}
						}
						//	breed
						Animal baby = animal.breed();
						if ( baby != null ) {
							theField.placeRandomAdj(row, col, (Cell)baby);
						}
					} else {
						theField.remove(row, col);
					}
				}
			}
		}
	}
	
	public static void main(String[] args) {
		FoxAndRabbit fnr = new FoxAndRabbit(50);
    }

}
