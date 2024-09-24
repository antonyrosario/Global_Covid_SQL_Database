--------------------------------------------------------------------------------------------------------
-------------------------------------Locations List-----------------------------------------------------
--------------------------------------------------------------------------------------------------------


CREATE TABLE Locations_list (
    Countries TEXT NOT NULL,
    ISO_Code  TEXT PRIMARY KEY
                   NOT NULL
);


--------------------------------------------------------------------------------------------------------
-------------------------------------Vaccine List-------------------------------------------------------
--------------------------------------------------------------------------------------------------------


CREATE TABLE Vaccine_list (
    Vaccine_Name TEXT NOT NULL,
    Vaccine_ID   TEXT PRIMARY KEY
                      NOT NULL
);


--------------------------------------------------------------------------------------------------------
-------------------------------------Locations----------------------------------------------------------
--------------------------------------------------------------------------------------------------------


CREATE TABLE Locations (
    ISO_Code,
    Date,
    Vaccine_ID,
    Source_Name,
    Source_Website,
    FOREIGN KEY (
        ISO_Code
    )
    REFERENCES Locations_list (ISO_Code),
    FOREIGN KEY (
        Vaccine_ID
    )
    REFERENCES Vaccine_list (Vaccine_ID),
    PRIMARY KEY (
        ISO_Code,
        Date,
        Vaccine_ID
    )
);



--------------------------------------------------------------------------------------------------------
-------------------------------------Vaccinations-------------------------------------------------------
--------------------------------------------------------------------------------------------------------


CREATE TABLE Vaccinations (
    ISO_Code,
    Date,
    TotalVaccinations,
    Total_Vaccinations_per_hundred,
    People_vaccinated,
    People_vaccinated_per_hundred,
    People_fully_vaccinated,
    People_fully_vaccinated_per_hundred,
    Total_Boosters,
    Total_Boosters_per_hundred,
    Daily_Vaccinations_raw,
    Daily_Vaccinations,
    Daily_Vaccinations_per_millions,
    Daily_People_Vaccinated,
    Daily_People_Vaccinated_per_hundred,
    FOREIGN KEY (
        ISO_Code
    )
    REFERENCES Locations_list (ISO_Code),
    PRIMARY KEY (
        ISO_Code,
        Date
    )
);


--------------------------------------------------------------------------------------------------------
-------------------------------------Vaccinations_by_age_group------------------------------------------
--------------------------------------------------------------------------------------------------------


CREATE TABLE Vaccinations_by_age_group (
    ISO_Code,
    Date,
    Age_group,
    People_Vaccinated_per_hundred,
    People_Fully_Vaccinated_per_hundred,
    People_with_booster_per_hundred,
    FOREIGN KEY (
        ISO_Code
    )
    REFERENCES Locations_list (ISO_Code),
    PRIMARY KEY (
        ISO_Code,
        Date,
        Age_group
    )
);


--------------------------------------------------------------------------------------------------------
-------------------------------------Vaccinations_by_manufacturers--------------------------------------
--------------------------------------------------------------------------------------------------------


CREATE TABLE Vaccinations_by_manufacturers (
    ISO_Code,
    Date,
    Vaccine_ID,
    Total_Vaccinations,
    FOREIGN KEY (
        ISO_Code
    )
    REFERENCES Locations_list (ISO_Code),
    FOREIGN KEY (
        Vaccine_ID
    )
    REFERENCES Vaccine_list (Vaccine_ID),
    PRIMARY KEY (
        ISO_Code,
        Date,
        Vaccine_ID
    )
);


--------------------------------------------------------------------------------------------------------
-------------------------------------US State Vaccinations----------------------------------------------
--------------------------------------------------------------------------------------------------------


CREATE TABLE US_State_Vaccinations (
    ISO_Code,
    Date,
    Location,
    Total_vaccinations,
    Total_distributed,
    People_vaccinated,
    People_fully_vaccinated_per_hundred,
    Total_vaccinations_per_hundred,
    People_fully_vaccinated,
    People_vaccinated_per_hundred,
    Distributed_per_hundred,
    Daily_vaccinations_raw,
    Daily_vaccinations,
    Daily_vaccinations_per_million,
    Share_doses_used,
    Total_boosters,
    Total_boosters_per_hundred,
    FOREIGN KEY (
        ISO_Code
    )
    REFERENCES Locations_list (ISO_Code),
    PRIMARY KEY (
        ISO_Code,
        Date,
        Location
    )
);


--------------------------------------------------------------------------------------------------------
-------------------------------------Country_Daily_Observation------------------------------------------
--------------------------------------------------------------------------------------------------------


CREATE TABLE Country_Daily_Observation (
    ISO_Code,
    Date,
    Vaccine_ID,
    Source_url,
    FOREIGN KEY (
        ISO_Code
    )
    REFERENCES Locations_list (ISO_Code),
    FOREIGN KEY (
        Vaccine_ID
    )
    REFERENCES Vaccine_list (Vaccine_ID),
    PRIMARY KEY (
        ISO_Code,
        Date,
        Vaccine_ID
    )
);


--------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------