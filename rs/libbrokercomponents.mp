input cfg/uml;

beginfig(1)
    Component.Protobuf("Google Protobuf")();
    Component.AMQP("AMQP")();
    leftToRight(40)(Protobuf, AMQP);
    Group.external(Protobuf, AMQP);

    Component.RPC("RPC")();
    topToBottom(40)(external, RPC);

    drawObjects(external, RPC);

    link(providedInterface)(Protobuf.s -- 0.5[Protobuf.s, RPC.n]);
    link(requiredInterface)(RPC.n -- 0.5[Protobuf.s, RPC.n]);

    link(providedInterface)(AMQP.s -- 0.5[AMQP.s, RPC.n]);
    link(requiredInterface)(RPC.n -- 0.5[AMQP.s, RPC.n]);
endfig;

end.
