package edu.skku.memorygame_fpgafullcolorled_jnidriver;

public class fpgafullcolorledJNIDriver {
	private boolean fConnectFlag;
	
	static {
		System.loadLibrary("sjl_jni");
	}
	
	private native static int openDriver(String path);
	private native static void closeDriver();
	public native int FLEDControl(int ledNum, int red, int green, int blue);
	
	public void fullledJNIDriver() {
		fConnectFlag = false;
	}

	public int open(String driver) {
		if(fConnectFlag)
			return -1;
		if (openDriver(driver) > 0){
			fConnectFlag = true;
			FLEDControl(5,0,0,0);
			return 1;
		}
		else
			return -1;
	}
	
	public void close() {
		if (!fConnectFlag)
			return;
		fConnectFlag = false;
		closeDriver();
	}

	protected void finalize() throws Throwable {
		close();
		super.finalize();
	}
	
}
