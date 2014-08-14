# fstrim in a can

This is a small Docker recipe to build `fstrim` easily and install it in your
system.


## How do I install `fstrim` with this?

If you want to install `fstrim` into `/usr/local/bin`, just do this:

    docker run --rm -v /usr/local/bin:/target bobtfish/fstrim

The `bobtfish/fstrim` container will detect that `/target` is a
mountpoint, and it will copy the `fstrim` binary into it.

If you don't trust me, and prefer to extract the `fstrim` binary,
rather than allowing my container to potentially wreak havoc into
your system's `$PATH`, you can also do this:

    docker run --rm bobtfish/fstrim cat /fstrim > /tmp/nsenter

Then do whatever you want with the binary in `/tmp/fstrim`.


## Caveats

- This only works on Intel 64 bits platforms.

## Credit

All credit for this idea goes to jpetazzo for the [nsenter container](https://github.com/jpetazzo/nsenter)

