package edu.skku.memorygame_fpgadotmatrix_jni;

public class fpgadotmatrixJNIDriver {
	static {
		System.loadLibrary("sjl_jni");
	}
	
	public native void DotMatrixControl(String str);
}
