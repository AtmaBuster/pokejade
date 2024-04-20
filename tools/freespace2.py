#!/usr/bin/env python3

import re
import math
import argparse as AP

def new_bank_info(banknum = 0, size = 0):
	return {
		"bank_num": banknum,
		"size": size,
		"free": size,
		"section_names": []
	}

def new_layout_info():
	return {
		"rom0": [],
		"romx": [],
		"sram": [],
		"wram0": [],
		"wramx": [],
		"hram": [],
		"vram": []
	}

r_map_hdr_banknum = re.compile(r"^(ROM0|ROMX|SRAM|WRAM0|WRAMX|HRAM|VRAM) bank #(\d+):$")
r_map_section_def = re.compile(r"^SECTION:.+\[\"(.+)\"\]$")
r_map_total_empty = re.compile(r"^TOTAL EMPTY: \$(.+) bytes?$")

def layoutinfo_from_maptxt(lines):
	layout = new_layout_info()
	current_key: LayoutInfoKey = "rom0"

	sizes = {
		"rom0": 0x4000,
		"romx": 0x4000,
		"sram": 0x2000,
		"wram0": 0x2000,
		"wramx": 0x2000,
		"hram": 0x80,
		"vram": 0x1000
	}

	for line in lines:
		mline = line.strip()
		banknum_match, sectiondef_match, totalempty_match = (
			r_map_hdr_banknum.match(mline),
			r_map_section_def.match(mline),
			r_map_total_empty.match(mline)
		)
		if banknum_match:
			banktype, banknum = banknum_match.groups()
			current_key = banktype.lower()

			layout[current_key].append(
				new_bank_info(
					banknum = int(banknum),
					size = sizes[current_key]
				)
			)
		elif sectiondef_match:
			layout[current_key][-1]["section_names"].append(
				sectiondef_match.group(1)
			)
		elif totalempty_match:
			layout[current_key][-1]["free"] = int(
				totalempty_match.group(1), 16
			)
	return layout

def progressbar(percentage, width):
	return \
		"█" * math.floor(percentage/100 * width) + \
		"░" * math.ceil((100-percentage)/100 * width)

if __name__ == '__main__':
	parser = AP.ArgumentParser(description='report free space of each section in a .map file (v0.7.x+)')
	parser.add_argument('filename', type=AP.FileType('r'))
	parser.add_argument('--sorted','-s',
		help='sort by largest amount of free space',
		action='store_true'
	)
	args = parser.parse_args()
	sortresults = args.sorted

	lines = args.filename.readlines()

	freeinfo = layoutinfo_from_maptxt(lines)

	display_order = [
		"rom0", "romx", "wram0", "wramx", "vram", "sram", "hram"
	]

	display_names = {
		"rom0": "ROM home bank",
		"romx": "ROM main banks",
		"wram0": "Fixed WRAM bank",
		"wramx": "Switchable WRAM banks",
		"vram": "Video RAM",
		"sram": "Switchable SRAM banks",
		"hram": "HRAM area"
	}

	for key in display_order:
		relinfo = freeinfo[key]

		print("%s\n%s" % (
			display_names[key], '-'*len(display_names[key])
		))

		if sortresults:
			relinfo = sorted(
				relinfo,
				key = lambda x: x["free"],
				reverse = True
			)

		for bankinfo in relinfo:
			percentage_free = (bankinfo["size"] - bankinfo["free"]) / (bankinfo["size"]) * 100

			print("   %02x -> %d%% used (%d bytes free)\n   %s\n      %s" % (
				bankinfo["bank_num"],
				percentage_free,
				bankinfo["free"],
				progressbar(
					percentage = percentage_free,
					width = 50
				),
				"".join(["%s\n      " % i for i in bankinfo["section_names"]])
			))
