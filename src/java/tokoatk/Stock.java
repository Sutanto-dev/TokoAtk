/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tokoatk;

import java.sql.*;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

public class Stock {
    public String id;
    public LocalDateTime waktu;
    public String username;

    public String getId() { return id; }
    public String getUsername() { return username; }
    public LocalDateTime getWaktu() { return waktu; }

    public boolean tambah(String username) {
        try (Connection conn = DbConnection.connect()) {
            LocalDateTime dt = LocalDateTime.now();
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyMMddHHmmssS");
            this.id = dt.format(formatter);
            this.username = username;

            String sql = "INSERT INTO stockm (id, username) VALUES (?, ?)";
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, this.id);
            st.setString(2, this.username);
            st.executeUpdate();
            return true;
        } catch (Exception ex) {
            return false;
        }
    }

    public boolean baca(String id) {
        try (Connection conn = DbConnection.connect()) {
            String sql = "SELECT * FROM stockm WHERE id=?";
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                this.id = rs.getString("id");
                this.username = rs.getString("username");
                return true;
            }
            return false;
        } catch (Exception ex) {
            return false;
        }
    }

    public boolean addDetail(String barangId, Integer qty, Integer harga) {
        StockDetail detail = new StockDetail();
        detail.stockId = this.id;
        detail.barangId = barangId;
        detail.qty = qty;
        detail.harga = harga;
        return detail.tambah();
    }

    public ArrayList<StockDetail> getDetail() {
        ArrayList<StockDetail> result = new ArrayList<>();
        try (Connection conn = DbConnection.connect()) {
            String sql = "SELECT * FROM stockd WHERE stockId=?";
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, this.id);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                StockDetail d = new StockDetail();
                d.baca(rs.getInt("id"));
                result.add(d);
            }
            return result;
        } catch (Exception ex) {
            return result;
        }
    }

    public static ArrayList<Stock> getList() {
        ArrayList<Stock> result = new ArrayList<>();
        try (Connection conn = DbConnection.connect()) {
            String sql = "SELECT * FROM stockm";
            PreparedStatement st = conn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Stock s = new Stock();
                s.baca(rs.getString("id"));
                result.add(s);
            }
            return result;
        } catch (Exception ex) {
            return result;
        }
    }
}
