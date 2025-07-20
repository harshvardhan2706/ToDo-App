<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add ToDo Item</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {background:linear-gradient(135deg,#f8ffae 0%,#43c6ac 100%);min-height:100vh;}
        .card {box-shadow:0 4px 24px rgba(0,0,0,.12);border-radius:18px;margin-top:40px;}
        h1 {font-weight:700;color:#2d3e50;text-shadow:1px 1px 8px #fff;}
        label {font-weight:600;color:#43c6ac;}
        .btn {border-radius:12px;font-size:1rem;font-weight:600;transition:box-shadow .2s;}
        .btn:hover {box-shadow:0 2px 8px #43c6ac;}
        .fa {margin-right:6px;}
    </style>
</head>
<body>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <div class="card p-4">
                    <h1 class="mb-4 text-center"><i class="fa fa-plus-circle"></i> Add a ToDo Item</h1>
                    <form:form action="/saveToDoItem" method="post" modelAttribute="todo">
                        <div class="mb-3">
                            <label for="title"><i class="fa fa-heading"></i> Title</label>
                            <form:input path="title" id="title" class="form-control" required="required"/>
                        </div>
                        <div class="mb-3">
                            <label for="date"><i class="fa fa-calendar-days"></i> Date</label>
                            <form:input path="date" id="date" type="date" class="form-control" required="required"/>
                        </div>
                        <div class="mb-3">
                            <label for="status"><i class="fa fa-info-circle"></i> Status</label>
                            <form:input path="status" id="status" class="form-control" value="Incomplete"/>
                        </div>
                        <div class="text-center">
                            <button type="submit" class="btn btn-success px-4">
                                <i class="fa fa-save"></i> Save Item
                            </button>
                        </div>
                    </form:form>
                    <div class="text-center mt-3">
                        <a href="/viewToDoList" class="btn btn-secondary"><i class="fa fa-list"></i> Back to List</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        window.onload = function() {
            var msg = "${message}";
            if (msg === "Save Failure") { alert("Save failed"); }
        };
    </script>
</body>
</html>
</body>
</html>
