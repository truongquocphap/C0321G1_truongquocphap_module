package model.bean;

public class Service {
    private int service_id;
    private String service_name;
    private int service_area;
    private double service_cost;
    private int service_max_people;
//    rent (thue)
    private int rent_type_id;
    private int service_type_id;
    private String strandard_room;
    private String description_other_convenience;
    private double pool_area;
    private int number_of_floor;
    private String service_code;

    public Service() {
    }

    public Service(String service_name, int service_area, double service_cost, int service_max_people, int rent_type_id, int service_type_id, String strandard_room, String description_other_convenience, double pool_area, int number_of_floor, String service_code) {
        this.service_name = service_name;
        this.service_area = service_area;
        this.service_cost = service_cost;
        this.service_max_people = service_max_people;
        this.rent_type_id = rent_type_id;
        this.service_type_id = service_type_id;
        this.strandard_room = strandard_room;
        this.description_other_convenience = description_other_convenience;
        this.pool_area = pool_area;
        this.number_of_floor = number_of_floor;
        this.service_code = service_code;
    }

    public Service(int service_id, String service_name, int service_area, double service_cost, int service_max_people, int rent_type_id, int service_type_id, String strandard_room, String description_other_convenience, double pool_area, int number_of_floor, String service_code) {
        this.service_id = service_id;
        this.service_name = service_name;
        this.service_area = service_area;
        this.service_cost = service_cost;
        this.service_max_people = service_max_people;
        this.rent_type_id = rent_type_id;
        this.service_type_id = service_type_id;
        this.strandard_room = strandard_room;
        this.description_other_convenience = description_other_convenience;
        this.pool_area = pool_area;
        this.number_of_floor = number_of_floor;
        this.service_code = service_code;
    }

    public int getService_id() {
        return service_id;
    }

    public void setService_id(int service_id) {
        this.service_id = service_id;
    }

    public String getService_name() {
        return service_name;
    }

    public void setService_name(String service_name) {
        this.service_name = service_name;
    }

    public int getService_area() {
        return service_area;
    }

    public void setService_area(int service_area) {
        this.service_area = service_area;
    }

    public double getService_cost() {
        return service_cost;
    }

    public void setService_cost(double service_cost) {
        this.service_cost = service_cost;
    }

    public int getService_max_people() {
        return service_max_people;
    }

    public void setService_max_people(int service_max_people) {
        this.service_max_people = service_max_people;
    }

    public int getRent_type_id() {
        return rent_type_id;
    }

    public void setRent_type_id(int rent_type_id) {
        this.rent_type_id = rent_type_id;
    }

    public int getService_type_id() {
        return service_type_id;
    }

    public void setService_type_id(int service_type_id) {
        this.service_type_id = service_type_id;
    }

    public String getStrandard_room() {
        return strandard_room;
    }

    public void setStrandard_room(String strandard_room) {
        this.strandard_room = strandard_room;
    }

    public String getDescription_other_convenience() {
        return description_other_convenience;
    }

    public void setDescription_other_convenience(String description_other_convenience) {
        this.description_other_convenience = description_other_convenience;
    }

    public double getPool_area() {
        return pool_area;
    }

    public void setPool_area(double pool_area) {
        this.pool_area = pool_area;
    }

    public int getNumber_of_floor() {
        return number_of_floor;
    }

    public void setNumber_of_floor(int number_of_floor) {
        this.number_of_floor = number_of_floor;
    }

    public String getService_code() {
        return service_code;
    }

    public void setService_code(String service_code) {
        this.service_code = service_code;
    }
}
