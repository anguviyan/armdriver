cmd_/home/bharathi/armdriver/arm/test/kthread.o := /opt/phytec-yogurt/BSP-Yocto-AM335x-PD17.1.1/sysroots/x86_64-phytecsdk-linux/usr/bin/arm-phytec-linux-gnueabi/arm-phytec-linux-gnueabi-gcc -Wp,-MD,/home/bharathi/armdriver/arm/test/.kthread.o.d  -nostdinc -isystem /opt/phytec-yogurt/BSP-Yocto-AM335x-PD17.1.1/sysroots/x86_64-phytecsdk-linux/usr/lib/arm-phytec-linux-gnueabi/gcc/arm-phytec-linux-gnueabi/6.2.0/include -I/home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/arch/arm/include -Iarch/arm/include/generated/uapi -Iarch/arm/include/generated  -I/home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include -Iinclude -I/home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/arch/arm/include/uapi -Iarch/arm/include/generated/uapi -I/home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/uapi -Iinclude/generated/uapi -include /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/kconfig.h   -I/home/bharathi/armdriver/arm/test -D__KERNEL__ -mlittle-endian -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -Werror-implicit-function-declaration -Wno-format-security -std=gnu89 -fno-PIE -fno-dwarf2-cfi-asm -fno-omit-frame-pointer -mapcs -mno-sched-prolog -fno-ipa-sra -mabi=aapcs-linux -mno-thumb-interwork -mfpu=vfp -funwind-tables -marm -D__LINUX_ARM_ARCH__=6 -march=armv6k -mtune=arm1136j-s -msoft-float -Uarm -fno-delete-null-pointer-checks -Wno-maybe-uninitialized -Wno-frame-address -O2 --param=allow-store-data-races=0 -Wframe-larger-than=1024 -fno-stack-protector -Wno-unused-but-set-variable -Wno-unused-const-variable -fno-omit-frame-pointer -fno-optimize-sibling-calls -fno-var-tracking-assignments -g -pg -Wdeclaration-after-statement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -Werror=implicit-int -Werror=strict-prototypes -Werror=date-time -DCC_HAVE_ASM_GOTO  -DMODULE  -D"KBUILD_STR(s)=\#s" -D"KBUILD_BASENAME=KBUILD_STR(kthread)"  -D"KBUILD_MODNAME=KBUILD_STR(kthread)" -c -o /home/bharathi/armdriver/arm/test/.tmp_kthread.o /home/bharathi/armdriver/arm/test/kthread.c

source_/home/bharathi/armdriver/arm/test/kthread.o := /home/bharathi/armdriver/arm/test/kthread.c

