table 50121 "CSD Posted Seminar Charge"
{
    // CSD1.00 - 2018-01-01 - D. E. Veloper
    //   Chapter 7 - Lab 3-4
    //     - Created new table
    Caption = 'Seminar Charge';

    fields
    {
        field(1; "Document No."; Code[20])
        {
            Caption = 'Document No.';
            NotBlank = true;
            TableRelation = "CSD Posted Seminar Reg. Header";
            DataClassification = AccountData;
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
            DataClassification = AccountData;
        }
        field(3; Type; Option)
        {
            Caption = 'Type';
            OptionCaption = 'Resource,G/L Account';
            OptionMembers = Resource,"G/L Account";
            DataClassification = AccountData;
        }
        field(4; "No."; Code[20])
        {
            Caption = 'No.';
            TableRelation = if (Type = const (Resource)) Resource."No."
            else
            if (Type = const ("G/L Account")) "G/L Account"."No.";
            DataClassification = AccountData;
        }
        field(5; Description; Text[50])
        {
            Caption = 'Description';
            DataClassification = AccountData;
        }
        field(6; Quantity; Decimal)
        {
            Caption = 'Quantity';
            DecimalPlaces = 0 : 5;
            DataClassification = AccountData;
        }
        field(7; "Unit Price"; Decimal)
        {
            Caption = 'Unit Price';
            AutoFormatType = 2;
            MinValue = 0;
            DataClassification = AccountData;
        }
        field(8; "Total Price"; Decimal)
        {
            Caption = 'Total Price';
            AutoFormatType = 1;
            Editable = false;
            DataClassification = AccountData;
        }
        field(9; "To Invoice"; Boolean)
        {
            Caption = 'To Invoice';
            InitValue = true;
            DataClassification = AccountData;
        }
        field(10; "Bill-to Customer No."; Code[20])
        {
            Caption = 'Bill-to Customer No.';
            TableRelation = Customer."No.";
            DataClassification = AccountData;
        }
        field(11; "Unit of Measure Code"; Code[10])
        {
            Caption = 'Unit of Measure Code';
            TableRelation = if (Type = const (Resource)) "Resource Unit of Measure".Code where ("Resource No." = Field ("No."))
            else
            "Unit of Measure".Code;
            DataClassification = AccountData;
        }
        field(12; "Gen. Prod. Posting Group"; Code[10])
        {
            Caption = 'Gen. Prod. Posting Group';
            TableRelation = "Gen. Product Posting Group".Code;
            DataClassification = AccountData;
        }
        field(13; "VAT Prod. Posting Group"; Code[10])
        {
            Caption = 'VAT Prod. Posting Group';
            TableRelation = "VAT Product Posting Group".Code;
            DataClassification = AccountData;
        }
        field(14; "Qty. per Unit of Measure"; Decimal)
        {
            Caption = 'Qty. per Unit of Measure';
            DataClassification = AccountData;
        }
        field(15; Registered; Boolean)
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

