import type { Metadata } from "next";
import "./globals.css";

export const metadata: Metadata = {
  title: "BuildCost PH | Construction Estimator",
  description: "Construction estimating and BOQ tools for Philippine projects.",
};

export default function RootLayout({ children }: Readonly<{ children: React.ReactNode }>) {
  return <html lang="en"><body>{children}</body></html>;
}
