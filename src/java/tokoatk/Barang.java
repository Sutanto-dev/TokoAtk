/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tokoatk;

/**
 *
 * @author sutantodwiputra
 */

import java.sql.*;
import java.util.ArrayList;

public class Barang {
    private String id;
    private String nama;
    private String jenis;
    private Integer harga;

    // Ganti ini: pakai DbConnection
    private Connection getConnection() throws SQLException {
        return DbConnection.connect();
    }

    // Getter dan Setter
    public String getId() { return id; }
    public void setId(String id) { this.id = id; }
    public String getNama() { return nama; }
    public void setNama(String nama) { this.nama = nama; }
    public String getJenis() { return jenis; }
    public void setJenis(String jenis) { this.jenis = jenis; }
    public Integer getHarga() { return harga; }
    public void setHarga(Integer harga) { this.harga = harga; }

    // Baca barang berdasarkan id
    public boolean baca(String id) {
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement("SELECT * FROM barang WHERE id = ?")) {
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                this.id = rs.getString("id");
                this.nama = rs.getString("nama");
                this.jenis = rs.getString("jenis");
                this.harga = rs.getInt("harga");
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Update barang
    public boolean update() {
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(
                 "UPDATE barang SET nama = ?, jenis = ?, harga = ? WHERE id = ?")) {
            ps.setString(1, nama);
            ps.setString(2, jenis);
            ps.setInt(3, harga);
            ps.setString(4, id);
            int rows = ps.executeUpdate();
            return rows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Tambah barang
    public boolean tambah() {
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(
                 "INSERT INTO barang (id, nama, jenis, harga) VALUES (?, ?, ?, ?)")) {
            ps.setString(1, id);
            ps.setString(2, nama);
            ps.setString(3, jenis);
            ps.setInt(4, harga);
            int rows = ps.executeUpdate();
            return rows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Hapus barang
    public boolean hapus() {
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement("DELETE FROM barang WHERE id = ?")) {
            ps.setString(1, id);
            int rows = ps.executeUpdate();
            return rows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Ambil list barang
    public ArrayList<Barang> getList() {
        ArrayList<Barang> list = new ArrayList<>();
        try (Connection conn = getConnection();
             Statement st = conn.createStatement();
             ResultSet rs = st.executeQuery("SELECT * FROM barang")) {
            while (rs.next()) {
                Barang b = new Barang();
                b.setId(rs.getString("id"));
                b.setNama(rs.getString("nama"));
                b.setJenis(rs.getString("jenis"));
                b.setHarga(rs.getInt("harga"));
                list.add(b);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}