deps_/home/bharathi/armdriver/arm/test/kthread.o := \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/kernel.h \
    $(wildcard include/config/lbdaf.h) \
    $(wildcard include/config/preempt/voluntary.h) \
    $(wildcard include/config/debug/atomic/sleep.h) \
    $(wildcard include/config/mmu.h) \
    $(wildcard include/config/prove/locking.h) \
    $(wildcard include/config/panic/timeout.h) \
    $(wildcard include/config/tracing.h) \
    $(wildcard include/config/ftrace/mcount/record.h) \
  /opt/phytec-yogurt/BSP-Yocto-AM335x-PD17.1.1/sysroots/x86_64-phytecsdk-linux/usr/lib/arm-phytec-linux-gnueabi/gcc/arm-phytec-linux-gnueabi/6.2.0/include/stdarg.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/linkage.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/compiler.h \
    $(wildcard include/config/sparse/rcu/pointer.h) \
    $(wildcard include/config/trace/branch/profiling.h) \
    $(wildcard include/config/profile/all/branches.h) \
    $(wildcard include/config/kasan.h) \
    $(wildcard include/config/enable/must/check.h) \
    $(wildcard include/config/enable/warn/deprecated.h) \
    $(wildcard include/config/kprobes.h) \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/compiler-gcc.h \
    $(wildcard include/config/arch/supports/optimized/inlining.h) \
    $(wildcard include/config/optimize/inlining.h) \
    $(wildcard include/config/gcov/kernel.h) \
    $(wildcard include/config/arch/use/builtin/bswap.h) \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/uapi/linux/types.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/arch/arm/include/asm/types.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/asm-generic/int-ll64.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/uapi/asm-generic/int-ll64.h \
  arch/arm/include/generated/asm/bitsperlong.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/asm-generic/bitsperlong.h \
    $(wildcard include/config/64bit.h) \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/uapi/asm-generic/bitsperlong.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/uapi/linux/posix_types.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/stddef.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/uapi/linux/stddef.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/arch/arm/include/uapi/asm/posix_types.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/uapi/asm-generic/posix_types.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/stringify.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/export.h \
    $(wildcard include/config/have/underscore/symbol/prefix.h) \
    $(wildcard include/config/modules.h) \
    $(wildcard include/config/modversions.h) \
    $(wildcard include/config/unused/symbols.h) \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/arch/arm/include/asm/linkage.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/types.h \
    $(wildcard include/config/have/uid16.h) \
    $(wildcard include/config/uid16.h) \
    $(wildcard include/config/arch/dma/addr/t/64bit.h) \
    $(wildcard include/config/phys/addr/t/64bit.h) \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/bitops.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/arch/arm/include/asm/bitops.h \
    $(wildcard include/config/smp.h) \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/irqflags.h \
    $(wildcard include/config/trace/irqflags.h) \
    $(wildcard include/config/irqsoff/tracer.h) \
    $(wildcard include/config/preempt/tracer.h) \
    $(wildcard include/config/trace/irqflags/support.h) \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/typecheck.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/arch/arm/include/asm/irqflags.h \
    $(wildcard include/config/cpu/v7m.h) \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/arch/arm/include/asm/ptrace.h \
    $(wildcard include/config/arm/thumb.h) \
    $(wildcard include/config/thumb2/kernel.h) \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/arch/arm/include/uapi/asm/ptrace.h \
    $(wildcard include/config/cpu/endian/be8.h) \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/arch/arm/include/asm/hwcap.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/arch/arm/include/uapi/asm/hwcap.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/asm-generic/irqflags.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/arch/arm/include/asm/barrier.h \
    $(wildcard include/config/cpu/32v6k.h) \
    $(wildcard include/config/cpu/xsc3.h) \
    $(wildcard include/config/cpu/fa526.h) \
    $(wildcard include/config/arm/heavy/mb.h) \
    $(wildcard include/config/arch/has/barriers.h) \
    $(wildcard include/config/arm/dma/mem/bufferable.h) \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/asm-generic/bitops/non-atomic.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/asm-generic/bitops/fls64.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/asm-generic/bitops/sched.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/asm-generic/bitops/hweight.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/asm-generic/bitops/arch_hweight.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/asm-generic/bitops/const_hweight.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/asm-generic/bitops/lock.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/asm-generic/bitops/le.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/arch/arm/include/uapi/asm/byteorder.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/byteorder/little_endian.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/uapi/linux/byteorder/little_endian.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/swab.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/uapi/linux/swab.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/arch/arm/include/asm/swab.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/arch/arm/include/uapi/asm/swab.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/byteorder/generic.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/asm-generic/bitops/ext2-atomic-setbit.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/log2.h \
    $(wildcard include/config/arch/has/ilog2/u32.h) \
    $(wildcard include/config/arch/has/ilog2/u64.h) \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/printk.h \
    $(wildcard include/config/message/loglevel/default.h) \
    $(wildcard include/config/early/printk.h) \
    $(wildcard include/config/printk.h) \
    $(wildcard include/config/dynamic/debug.h) \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/init.h \
    $(wildcard include/config/broken/rodata.h) \
    $(wildcard include/config/lto.h) \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/kern_levels.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/cache.h \
    $(wildcard include/config/arch/has/cache/line/size.h) \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/uapi/linux/kernel.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/uapi/linux/sysinfo.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/arch/arm/include/asm/cache.h \
    $(wildcard include/config/arm/l1/cache/shift.h) \
    $(wildcard include/config/aeabi.h) \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/dynamic_debug.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/arch/arm/include/asm/div64.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/arch/arm/include/asm/compiler.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/arch/arm/include/asm/bug.h \
    $(wildcard include/config/bug.h) \
    $(wildcard include/config/debug/bugverbose.h) \
    $(wildcard include/config/arm/lpae.h) \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/arch/arm/include/asm/opcodes.h \
    $(wildcard include/config/cpu/endian/be32.h) \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/asm-generic/bug.h \
    $(wildcard include/config/generic/bug.h) \
    $(wildcard include/config/generic/bug/relative/pointers.h) \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/module.h \
    $(wildcard include/config/sysfs.h) \
    $(wildcard include/config/module/sig.h) \
    $(wildcard include/config/modules/tree/lookup.h) \
    $(wildcard include/config/kallsyms.h) \
    $(wildcard include/config/tracepoints.h) \
    $(wildcard include/config/event/tracing.h) \
    $(wildcard include/config/livepatch.h) \
    $(wildcard include/config/module/unload.h) \
    $(wildcard include/config/constructors.h) \
    $(wildcard include/config/debug/set/module/ronx.h) \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/list.h \
    $(wildcard include/config/debug/list.h) \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/poison.h \
    $(wildcard include/config/illegal/pointer/value.h) \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/uapi/linux/const.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/stat.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/arch/arm/include/uapi/asm/stat.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/uapi/linux/stat.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/time.h \
    $(wildcard include/config/arch/uses/gettimeoffset.h) \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/seqlock.h \
    $(wildcard include/config/debug/lock/alloc.h) \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/spinlock.h \
    $(wildcard include/config/debug/spinlock.h) \
    $(wildcard include/config/generic/lockbreak.h) \
    $(wildcard include/config/preempt.h) \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/preempt.h \
    $(wildcard include/config/preempt/count.h) \
    $(wildcard include/config/debug/preempt.h) \
    $(wildcard include/config/preempt/notifiers.h) \
  arch/arm/include/generated/asm/preempt.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/asm-generic/preempt.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/thread_info.h \
    $(wildcard include/config/compat.h) \
    $(wildcard include/config/debug/stack/usage.h) \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/bug.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/arch/arm/include/asm/thread_info.h \
    $(wildcard include/config/crunch.h) \
    $(wildcard include/config/arm/thumbee.h) \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/arch/arm/include/asm/fpstate.h \
    $(wildcard include/config/vfpv3.h) \
    $(wildcard include/config/iwmmxt.h) \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/arch/arm/include/asm/page.h \
    $(wildcard include/config/cpu/copy/v4wt.h) \
    $(wildcard include/config/cpu/copy/v4wb.h) \
    $(wildcard include/config/cpu/copy/feroceon.h) \
    $(wildcard include/config/cpu/copy/fa.h) \
    $(wildcard include/config/cpu/sa1100.h) \
    $(wildcard include/config/cpu/xscale.h) \
    $(wildcard include/config/cpu/copy/v6.h) \
    $(wildcard include/config/kuser/helpers.h) \
    $(wildcard include/config/have/arch/pfn/valid.h) \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/arch/arm/include/asm/glue.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/arch/arm/include/asm/pgtable-2level-types.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/arch/arm/include/asm/memory.h \
    $(wildcard include/config/need/mach/memory/h.h) \
    $(wildcard include/config/page/offset.h) \
    $(wildcard include/config/highmem.h) \
    $(wildcard include/config/dram/base.h) \
    $(wildcard include/config/dram/size.h) \
    $(wildcard include/config/have/tcm.h) \
    $(wildcard include/config/arm/patch/phys/virt.h) \
    $(wildcard include/config/phys/offset.h) \
    $(wildcard include/config/virt/to/bus.h) \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/sizes.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/asm-generic/memory_model.h \
    $(wildcard include/config/flatmem.h) \
    $(wildcard include/config/discontigmem.h) \
    $(wildcard include/config/sparsemem/vmemmap.h) \
    $(wildcard include/config/sparsemem.h) \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/pfn.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/asm-generic/getorder.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/bottom_half.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/spinlock_types.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/spinlock_types_up.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/lockdep.h \
    $(wildcard include/config/lockdep.h) \
    $(wildcard include/config/lock/stat.h) \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/rwlock_types.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/spinlock_up.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/arch/arm/include/asm/processor.h \
    $(wildcard include/config/have/hw/breakpoint.h) \
    $(wildcard include/config/arm/errata/754327.h) \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/arch/arm/include/asm/hw_breakpoint.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/arch/arm/include/asm/unified.h \
    $(wildcard include/config/arm/asm/unified.h) \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/rwlock.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/spinlock_api_up.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/atomic.h \
    $(wildcard include/config/generic/atomic64.h) \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/arch/arm/include/asm/atomic.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/prefetch.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/arch/arm/include/asm/cmpxchg.h \
    $(wildcard include/config/cpu/sa110.h) \
    $(wildcard include/config/cpu/v6.h) \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/asm-generic/cmpxchg-local.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/asm-generic/atomic-long.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/math64.h \
    $(wildcard include/config/arch/supports/int128.h) \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/time64.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/uapi/linux/time.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/uidgid.h \
    $(wildcard include/config/multiuser.h) \
    $(wildcard include/config/user/ns.h) \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/highuid.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/kmod.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/gfp.h \
    $(wildcard include/config/zone/dma.h) \
    $(wildcard include/config/zone/dma32.h) \
    $(wildcard include/config/numa.h) \
    $(wildcard include/config/deferred/struct/page/init.h) \
    $(wildcard include/config/pm/sleep.h) \
    $(wildcard include/config/cma.h) \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/mmdebug.h \
    $(wildcard include/config/debug/vm.h) \
    $(wildcard include/config/debug/virtual.h) \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/mmzone.h \
    $(wildcard include/config/force/max/zoneorder.h) \
    $(wildcard include/config/memory/isolation.h) \
    $(wildcard include/config/memcg.h) \
    $(wildcard include/config/zone/device.h) \
    $(wildcard include/config/memory/hotplug.h) \
    $(wildcard include/config/compaction.h) \
    $(wildcard include/config/flat/node/mem/map.h) \
    $(wildcard include/config/page/extension.h) \
    $(wildcard include/config/no/bootmem.h) \
    $(wildcard include/config/numa/balancing.h) \
    $(wildcard include/config/have/memory/present.h) \
    $(wildcard include/config/have/memoryless/nodes.h) \
    $(wildcard include/config/need/node/memmap/size.h) \
    $(wildcard include/config/have/memblock/node/map.h) \
    $(wildcard include/config/need/multiple/nodes.h) \
    $(wildcard include/config/have/arch/early/pfn/to/nid.h) \
    $(wildcard include/config/sparsemem/extreme.h) \
    $(wildcard include/config/holes/in/zone.h) \
    $(wildcard include/config/arch/has/holes/memorymodel.h) \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/wait.h \
  arch/arm/include/generated/asm/current.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/asm-generic/current.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/uapi/linux/wait.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/threads.h \
    $(wildcard include/config/nr/cpus.h) \
    $(wildcard include/config/base/small.h) \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/numa.h \
    $(wildcard include/config/nodes/shift.h) \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/nodemask.h \
    $(wildcard include/config/movable/node.h) \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/bitmap.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/string.h \
    $(wildcard include/config/binary/printf.h) \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/uapi/linux/string.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/arch/arm/include/asm/string.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/pageblock-flags.h \
    $(wildcard include/config/hugetlb/page.h) \
    $(wildcard include/config/hugetlb/page/size/variable.h) \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/page-flags-layout.h \
  include/generated/bounds.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/memory_hotplug.h \
    $(wildcard include/config/memory/hotremove.h) \
    $(wildcard include/config/have/arch/nodedata/extension.h) \
    $(wildcard include/config/have/bootmem/info/node.h) \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/notifier.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/errno.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/uapi/linux/errno.h \
  arch/arm/include/generated/asm/errno.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/uapi/asm-generic/errno.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/uapi/asm-generic/errno-base.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/mutex.h \
    $(wildcard include/config/debug/mutexes.h) \
    $(wildcard include/config/mutex/spin/on/owner.h) \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/osq_lock.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/rwsem.h \
    $(wildcard include/config/rwsem/spin/on/owner.h) \
    $(wildcard include/config/rwsem/generic/spinlock.h) \
  arch/arm/include/generated/asm/rwsem.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/asm-generic/rwsem.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/srcu.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/rcupdate.h \
    $(wildcard include/config/tiny/rcu.h) \
    $(wildcard include/config/tree/rcu.h) \
    $(wildcard include/config/preempt/rcu.h) \
    $(wildcard include/config/rcu/trace.h) \
    $(wildcard include/config/rcu/stall/common.h) \
    $(wildcard include/config/no/hz/full.h) \
    $(wildcard include/config/rcu/nocb/cpu.h) \
    $(wildcard include/config/tasks/rcu.h) \
    $(wildcard include/config/debug/objects/rcu/head.h) \
    $(wildcard include/config/hotplug/cpu.h) \
    $(wildcard include/config/prove/rcu.h) \
    $(wildcard include/config/rcu/boost.h) \
    $(wildcard include/config/rcu/nocb/cpu/all.h) \
    $(wildcard include/config/no/hz/full/sysidle.h) \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/cpumask.h \
    $(wildcard include/config/cpumask/offstack.h) \
    $(wildcard include/config/debug/per/cpu/maps.h) \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/completion.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/debugobjects.h \
    $(wildcard include/config/debug/objects.h) \
    $(wildcard include/config/debug/objects/free.h) \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/ktime.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/jiffies.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/timex.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/uapi/linux/timex.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/uapi/linux/param.h \
  arch/arm/include/generated/asm/param.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/asm-generic/param.h \
    $(wildcard include/config/hz.h) \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/uapi/asm-generic/param.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/arch/arm/include/asm/timex.h \
  include/generated/timeconst.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/timekeeping.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/rcutiny.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/workqueue.h \
    $(wildcard include/config/debug/objects/work.h) \
    $(wildcard include/config/freezer.h) \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/timer.h \
    $(wildcard include/config/timer/stats.h) \
    $(wildcard include/config/debug/objects/timers.h) \
    $(wildcard include/config/no/hz/common.h) \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/topology.h \
    $(wildcard include/config/use/percpu/numa/node/id.h) \
    $(wildcard include/config/sched/smt.h) \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/smp.h \
    $(wildcard include/config/up/late/init.h) \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/llist.h \
    $(wildcard include/config/arch/have/nmi/safe/cmpxchg.h) \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/percpu.h \
    $(wildcard include/config/need/per/cpu/embed/first/chunk.h) \
    $(wildcard include/config/need/per/cpu/page/first/chunk.h) \
    $(wildcard include/config/have/setup/per/cpu/area.h) \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/arch/arm/include/asm/percpu.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/asm-generic/percpu.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/percpu-defs.h \
    $(wildcard include/config/debug/force/weak/per/cpu.h) \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/arch/arm/include/asm/topology.h \
    $(wildcard include/config/arm/cpu/topology.h) \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/asm-generic/topology.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/sysctl.h \
    $(wildcard include/config/sysctl.h) \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/rbtree.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/uapi/linux/sysctl.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/elf.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/arch/arm/include/asm/elf.h \
    $(wildcard include/config/vdso.h) \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/arch/arm/include/asm/auxvec.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/arch/arm/include/uapi/asm/auxvec.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/arch/arm/include/asm/vdso_datapage.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/arch/arm/include/asm/user.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/uapi/linux/elf.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/uapi/linux/elf-em.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/kobject.h \
    $(wildcard include/config/uevent/helper.h) \
    $(wildcard include/config/debug/kobject/release.h) \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/sysfs.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/kernfs.h \
    $(wildcard include/config/kernfs.h) \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/err.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/idr.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/kobject_ns.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/kref.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/moduleparam.h \
    $(wildcard include/config/alpha.h) \
    $(wildcard include/config/ia64.h) \
    $(wildcard include/config/ppc64.h) \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/jump_label.h \
    $(wildcard include/config/jump/label.h) \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/rbtree_latch.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/arch/arm/include/asm/module.h \
    $(wildcard include/config/arm/unwind.h) \
    $(wildcard include/config/arm/module/plts.h) \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/asm-generic/module.h \
    $(wildcard include/config/have/mod/arch/specific.h) \
    $(wildcard include/config/modules/use/elf/rel.h) \
    $(wildcard include/config/modules/use/elf/rela.h) \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/gpio.h \
    $(wildcard include/config/gpiolib.h) \
    $(wildcard include/config/arch/have/custom/gpio/h.h) \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/arch/arm/include/asm/gpio.h \
    $(wildcard include/config/arch/nr/gpio.h) \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/asm-generic/gpio.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/of.h \
    $(wildcard include/config/sparc.h) \
    $(wildcard include/config/of/dynamic.h) \
    $(wildcard include/config/of.h) \
    $(wildcard include/config/attach/node.h) \
    $(wildcard include/config/detach/node.h) \
    $(wildcard include/config/add/property.h) \
    $(wildcard include/config/remove/property.h) \
    $(wildcard include/config/update/property.h) \
    $(wildcard include/config/no/change.h) \
    $(wildcard include/config/change/add.h) \
    $(wildcard include/config/change/remove.h) \
    $(wildcard include/config/of/resolve.h) \
    $(wildcard include/config/of/overlay.h) \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/mod_devicetable.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/uuid.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/uapi/linux/uuid.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/property.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/fwnode.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/gpio/driver.h \
    $(wildcard include/config/gpiolib/irqchip.h) \
    $(wildcard include/config/of/gpio.h) \
    $(wildcard include/config/pinctrl.h) \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/irq.h \
    $(wildcard include/config/irq/domain/hierarchy.h) \
    $(wildcard include/config/generic/pending/irq.h) \
    $(wildcard include/config/hardirqs/sw/resend.h) \
    $(wildcard include/config/generic/irq/legacy/alloc/hwirq.h) \
    $(wildcard include/config/generic/irq/legacy.h) \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/irqhandler.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/irqreturn.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/irqnr.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/uapi/linux/irqnr.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/io.h \
    $(wildcard include/config/have/arch/huge/vmap.h) \
    $(wildcard include/config/has/ioport/map.h) \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/arch/arm/include/asm/io.h \
    $(wildcard include/config/pci.h) \
    $(wildcard include/config/need/mach/io/h.h) \
    $(wildcard include/config/pcmcia/soc/common.h) \
    $(wildcard include/config/isa.h) \
    $(wildcard include/config/pccard.h) \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/blk_types.h \
    $(wildcard include/config/block.h) \
    $(wildcard include/config/blk/cgroup.h) \
    $(wildcard include/config/blk/dev/integrity.h) \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/asm-generic/pci_iomap.h \
    $(wildcard include/config/no/generic/pci/ioport/map.h) \
    $(wildcard include/config/generic/pci/iomap.h) \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/xen/xen.h \
    $(wildcard include/config/xen.h) \
    $(wildcard include/config/xen/dom0.h) \
    $(wildcard include/config/xen/pvh.h) \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/asm-generic/io.h \
    $(wildcard include/config/generic/iomap.h) \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/vmalloc.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/arch/arm/include/asm/irq.h \
    $(wildcard include/config/sparse/irq.h) \
    $(wildcard include/config/multi/irq/handler.h) \
  arch/arm/include/generated/asm/irq_regs.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/asm-generic/irq_regs.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/irqdesc.h \
    $(wildcard include/config/irq/preflow/fasteoi.h) \
    $(wildcard include/config/proc/fs.h) \
    $(wildcard include/config/handle/domain/irq.h) \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/arch/arm/include/asm/hw_irq.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/irqchip/chained_irq.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/irqdomain.h \
    $(wildcard include/config/irq/domain.h) \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/radix-tree.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/pinctrl/pinctrl.h \
    $(wildcard include/config/generic/pinconf.h) \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/seq_file.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/pinctrl/pinctrl-state.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/gpio/consumer.h \
    $(wildcard include/config/gpio/sysfs.h) \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/kthread.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/sched.h \
    $(wildcard include/config/sched/debug.h) \
    $(wildcard include/config/lockup/detector.h) \
    $(wildcard include/config/detect/hung/task.h) \
    $(wildcard include/config/core/dump/default/elf/headers.h) \
    $(wildcard include/config/virt/cpu/accounting/native.h) \
    $(wildcard include/config/sched/autogroup.h) \
    $(wildcard include/config/bsd/process/acct.h) \
    $(wildcard include/config/taskstats.h) \
    $(wildcard include/config/audit.h) \
    $(wildcard include/config/inotify/user.h) \
    $(wildcard include/config/fanotify.h) \
    $(wildcard include/config/epoll.h) \
    $(wildcard include/config/posix/mqueue.h) \
    $(wildcard include/config/keys.h) \
    $(wildcard include/config/perf/events.h) \
    $(wildcard include/config/bpf/syscall.h) \
    $(wildcard include/config/sched/info.h) \
    $(wildcard include/config/task/delay/acct.h) \
    $(wildcard include/config/schedstats.h) \
    $(wildcard include/config/sched/mc.h) \
    $(wildcard include/config/fair/group/sched.h) \
    $(wildcard include/config/rt/group/sched.h) \
    $(wildcard include/config/cgroup/sched.h) \
    $(wildcard include/config/blk/dev/io/trace.h) \
    $(wildcard include/config/memcg/kmem.h) \
    $(wildcard include/config/compat/brk.h) \
    $(wildcard include/config/cc/stackprotector.h) \
    $(wildcard include/config/virt/cpu/accounting/gen.h) \
    $(wildcard include/config/sysvipc.h) \
    $(wildcard include/config/auditsyscall.h) \
    $(wildcard include/config/rt/mutexes.h) \
    $(wildcard include/config/task/xacct.h) \
    $(wildcard include/config/cpusets.h) \
    $(wildcard include/config/cgroups.h) \
    $(wildcard include/config/futex.h) \
    $(wildcard include/config/arch/want/batched/unmap/tlb/flush.h) \
    $(wildcard include/config/fault/injection.h) \
    $(wildcard include/config/latencytop.h) \
    $(wildcard include/config/function/graph/tracer.h) \
    $(wildcard include/config/uprobes.h) \
    $(wildcard include/config/bcache.h) \
    $(wildcard include/config/arch/wants/dynamic/task/struct.h) \
    $(wildcard include/config/have/unstable/sched/clock.h) \
    $(wildcard include/config/irq/time/accounting.h) \
    $(wildcard include/config/stack/growsup.h) \
    $(wildcard include/config/have/copy/thread/tls.h) \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/uapi/linux/sched.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/sched/prio.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/capability.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/uapi/linux/capability.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/plist.h \
    $(wildcard include/config/debug/pi/list.h) \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/mm_types.h \
    $(wildcard include/config/split/ptlock/cpus.h) \
    $(wildcard include/config/arch/enable/split/pmd/ptlock.h) \
    $(wildcard include/config/have/cmpxchg/double.h) \
    $(wildcard include/config/have/aligned/struct/page.h) \
    $(wildcard include/config/transparent/hugepage.h) \
    $(wildcard include/config/kmemcheck.h) \
    $(wildcard include/config/userfaultfd.h) \
    $(wildcard include/config/pgtable/levels.h) \
    $(wildcard include/config/aio.h) \
    $(wildcard include/config/mmu/notifier.h) \
    $(wildcard include/config/x86/intel/mpx.h) \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/auxvec.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/uapi/linux/auxvec.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/uprobes.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/arch/arm/include/asm/mmu.h \
    $(wildcard include/config/cpu/has/asid.h) \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/cputime.h \
  arch/arm/include/generated/asm/cputime.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/asm-generic/cputime.h \
    $(wildcard include/config/virt/cpu/accounting.h) \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/asm-generic/cputime_jiffies.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/sem.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/uapi/linux/sem.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/ipc.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/uapi/linux/ipc.h \
  arch/arm/include/generated/asm/ipcbuf.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/uapi/asm-generic/ipcbuf.h \
  arch/arm/include/generated/asm/sembuf.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/uapi/asm-generic/sembuf.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/shm.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/uapi/linux/shm.h \
  arch/arm/include/generated/asm/shmbuf.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/uapi/asm-generic/shmbuf.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/arch/arm/include/asm/shmparam.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/signal.h \
    $(wildcard include/config/old/sigaction.h) \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/uapi/linux/signal.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/arch/arm/include/asm/signal.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/arch/arm/include/uapi/asm/signal.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/uapi/asm-generic/signal-defs.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/arch/arm/include/uapi/asm/sigcontext.h \
  arch/arm/include/generated/asm/siginfo.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/asm-generic/siginfo.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/uapi/asm-generic/siginfo.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/pid.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/proportions.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/percpu_counter.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/seccomp.h \
    $(wildcard include/config/seccomp.h) \
    $(wildcard include/config/have/arch/seccomp/filter.h) \
    $(wildcard include/config/seccomp/filter.h) \
    $(wildcard include/config/checkpoint/restore.h) \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/uapi/linux/seccomp.h \
  arch/arm/include/generated/asm/seccomp.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/asm-generic/seccomp.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/uapi/linux/unistd.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/arch/arm/include/asm/unistd.h \
    $(wildcard include/config/oabi/compat.h) \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/arch/arm/include/uapi/asm/unistd.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/rculist.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/rtmutex.h \
    $(wildcard include/config/debug/rt/mutexes.h) \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/resource.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/uapi/linux/resource.h \
  arch/arm/include/generated/asm/resource.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/asm-generic/resource.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/uapi/asm-generic/resource.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/hrtimer.h \
    $(wildcard include/config/high/res/timers.h) \
    $(wildcard include/config/time/low/res.h) \
    $(wildcard include/config/timerfd.h) \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/timerqueue.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/task_io_accounting.h \
    $(wildcard include/config/task/io/accounting.h) \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/latencytop.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/cred.h \
    $(wildcard include/config/debug/credentials.h) \
    $(wildcard include/config/security.h) \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/key.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/assoc_array.h \
    $(wildcard include/config/associative/array.h) \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/selinux.h \
    $(wildcard include/config/security/selinux.h) \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/uapi/linux/magic.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/cgroup-defs.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/uapi/linux/limits.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/percpu-refcount.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/percpu-rwsem.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/rcu_sync.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/cgroup_subsys.h \
    $(wildcard include/config/cgroup/cpuacct.h) \
    $(wildcard include/config/cgroup/device.h) \
    $(wildcard include/config/cgroup/freezer.h) \
    $(wildcard include/config/cgroup/net/classid.h) \
    $(wildcard include/config/cgroup/perf.h) \
    $(wildcard include/config/cgroup/net/prio.h) \
    $(wildcard include/config/cgroup/hugetlb.h) \
    $(wildcard include/config/cgroup/pids.h) \
    $(wildcard include/config/cgroup/debug.h) \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/include/linux/delay.h \
  /home/bharathi/BSP-Yocto-AM335x-PD17.1.1/build/tmp/work-shared/phyboard-wega-am335x-2/kernel-source/arch/arm/include/asm/delay.h \

/home/bharathi/armdriver/arm/test/kthread.o: $(deps_/home/bharathi/armdriver/arm/test/kthread.o)

$(deps_/home/bharathi/armdriver/arm/test/kthread.o):
