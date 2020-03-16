#include <linux/module.h>
#include <linux/vermagic.h>
#include <linux/compiler.h>

MODULE_INFO(vermagic, VERMAGIC_STRING);

__visible struct module __this_module
__attribute__((section(".gnu.linkonce.this_module"))) = {
	.name = KBUILD_MODNAME,
	.init = init_module,
#ifdef CONFIG_MODULE_UNLOAD
	.exit = cleanup_module,
#endif
	.arch = MODULE_ARCH_INIT,
};

static const struct modversion_info ____versions[]
__used
__attribute__((section("__versions"))) = {
	{ 0x788c9cac, __VMLINUX_SYMBOL_STR(module_layout) },
	{ 0x7485e15e, __VMLINUX_SYMBOL_STR(unregister_chrdev_region) },
	{ 0x1c64e9a0, __VMLINUX_SYMBOL_STR(cdev_del) },
	{ 0xfb705cd0, __VMLINUX_SYMBOL_STR(class_destroy) },
	{ 0x213431, __VMLINUX_SYMBOL_STR(device_destroy) },
	{ 0x37a0cba, __VMLINUX_SYMBOL_STR(kfree) },
	{ 0xfe990052, __VMLINUX_SYMBOL_STR(gpio_free) },
	{ 0x5cafe056, __VMLINUX_SYMBOL_STR(gpiod_unexport) },
	{ 0x3cd89460, __VMLINUX_SYMBOL_STR(kmalloc_caches) },
	{ 0x939ba8fb, __VMLINUX_SYMBOL_STR(kmem_cache_alloc_trace) },
	{ 0x32cdea3a, __VMLINUX_SYMBOL_STR(device_create) },
	{ 0x5bc7df07, __VMLINUX_SYMBOL_STR(__class_create) },
	{ 0xd40e30fd, __VMLINUX_SYMBOL_STR(cdev_add) },
	{ 0xd4f7e24e, __VMLINUX_SYMBOL_STR(cdev_init) },
	{ 0x6bb85504, __VMLINUX_SYMBOL_STR(cdev_alloc) },
	{ 0x29537c9e, __VMLINUX_SYMBOL_STR(alloc_chrdev_region) },
	{ 0x47229b5c, __VMLINUX_SYMBOL_STR(gpio_request) },
	{ 0x83803087, __VMLINUX_SYMBOL_STR(gpiod_export) },
	{ 0x1b3d2607, __VMLINUX_SYMBOL_STR(gpiod_direction_output_raw) },
	{ 0xfa2a45e, __VMLINUX_SYMBOL_STR(__memzero) },
	{ 0x70601303, __VMLINUX_SYMBOL_STR(gpiod_set_raw_value) },
	{ 0x8dd38000, __VMLINUX_SYMBOL_STR(gpio_to_desc) },
	{ 0x28cc25db, __VMLINUX_SYMBOL_STR(arm_copy_from_user) },
	{ 0x7af0f869, __VMLINUX_SYMBOL_STR(module_refcount) },
	{ 0x2e5810c6, __VMLINUX_SYMBOL_STR(__aeabi_unwind_cpp_pr1) },
	{ 0x27e1a049, __VMLINUX_SYMBOL_STR(printk) },
	{ 0xb1ad28e0, __VMLINUX_SYMBOL_STR(__gnu_mcount_nc) },
};

static const char __module_depends[]
__used
__attribute__((section(".modinfo"))) =
"depends=";


MODULE_INFO(srcversion, "F7DCBECF8EA759EBD01C2F4");
