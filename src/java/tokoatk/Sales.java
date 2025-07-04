package tokoatk;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

public class Sales {
    public String id;
    public LocalDateTime waktu;
    public String username;
    
    public LocalDateTime getWaktu() {
        return waktu;
    }
    
    public String getId() {
        return id;
    }
    
    public String getUsername() {
        return username;
    }
    
    public boolean baca(String id) {
        Connection conn = null;
        PreparedStatement st;
        ResultSet rs;

        try {
            conn = DbConnection.connect();

            // prepare select statement
            String sql = "SELECT * from salesm where id=?";
            st = conn.prepareStatement(sql);
            st.setString(1, id);
            rs = st.executeQuery();

            boolean result = rs.next();
            this.id = rs.getString("id");
            //this.waktu = rs.getDate("waktu");
            // untuk sementara kita akan abaikan dulu field waktu ini
            this.username = rs.getString("username");
            conn.close();

            return result;
        } catch (Exception ex) {
            return false;
        }
    }
    
    public boolean tambah(String username) {
        Connection conn = null;
        PreparedStatement st;

        try {
            conn = DbConnection.connect();
            
            LocalDateTime dt = LocalDateTime.now();
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyMMddHHmmssS");
            id = dt.format(formatter);

            // prepare select statement
            String sql = "INSERT INTO salesm (id,username) values (?,?)";
            st = conn.prepareStatement(sql);
            st.setString(1, id);
            st.setString(2, username);
            st.executeUpdate();
            conn.close();
            
            return true;
        } catch (Exception ex) {
            return false;
        }
    }
    
    public boolean hapus() {
        Connection conn = null;
        PreparedStatement st;
        
        try {
            conn = DbConnection.connect();

            // prepare select statement
            String sql = "DELETE FROM salesm where id=?";
            st = conn.prepareStatement(sql);
            st.setString(1, id);

            st.executeUpdate();

            conn.close();

            return true;
        } catch (Exception ex) {
            return false;
        }
    }
    
    public boolean addDetail(String barangId, Integer qty, Integer harga) {
        SalesDetail detail = new SalesDetail();
        detail.salesId = this.id;
        detail.barangId = barangId;
        detail.qty = qty;
        detail.harga = harga;
        return detail.tambah();
    }
    
    public ArrayList<SalesDetail> getDetail() {
        Connection conn = null;
        PreparedStatement st;
        ResultSet rs;
        ArrayList<SalesDetail> result = new ArrayList<SalesDetail>();

        try {
            conn = DbConnection.connect();

            // prepare select statement
            String sql = "SELECT * from salesd where salesId=?";
            st = conn.prepareStatement(sql);
            st.setString(1, this.id);
            rs = st.executeQuery();

            while(rs.next()) {
                SalesDetail entry = new SalesDetail();
                entry.baca(rs.getInt("id"));
                result.add(entry);
            }
            conn.close();

            return result;
        } catch (Exception ex) {
            return null;
        }
    }
    
    public static ArrayList<Sales> getList() {
        Connection conn = null;
        PreparedStatement st;
        ResultSet rs;
        ArrayList<Sales> result = new ArrayList<Sales>();

        try {
            conn = DbConnection.connect();

            // prepare select statement
            String sql = "SELECT * from salesm";
            st = conn.prepareStatement(sql);
            rs = st.executeQuery();

            while(rs.next()) {
                Sales entry = new Sales();
                entry.baca(rs.getString("id"));
                result.add(entry);
            }
            conn.close();

            return result;
        } catch (Exception ex) {
            return null;
        }
    }
}