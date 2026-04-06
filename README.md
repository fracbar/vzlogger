# vzlogger Image

This is an (unofficial) image from [vzlogger](https://github.com/volkszaehler/vzlogger) with the following purpose:

* based on plain Debian distro packages (bookworm)
* multi-arch support
* where the tag refers to the vzlogger tag (currently 0.8.9)

## Installation

### Running the Container (plain Docker)

Mount your vzlogger configuration file:

```bash
docker run -d \
  --name vzlogger \
  -v /path/to/vzlogger.conf:/etc/vzlogger.conf:ro \
  --device /dev/ttyUSB0 \
  ghcr.io/fracbar/vzlogger:0.8.9
```

### Configuration

The container requires a vzlogger configuration file. Mount it at `/etc/vzlogger.conf` inside the container.

If your vzlogger device requires access to serial ports (USB devices), use the `--device` flag:

```bash
--device /dev/ttyUSB0:/dev/ttyUSB0
```

Or use `--privileged` for full device access:

```bash
docker run -d \
  --name vzlogger \
  --privileged \
  -v /path/to/vzlogger.conf:/etc/vzlogger.conf:ro \
  ghcr.io/fracbar/vzlogger:0.8.9
```

### Docker Compose Example

```yaml
version: '3.8'

services:
  vzlogger:
    image:   ghcr.io/fracbar/vzlogger:0.8.9
    container_name: vzlogger
    restart: always
    volumes:
      - /path/to/vzlogger.conf:/etc/vzlogger.conf:ro
    devices:
      - /dev/ttyUSB0:/dev/ttyUSB0
```

