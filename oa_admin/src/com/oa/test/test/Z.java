package com.oa.test.test;

public class Z {

	public static void main(String[] args) {
		new Z();
	}

	Z() {
		Z alias1 = this;
		Z alias2 = this;
		synchronized (alias1) {
			try {
				alias2.wait();
				System.out.println("DONE WAITING");
			} catch (InterruptedException e) {
				System.out.println("InterruptedException");
			} catch (Exception e) {
				System.out.println("Other Exception");
			} finally {
				System.out.println("Finally");
			}
		}
		System.out.println("END");
	}

}
