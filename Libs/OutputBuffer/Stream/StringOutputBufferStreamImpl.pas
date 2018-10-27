{*!
 * Fano Web Framework (https://fano.juhara.id)
 *
 * @link      https://github.com/zamronypj/fano
 * @copyright Copyright (c) 2018 Zamrony P. Juhara
 * @license   https://github.com/zamronypj/fano/blob/master/LICENSE (GPL 3.0)
 *}

unit StringOutputBufferStreamImpl;

interface

{$MODE OBJFPC}
{$H+}

uses

    classes,
    OutputBufferStreamIntf,
    OutputBufferStreamImpl;

type

    (*!------------------------------------------------
     * IOutputBufferStream implementation using
     * TStringStream for store output buffering content
     *
     * @author Zamrony P. Juhara <zamronypj@yahoo.com>
     *---------------------------------------------------*)
    TStringOutputBufferStream = class (TOutputBufferStreamAdapter, IOutputBufferStream)
    protected
        function createStream() : TStream; override;
    public
        function getContent() : string; override;
    end;

implementation

    function TStringOutputBufferStream.createStream() : TStream;
    begin
        result := TStringStream.create('');
    end;

    function TStringOutputBufferStream.getContent() : string;
    begin
        //fstream always TStringStream, so this is safe typecast
        result := TStringStream(fstream).dataString;
    end;

end.