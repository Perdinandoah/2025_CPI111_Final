function generate_sequence(length) {
    var seq = [];
    for (var i = 0; i < length; i++) {
        seq[i] = choose(buttons);
    }
    return seq;
}
