input cfg/uml;

beginfig(1)
    Class.connection("Connection")()(
        "+IsClosed(): bool",
        "+Close(): void",
        "+Reconnect(): void"
    );
    connection.info.iName.fixedWidth := 110;
    Class.clientBase("ClientBase")()(
        "+Close(): void",
        "+Dispose(): void"
    );
    clientBase.info.iName.fixedWidth := 97;

    Class.clientListener("ClientListener")()(
        "+Listen(callbacks...): void"
    );
    clientListener.info.iName.fixedWidth := 165;
    Class.clientSender("ClientSender")()(
        "+Send(task): void"
    );
    clientSender.info.iName.fixedWidth := 105;
    leftToRight(40)(clientListener, clientSender);
    Group.clientApi(clientListener, clientSender);

    topToBottom(40)(connection, clientBase, clientApi);

    drawObjects(connection, clientBase, clientApi);

    link(aggregation)(connection.s -- clientBase.n);
    link(inheritance)(clientBase.s -- clientListener.n);
    link(inheritance)(clientBase.s -- clientSender.n);
endfig;

end.
