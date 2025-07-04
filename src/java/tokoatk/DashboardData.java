/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tokoatk;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DashboardData {

    public static int getTotalBarang() {
        String sql = "SELECT COUNT(*) AS total FROM barang";
        return getIntFromQuery(sql);
    }

    public static int getTotalTransaksi() {
        String sql = "SELECT COUNT(*) AS total FROM salesm"; // atau stockm jika yang dipakai transaksi stock
        return getIntFromQuery(sql);
    }

    public static int getTotalPendapatan() {
        String sql = "SELECT SUM(harga) AS total FROM salesd"; 
        // sesuaikan kolom total dengan struktur tabel sales
        // misal salesm punya kolom total atau hitung di join salesd
        return getIntFromQuery(sql);
    }

    public static int getTotalUser() {
        String sql = "SELECT COUNT(*) AS total FROM users";
        return getIntFromQuery(sql);
    }

    private static int getIntFromQuery(String sql) {
        try (Connection conn = DbConnection.connect()) {
            PreparedStatement st = conn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt("total");
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return 0;
    }
}
