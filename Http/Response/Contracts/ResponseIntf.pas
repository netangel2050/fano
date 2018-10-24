{*!
 * Fano Web Framework (https://fano.juhara.id)
 *
 * @link      https://github.com/zamronypj/fano
 * @copyright Copyright (c) 2018 Zamrony P. Juhara
 * @license   https://github.com/zamronypj/fano/blob/master/LICENSE (GPL 2.0)
 *}

unit ResponseIntf;

interface

uses

    HeadersIntf,
    CloneableIntf;

type

    (*!----------------------------------------------
     * interface for any class having capability as
     * HTTP response
     *
     * @author Zamrony P. Juhara <zamronypj@yahoo.com>
     *-----------------------------------------------*)
    IResponse = interface(ICloneable)
        ['{36D6274C-3EE1-4262-BACB-2A313C673206}']

        (*!------------------------------------
         * get http headers instance
         *-------------------------------------
         * @return header instance
         *-------------------------------------*)
        function headers() : IHeaders;

        (*!------------------------------------
         * output http response to STDIN
         *-------------------------------------
         * @return current instance
         *-------------------------------------*)
        function write() : IResponse;
    end;

implementation
end.
