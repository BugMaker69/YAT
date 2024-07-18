public class ElectricalStudent extends Student implements Enroll {
    

    private int year;
    private double fee;
    private String depName;
    private String depId;
    
    


    public ElectricalStudent(String name, String address, int year, double fee) {
        super(name, address);
        this.year = year;
        this.fee = fee;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public double getFee() {
        return fee;
    }

    public void setFee(double fee) {
        this.fee = fee;
    }



    @Override
    public String toString() {
        return "From ElectricalStudent: , " + "Name: " + super.getName() +  " , " + "DepName: " + depName;
    }


    @Override
    public void enroll(String depName, String depId) {
        this.depId = depId;
        this.depName = depName;
    }


    @Override
    public boolean pass(int grades) {
        return grades>=500;
    }


}
