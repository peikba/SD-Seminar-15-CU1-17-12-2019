codeunit 50138
 "CSD Upgrade Seminar"
{
    Subtype = Upgrade;

    trigger OnCheckPreconditionsPerCompany()
    var
        Info: ModuleInfo;
    begin
        NavApp.GetCurrentModuleInfo(Info);
        message('%1', Info.AppVersion());
        case format(Info.DataVersion()) of
            '1.0.0.0':
                begin
                    // Some Code
                    // Some more code
                end;
        end;
    end;

    trigger OnUpgradePerCompany()
    begin

    end;

    trigger OnValidateUpgradePerCompany()
    begin

    end;
}