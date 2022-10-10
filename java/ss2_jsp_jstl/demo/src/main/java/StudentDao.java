import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class StudentDao {
    Connection conn=null;
    PreparedStatement ps=null;
    ResultSet rs=null;
    public List<Student> getAllStudent(){
        List<Student>list=new ArrayList<>();
         String query="select * from student";
         try{
//             conn=new DBContext().getConnection();
             ps= conn.prepareStatement(query);
             rs=ps.executeQuery();
             while (rs.next()){
//                 list.add(new Student(rs.getInt(1),
//                         rs.getString(2),
//                         rs.getInt(3),
//                         rs.getDate(4)));
             }
         }
         catch (Exception e){

         }
        return list;
    }
}
