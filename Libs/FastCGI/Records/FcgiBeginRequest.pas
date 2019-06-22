{*!
 * Fano Web Framework (https://fanoframework.github.io)
 *
 * @link      https://github.com/fanoframework/fano
 * @copyright Copyright (c) 2018 Zamrony P. Juhara
 * @license   https://github.com/fanoframework/fano/blob/master/LICENSE (MIT)
 *}

unit FcgiBeginRequest;

interface

{$MODE OBJFPC}
{$H+}

uses

    fastcgi,
    StreamAdapterIntf,
    FcgiRecord;

type

    (*!-----------------------------------------------
     * Begin Request record (FCGI_BEGIN_REQUEST)
     *
     * @author Zamrony P. Juhara <zamronypj@yahoo.com>
     *-----------------------------------------------*)
    TFcgiBeginRequest = class(TFcgiRecord)
    public
        constructor create(
            const aVersion : byte;
            const aType : byte;
            const aRequestId : word;
            const dataStream : IStreamAdapter;
            const role : byte;
            const flag: byte
        );

        constructor create(
            const dataStream : IStreamAdapter;
            const requestId : word;
            const role : byte = FCGI_RESPONDER;
            const flag: byte = 0
        );
    end;

implementation

    constructor TFcgiBeginRequest.create(
        const aVersion : byte;
        const aType : byte;
        const aRequestId : word;
        const dataStream : IStreamAdapter;
        const role : byte;
        const flag: byte
    );
    var beginRequestRec : FCGI_BeginRequestBody;
        bytesToWrite : integer;
    begin
        inherited create(aVersion, aType, aRequestId, dataStream);
        bytesToWrite := sizeOf(FCGI_BeginRequestBody);
        beginRequestRec.role := role;
        beginRequestRec.flags := flag;
        beginRequestRec.reserved[0] := 0;
        beginRequestRec.reserved[1] := 0;
        beginRequestRec.reserved[2] := 0;
        beginRequestRec.reserved[3] := 0;
        beginRequestRec.reserved[4] := 0;
        fContentData.writeBuffer(beginRequestRec, bytesToWrite);
    end;

    constructor TFcgiBeginRequest.create(
        const dataStream : IStreamAdapter;
        const requestId : word;
        const role : byte = FCGI_RESPONDER;
        const flag: byte = 0
    );
    begin
        create(FCGI_VERSION_1, FCGI_BEGIN_REQUEST, requestId, dataStream, role, flag);
    end;
end.
