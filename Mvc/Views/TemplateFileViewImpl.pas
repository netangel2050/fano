unit TemplateFileViewImpl;

interface

uses
    ResponseIntf,
    ViewParamsIntf,
    ViewIntf,
    OutputBufferIntf,
    TemplateViewImpl;

type
    {------------------------------------------------
     View that can render from a HTML template file
     @author Zamrony P. Juhara <zamronypj@yahoo.com>
    -----------------------------------------------}
    TTemplateFileView = class(TTemplateView)
    private
        function readStream(const filename: string): string;
    public
        constructor create(
            const outputBufferInst : IOutputBuffer;
            const templatePath : string
        ); override;
    end;

implementation

uses
    classes;

    constructor TTemplateFileView.create(
        const outputBufferInst : IOutputBuffer;
        const templatePath : string
    );
    begin
        inherited create(outputBufferInst, readStream(templatePath));
    end;

    function TTemplateFileView.readStream(const filename: string): string;
    var
        fstream : TFileStream;
        n : longint;
        content : string;
    begin
        content := '';
        fstream := TFileStream.Create(filename, fmOpenRead);
        try
            n := fstream.size;
            setLength(content, n);
            //pascal string start from index 1
            fstream.read(content[1], n);
        finally
            fstream.free();
        end;
        result := content;
    end;
end.
