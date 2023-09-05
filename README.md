# MHSDS_set_up
Mental Health Services Dataset (MHSDS) MySQL set up and basic cleaning

MYSQL code to impoort raw data files as received from NHS England

The data covers version 4.1 of the MHSDS (though tables and variables are set up in the version 5.0 format) for financial years (or HES years) 2016/17 to 2019/20, and for people aged 0 - 55 years. Data model available from the NHS England website: https://digital.nhs.uk/binaries/content/assets/website-assets/data-and-information/data-sets/mhsds/mhsds_v4.1_data_model.pdf
And the technical output specification: 
https://digital.nhs.uk/binaries/content/assets/website-assets/data-and-information/data-sets/mhsds/mhsds_v4.1_technical_output_specification_v4.1.12_061021_publishedversion.xlsm

The MySQL code sets up 4 key tables: 
  - MHS001: Master Patient Index
  - MHS101: Service or Team Referral
  - MHS201: Care Contact
  - MHS202: Care Activity

Indexes are created for the primary keys that link the tables together.

Two very basic cleaning steps are performed:
1) Duplicate removal. Other than table MHS001, all tables received by NHSE contained numerous complete duplicates. This might be an artifact specific to the NIC-393510 data extract, or a wider problem with the MHSDS data?
  
2) Creation of a variable to indicate the financial year in which the record took place (HES year). This will allow for comparisons with published data. Variables used to determine HES year:
  - MHS001: RecordStartDate (Record Start Date MPI)
  - MHS101: RecordStartDate (Record Start Date Referral)
  - MHS201: CareContDate (Care Contact Date)

