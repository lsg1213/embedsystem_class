package edu.skku.memorygame_fpga7segment_jni;

public class fpga7segmentJNIDriver {
	static {
		System.loadLibrary("sjl_jni");
	}
	
	public native void open();
	public native void print(int num);
	public native void close();
}
