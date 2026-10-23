#include "defuser.h"

#include <inttypes.h>
#include <stdio.h>

#define MAX_FIELDS 8

/*
 * 把 values 中的 count 个整数写成一行“空格分隔的无符号十进制整数”，存入 out。
 * 成功返回 0；count 为 0（还没有实现）、snprintf 出错或结果被截断时返回非零。
 */
static int write_answer(char *out, size_t cap, const uint32_t *values, size_t count) {
    size_t used = 0;
    for (size_t i = 0; i < count; ++i) {
        int size = snprintf(out + used, cap - used, "%s%" PRIu32, i ? " " : "", values[i]);
        if (size < 0 || (size_t)size >= cap - used) return 1;
        used += (size_t)size;
    }
    return count == 0;
}

int solve_phase_1(uint64_t challenge, char *out, size_t cap) {
    uint32_t values[MAX_FIELDS] = {0};
    size_t count = 1;
    (void)challenge;
    uint64_t c = challenge;
    uint32_t high = (uint32_t)(c >> 32);
    uint32_t uc = (uint32_t)c;
    uint32_t p1 = (uint32_t) ((high + (c >> 16) * 2) ^ (0xa10f));
    uint32_t p0 = (uint32_t) (((uint32_t)(3 * uc)) ^ (uint32_t)(high + 0xa91d));
    uint32_t p2 = (uint32_t) (5 * (uint32_t) (p0 - p1) + 0x6142);
    
    
    values[0] = p2;
    return write_answer(out, cap, values, count);
}

int solve_phase_2(uint64_t challenge, char *out, size_t cap) {
    uint32_t values[MAX_FIELDS] = {0};
    size_t count = 6;
    (void)challenge;

    uint64_t c = challenge;
    uint32_t c1 = (uint32_t)(3 * ((c >> 9) & 0x7f));

    values[0] = c1;

    for (uint64_t i = 1; i < 6; i++) {
        uint32_t p = (uint32_t)(5 * values[i - 1] + (((c >> (i + 12)) & 0x1f) ^ (i + 15)));
        values[i] = p;
    }

    return write_answer(out, cap, values, count);
}

int solve_phase_3(uint64_t challenge, char *out, size_t cap) {
    uint32_t values[MAX_FIELDS] = {0};
    size_t count = 2;
    (void)challenge;

    uint64_t c = challenge;
    uint32_t c1 = (uint32_t)(c & 0x7);
    uint32_t k = (uint32_t)(c >> 32) ^ (uint32_t)(c >> 3);
    uint32_t c2 = 0;

    switch (c1) {
        case 0: c2 = (uint32_t)((2 * k) ^ 0x83c7); break;
        case 1: c2 = (uint32_t)((k ^ 0x1afa) + (k >> 2)); break;
        case 2: c2 = (uint32_t)(5 * k + 0x1766f); break;
        case 3: c2 = (uint32_t)((k ^ 0x5b22) + (k >> 2)); break;
        case 4: c2 = (uint32_t)(3 * k + 0xeee7); break;
        case 5: c2 = (uint32_t)((2 * k) ^ 0x8d21); break;
        case 6: c2 = (uint32_t)(5 * k + 0x2c51); break;
        case 7: c2 = (uint32_t)(5 * k + 0xcbd4); break;
    }

    values[0] = c1;
    values[1] = c2;

    return write_answer(out, cap, values, count);
}

uint32_t p4_walk(uint32_t end, uint32_t low,
                 uint32_t high, uint32_t num) {
    uint32_t mid = low + ((high - low) >> 1);

    if (end == mid) {
        return (uint32_t)((mid + 0x90) ^ num);
    }

    uint32_t temp = (uint32_t)(mid + num);

    if (end < mid) {
        uint32_t result = p4_walk(end, low, mid - 1, num);
        return (uint32_t)((3 * result) ^ temp ^ 0x17);
    } 
    
    else {
        uint32_t result = p4_walk(end, mid + 1, high, num);
        return (uint32_t)((3 * result) ^ temp ^ 0x1d);
    }
}

int solve_phase_4(uint64_t challenge, char *out, size_t cap) {
    uint32_t values[MAX_FIELDS] = {0};
    size_t count = 1;
    (void)challenge;

    uint64_t c = challenge;
    uint32_t c1 = (uint32_t)(c & 0x7f);
    uint32_t c2 = (uint32_t)(c >> 7) ^ (uint32_t)(c >> 32);

    uint32_t c3 = p4_walk(c1, 0, 0x7f, c2);

    values[0] = c3;

    return write_answer(out, cap, values, count);
}

