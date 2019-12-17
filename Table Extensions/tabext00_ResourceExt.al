tableextension 50100 "CSD Resource Ext" extends Resource
{
    fields
    {
        field(50101; "CSD Resource Type"; Option)
        {
            Caption = 'Resource Type';
            DataClassification = AccountData;
            OptionMembers = Internal,External;
            OptionCaption = 'Internal,External';

        }
        field(50102; "CSD Maximum Participants"; Integer)
        {
            DataClassification = AccountData;
            Caption = 'Maximum Participants';
        }
        field(50103; "CSD Quantity Per Day"; Decimal)
        {
            DataClassification = AccountData;
            Caption = 'Quantity Per Day';
        }
        modify("Profit %")
        {
            trigger OnAfterValidate()
            begin
                TestField("Unit Cost");
            end;
        }
        modify(Type)
        {
            OptionCaption = 'Instructor,Room';
        }
    }
}