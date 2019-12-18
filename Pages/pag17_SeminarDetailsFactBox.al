page 50117 "CSD Seminar Details FactBox"
{
    // CSD1.00 - 2018-01-01 - D. E. Veloper
    //   Chapter 6 - Lab 2
    //     - Created new page

    Caption = 'Seminar Details';
    PageType = CardPart;
    SourceTable = "CSD Seminar";

    layout
    {
        area(content)
        {
            field("No."; "No.")
            {
                ApplicationArea = All;
            }
            field(Name; Name)
            {
                ApplicationArea = All;
            }
            field("Seminar Duration"; "Seminar Duration")
            {
                ApplicationArea = All;
            }
            field("Minimum Participants"; "Minimum Participants")
            {
                ApplicationArea = All;
            }
            field("Maximum Participants"; "Maximum Participants")
            {
                ApplicationArea = All;
            }
            field("Seminar Price"; "Seminar Price")
            {
                ApplicationArea = All;
            }
        }
    }
}

