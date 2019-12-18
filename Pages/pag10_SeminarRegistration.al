page 50110 "CSD Seminar Registration"
{
    // CSD1.00 - 2018-01-01 - D. E. Veloper
    //   Chapter 6 - Lab 3-1
    //     - Created new page
    //   Chapter 8 - Lab 2 - 4
    //   Added Action Navigate


    Caption = 'Seminar Registration';
    PageType = Document;
    SourceTable = "CSD Seminar Reg. Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; "No.")
                {
                    AssistEdit = true;
                    trigger OnAssistEdit();
                    begin
                        if AssistEdit(xRec) then
                            CurrPage.UPDATE;
                    end;
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
            part(SeminarRegistrationLines; "CSD Seminar Reg. Subpage")
            {
                Caption = 'Lines';
                SubPageLink = "Document No." = field ("No.");
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
                SubPageLink = "No." = field ("Seminar No.");
            }
            part("Customer Details FactBox"; "Customer Details FactBox")
            {
                ApplicationArea = All;
                Provider = SeminarRegistrationLines;
                SubPageLink = "No." = field ("Bill-to Customer No.");
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
                    ApplicationArea = All;
                    Caption = 'Co&mments';
                    Image = Comment;
                    RunObject = Page 50106;
                    RunPageLink = "No." = Field ("No.");
                    RunPageView = where ("Table Name" = const ("Seminar Registration"));
                }
                action("&Charges")
                {
                    ApplicationArea = All;
                    Caption = '&Charges';
                    Image = Costs;
                    RunObject = Page 50124;
                    RunPageLink = "Document No." = Field ("No.");
                }
            }
        }
    }
}

