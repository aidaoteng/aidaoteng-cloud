package com.aidaoteng.common.log.aspect;

import cn.hutool.core.util.ReflectUtil;
import cn.hutool.json.JSONUtil;
import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.servlet.http.HttpServletRequest;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import java.lang.annotation.Annotation;
import java.lang.reflect.Method;

@Aspect
@Component
@Slf4j
public class ControllerLogAspect {

    // 定义切点，拦截所有Controller层的方法
    @Pointcut("within(@org.springframework.web.bind.annotation.RestController *)")
    public void controllerLayer() {}

    // 环绕通知：在Controller方法执行之前和之后执行
    @Around("controllerLayer()")
    public Object aroundControllerAdvice(ProceedingJoinPoint joinPoint) throws Throwable {
        // 获取HttpServletRequest对象
        ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        HttpServletRequest request = null;
        if (attributes != null) {
            request = attributes.getRequest();
            // 打印请求信息
            log.info("----------------------------------------------------------");
            reflectClass(joinPoint);
            log.info("URL           :{}", request.getRequestURL().toString());
            log.info("HTTP_METHOD   :{}", request.getMethod());
            log.info("IP            :{}", request.getRemoteAddr());
            log.info("CLASS_METHOD  :{}.{}", joinPoint.getSignature().getDeclaringTypeName(), joinPoint.getSignature().getName());

            // 打印入参
            Object[] args = joinPoint.getArgs();
            if (args != null) {
                log.info("body          :{}", JSONUtil.toJsonStr(args[0]));
            }
        }


        // 执行原方法
        Object result = joinPoint.proceed();
        // 打印出参
        log.info("RETURN        :{}", JSONUtil.toJsonStr(result));
        return result;
    }


    private void reflectClass(JoinPoint joinPoint) {
        try {
            Class<?> clazz = joinPoint.getTarget().getClass();
            Schema clazzSchema = clazz.getDeclaredAnnotation(Schema.class);
            String title = clazzSchema!=null? clazzSchema.description()+"-":"";

            Method[] methods = ReflectUtil.getMethods(joinPoint.getTarget().getClass());
            for (Method method : methods) {
                if (method.getName().equals(joinPoint.getSignature().getName())) {
                    try{
                        Schema comment = method.getAnnotation(Schema.class);
                        log.info("api           :{}", title+comment.description());
                    }catch (Exception e) {
                        log.error("getAnnotation->{}", e.getMessage(), e);
                    }
                    break;
                }
            }
        } catch (Exception e) {
            log.error("reflectClass->Exception->{}", e.getMessage(), e);
        }

    }
}
