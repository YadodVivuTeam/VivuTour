/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entities;

/**
 *
 * @author MienTrungComputer
 */
public class Activiti {
    private int activity_ID;
    private int tour_ID;
    private String landscape_Address;
    private String activityName;
    private String time;
    private boolean isActive;

    public Activiti() {
    }

    public Activiti(int activity_ID, int tour_ID, String landscape_Address, String activityName, String time, boolean isActive) {
        this.activity_ID = activity_ID;
        this.tour_ID = tour_ID;
        this.landscape_Address = landscape_Address;
        this.activityName = activityName;
        this.time = time;
        this.isActive = isActive;
    }

    public Activiti(int activity_ID, String landscape_Address, String activityName, String time, boolean isActive) {
        this.activity_ID = activity_ID;
        this.landscape_Address = landscape_Address;
        this.activityName = activityName;
        this.time = time;
        this.isActive = isActive;
    }

    

    public boolean isIsActive() {
        return isActive;
    }

    public void setIsActive(boolean isActive) {
        this.isActive = isActive;
    }
    
    
    
    public String getActivityName() {
        return activityName;
    }

    public void setActivityName(String activityName) {
        this.activityName = activityName;
    }

    

    public int getActivity_ID() {
        return activity_ID;
    }

    public void setActivity_ID(int activity_ID) {
        this.activity_ID = activity_ID;
    }

    public int getTour_ID() {
        return tour_ID;
    }

    public void setTour_ID(int tour_ID) {
        this.tour_ID = tour_ID;
    }

    public String getLandscape_Address() {
        return landscape_Address;
    }

    public void setLandscape_Address(String landscape_Address) {
        this.landscape_Address = landscape_Address;
    }

    public String getTime() {
        if(time.isEmpty()){
            return "07:00";
        }
        return time.substring(0, 5);
    }

    public void setTime(String time) {
        this.time = time;
    }

    @Override
    public String toString() {
        return "Activiti{" + "activity_ID=" + activity_ID + ", tour_ID=" + tour_ID + ", landscape_Address=" + landscape_Address + ", activityName=" + activityName + ", time=" + time + '}';
    }
    
    
    
}
