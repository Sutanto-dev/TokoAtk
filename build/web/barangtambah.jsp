<%-- 
    Document   : barangtambah
    Created on : 19 Jun 2025, 14.00.13
    Author     : sutantodwiputra
--%>

<%@ page import="tokoatk.Barang" %>
<%
    String id = request.getParameter("id");
    String nama = request.getParameter("nama");
    String jenis = request.getParameter("jenis");
    String hargaStr = request.getParameter("harga");
    Integer harga = Integer.parseInt(hargaStr);

    Barang b = new Barang();
    b.setId(id);
    b.setNama(nama);
    b.setJenis(jenis);
    b.setHarga(harga);

    boolean berhasil = b.tambah();

    if (berhasil) {
        response.sendRedirect("baranglist.jsp");
    } else {
        out.println("Gagal menambahkan data barang.");
    }
%>
