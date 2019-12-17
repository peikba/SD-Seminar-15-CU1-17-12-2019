table 50100 "CSD Seminar Setup"
{
    Caption='Seminar Setup';
    DataClassification = CustomerContent;
    
    fields
    {
        field(10;"Primary Key"; Code[10])
        {
            DataClassification = ToBeClassified;
            Caption='Primary Key';
        }
        field(20; "Seminar Nos."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption='Seminar Nos.';
            TableRelation="No. Series";
        }
        field(30; "Seminar Registration Nos."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption='Seminar Registration Nos.';
            TableRelation="No. Series";
        }
        field(40; "Posted Seminar Nos."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption='Posted Seminar Nos.';
            TableRelation="No. Series";
        }
    }
    
    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }
}