"use client";

import { Button } from "@/components/ui/arc/button";
import { css } from "../../../../styled-system/css";

export function ButtonShowcase() {
	return (
		<div className={css({ display: "flex", gap: "3", flexWrap: "wrap" })}>
			<Button variant="solid">Solid</Button>
			<Button variant="outline">Outline</Button>
			<Button variant="ghost">Ghost</Button>
			<Button variant="subtle">Subtle</Button>
		</div>
	);
}
