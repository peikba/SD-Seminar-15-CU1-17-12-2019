table 50119 "CSD Posted Seminar Reg. Line"
{
    // CSD1.00 - 2018-01-01 - D. E. Veloper
    // Chapter 7 - Lab 3-3
    Caption = 'Posted Seminar Reg. Line';

    fields
    {
        field(1; "Document No."; Code[20])
        {
            Caption = 'Document No.';
            TableRelation = "CSD Posted Seminar Reg. Header";
            DataClassification = AccountData;
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
            DataClassification = AccountData;
        }
        field(3; "Bill-to Customer No."; Code[20])
        {
            TableRelation = Customer;
            Caption = 'Bill-to Customer No.';
            DataClassification = AccountData;
        }
        field(4; "Participant Contact No."; Code[20])
        {
            TableRelation = Contact;
            Caption = 'Participant Contact No.';
            DataClassification = AccountData;
        }
        field(5; "Participant Name"; Text[50])
        {
            Caption = 'Participant Name';
            CalcFormula = Lookup (Contact.Name where ("No." = Field ("Participant Contact No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(6; "Registration Date"; Date)
        {
            Caption = 'Registration Date';
            Editable = false;
            DataClassification = AccountData;
        }
        field(7; "To Invoice"; Boolean)
        {
            Caption = 'To Invoice';
            InitValue = true;
            DataClassification = AccountData;
        }
        field(8; Participated; Boolean)
        {
            Caption = 'Participated';
            DataClassification = AccountData;
        }
        field(9; "Confirmation Date"; Date)
        {
            Caption = 'Confirmation Date';
            Editable = false;
            DataClassification = AccountData;
        }
        field(10; "Seminar Price"; Decimal)
        {
            Caption = 'Seminar Price';
            AutoFormatType = 2;
            DataClassification = AccountData;
        }
        field(11; "Line Discount %"; Decimal)
        {
            Caption = 'Line Discount %';
            DecimalPlaces = 0 : 5;
            MaxValue = 100;
            MinValue = 0;
            DataClassification = AccountData;
        }
        field(12; "Line Discount Amount"; Decimal)
        {
            Caption = 'Line Discount Amount';
            AutoFormatType = 1;
            DataClassification = AccountData;
        }
        field(13; Amount; Decimal)
        {
            Caption = 'Amount';
            AutoFormatType = 1;
            DataClassification = AccountData;
        }
        field(14; Registered; Boolean)
        {
            Caption = 'Registered';
            Editable = false;
            DataClassification = AccountData;
        }
    }

    keys
    {
        key(Key1; "Document No.", "Line No.")
        {
        }
    }
}

