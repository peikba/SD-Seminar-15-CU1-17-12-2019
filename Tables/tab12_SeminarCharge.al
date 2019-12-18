table 50112 "CSD Seminar Charge"
{
    // CSD1.00 - 2018-01-01 - D. E. Veloper
    //   Chapter 6 - Lab 1
    //     - Created new table
    Caption='Seminar Charge';

    fields
    {
        field(1;"Document No.";Code[20])
        {
            Caption='Document No.';
            NotBlank = true;
            TableRelation = "CSD Seminar Reg. Header";
            DataClassification = AccountData;
        }
        field(2;"Line No.";Integer)
        {
            Caption='Line No.';
            DataClassification = AccountData;
        }
        field(3;Type;Option)
        {
            Caption='Type';
            OptionCaption = 'Resource,G/L Account';
            OptionMembers = Resource,"G/L Account";
            DataClassification = AccountData;

            trigger OnValidate();
            var
                OldType : Integer;
            begin
                if Type <> xRec.Type then begin
                  OldType:=Type;  
                  Init;
                  Type:=OldType;
                end;
            end;
        }
        field(4;"No.";Code[20])
        {
            Caption='No.';
            TableRelation = if (Type=const(Resource)) Resource."No."
                            else if (Type=const("G/L Account")) "G/L Account"."No.";
            DataClassification = AccountData;

            trigger OnValidate();
            begin
                case Type of
                  Type::Resource:
                    begin
                      Resource.Get("No.");
                      Resource.TestField(Blocked,false);
                      Resource.TestField("Gen. Prod. Posting Group");
                      Description := Resource.Name;
                      "Gen. Prod. Posting Group" := Resource."Gen. Prod. Posting Group";
                      "VAT Prod. Posting Group" := Resource."VAT Prod. Posting Group";
                      "Unit of Measure Code" := Resource."Base Unit of Measure";
                      "Unit Price" := Resource."Unit Price";
                    end;
                  Type::"G/L Account":
                    begin
                      GLAccount.Get("No.");
                      GLAccount.CheckGLAcc();
                      GLAccount.TestField("Direct Posting",true);
                      Description := GLAccount.Name;
                      "Gen. Prod. Posting Group" := GLAccount."Gen. Bus. Posting Group";
                      "VAT Prod. Posting Group" := GLAccount."VAT Bus. Posting Group";
                    end;
                end;
            end;
        }
        field(5;Description;Text[50])
        {
            Caption='Description';
            DataClassification = AccountData;
        }
        field(6;Quantity;Decimal)
        {
            Caption='Quantity';
            DecimalPlaces = 0:5;
            DataClassification = AccountData;

            trigger OnValidate();
            begin
                "Total Price" := Round("Unit Price" * Quantity,0.01);
            end;
        }
        field(7;"Unit Price";Decimal)
        {
            Caption='Unit Price';
            AutoFormatType = 2;
            MinValue = 0;
            DataClassification = AccountData;

            trigger OnValidate();
            begin
                "Total Price" := Round("Unit Price" * Quantity,0.01);
            end;
        }
        field(8;"Total Price";Decimal)
        {
            Caption='Total Price';
            AutoFormatType = 1;
            Editable = false;
            DataClassification = AccountData;

            trigger OnValidate();
            begin
              if (Quantity<>0) then 
                "Unit Price" := Round("Total Price" / Quantity,0.01)
              else
                "Unit Price":=0;
            end;
        }
        field(9;"To Invoice";Boolean)
        {
            Caption='To Invoice';
            InitValue = true;
            DataClassification = AccountData;
        }
        field(10;"Bill-to Customer No.";Code[20])
        {
            Caption='Bill-to Customer No.';
            TableRelation = Customer."No.";
            DataClassification = AccountData;
        }
        field(11;"Unit of Measure Code";Code[10])
        {
            Caption='Unit of Measure Code';
            TableRelation = if (Type=const(Resource)) "Resource Unit of Measure".Code where ("Resource No."=Field("No."))
                            else "Unit of Measure".Code;
            DataClassification = AccountData;

            trigger OnValidate();
            begin
                case Type of
                  Type::Resource:
                    begin
                      Resource.Get("No.");
                      if "Unit of Measure Code" = '' then begin
                        "Unit of Measure Code" := Resource."Base Unit of Measure";
                      end;
                      ResourceUofM.Get("No.","Unit of Measure Code");
                      "Qty. per Unit of Measure" := ResourceUofM."Qty. per Unit of Measure";
                      "Total Price" := Round(Resource."Unit Price" * "Qty. per Unit of Measure");
                    end;
                  Type::"G/L Account":
                    begin
                      "Qty. per Unit of Measure" := 1;
                    end;
                end;
                if CurrFieldNo = FieldNO("Unit of Measure Code") then begin
                  Validate("Unit Price");
                end;
            end;
        }
        field(12;"Gen. Prod. Posting Group";Code[10])
        {
            Caption='Gen. Prod. Posting Group';
            TableRelation = "Gen. Product Posting Group".Code;
            DataClassification = AccountData;
        }
        field(13;"VAT Prod. Posting Group";Code[10])
        {
            Caption='VAT Prod. Posting Group';
            TableRelation = "VAT Product Posting Group".Code;
            DataClassification = AccountData;
        }
        field(14;"Qty. per Unit of Measure";Decimal)
        {
            Caption='Qty. per Unit of Measure';
            DataClassification = AccountData;
        }
        field(15;Registered;Boolean)
        {
            Caption='Registered';
            Editable = false;
            DataClassification = AccountData;
        }
    }

    keys
    {
        key(Key1;"Document No.","Line No.")
        {
        }
    }

    trigger OnDelete();
    begin
        TestField(Registered,false);
    end;

    trigger OnInsert();
    begin
        SeminarRegistrationHeader.Get("Document No.");
    end;

    var
        GLAccount : Record "G/L Account";
        Resource : Record Resource;
        ResourceUofM : Record "Resource Unit of Measure";
        SeminarRegistrationHeader : Record "CSD Seminar Reg. Header";
}

