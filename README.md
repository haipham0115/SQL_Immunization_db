# SQL_Immunization_db
Setting up PostgreSQL database, storing synthetic data of a healthcare provider system
Intruction and schema from Data Wizardry (https://github.com/Data-Wizardry/SQL-Webinar-1/blob/main/Create_New_Tables.sql)

## Overview:
This repository is documentatin for my own learning experience, including:
* Hand-on works with synthetic healthcare dataset (all data in this work is not real, synthetic data created by Synthea)
* PostgreSQl database setting up
* Data manipulation with SQL 
* Data retrieval, and load into reporting BI software (Tableau)

## Project Objectives:
Display metrics and visualizations of Flu Vaccination report of a healthcare provider in Massachusetts:
* 1) Total % of patient getting flu shot in 2022, stratified by:
**   a) Age
     b) Race
     c) Residential area (Zip Code)
* 2) Trended total flu shots over the course of 2022
* 3) Total number of flu shots given in 2022

 ## Requirements (Scopes):
* 1) Patient must have been "Currently Active at our hospital system" (started within 3 years)
* 2) Following the guidline: "Everyone, who are 6 months and older, should be receiving flu shots"

