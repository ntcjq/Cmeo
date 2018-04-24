package com.aspect;


import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Inherited;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

//这里不明白的童鞋可以抽空看看自定义注解
@Target({ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
@Documented
@Inherited
public @interface OperLog {
	
	//操作模块
    String operModule() default "";
    //操作类型
    String operType() default "";
    
    //描述
    String operDesc() default "";
    
}