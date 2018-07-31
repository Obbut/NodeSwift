process.stdin.resume();
process.stdin.on('end', function() {
    process.exit();
});

process.stdin.on('data', function (data) {
    const json = JSON.parse(data);

    if (json.eval) {
        eval(json.eval);
    }
});
