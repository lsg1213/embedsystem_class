package edu.skku.memorygame_fpgalcd_jnidriver;

public class fpgalcdJNIDriver {
	static {
		System.loadLibrary("sjl_jni");
	}
	
	public native void on();
	public native void off();
	public native void initialize();
	public native void clear();
	
	public native void print1Line(String str);
	public native void print2Line(String str);
}
