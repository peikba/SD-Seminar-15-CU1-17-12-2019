page 50134 "CSD Posted Seminar Reg."
{
    // CSD1.00 - 2018-01-01 - D. E. Veloper
    //   Chapter 7 - Lab 3
    //     - Created new page

    Caption = 'Posted Seminar Registration';
    Editable = false;
    PageType = Document;
    SourceTable = "CSD Posted Seminar Reg. Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; "No.")
                {
                    ApplicationArea = All;
                }
                field("Starting Date"; "Starting Date")
                {
                    ApplicationArea = All;
                }
                field("Seminar No."; "Seminar No.")
                {
                    ApplicationArea = All;
                }
                field("Seminar Name"; "Seminar Name")
                {
                    ApplicationArea = All;
                }
                field("Instructor Resource No."; "Instructor Resource No.")
                {
                    ApplicationArea = All;
                }
                field("Instructor Name"; "Instructor Name")
                {
                    ApplicationArea = All;
                }
                field("Posting Date"; "Posting Date")
                {
                    ApplicationArea = All;
                }
                field("Document Date"; "Document Date")
                {
                    ApplicationArea = All;
                }
                field(Status; Status)
                {
                    ApplicationArea = All;
                }
                field(Duration; Duration)
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
            }
            part(SeminarRegistrationLines; "CSD Post Seminar Reg. Subpage")
            {
                SubPageLink = "Document No." = Field ("No.");
                ApplicationArea = All;
            }
            group("Seminar Room")
            {
                field("Room Resource No."; "Room Resource No.")
                {
                    ApplicationArea = All;
                }
                field("Room Name"; "Room Name")
                {
                    ApplicationArea = All;
                }
                field("Room Address"; "Room Address")
                {
                    ApplicationArea = All;
                }
                field("Room Address 2"; "Room Address 2")
                {
                    ApplicationArea = All;
                }
                field("Room Post Code"; "Room Post Code")
                {
                    ApplicationArea = All;
                }
                field("Room City"; "Room City")
                {
                    ApplicationArea = All;
                }
                field("Room Country/Reg. Code"; "Room Country/Reg. Code")
                {
                    ApplicationArea = All;
                }
                field("Room County"; "Room County")
                {
                    ApplicationArea = All;
                }
            }
            group(Invoicing)
            {
                field("Gen. Prod. Posting Group"; "Gen. Prod. Posting Group")
                {
                    ApplicationArea = All;
                }
                field("VAT Prod. Posting Group"; "VAT Prod. Posting Group")
                {
                    ApplicationArea = All;
                }
                field("Seminar Price"; "Seminar Price")
                {
                    ApplicationArea = All;
                }
            }
        }
        area(factboxes)
        {
            part("Seminar Details FactBox"; "CSD Seminar Details FactBox")
            {
                ApplicationArea = All;
                SubPageLink = "No." = Field ("Seminar No.");
            }
            part("Customer Details FactBox"; "Customer Details FactBox")
            {
                Provider = SeminarRegistrationLines;
                SubPageLink = "No." = Field ("Bill-to Customer No.");
                ApplicationArea = All;
            }
            systempart("Links"; Links)
            {
                ApplicationArea = All;
            }
            systempart("Notes"; Notes)
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Seminar Registration")
            {
                Caption = '&Seminar Registration';
                action("Co&mments")
                {
                    Caption = 'Co&mments';
                    Image = Comment;
                    RunObject = page "CSD Seminar Comment List";
                    RunPageLink = "No." = Field ("No.");
                    RunPageView = where ("Table Name" = const ("Posted Seminar Registration"));
                    ApplicationArea = All;
                }
                action("&Charges")
                {
                    Caption = '&Charges';
                    Image = Costs;
                    RunObject = Page "CSD Posted Seminar Charges";
                    RunPageLink = "Document No." = Field ("No.");
                    ApplicationArea = All;
                }
            }
        }
    }
}

