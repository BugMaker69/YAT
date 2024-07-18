public class App {
    public static void main(String[] args){

        CsStudent cStudent = new CsStudent("Omar","Alex",4,900.5);
        
        ElectricalStudent electricalStudent = new ElectricalStudent("Ali","Cairo",2,400.5);

        cStudent.enroll("Cs","2");
        cStudent.toString();
        if(cStudent.pass(900)){
            System.out.println("Name: " + cStudent.getName() +" Pass successfully");
        }else{
            System.out.println("Name: " + cStudent.getName() +"Sorry But You Not Pass");
        }

        electricalStudent.enroll("Electrical", "5");
        electricalStudent.toString();
        if(electricalStudent.pass(900)){
            System.out.println("Name: " + electricalStudent.getName() +" Pass successfully");
        }else{
            System.out.println("Name: " + electricalStudent.getName() +"Sorry But You Not Pass");
        }

        Student list[] = {cStudent,electricalStudent};

        for(Student s : list){
            System.out.println(s.getAddress());
            System.out.println(s.getName());
            System.out.println(s.toString());
        }


    }
        
}
