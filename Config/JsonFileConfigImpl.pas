{*!
 * Fano Web Framework (https://fano.juhara.id)
 *
 * @link      https://github.com/zamronypj/fano
 * @copyright Copyright (c) 2018 Zamrony P. Juhara
 * @license   https://github.com/zamronypj/fano/blob/master/LICENSE (GPL 3.0)
 *}

unit JsonFileConfigImpl;

interface

{$MODE OBJFPC}
{$H+}

uses
    fpjson,
    jsonparser,
    DependencyIntf,
    ConfigIntf,
    JsonConfigImpl;

type

    (*!------------------------------------------------------------
     * Application configuration class that load data from JSON file
     *
     * @author Zamrony P. Juhara <zamronypj@yahoo.com>
     *-------------------------------------------------------------*)
    TJsonFileConfig = class(TJsonConfig, IAppConfiguration, IDependency)
    private
        jsonConfigFile : string;
    protected
        function buildJsonData() : TJSONData; override;
    public
        constructor create(const configFile : string);
    end;

implementation

uses
    sysutils,
    classes;

    function TJsonFileConfig.buildJsonData() : TJSONData;
    var fstream : TFileStream;
    begin
        //open for read and share but deny write
        //so if multiple processes of our application access same file
        //at the same time they stil can open and read it
        fstream := TFileStream.create(jsonConfigFile, fmOpenRead or fmShareDenyWrite);
        try
            result := getJSON(fstream);
        finally
            fstream.free();
        end;
    end;

    constructor TJsonFileConfig.create(const configFile : string);
    begin
        jsonConfigFile := configFile;
        //must be called after we set jsonConfigFile
        inherited create();
    end;

end.
