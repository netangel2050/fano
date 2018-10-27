{*!
 * Fano Web Framework (https://fano.juhara.id)
 *
 * @link      https://github.com/zamronypj/fano
 * @copyright Copyright (c) 2018 Zamrony P. Juhara
 * @license   https://github.com/zamronypj/fano/blob/master/LICENSE (GPL 3.0)
 *}

unit MiddlewareChainFactoryIntf;

interface

{$MODE OBJFPC}

uses

   MiddlewareChainIntf,
   MiddlewareCollectionIntf;

type

    (*!------------------------------------------------
     * interface for any class having capability to create
     * middleware chain instance
     *
     * @author Zamrony P. Juhara <zamronypj@yahoo.com>
     *-----------------------------------------------*)
    IMiddlewareChainFactory = interface
        ['{3D57F1EB-46CD-4D63-B77B-D51C656139EE}']

        function build(
            const appBeforeMiddlewares : IMiddlewareCollection;
            const appAfterMiddlewares : IMiddlewareCollection;
            const routeBeforeMiddlewares : IMiddlewareCollection;
            const routeAfterMiddlewares : IMiddlewareCollection
        ) : IMiddlewareChain;
    end;

implementation

end.
