import androidhelper

ad = androidhelper.Android()

ln = ad.dialogGetInput()

ad.makeToast(ln.result)