typedef struct {
    uint32_t next;
    uint32_t value;
    uint32_t extra;
} P5Node;

uint32_t p5_compute(uint64_t challenge, uint32_t *last) {
    const P5Node nodes[12] = {
        { 3, 0x026f, 0x7e0f },
        {10, 0x0423, 0x7d48 },
        { 4, 0x0541, 0x0780 },
        { 8, 0x073a, 0xd39a },
        { 1, 0x085d, 0x740f },
        { 0, 0x0128, 0x90a4 },
        { 2, 0x0b75, 0xc63e },
        { 5, 0x0a73, 0xe0f6 },
        { 9, 0x0351, 0x12c2 },
        {12, 0x0016, 0x1b03 },
        {11, 0x090e, 0x0ad7 },
        { 7, 0x064d, 0xbd4f }
    };

    const uint32_t heads[8] = {
        6, 2, 4, 1, 10, 11, 7, 5
    };

    uint64_t c = challenge;

    uint32_t index = (uint32_t)(c & 0x7);
    uint32_t steps = (uint32_t)((c >> 3) & 0x3);
    uint32_t k = (uint32_t)(c >> 6)
               ^ (uint32_t)(c >> 32)
               ^ 0x6c59U;

    uint32_t pos = heads[index];

    uint32_t acc = (uint32_t)(
        3U * k + nodes[pos].extra
    ) ^ nodes[pos].value;

    *last = nodes[pos].value;

    for (uint32_t i = 0; i < steps; i++) {
        pos = nodes[pos].next;

        acc = (uint32_t)(
            3U * acc + nodes[pos].extra
        ) ^ nodes[pos].value;

        *last = nodes[pos].value;
    }

    return acc;
}
int solve_phase_5(uint64_t challenge, char *out, size_t cap) {
    uint32_t values[MAX_FIELDS] = {0};
    size_t count = 2;
    (void)challenge;

    uint32_t p1 = 0;
    uint32_t p0 = p5_compute(challenge, &p1);

    values[0] = p0;
    values[1] = p1;

    return write_answer(out, cap, values, count);
}

uint32_t p6_op(uint32_t i, uint32_t x) {
    switch (i) {
        case 0:
        case 7:
            return (x >> 3) | (x << 29);

        case 1:
        case 2:
            return ((x << 7) + 0x8fb0) ^ (7U * x);

        case 3:
            return ((x << 7) | (x >> 25)) ^ 0xae66;

        case 4:
            return (x ^ 0x2608) + 2U * x;

        case 5:
            return (x + 0x5f05) ^ (x >> 5);

        case 6:
            return ((x >> 5) ^ x) + 0x9919;
    }

    return 0;
}

int solve_phase_6(uint64_t challenge, char *out, size_t cap) {
    uint32_t values[MAX_FIELDS] = {0};
    size_t count = 1;
    (void)challenge;
    uint64_t c = challenge;
    uint32_t x = (uint32_t)(c >> 6) ^ (uint32_t)(c >> 32);

    uint32_t i = (uint32_t)(c & 0x7);
    uint32_t j = (uint32_t)((c >> 3) & 0x7);

    uint32_t p0 = p6_op(i, x);
    p0 = p6_op(j, p0 ^ 0xa712);
    p0 = (uint32_t)(p0 + 0xeac0);

    values[0] = p0;
    
    return write_answer(out, cap, values, count);
}

int solve_secret(uint64_t challenge, uint64_t context, char *out, size_t cap) {
    uint64_t c = challenge;
    uint64_t t = context;

    uint32_t p0 = (uint32_t)(t & 0x3);

    uint32_t a = (uint32_t)(c >> 32) ^ (uint32_t)c;
    uint32_t b = (uint32_t)(t >> 32) ^ (uint32_t)t;
    uint32_t d = (uint32_t)(0x65e8U * p0) ^ (uint32_t)(t >> 16);

    uint32_t x = a ^ b;
    uint32_t mix = ((x >> 5) | (x << 27)) ^ 0xe1b2U;

    uint32_t p1 = mix ^ d;
    uint32_t p2 = p1 ^ (b + p0 + 0x845aU + (a >> 5));

    int n = snprintf(
        out, cap,
        "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAOPEN%u %u %u",
        (unsigned)p0, (unsigned)p1, (unsigned)p2
    );

    if (n < 0 || (size_t)n >= cap || n > 163)
        return 1;

    return 0;
}
