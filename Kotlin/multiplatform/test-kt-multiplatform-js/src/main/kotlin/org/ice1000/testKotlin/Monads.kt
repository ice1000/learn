package org.ice1000.testKotlin

import kotlin.browser.window

actual fun putStr(string: String) = console.log(string)

actual fun showAlert(message: String) = window.alert(message)
