import javax.swing.*;
import java.awt.*;
import java.util.ArrayList;

/**
 * @author ice1000
 * @since 2016/7/29
 * <p/>
 * Created by ice1000 on 2016/7/29.
 */
public class MainActivity {

	public MainActivity() {
		JFrame frame = new JFrame("汇率计算器 by 张寅森");
		frame.setSize(360, 180);
		frame.setResizable(false);
		ArrayList<JButton> buttons1 = new ArrayList<>();
		ArrayList<JButton> buttons2 = new ArrayList<>();
		buttons1.add(new JButton("RMB"));
		buttons1.add(new JButton("Dollar"));
		buttons1.add(new JButton("Euro"));
		buttons2.add(new JButton("OK"));
		buttons2.add(new JButton("Cancel"));
		buttons2.add(new JButton("Exit"));
		JTextField out = new JTextField(4);
		GridBagLayout layout = new GridBagLayout();
		frame.setLayout(layout);
		buttons2.forEach(frame::add);
		buttons1.forEach(frame::add);
		frame.add(out);
		GridBagConstraints constraints = new GridBagConstraints(
				0, 0, 3, 1, 1, 1,
				GridBagConstraints.CENTER,
				GridBagConstraints.BOTH,
				new Insets(0, 0, 0, 0),
				0, 0
		);
		layout.setConstraints(out, constraints);
		constraints.gridwidth = 1;
		constraints.gridy = 1;
		buttons1.forEach(button -> {
			layout.setConstraints(button, constraints);
			constraints.gridx++;
		});
		constraints.gridy = 2;
		constraints.gridx = 0;
		buttons2.forEach(button -> {
			layout.setConstraints(button, constraints);
			constraints.gridx++;
		});
		frame.setVisible(true);
	}

	public static void main(String[] args) {
		new MainActivity();
	}
}
