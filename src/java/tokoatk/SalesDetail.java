package tokoatk;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


public class SalesDetail {
    public Integer id;
    public String salesId;
    public String barangId;
    public Integer qty;
    public Integer harga;
    
    public Integer getId() {
        return id;
    }
    
    public String getBarangId() {
        return barangId;
    }
            
    public String getBarangNama() {
        Barang barang = new Barang();
        barang.baca(barangId);
        return barang.getNama();
    }
            
    public Integer getQty() {
        return qty;
    }
        
    public Integer getHarga() {
        return harga;
    }
            
    public Integer getTotal() {
        return harga * qty;
    }
    
    public boolean tambah() {
        Connection conn = null;
        PreparedStatement st;

        try {
            conn = DbConnection.connect();

            // prepare select statement
            String sql = "INSERT INTO salesd (salesId,barangId,qty,harga) values (?,?,?,?)";
            st = conn.prepareStatement(sql);
            st.setString(1, salesId);
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
            
    public boolean baca(Integer id) {
        Connection conn = null;
        PreparedStatement st;
        ResultSet rs;

        try {
            conn = DbConnection.connect();

            // prepare select statement
            String sql = "SELECT * from salesd where id=?";
            st = conn.prepareStatement(sql);
            st.setInt(1, id);
            rs = st.executeQuery();

            boolean result = rs.next();
            this.id = id;
            this.salesId = rs.getString("salesId");
            this.barangId = rs.getString("barangId");
            this.qty = rs.getInt("qty");
            this.harga = rs.getInt("harga");
            conn.close();

            return result;
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
            String sql = "DELETE FROM salesd where id=?";
            st = conn.prepareStatement(sql);
            st.setInt(1, id);

            st.executeUpdate();

            conn.close();

            return true;
        } catch (Exception ex) {
            return false;
        }
    }
    
    public static ArrayList<SalesDetail> getAll() {
        ArrayList<SalesDetail> list = new ArrayList<>();
        try (Connection conn = DbConnection.connect();
             PreparedStatement st = conn.prepareStatement("SELECT * FROM salesd");
             ResultSet rs = st.executeQuery()) {

            while (rs.next()) {
                SalesDetail detail = new SalesDetail();
                detail.id = rs.getInt("id");
                detail.salesId = rs.getString("salesId");
                detail.barangId = rs.getString("barangId");
                detail.qty = rs.getInt("qty");
                detail.harga = rs.getInt("harga");
                list.add(detail);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            return null;
        }
        return list;
    }

}