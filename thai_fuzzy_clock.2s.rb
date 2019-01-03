#!/usr/bin/env ruby

def th(input)
  out = ""

  value = input

  sixty = %w{ ศูนย์ หนึ่ง สอง สาม สี่ ห้า หก เจ็ด แปด เก้า
    สิบ สิบเอ็ด สิบสอง สิบสาม สิบสี่ สิบห้า สิบหก สิบเจ็ด สิบแปด สิบเก้า
    ยี่สิบ ยี่สิบเอ็ด ยี่สิบสอง ยี่สิบสาม ยี่สิบสี่ ยี่สิบห้า ยี่สิบหก ยี่สิบเจ็ด ยี่สิบแปด ยี่สิบเก้า
    สามสิบ สามสิบเอ็ด สามสิบสอง สามสิบสาม สามสิบสี่ สามสิบห้า สามสิบหก สามสิบเจ็ด สามสิบแปด สามสิบเก้า
    สี่สิบ สี่สิบเอ็ด สี่สิบสอง สี่สิบสาม สี่สิบสี่ สี่สิบห้า สี่สิบหก สี่สิบเจ็ด สี่สิบแปด สี่สิบเก้า
    ห้าสิบ ห้าสิบเอ็ด ห้าสิบสอง ห้าสิบสาม ห้าสิบสี่ ห้าสิบห้า ห้าสิบหก ห้าสิบเจ็ด ห้าสิบแปด ห้าสิบเก้า
  }

  out << sixty[input]

  out
end

def run
  puts ["🕐", h, m].join
  puts "---"
  puts now
  puts "---"
  puts h
  puts m
  puts s
end

def h
  case now.hour
  when 0
    "เที่ยงคืน"
  when 1..5
    "ตี#{th(now.hour)}"
  when 6..11
    "#{th(now.hour)}โมงเช้า"
  when 12
    "เที่ยง"
  when 13
    "บ่ายโมง"
  when 14..18
    "#{th(now.hour-12)}โมงเย็น"
  when 19..23
    "#{th(now.hour-18)}ทุ่ม"
  else
    "ERROR"
  end
end

def m
  if now.min > 0
    "#{th(now.min)}นาที"
  end
end

def s
  "#{th((now.sec % 60).round(-1))}วินาที" # Time#sec can return leap second (60)
end

def now
  @now ||= Time.now
end

begin
  run
rescue StandardError => msg
  puts "Error occurred : #{msg}"
end
