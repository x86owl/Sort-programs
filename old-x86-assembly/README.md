# Old x86 Assembly Code Archive

**⚠️ Legacy Code Repository**

This repository contains my early x86 assembly experiments and learning exercises from when I first started diving into low-level programming. The code here represents my journey into understanding computer architecture, instruction sets, and systems programming.

## ⚠️ Important Notice

This is **archived legacy code** - it's preserved for historical and educational purposes:

- Code may contain bugs, inefficiencies, or security issues
- Not actively maintained or updated
- Some programs may not compile on modern systems
- Assembly syntax and conventions may be outdated
- No guarantees on functionality or best practices

**If you're looking for my current work**, check out my [active repositories](https://github.com/x86owl).

## What's Inside

This repository contains various x86 assembly programs I wrote while learning:

- Basic arithmetic and logic operations
- String manipulation and memory access
- System calls (Linux syscall interface)
- Register manipulation and stack operations
- Simple I/O programs
- Experiments with different assembly syntax (NASM/YASM)
- Early attempts at understanding calling conventions

## Context & Learning Path

These programs were written as I worked through:
- x86 instruction set documentation
- Online assembly tutorials and wargames
- Reverse engineering challenges
- Understanding how C compiles to assembly
- Manual debugging with GDB

**What I learned from this code:**
- How CPU registers actually work
- Memory addressing modes
- The difference between Intel and AT&T syntax
- Why buffer overflows happen at the assembly level
- Stack frame construction and destruction
- System call conventions (int 0x80 vs syscall)

## Build Instructions

Most of these programs were written for **32-bit x86 Linux** using NASM:

### For 32-bit programs:
```bash
# Assemble
nasm -f elf32 program.asm -o program.o

# Link
ld -m elf_i386 program.o -o program

# Run
./program
```

### For 64-bit programs:
```bash
# Assemble
nasm -f elf64 program.asm -o program.o

# Link
ld program.o -o program

# Run
./program
```

### Common Issues:
- **"bad ELF interpreter"**: Install 32-bit libraries (`sudo apt install libc6-i386`)
- **Syscall numbers wrong**: Different between 32-bit (int 0x80) and 64-bit (syscall)
- **Segmentation faults**: Likely stack/memory mismanagement or incorrect addressing

## File Organization

```
old-x86-assembly/
├── hello_world.asm       # Classic first program
├── math_ops.asm          # Basic arithmetic
├── string_ops.asm        # String manipulation
├── file_io.asm           # Reading/writing files
├── syscalls/             # Various Linux syscall examples
├── experiments/          # Random experiments and tests
└── README.md             # This file
```

*(Adjust based on your actual file structure)*

## Common Patterns in This Code

### Hello World (int 0x80 style)
```asm
section .data
    msg db "Hello, World!", 0xA
    len equ $ - msg

section .text
    global _start

_start:
    mov eax, 4          ; sys_write
    mov ebx, 1          ; stdout
    mov ecx, msg        ; message
    mov edx, len        ; length
    int 0x80            ; syscall

    mov eax, 1          ; sys_exit
    xor ebx, ebx        ; exit code 0
    int 0x80
```

### System Call Convention (x86)
- **EAX**: Syscall number
- **EBX**: First argument
- **ECX**: Second argument
- **EDX**: Third argument
- **ESI**: Fourth argument
- **EDI**: Fifth argument

### System Call Convention (x86-64)
- **RAX**: Syscall number
- **RDI**: First argument
- **RSI**: Second argument
- **RDX**: Third argument
- **R10**: Fourth argument
- **R8**: Fifth argument
- **R9**: Sixth argument

## Why This Code Exists

Learning assembly is like learning to read the Matrix. This code represents my first steps into:
- **Understanding how computers actually execute instructions**
- **Seeing what the compiler does under the hood**
- **Building intuition for reverse engineering**
- **Recognizing vulnerability patterns (buffer overflows, etc.)**
- **Appreciating why high-level languages exist**

These programs aren't meant to be practical - they're meant to be **educational**. Writing in assembly forces you to think about every byte, every register, every instruction.

## Evolution from This Code

After this early phase, I moved on to:
- Modern x86-64 assembly with SSE/AVX instructions
- Hybrid C + Assembly projects
- System programming in C
- Binary exploitation and reverse engineering
- Writing custom tools and shells

**Current focus:** Low-level security research, binary exploitation, and building educational tools. Check my [active repositories](https://github.com/x86owl) for current work.

## Resources That Helped Me

If you're learning assembly and stumbled upon this repo:

**Documentation:**
- Intel Software Developer Manuals
- AMD64 Architecture Programmer's Manual
- Linux syscall reference (`man 2 syscall`)

**Tutorials:**
- [Programming from the Ground Up](https://savannah.nongnu.org/projects/pgubook/)
- [x86 Assembly Wikibook](https://en.wikibooks.org/wiki/X86_Assembly)
- [NASM Tutorial](https://cs.lmu.edu/~ray/notes/nasmtutorial/)

**Practice:**
- pwn.college (binary exploitation)
- CryptoHack (assembly challenges)
- OverTheWire (wargames)
- Exploit Education (buffer overflows)

**Tools:**
- GDB (debugger)
- objdump (disassembler)
- strace (syscall tracer)
- ltrace (library call tracer)

## Using This Code

Feel free to:
- Browse and learn from it
- Use it as reference for your own learning
- Point out mistakes (create an issue!)
- Adapt it for educational purposes

**Don't:**
- Use this in production (seriously)
- Expect it to be secure or efficient
- Assume it follows best practices

## Current Work

I've moved beyond basic assembly exercises. My current projects focus on:
- **C + Assembly hybrid programs** (calculator, shells, etc.)
- **Binary exploitation** and understanding vulnerabilities
- **Reverse engineering** real-world binaries
- **Low-level security tools** and PoCs

Check out my [GitHub profile](https://github.com/x86owl) or [website](https://x86owl.github.io/x86owl.dev/) for current work.

## Contributing

Since this is archived code, I'm not actively accepting PRs. However:
- **Found a bug?** Open an issue to document it for others
- **Want to suggest improvements?** Feel free to fork and modernize it
- **Questions about the code?** Open an issue or ping me on [Discord](https://discord.gg/Jm9gXbxf4V)

## Author

**x86owl** (x86owl)
- GitHub: [@x86owl](https://github.com/x86owl)
- Website: [x86owl](https://x86owl.github.io/x86owl.dev/)
- Twitter: [@Itsmanikandan73](https://twitter.com/Itsmanikandan73)

## License

MIT License - Use for learning, reference, or whatever. Just don't blame me if it breaks something.

## Final Thoughts

This code represents the messy, experimental phase of learning. It's not perfect, it's not production-ready, and that's the point. Every exploit researcher, every kernel developer, every reverse engineer started by writing programs like these.

The goal was never to write perfect assembly - it was to **understand the machine**.

---

*"Legacy code is just code written by you, six months ago, who no longer exists."*

**Status:** Archived | **Maintained:** No | **Educational Value:** Yes
