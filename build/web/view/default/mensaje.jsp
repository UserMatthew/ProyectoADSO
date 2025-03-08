<%
    String mensaje = (String) session.getAttribute("mensaje");
    String error = (String) session.getAttribute("error");
%>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        <% if (mensaje != null) { %>
            Swal.fire({
                toast: true,
                position: 'top-end',
                icon: 'success',
                title: '<%= mensaje %>',
                showConfirmButton: false,
                timer: 3000
            });
            <% session.removeAttribute("mensaje"); %> 
        <% } else if (error != null) { %>
            Swal.fire({
                toast: true,
                position: 'top-end',
                icon: 'error',
                title: '<%= error %>',
                showConfirmButton: false,
                timer: 3000
            });
            <% session.removeAttribute("error"); %>
        <% } %>
    });
</script>

