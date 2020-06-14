package gov.gtas.summary;

import java.util.ArrayList;
import java.util.List;

public class SummaryMetaData {
    public String summary;
    public List<String> countryList = new ArrayList<>();
    public List<String> orgList = new ArrayList<>();
    public String countryGroupName;
    public String orgGroupName;

    public SummaryMetaData(){}

    public String getOrgGroupName() {
        return orgGroupName;
    }

    public void setOrgGroupName(String orgGroupName) {
        this.orgGroupName = orgGroupName;
    }

    public List<String> getOrgList() {
        return orgList;
    }

    public void setOrgList(List<String> orgList) {
        this.orgList = orgList;
    }

    public List<String> getCountryList() {
        return countryList;
    }

    public void setCountryList(List<String> countryList) {
        this.countryList = countryList;
    }

    public String getCountryGroupName() {
        return countryGroupName;
    }

    public void setCountryGroupName(String countryGroupName) {
        this.countryGroupName = countryGroupName;
    }

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }
}
