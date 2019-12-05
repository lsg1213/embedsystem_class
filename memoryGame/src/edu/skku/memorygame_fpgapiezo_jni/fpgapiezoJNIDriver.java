package edu.skku.memorygame_fpgapiezo_jni;

public class fpgapiezoJNIDriver {
	static {
		System.loadLibrary("sjl_jni");
	}

	

	public native void open();

	public native void write(char data);

	public native void close();

}
