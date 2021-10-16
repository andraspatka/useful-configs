# PDF utility scripts

## Requirements

```bash
sudo apt-get install ghostscript imagemagick
```

## Usage

```bash
png-pdf.sh <input>

shrink-pdf.sh <input> <compress_level>
```

### Known errors

```
convert: attempt to perform an operation not allowed by the security policy `PDF' @ error/constitute.c/IsCoderAuthorized/408.
```

Solution: https://bugs.archlinux.org/task/60580