/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tokoatk;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class StockDetail {
    public int id;
    public String stockId;
    public String barangId;
    public int qty;
    public int harga;

    public String getId() { return String.valueOf(id); }
    public String getStockId() { return stockId; }
    public String getBarangId() { return barangId; }
    public int getQty() { return qty; }
    public int getHarga() { return harga; }
    public int getTotal() { return qty * harga; }

    public String getBarangNama() {
        Barang b = new Barang();
        if (b.baca(barangId)) {
            return b.getNama();
        } else {
            return "-";
        }
    }

    public boolean tambah() {
        Connection conn = null;
        PreparedStatement st;

        try {
            conn = DbConnection.connect();
            String sql = "INSERT INTO stockd (stockId, barangId, qty, harga) VALUES (?, ?, ?, ?)";
            st = conn.prepareStatement(sql);
            st.setString(1, stockId);
            st.setString(2, barangId);
            st.setInt(3, qty);
            st.setInt(4, harga);
            st.executeUpdate();

            conn.close();
            return true;
        } catch (Exception ex) {
            return false;
        }
    }

    public boolean baca(int id) {
        try (Connection conn = DbConnection.connect()) {
            String sql = "SELECT * FROM stockd WHERE id=?";
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                this.id = rs.getInt("id");
                this.stockId = rs.getString("stockId");
                this.barangId = rs.getString("barangId");
                this.qty = rs.getInt("qty");
                this.harga = rs.getInt("harga");
                return true;
            }
            return false;
        } catch (Exception ex) {
            return false;
        }
    }

    public boolean hapus() {
        try (Connection conn = DbConnection.connect()) {
            String sql = "DELETE FROM stockd WHERE id=?";
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1, this.id);
            st.executeUpdate();
            return true;
        } catch (Exception ex) {
            return false;
        }
    }
}
