<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!-- c:out ; c:forEach etc. -->
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!-- Formatting (dates) -->
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
            <!-- form:form -->
            <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
                <!-- for rendering errors on PUT routes -->
                <%@ page isErrorPage="true" %>
                    <!DOCTYPE html>
                    <html data-bs-theme="dark">

                    <head>
                        <meta charset="UTF-8">
                        <title>Login Reg</title>
                        <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
                        <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
                        <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
                        <script type="text/javascript" src="/js/app.js"></script>
                        <!-- change to match your file/naming structure -->
                    </head>

                    <body>
                        <h1>Welcome!</h1>
                        <h3>Join our growing community</h3>
                        <h4 class="display-1">Registration</h4>
                        <div class="card shadown">
                            <div class="card-body">
                                <form:form action="/register" method="post" modelAttribute="newUser">
                                    <div class="mb-3">
                                        <form:label class="form-lable" path="UserName">Username</form:label>
                                        <form:input class="form-control" path="UserName"></form:input>

                                    </div>
                                    <div class="mb-3">
                                        <form:label class="form-lable" path="email">Email</form:label>
                                        <form:input class="form-control" path="email"></form:input>

                                    </div>
                                    <div class="mb-3">
                                        <form:label class="form-lable" path="password">Password</form:label>
                                        <form:input class="form-control" path="password"></form:input>

                                    </div>
                                    <div class="mb-3">
                                        <form:label class="form-lable" path="confirm">Confirm password</form:label>
                                        <form:input class="form-control" path="confirm"></form:input>
                                    </div>
                                    <input class="btn btn-primary" type="submit" value="register">
                                </form:form>
                            </div>
                        </div>
                        <h4 class="display-1">Login</h4>
                        <div class="card shadown">
                            <div class="card-body">
                                <form:form action="/login" method="post" modelAttribute="newLogin">
                                    
                                    <div class="mb-3">
                                        <form:label class="form-lable" path="email">Email</form:label>
                                        <form:input class="form-control" path="email"></form:input>

                                    </div>
                                    <div class="mb-3">
                                        <form:label class="form-lable" path="password">Password</form:label>
                                        <form:input class="form-control" path="password"></form:input>

                                    </div>
                                    <input class="btn btn-primary" type="submit" value="login">
                                </form:form>
                            </div>

                        </div>
                    </body>

                    </html>