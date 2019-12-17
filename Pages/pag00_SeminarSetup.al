page 50100 "CSD Seminar Setup"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "CSD Seminar Setup";
    Caption = 'Seminar Setup';
    DeleteAllowed = false;
    InsertAllowed = false;


    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field("Seminar Nos."; "Seminar Nos.")
                {
                    ApplicationArea = All;

                }
                field("Seminar Registration Nos."; "Seminar Registration Nos.")
                {
                    ApplicationArea = All;

                }
                field("Posted Seminar Nos."; "Posted Seminar Nos.")
                {
                    ApplicationArea = All;

                }
            }
        }
    }
    trigger OnOpenPage()
    begin
        if not get then begin
            Init();
            Insert();
        end;
    end;
}