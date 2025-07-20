<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View ToDo Item List</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body { background: linear-gradient(135deg, #f8ffae 0%, #43c6ac 100%); min-height: 100vh; }
        .card { box-shadow: 0 4px 24px rgba(0,0,0,0.12); border-radius: 18px; margin-top: 40px; }
        h1 { font-weight: 700; color: #2d3e50; text-shadow: 1px 1px 8px #fff; }
        .table th, .table td { vertical-align: middle; font-size: 1.1rem; }
        .btn { border-radius: 12px; font-size: 1rem; font-weight: 600; transition: box-shadow 0.2s; }
        .btn:hover { box-shadow: 0 2px 8px #43c6ac; }
        .fa { margin-right: 6px; }
        form { display:inline; }
    </style>
</head>
<body>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-10">
                <div class="card p-4">
                    <h1 class="mb-4 text-center"><i class="fa fa-list-check"></i> ToDo Item List</h1>
                    <table class="table table-hover table-bordered bg-white">
                        <thead class="table-success">
                            <tr>
                                <th><i class="fa fa-hashtag"></i> Id</th>
                                <th><i class="fa fa-heading"></i> Title</th>
                                <th><i class="fa fa-calendar-days"></i> Date</th>
                                <th><i class="fa fa-info-circle"></i> Status</th>
                                <th><i class="fa fa-check"></i> Mark Completed</th>
                                <th><i class="fa fa-edit"></i> Edit</th>
                                <th><i class="fa fa-trash"></i> Delete</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="todo" items="${list}">
                                <tr>
                                    <td>${todo.id}</td>
                                    <td>${todo.title}</td>
                                    <td>${todo.date}</td>
                                    <td>
                                        <span class="badge ${todo.status eq 'Completed' ? 'bg-success' : 'bg-warning'}">${todo.status}</span>
                                    </td>
                                    <td>
                                        <form action="${pageContext.request.contextPath}/updateToDoStatus/${todo.id}" method="post">
                                            <button type="submit" class="btn btn-success">
                                                <i class="fa fa-check"></i> Mark Complete
                                            </button>
                                        </form>
                                    </td>
                                    <td>
                                        <a href="/editToDoItem/${todo.id}" class="btn btn-primary">
                                            <i class="fa fa-edit"></i> Edit
                                        </a>
                                    </td>
                                    <td>
                                        <form action="${pageContext.request.contextPath}/deleteToDoItem/${todo.id}" method="post">
                                            <button type="submit" class="btn btn-danger">
                                                <i class="fa fa-trash"></i> Delete
                                            </button>
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <div class="text-center mt-3">
                        <a href="/addToDoItem" class="btn btn-primary"><i class="fa fa-plus"></i> Add New ToDo Item</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        window.onload = function() {
            var msg = "${message}";
            if (msg == "Save Success") {
                toastr["success"]("Item added successfully!!");
            } else if (msg == "Delete Success") {
                toastr["success"]("Item deleted successfully!!");
            } else if (msg == "Delete Failure") {
                toastr["error"]("Some error occurred, couldn't delete item");
            } else if (msg == "Edit Success") {
                toastr["success"]("Item updated successfully!!");
            }
            toastr.options = {
                "closeButton": true,
                "progressBar": true,
                "positionClass": "toast-top-right",
                "timeOut": "5000"
            }
        }
    </script>
</body>
</html>
