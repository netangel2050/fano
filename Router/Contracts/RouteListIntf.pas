{*!
 * Fano Web Framework (https://fano.juhara.id)
 *
 * @link      https://github.com/zamronypj/fano
 * @copyright Copyright (c) 2018 Zamrony P. Juhara
 * @license   https://github.com/zamronypj/fano/blob/master/LICENSE (GPL 3.0)
 *}

unit RouteListIntf;

interface

{$MODE OBJFPC}

uses
    HashListIntf;

type

    (*!------------------------------------------------
     * interface for any class having capability to
     * manage and retrieve routes
     *
     * @author Zamrony P. Juhara <zamronypj@yahoo.com>
     *-------------------------------------------------*)
    IRouteList = interface(IHashList)
        ['{0BE04022-B3E7-4AE9-83F8-829D07F7EB83}']

        (*!-----------------------------------------
         * match item using its transformed key
         *------------------------------------------*)
        function match(const transformedKey : string) : pointer;
    end;

implementation
end.
