program="user"

# Compiling kernel/ and user/
python3 compiler/JackCompiler.py kernel/
python3 compiler/JackCompiler.py $program/

# Moving VM files to build directory
mkdir -p build
rm build/*
cp kernel/*.vm build/
cp $program/*.vm build/

# Translating
python3 translator/translator.py build/

# Assembling
python3 assembler/assembler.py build/out.asm > build/out.dbg

# Emulating
python3 emulator/python/main.py build/out.hack &
#emulator/rust/target/debug/rs_emu build/out.hack
