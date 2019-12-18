page 50135 "CSD Post Seminar Reg. Subpage"
{
    // CSD1.00 - 2018-01-01 - D. E. Veloper
    //   Chapter 7 - Lab 3
    //     - Created new page

    AutoSplitKey = true;
    Caption = 'Posted Lines';
    DelayedInsert = true;
    PageType = ListPart;
    SourceTable = "CSD Posted Seminar Reg. Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Bill-to Customer No."; "Bill-to Customer No.")
                {
                    ApplicationArea = All;
                }
                field("Participant Contact No."; "Participant Contact No.")
                {
                    ApplicationArea = All;
                }
                field("Participant Name"; "Participant Name")
                {
                    ApplicationArea = All;
                }
                field(Participated; Participated)
                {
                    ApplicationArea = All;
                }
                field("Registration Date"; "Registration Date")
                {
                    ApplicationArea = All;
                }
                field("Confirmation Date"; "Confirmation Date")
                {
                    ApplicationArea = All;
                }
                field("To Invoice"; "To Invoice")
                {
                    ApplicationArea = All;
                }
                field(Registered; Registered)
                {
                    ApplicationArea = All;
                }
                field("Seminar Price"; "Seminar Price")
                {
                    ApplicationArea = All;
                }
                field("Line Discount %"; "Line Discount %")
                {
                    ApplicationArea = All;
                }
                field("Line Discount Amount"; "Line Discount Amount")
                {
                    ApplicationArea = All;
                }
                field(Amount; Amount)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}

