<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="dao.ProductDao" %>
<%@ page import="bean.Product" %>
<%@ page import="java.io.*, java.sql.*" %>
<%
    HttpSession httpSession = request.getSession();
    if (httpSession == null || httpSession.getAttribute("user") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    
    // Retrieve all products using ProductDAO
    ProductDao productDAO = new ProductDao();
    List<Product> productList = productDAO.getAllProducts();
    
    // Retrieve all brands
    List<String> brandNames = productDAO.getAllBrandNames(); // Assuming you have a method to fetch brand names
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Weave Wardrobe - Products</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        th, td {
            font-size: 14px; /* Adjust the font size as needed */
        }
    </style>
</head>
<body>
    <div class="container mt-5">
        <h2 class="text-center mb-4">Products</h2>
        <div class="table-responsive">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Brand</th>
                        <th>Price</th>
                        <th>Color</th>
                        <th>Specification</th>
                        <th>Image</th>
                        <th>Edit</th>
                        <th>Delete</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (Product product : productList) { %>
                    <tr>
                        <td><%= product.getId() %></td>
                        <td><%= product.getName() %></td>
                        <td><%= product.getBrand_name() %></td>
                        <td><%= product.getPrice() %></td>
                        <td><%= product.getColor() %></td>
                        <td><%= product.getSpecification() %></td>
                        <td>
                            <img src="<%= product.getImage() %>" alt="Product Image" style="max-width: 100%; height: auto;">
                        </td>
                        <td>
                            <a href="editproduct.jsp?id=<%= product.getId() %>" class="btn btn-primary btn-sm">Edit</a>
                        </td>
                        <td>
                            <a href="deleteproduct.jsp?id=<%= product.getId() %>" class="btn btn-danger btn-sm">Delete</a>
                        </td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </div>

    <!-- Bootstrap JS (optional) -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
