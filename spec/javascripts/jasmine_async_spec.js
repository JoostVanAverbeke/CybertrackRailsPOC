describe('Mockjax', function() {
    it("should simulate an asynchronous call", function () {
        runs(function () {
            flag = false;
            value = 0;

            setTimeout(function () {
                value++;
                //keep returning false…
                flag = false;
            }, 500);
        });

        waitsFor(function () {
            return flag;
        }, "The Value should be incremented", 5000);
    });
});