package org.ice1000.testKotlin

import javax.swing.JOptionPane

actual fun putStr(string: String) = System.out.print(string)
actual fun showAlert(message: String) = JOptionPane.showMessageDialog(null, null, message, JOptionPane.OK_OPTION)
