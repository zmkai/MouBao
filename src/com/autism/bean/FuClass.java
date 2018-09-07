package com.autism.bean;

public class FuClass {
	static{
		System.out.println("父类的静态代码块");
	}
	
	public FuClass() {
		System.out.println("父类的构造方法");
	}

	public void print(){
		System.out.println("父类的打印方法");
	}
}
