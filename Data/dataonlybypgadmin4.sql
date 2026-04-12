--
-- PostgreSQL database dump
--

\restrict vaVTsG6pGpUibCfjX0wTUGCht9gKVbqHNOfOOM6LaMbpwXBxRofH1sVa0noGCPj

-- Dumped from database version 13.23
-- Dumped by pg_dump version 13.23

-- Started on 2026-04-12 22:00:54

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 3191 (class 0 OID 16675)
-- Dependencies: 208
-- Data for Name: course; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.course (courseid, coursename, mindegree, maxdegree) FROM stdin;
1	HTML & CSS	50	100
2	JavaScript	50	100
3	Python Basics	50	100
4	SQL & Databases	50	100
5	Linux Fundamentals	50	100
6	Network Basics	50	100
7	Kotlin Basics	50	100
8	Swift Basics	50	100
9	Flutter & Dart	50	100
10	Cloud Fundamentals	50	100
11	Docker & Kubernetes	50	100
12	CI/CD Pipelines	50	100
13	HTML & CSS	50	100
14	JavaScript	50	100
15	Python Basics	50	100
16	SQL & Databases	50	100
17	Linux Fundamentals	50	100
18	Network Basics	50	100
19	Kotlin Basics	50	100
20	Swift Basics	50	100
21	Flutter & Dart	50	100
22	Cloud Fundamentals	50	100
23	Docker & Kubernetes	50	100
24	CI/CD Pipelines	50	100
\.


--
-- TOC entry 3200 (class 0 OID 16770)
-- Dependencies: 217
-- Data for Name: questions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.questions (questionid, courseid, questiontext, questiontype, points) FROM stdin;
1	1	Course 1 Question 1	TF	2
2	1	Course 1 Question 2	MCQ	2
3	1	Course 1 Question 3	TF	2
4	1	Course 1 Question 4	MCQ	2
5	1	Course 1 Question 5	TF	2
6	1	Course 1 Question 6	MCQ	2
7	1	Course 1 Question 7	TF	2
8	1	Course 1 Question 8	MCQ	2
9	1	Course 1 Question 9	TF	2
10	1	Course 1 Question 10	MCQ	2
11	1	Course 1 Question 11	TF	2
12	1	Course 1 Question 12	MCQ	2
13	1	Course 1 Question 13	TF	2
14	1	Course 1 Question 14	MCQ	2
15	1	Course 1 Question 15	TF	2
16	1	Course 1 Question 16	MCQ	2
17	1	Course 1 Question 17	TF	2
18	1	Course 1 Question 18	MCQ	2
19	1	Course 1 Question 19	TF	2
20	1	Course 1 Question 20	MCQ	2
21	1	Course 1 Question 21	TF	2
22	1	Course 1 Question 22	MCQ	2
23	1	Course 1 Question 23	TF	2
24	1	Course 1 Question 24	MCQ	2
25	1	Course 1 Question 25	TF	2
26	1	Course 1 Question 26	MCQ	2
27	1	Course 1 Question 27	TF	2
28	1	Course 1 Question 28	MCQ	2
29	1	Course 1 Question 29	TF	2
30	1	Course 1 Question 30	MCQ	2
31	1	Course 1 Question 31	TF	2
32	1	Course 1 Question 32	MCQ	2
33	1	Course 1 Question 33	TF	2
34	1	Course 1 Question 34	MCQ	2
35	1	Course 1 Question 35	TF	2
36	1	Course 1 Question 36	MCQ	2
37	1	Course 1 Question 37	TF	2
38	1	Course 1 Question 38	MCQ	2
39	1	Course 1 Question 39	TF	2
40	1	Course 1 Question 40	MCQ	2
41	1	Course 1 Question 41	TF	2
42	1	Course 1 Question 42	MCQ	2
43	1	Course 1 Question 43	TF	2
44	1	Course 1 Question 44	MCQ	2
45	1	Course 1 Question 45	TF	2
46	1	Course 1 Question 46	MCQ	2
47	1	Course 1 Question 47	TF	2
48	1	Course 1 Question 48	MCQ	2
49	1	Course 1 Question 49	TF	2
50	1	Course 1 Question 50	MCQ	2
51	1	Course 2 Question 1	TF	2
52	1	Course 2 Question 2	MCQ	2
53	1	Course 2 Question 3	TF	2
54	1	Course 2 Question 4	MCQ	2
55	1	Course 2 Question 5	TF	2
56	1	Course 2 Question 6	MCQ	2
57	1	Course 2 Question 7	TF	2
58	1	Course 2 Question 8	MCQ	2
59	1	Course 2 Question 9	TF	2
60	1	Course 2 Question 10	MCQ	2
61	1	Course 2 Question 11	TF	2
62	1	Course 2 Question 12	MCQ	2
63	1	Course 2 Question 13	TF	2
64	1	Course 2 Question 14	MCQ	2
65	1	Course 2 Question 15	TF	2
66	1	Course 2 Question 16	MCQ	2
67	1	Course 2 Question 17	TF	2
68	1	Course 2 Question 18	MCQ	2
69	1	Course 2 Question 19	TF	2
70	1	Course 2 Question 20	MCQ	2
71	1	Course 2 Question 21	TF	2
72	1	Course 2 Question 22	MCQ	2
73	1	Course 2 Question 23	TF	2
74	1	Course 2 Question 24	MCQ	2
75	1	Course 2 Question 25	TF	2
76	1	Course 2 Question 26	MCQ	2
77	1	Course 2 Question 27	TF	2
78	1	Course 2 Question 28	MCQ	2
79	1	Course 2 Question 29	TF	2
80	1	Course 2 Question 30	MCQ	2
81	1	Course 2 Question 31	TF	2
82	1	Course 2 Question 32	MCQ	2
83	1	Course 2 Question 33	TF	2
84	1	Course 2 Question 34	MCQ	2
85	1	Course 2 Question 35	TF	2
86	1	Course 2 Question 36	MCQ	2
87	1	Course 2 Question 37	TF	2
88	1	Course 2 Question 38	MCQ	2
89	1	Course 2 Question 39	TF	2
90	1	Course 2 Question 40	MCQ	2
91	1	Course 2 Question 41	TF	2
92	1	Course 2 Question 42	MCQ	2
93	1	Course 2 Question 43	TF	2
94	1	Course 2 Question 44	MCQ	2
95	1	Course 2 Question 45	TF	2
96	1	Course 2 Question 46	MCQ	2
97	1	Course 2 Question 47	TF	2
98	1	Course 2 Question 48	MCQ	2
99	1	Course 2 Question 49	TF	2
100	1	Course 2 Question 50	MCQ	2
101	1	Course 3 Question 1	TF	2
102	1	Course 3 Question 2	MCQ	2
103	1	Course 3 Question 3	TF	2
104	1	Course 3 Question 4	MCQ	2
105	1	Course 3 Question 5	TF	2
106	1	Course 3 Question 6	MCQ	2
107	1	Course 3 Question 7	TF	2
108	1	Course 3 Question 8	MCQ	2
109	1	Course 3 Question 9	TF	2
110	1	Course 3 Question 10	MCQ	2
111	1	Course 3 Question 11	TF	2
112	1	Course 3 Question 12	MCQ	2
113	1	Course 3 Question 13	TF	2
114	1	Course 3 Question 14	MCQ	2
115	1	Course 3 Question 15	TF	2
116	1	Course 3 Question 16	MCQ	2
117	1	Course 3 Question 17	TF	2
118	1	Course 3 Question 18	MCQ	2
119	1	Course 3 Question 19	TF	2
120	1	Course 3 Question 20	MCQ	2
121	1	Course 3 Question 21	TF	2
122	1	Course 3 Question 22	MCQ	2
123	1	Course 3 Question 23	TF	2
124	1	Course 3 Question 24	MCQ	2
125	1	Course 3 Question 25	TF	2
126	1	Course 3 Question 26	MCQ	2
127	1	Course 3 Question 27	TF	2
128	1	Course 3 Question 28	MCQ	2
129	1	Course 3 Question 29	TF	2
130	1	Course 3 Question 30	MCQ	2
131	1	Course 3 Question 31	TF	2
132	1	Course 3 Question 32	MCQ	2
133	1	Course 3 Question 33	TF	2
134	1	Course 3 Question 34	MCQ	2
135	1	Course 3 Question 35	TF	2
136	1	Course 3 Question 36	MCQ	2
137	1	Course 3 Question 37	TF	2
138	1	Course 3 Question 38	MCQ	2
139	1	Course 3 Question 39	TF	2
140	1	Course 3 Question 40	MCQ	2
141	1	Course 3 Question 41	TF	2
142	1	Course 3 Question 42	MCQ	2
143	1	Course 3 Question 43	TF	2
144	1	Course 3 Question 44	MCQ	2
145	1	Course 3 Question 45	TF	2
146	1	Course 3 Question 46	MCQ	2
147	1	Course 3 Question 47	TF	2
148	1	Course 3 Question 48	MCQ	2
149	1	Course 3 Question 49	TF	2
150	1	Course 3 Question 50	MCQ	2
151	1	Course 4 Question 1	TF	2
152	1	Course 4 Question 2	MCQ	2
153	1	Course 4 Question 3	TF	2
154	1	Course 4 Question 4	MCQ	2
155	1	Course 4 Question 5	TF	2
156	1	Course 4 Question 6	MCQ	2
157	1	Course 4 Question 7	TF	2
158	1	Course 4 Question 8	MCQ	2
159	1	Course 4 Question 9	TF	2
160	1	Course 4 Question 10	MCQ	2
161	1	Course 4 Question 11	TF	2
162	1	Course 4 Question 12	MCQ	2
163	1	Course 4 Question 13	TF	2
164	1	Course 4 Question 14	MCQ	2
165	1	Course 4 Question 15	TF	2
166	1	Course 4 Question 16	MCQ	2
167	1	Course 4 Question 17	TF	2
168	1	Course 4 Question 18	MCQ	2
169	1	Course 4 Question 19	TF	2
170	1	Course 4 Question 20	MCQ	2
171	1	Course 4 Question 21	TF	2
172	1	Course 4 Question 22	MCQ	2
173	1	Course 4 Question 23	TF	2
174	1	Course 4 Question 24	MCQ	2
175	1	Course 4 Question 25	TF	2
176	1	Course 4 Question 26	MCQ	2
177	1	Course 4 Question 27	TF	2
178	1	Course 4 Question 28	MCQ	2
179	1	Course 4 Question 29	TF	2
180	1	Course 4 Question 30	MCQ	2
181	1	Course 4 Question 31	TF	2
182	1	Course 4 Question 32	MCQ	2
183	1	Course 4 Question 33	TF	2
184	1	Course 4 Question 34	MCQ	2
185	1	Course 4 Question 35	TF	2
186	1	Course 4 Question 36	MCQ	2
187	1	Course 4 Question 37	TF	2
188	1	Course 4 Question 38	MCQ	2
189	1	Course 4 Question 39	TF	2
190	1	Course 4 Question 40	MCQ	2
191	1	Course 4 Question 41	TF	2
192	1	Course 4 Question 42	MCQ	2
193	1	Course 4 Question 43	TF	2
194	1	Course 4 Question 44	MCQ	2
195	1	Course 4 Question 45	TF	2
196	1	Course 4 Question 46	MCQ	2
197	1	Course 4 Question 47	TF	2
198	1	Course 4 Question 48	MCQ	2
199	1	Course 4 Question 49	TF	2
200	1	Course 4 Question 50	MCQ	2
201	1	Course 5 Question 1	TF	2
202	1	Course 5 Question 2	MCQ	2
203	1	Course 5 Question 3	TF	2
204	1	Course 5 Question 4	MCQ	2
205	1	Course 5 Question 5	TF	2
206	1	Course 5 Question 6	MCQ	2
207	1	Course 5 Question 7	TF	2
208	1	Course 5 Question 8	MCQ	2
209	1	Course 5 Question 9	TF	2
210	1	Course 5 Question 10	MCQ	2
211	1	Course 5 Question 11	TF	2
212	1	Course 5 Question 12	MCQ	2
213	1	Course 5 Question 13	TF	2
214	1	Course 5 Question 14	MCQ	2
215	1	Course 5 Question 15	TF	2
216	1	Course 5 Question 16	MCQ	2
217	1	Course 5 Question 17	TF	2
218	1	Course 5 Question 18	MCQ	2
219	1	Course 5 Question 19	TF	2
220	1	Course 5 Question 20	MCQ	2
221	1	Course 5 Question 21	TF	2
222	1	Course 5 Question 22	MCQ	2
223	1	Course 5 Question 23	TF	2
224	1	Course 5 Question 24	MCQ	2
225	1	Course 5 Question 25	TF	2
226	1	Course 5 Question 26	MCQ	2
227	1	Course 5 Question 27	TF	2
228	1	Course 5 Question 28	MCQ	2
229	1	Course 5 Question 29	TF	2
230	1	Course 5 Question 30	MCQ	2
231	1	Course 5 Question 31	TF	2
232	1	Course 5 Question 32	MCQ	2
233	1	Course 5 Question 33	TF	2
234	1	Course 5 Question 34	MCQ	2
235	1	Course 5 Question 35	TF	2
236	1	Course 5 Question 36	MCQ	2
237	1	Course 5 Question 37	TF	2
238	1	Course 5 Question 38	MCQ	2
239	1	Course 5 Question 39	TF	2
240	1	Course 5 Question 40	MCQ	2
241	1	Course 5 Question 41	TF	2
242	1	Course 5 Question 42	MCQ	2
243	1	Course 5 Question 43	TF	2
244	1	Course 5 Question 44	MCQ	2
245	1	Course 5 Question 45	TF	2
246	1	Course 5 Question 46	MCQ	2
247	1	Course 5 Question 47	TF	2
248	1	Course 5 Question 48	MCQ	2
249	1	Course 5 Question 49	TF	2
250	1	Course 5 Question 50	MCQ	2
251	1	Course 6 Question 1	TF	2
252	1	Course 6 Question 2	MCQ	2
253	1	Course 6 Question 3	TF	2
254	1	Course 6 Question 4	MCQ	2
255	1	Course 6 Question 5	TF	2
256	1	Course 6 Question 6	MCQ	2
257	1	Course 6 Question 7	TF	2
258	1	Course 6 Question 8	MCQ	2
259	1	Course 6 Question 9	TF	2
260	1	Course 6 Question 10	MCQ	2
261	1	Course 6 Question 11	TF	2
262	1	Course 6 Question 12	MCQ	2
263	1	Course 6 Question 13	TF	2
264	1	Course 6 Question 14	MCQ	2
265	1	Course 6 Question 15	TF	2
266	1	Course 6 Question 16	MCQ	2
267	1	Course 6 Question 17	TF	2
268	1	Course 6 Question 18	MCQ	2
269	1	Course 6 Question 19	TF	2
270	1	Course 6 Question 20	MCQ	2
271	1	Course 6 Question 21	TF	2
272	1	Course 6 Question 22	MCQ	2
273	1	Course 6 Question 23	TF	2
274	1	Course 6 Question 24	MCQ	2
275	1	Course 6 Question 25	TF	2
276	1	Course 6 Question 26	MCQ	2
277	1	Course 6 Question 27	TF	2
278	1	Course 6 Question 28	MCQ	2
279	1	Course 6 Question 29	TF	2
280	1	Course 6 Question 30	MCQ	2
281	1	Course 6 Question 31	TF	2
282	1	Course 6 Question 32	MCQ	2
283	1	Course 6 Question 33	TF	2
284	1	Course 6 Question 34	MCQ	2
285	1	Course 6 Question 35	TF	2
286	1	Course 6 Question 36	MCQ	2
287	1	Course 6 Question 37	TF	2
288	1	Course 6 Question 38	MCQ	2
289	1	Course 6 Question 39	TF	2
290	1	Course 6 Question 40	MCQ	2
291	1	Course 6 Question 41	TF	2
292	1	Course 6 Question 42	MCQ	2
293	1	Course 6 Question 43	TF	2
294	1	Course 6 Question 44	MCQ	2
295	1	Course 6 Question 45	TF	2
296	1	Course 6 Question 46	MCQ	2
297	1	Course 6 Question 47	TF	2
298	1	Course 6 Question 48	MCQ	2
299	1	Course 6 Question 49	TF	2
300	1	Course 6 Question 50	MCQ	2
301	1	Course 7 Question 1	TF	2
302	1	Course 7 Question 2	MCQ	2
303	1	Course 7 Question 3	TF	2
304	1	Course 7 Question 4	MCQ	2
305	1	Course 7 Question 5	TF	2
306	1	Course 7 Question 6	MCQ	2
307	1	Course 7 Question 7	TF	2
308	1	Course 7 Question 8	MCQ	2
309	1	Course 7 Question 9	TF	2
310	1	Course 7 Question 10	MCQ	2
311	1	Course 7 Question 11	TF	2
312	1	Course 7 Question 12	MCQ	2
313	1	Course 7 Question 13	TF	2
314	1	Course 7 Question 14	MCQ	2
315	1	Course 7 Question 15	TF	2
316	1	Course 7 Question 16	MCQ	2
317	1	Course 7 Question 17	TF	2
318	1	Course 7 Question 18	MCQ	2
319	1	Course 7 Question 19	TF	2
320	1	Course 7 Question 20	MCQ	2
321	1	Course 7 Question 21	TF	2
322	1	Course 7 Question 22	MCQ	2
323	1	Course 7 Question 23	TF	2
324	1	Course 7 Question 24	MCQ	2
325	1	Course 7 Question 25	TF	2
326	1	Course 7 Question 26	MCQ	2
327	1	Course 7 Question 27	TF	2
328	1	Course 7 Question 28	MCQ	2
329	1	Course 7 Question 29	TF	2
330	1	Course 7 Question 30	MCQ	2
331	1	Course 7 Question 31	TF	2
332	1	Course 7 Question 32	MCQ	2
333	1	Course 7 Question 33	TF	2
334	1	Course 7 Question 34	MCQ	2
335	1	Course 7 Question 35	TF	2
336	1	Course 7 Question 36	MCQ	2
337	1	Course 7 Question 37	TF	2
338	1	Course 7 Question 38	MCQ	2
339	1	Course 7 Question 39	TF	2
340	1	Course 7 Question 40	MCQ	2
341	1	Course 7 Question 41	TF	2
342	1	Course 7 Question 42	MCQ	2
343	1	Course 7 Question 43	TF	2
344	1	Course 7 Question 44	MCQ	2
345	1	Course 7 Question 45	TF	2
346	1	Course 7 Question 46	MCQ	2
347	1	Course 7 Question 47	TF	2
348	1	Course 7 Question 48	MCQ	2
349	1	Course 7 Question 49	TF	2
350	1	Course 7 Question 50	MCQ	2
351	1	Course 8 Question 1	TF	2
352	1	Course 8 Question 2	MCQ	2
353	1	Course 8 Question 3	TF	2
354	1	Course 8 Question 4	MCQ	2
355	1	Course 8 Question 5	TF	2
356	1	Course 8 Question 6	MCQ	2
357	1	Course 8 Question 7	TF	2
358	1	Course 8 Question 8	MCQ	2
359	1	Course 8 Question 9	TF	2
360	1	Course 8 Question 10	MCQ	2
361	1	Course 8 Question 11	TF	2
362	1	Course 8 Question 12	MCQ	2
363	1	Course 8 Question 13	TF	2
364	1	Course 8 Question 14	MCQ	2
365	1	Course 8 Question 15	TF	2
366	1	Course 8 Question 16	MCQ	2
367	1	Course 8 Question 17	TF	2
368	1	Course 8 Question 18	MCQ	2
369	1	Course 8 Question 19	TF	2
370	1	Course 8 Question 20	MCQ	2
371	1	Course 8 Question 21	TF	2
372	1	Course 8 Question 22	MCQ	2
373	1	Course 8 Question 23	TF	2
374	1	Course 8 Question 24	MCQ	2
375	1	Course 8 Question 25	TF	2
376	1	Course 8 Question 26	MCQ	2
377	1	Course 8 Question 27	TF	2
378	1	Course 8 Question 28	MCQ	2
379	1	Course 8 Question 29	TF	2
380	1	Course 8 Question 30	MCQ	2
381	1	Course 8 Question 31	TF	2
382	1	Course 8 Question 32	MCQ	2
383	1	Course 8 Question 33	TF	2
384	1	Course 8 Question 34	MCQ	2
385	1	Course 8 Question 35	TF	2
386	1	Course 8 Question 36	MCQ	2
387	1	Course 8 Question 37	TF	2
388	1	Course 8 Question 38	MCQ	2
389	1	Course 8 Question 39	TF	2
390	1	Course 8 Question 40	MCQ	2
391	1	Course 8 Question 41	TF	2
392	1	Course 8 Question 42	MCQ	2
393	1	Course 8 Question 43	TF	2
394	1	Course 8 Question 44	MCQ	2
395	1	Course 8 Question 45	TF	2
396	1	Course 8 Question 46	MCQ	2
397	1	Course 8 Question 47	TF	2
398	1	Course 8 Question 48	MCQ	2
399	1	Course 8 Question 49	TF	2
400	1	Course 8 Question 50	MCQ	2
401	1	Course 9 Question 1	TF	2
402	1	Course 9 Question 2	MCQ	2
403	1	Course 9 Question 3	TF	2
404	1	Course 9 Question 4	MCQ	2
405	1	Course 9 Question 5	TF	2
406	1	Course 9 Question 6	MCQ	2
407	1	Course 9 Question 7	TF	2
408	1	Course 9 Question 8	MCQ	2
409	1	Course 9 Question 9	TF	2
410	1	Course 9 Question 10	MCQ	2
411	1	Course 9 Question 11	TF	2
412	1	Course 9 Question 12	MCQ	2
413	1	Course 9 Question 13	TF	2
414	1	Course 9 Question 14	MCQ	2
415	1	Course 9 Question 15	TF	2
416	1	Course 9 Question 16	MCQ	2
417	1	Course 9 Question 17	TF	2
418	1	Course 9 Question 18	MCQ	2
419	1	Course 9 Question 19	TF	2
420	1	Course 9 Question 20	MCQ	2
421	1	Course 9 Question 21	TF	2
422	1	Course 9 Question 22	MCQ	2
423	1	Course 9 Question 23	TF	2
424	1	Course 9 Question 24	MCQ	2
425	1	Course 9 Question 25	TF	2
426	1	Course 9 Question 26	MCQ	2
427	1	Course 9 Question 27	TF	2
428	1	Course 9 Question 28	MCQ	2
429	1	Course 9 Question 29	TF	2
430	1	Course 9 Question 30	MCQ	2
431	1	Course 9 Question 31	TF	2
432	1	Course 9 Question 32	MCQ	2
433	1	Course 9 Question 33	TF	2
434	1	Course 9 Question 34	MCQ	2
435	1	Course 9 Question 35	TF	2
436	1	Course 9 Question 36	MCQ	2
437	1	Course 9 Question 37	TF	2
438	1	Course 9 Question 38	MCQ	2
439	1	Course 9 Question 39	TF	2
440	1	Course 9 Question 40	MCQ	2
441	1	Course 9 Question 41	TF	2
442	1	Course 9 Question 42	MCQ	2
443	1	Course 9 Question 43	TF	2
444	1	Course 9 Question 44	MCQ	2
445	1	Course 9 Question 45	TF	2
446	1	Course 9 Question 46	MCQ	2
447	1	Course 9 Question 47	TF	2
448	1	Course 9 Question 48	MCQ	2
449	1	Course 9 Question 49	TF	2
450	1	Course 9 Question 50	MCQ	2
451	10	Course 10 Question 1	TF	2
452	10	Course 10 Question 2	MCQ	2
453	10	Course 10 Question 3	TF	2
454	10	Course 10 Question 4	MCQ	2
455	10	Course 10 Question 5	TF	2
456	10	Course 10 Question 6	MCQ	2
457	10	Course 10 Question 7	TF	2
458	10	Course 10 Question 8	MCQ	2
459	10	Course 10 Question 9	TF	2
460	10	Course 10 Question 10	MCQ	2
461	10	Course 10 Question 11	TF	2
462	10	Course 10 Question 12	MCQ	2
463	10	Course 10 Question 13	TF	2
464	10	Course 10 Question 14	MCQ	2
465	10	Course 10 Question 15	TF	2
466	10	Course 10 Question 16	MCQ	2
467	10	Course 10 Question 17	TF	2
468	10	Course 10 Question 18	MCQ	2
469	10	Course 10 Question 19	TF	2
470	10	Course 10 Question 20	MCQ	2
471	10	Course 10 Question 21	TF	2
472	10	Course 10 Question 22	MCQ	2
473	10	Course 10 Question 23	TF	2
474	10	Course 10 Question 24	MCQ	2
475	10	Course 10 Question 25	TF	2
476	10	Course 10 Question 26	MCQ	2
477	10	Course 10 Question 27	TF	2
478	10	Course 10 Question 28	MCQ	2
479	10	Course 10 Question 29	TF	2
480	10	Course 10 Question 30	MCQ	2
481	10	Course 10 Question 31	TF	2
482	10	Course 10 Question 32	MCQ	2
483	10	Course 10 Question 33	TF	2
484	10	Course 10 Question 34	MCQ	2
485	10	Course 10 Question 35	TF	2
486	10	Course 10 Question 36	MCQ	2
487	10	Course 10 Question 37	TF	2
488	10	Course 10 Question 38	MCQ	2
489	10	Course 10 Question 39	TF	2
490	10	Course 10 Question 40	MCQ	2
491	10	Course 10 Question 41	TF	2
492	10	Course 10 Question 42	MCQ	2
493	10	Course 10 Question 43	TF	2
494	10	Course 10 Question 44	MCQ	2
495	10	Course 10 Question 45	TF	2
496	10	Course 10 Question 46	MCQ	2
497	10	Course 10 Question 47	TF	2
498	10	Course 10 Question 48	MCQ	2
499	10	Course 10 Question 49	TF	2
500	10	Course 10 Question 50	MCQ	2
501	11	Course 11 Question 1	TF	2
502	11	Course 11 Question 2	MCQ	2
503	11	Course 11 Question 3	TF	2
504	11	Course 11 Question 4	MCQ	2
505	11	Course 11 Question 5	TF	2
506	11	Course 11 Question 6	MCQ	2
507	11	Course 11 Question 7	TF	2
508	11	Course 11 Question 8	MCQ	2
509	11	Course 11 Question 9	TF	2
510	11	Course 11 Question 10	MCQ	2
511	11	Course 11 Question 11	TF	2
512	11	Course 11 Question 12	MCQ	2
513	11	Course 11 Question 13	TF	2
514	11	Course 11 Question 14	MCQ	2
515	11	Course 11 Question 15	TF	2
516	11	Course 11 Question 16	MCQ	2
517	11	Course 11 Question 17	TF	2
518	11	Course 11 Question 18	MCQ	2
519	11	Course 11 Question 19	TF	2
520	11	Course 11 Question 20	MCQ	2
521	11	Course 11 Question 21	TF	2
522	11	Course 11 Question 22	MCQ	2
523	11	Course 11 Question 23	TF	2
524	11	Course 11 Question 24	MCQ	2
525	11	Course 11 Question 25	TF	2
526	11	Course 11 Question 26	MCQ	2
527	11	Course 11 Question 27	TF	2
528	11	Course 11 Question 28	MCQ	2
529	11	Course 11 Question 29	TF	2
530	11	Course 11 Question 30	MCQ	2
531	11	Course 11 Question 31	TF	2
532	11	Course 11 Question 32	MCQ	2
533	11	Course 11 Question 33	TF	2
534	11	Course 11 Question 34	MCQ	2
535	11	Course 11 Question 35	TF	2
536	11	Course 11 Question 36	MCQ	2
537	11	Course 11 Question 37	TF	2
538	11	Course 11 Question 38	MCQ	2
539	11	Course 11 Question 39	TF	2
540	11	Course 11 Question 40	MCQ	2
541	11	Course 11 Question 41	TF	2
542	11	Course 11 Question 42	MCQ	2
543	11	Course 11 Question 43	TF	2
544	11	Course 11 Question 44	MCQ	2
545	11	Course 11 Question 45	TF	2
546	11	Course 11 Question 46	MCQ	2
547	11	Course 11 Question 47	TF	2
548	11	Course 11 Question 48	MCQ	2
549	11	Course 11 Question 49	TF	2
550	11	Course 11 Question 50	MCQ	2
551	12	Course 12 Question 1	TF	2
552	12	Course 12 Question 2	MCQ	2
553	12	Course 12 Question 3	TF	2
554	12	Course 12 Question 4	MCQ	2
555	12	Course 12 Question 5	TF	2
556	12	Course 12 Question 6	MCQ	2
557	12	Course 12 Question 7	TF	2
558	12	Course 12 Question 8	MCQ	2
559	12	Course 12 Question 9	TF	2
560	12	Course 12 Question 10	MCQ	2
561	12	Course 12 Question 11	TF	2
562	12	Course 12 Question 12	MCQ	2
563	12	Course 12 Question 13	TF	2
564	12	Course 12 Question 14	MCQ	2
565	12	Course 12 Question 15	TF	2
566	12	Course 12 Question 16	MCQ	2
567	12	Course 12 Question 17	TF	2
568	12	Course 12 Question 18	MCQ	2
569	12	Course 12 Question 19	TF	2
570	12	Course 12 Question 20	MCQ	2
571	12	Course 12 Question 21	TF	2
572	12	Course 12 Question 22	MCQ	2
573	12	Course 12 Question 23	TF	2
574	12	Course 12 Question 24	MCQ	2
575	12	Course 12 Question 25	TF	2
576	12	Course 12 Question 26	MCQ	2
577	12	Course 12 Question 27	TF	2
578	12	Course 12 Question 28	MCQ	2
579	12	Course 12 Question 29	TF	2
580	12	Course 12 Question 30	MCQ	2
581	12	Course 12 Question 31	TF	2
582	12	Course 12 Question 32	MCQ	2
583	12	Course 12 Question 33	TF	2
584	12	Course 12 Question 34	MCQ	2
585	12	Course 12 Question 35	TF	2
586	12	Course 12 Question 36	MCQ	2
587	12	Course 12 Question 37	TF	2
588	12	Course 12 Question 38	MCQ	2
589	12	Course 12 Question 39	TF	2
590	12	Course 12 Question 40	MCQ	2
591	12	Course 12 Question 41	TF	2
592	12	Course 12 Question 42	MCQ	2
593	12	Course 12 Question 43	TF	2
594	12	Course 12 Question 44	MCQ	2
595	12	Course 12 Question 45	TF	2
596	12	Course 12 Question 46	MCQ	2
597	12	Course 12 Question 47	TF	2
598	12	Course 12 Question 48	MCQ	2
599	12	Course 12 Question 49	TF	2
600	12	Course 12 Question 50	MCQ	2
\.


--
-- TOC entry 3202 (class 0 OID 16788)
-- Dependencies: 219
-- Data for Name: choice; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.choice (optionid, questionid, optiontext, optionorder) FROM stdin;
1	1	True	1
2	1	False	2
3	2	Option A	1
4	2	Option B	2
5	2	Option C	3
6	2	Option D	4
7	3	True	1
8	3	False	2
9	4	Option A	1
10	4	Option B	2
11	4	Option C	3
12	4	Option D	4
13	5	True	1
14	5	False	2
15	6	Option A	1
16	6	Option B	2
17	6	Option C	3
18	6	Option D	4
19	7	True	1
20	7	False	2
21	8	Option A	1
22	8	Option B	2
23	8	Option C	3
24	8	Option D	4
25	9	True	1
26	9	False	2
27	10	Option A	1
28	10	Option B	2
29	10	Option C	3
30	10	Option D	4
31	11	True	1
32	11	False	2
33	12	Option A	1
34	12	Option B	2
35	12	Option C	3
36	12	Option D	4
37	13	True	1
38	13	False	2
39	14	Option A	1
40	14	Option B	2
41	14	Option C	3
42	14	Option D	4
43	15	True	1
44	15	False	2
45	16	Option A	1
46	16	Option B	2
47	16	Option C	3
48	16	Option D	4
49	17	True	1
50	17	False	2
51	18	Option A	1
52	18	Option B	2
53	18	Option C	3
54	18	Option D	4
55	19	True	1
56	19	False	2
57	20	Option A	1
58	20	Option B	2
59	20	Option C	3
60	20	Option D	4
61	21	True	1
62	21	False	2
63	22	Option A	1
64	22	Option B	2
65	22	Option C	3
66	22	Option D	4
67	23	True	1
68	23	False	2
69	24	Option A	1
70	24	Option B	2
71	24	Option C	3
72	24	Option D	4
73	25	True	1
74	25	False	2
75	26	Option A	1
76	26	Option B	2
77	26	Option C	3
78	26	Option D	4
79	27	True	1
80	27	False	2
81	28	Option A	1
82	28	Option B	2
83	28	Option C	3
84	28	Option D	4
85	29	True	1
86	29	False	2
87	30	Option A	1
88	30	Option B	2
89	30	Option C	3
90	30	Option D	4
91	31	True	1
92	31	False	2
93	32	Option A	1
94	32	Option B	2
95	32	Option C	3
96	32	Option D	4
97	33	True	1
98	33	False	2
99	34	Option A	1
100	34	Option B	2
101	34	Option C	3
102	34	Option D	4
103	35	True	1
104	35	False	2
105	36	Option A	1
106	36	Option B	2
107	36	Option C	3
108	36	Option D	4
109	37	True	1
110	37	False	2
111	38	Option A	1
112	38	Option B	2
113	38	Option C	3
114	38	Option D	4
115	39	True	1
116	39	False	2
117	40	Option A	1
118	40	Option B	2
119	40	Option C	3
120	40	Option D	4
121	41	True	1
122	41	False	2
123	42	Option A	1
124	42	Option B	2
125	42	Option C	3
126	42	Option D	4
127	43	True	1
128	43	False	2
129	44	Option A	1
130	44	Option B	2
131	44	Option C	3
132	44	Option D	4
133	45	True	1
134	45	False	2
135	46	Option A	1
136	46	Option B	2
137	46	Option C	3
138	46	Option D	4
139	47	True	1
140	47	False	2
141	48	Option A	1
142	48	Option B	2
143	48	Option C	3
144	48	Option D	4
145	49	True	1
146	49	False	2
147	50	Option A	1
148	50	Option B	2
149	50	Option C	3
150	50	Option D	4
151	51	True	1
152	51	False	2
153	52	Option A	1
154	52	Option B	2
155	52	Option C	3
156	52	Option D	4
157	53	True	1
158	53	False	2
159	54	Option A	1
160	54	Option B	2
161	54	Option C	3
162	54	Option D	4
163	55	True	1
164	55	False	2
165	56	Option A	1
166	56	Option B	2
167	56	Option C	3
168	56	Option D	4
169	57	True	1
170	57	False	2
171	58	Option A	1
172	58	Option B	2
173	58	Option C	3
174	58	Option D	4
175	59	True	1
176	59	False	2
177	60	Option A	1
178	60	Option B	2
179	60	Option C	3
180	60	Option D	4
181	61	True	1
182	61	False	2
183	62	Option A	1
184	62	Option B	2
185	62	Option C	3
186	62	Option D	4
187	63	True	1
188	63	False	2
189	64	Option A	1
190	64	Option B	2
191	64	Option C	3
192	64	Option D	4
193	65	True	1
194	65	False	2
195	66	Option A	1
196	66	Option B	2
197	66	Option C	3
198	66	Option D	4
199	67	True	1
200	67	False	2
201	68	Option A	1
202	68	Option B	2
203	68	Option C	3
204	68	Option D	4
205	69	True	1
206	69	False	2
207	70	Option A	1
208	70	Option B	2
209	70	Option C	3
210	70	Option D	4
211	71	True	1
212	71	False	2
213	72	Option A	1
214	72	Option B	2
215	72	Option C	3
216	72	Option D	4
217	73	True	1
218	73	False	2
219	74	Option A	1
220	74	Option B	2
221	74	Option C	3
222	74	Option D	4
223	75	True	1
224	75	False	2
225	76	Option A	1
226	76	Option B	2
227	76	Option C	3
228	76	Option D	4
229	77	True	1
230	77	False	2
231	78	Option A	1
232	78	Option B	2
233	78	Option C	3
234	78	Option D	4
235	79	True	1
236	79	False	2
237	80	Option A	1
238	80	Option B	2
239	80	Option C	3
240	80	Option D	4
241	81	True	1
242	81	False	2
243	82	Option A	1
244	82	Option B	2
245	82	Option C	3
246	82	Option D	4
247	83	True	1
248	83	False	2
249	84	Option A	1
250	84	Option B	2
251	84	Option C	3
252	84	Option D	4
253	85	True	1
254	85	False	2
255	86	Option A	1
256	86	Option B	2
257	86	Option C	3
258	86	Option D	4
259	87	True	1
260	87	False	2
261	88	Option A	1
262	88	Option B	2
263	88	Option C	3
264	88	Option D	4
265	89	True	1
266	89	False	2
267	90	Option A	1
268	90	Option B	2
269	90	Option C	3
270	90	Option D	4
271	91	True	1
272	91	False	2
273	92	Option A	1
274	92	Option B	2
275	92	Option C	3
276	92	Option D	4
277	93	True	1
278	93	False	2
279	94	Option A	1
280	94	Option B	2
281	94	Option C	3
282	94	Option D	4
283	95	True	1
284	95	False	2
285	96	Option A	1
286	96	Option B	2
287	96	Option C	3
288	96	Option D	4
289	97	True	1
290	97	False	2
291	98	Option A	1
292	98	Option B	2
293	98	Option C	3
294	98	Option D	4
295	99	True	1
296	99	False	2
297	100	Option A	1
298	100	Option B	2
299	100	Option C	3
300	100	Option D	4
301	101	True	1
302	101	False	2
303	102	Option A	1
304	102	Option B	2
305	102	Option C	3
306	102	Option D	4
307	103	True	1
308	103	False	2
309	104	Option A	1
310	104	Option B	2
311	104	Option C	3
312	104	Option D	4
313	105	True	1
314	105	False	2
315	106	Option A	1
316	106	Option B	2
317	106	Option C	3
318	106	Option D	4
319	107	True	1
320	107	False	2
321	108	Option A	1
322	108	Option B	2
323	108	Option C	3
324	108	Option D	4
325	109	True	1
326	109	False	2
327	110	Option A	1
328	110	Option B	2
329	110	Option C	3
330	110	Option D	4
331	111	True	1
332	111	False	2
333	112	Option A	1
334	112	Option B	2
335	112	Option C	3
336	112	Option D	4
337	113	True	1
338	113	False	2
339	114	Option A	1
340	114	Option B	2
341	114	Option C	3
342	114	Option D	4
343	115	True	1
344	115	False	2
345	116	Option A	1
346	116	Option B	2
347	116	Option C	3
348	116	Option D	4
349	117	True	1
350	117	False	2
351	118	Option A	1
352	118	Option B	2
353	118	Option C	3
354	118	Option D	4
355	119	True	1
356	119	False	2
357	120	Option A	1
358	120	Option B	2
359	120	Option C	3
360	120	Option D	4
361	121	True	1
362	121	False	2
363	122	Option A	1
364	122	Option B	2
365	122	Option C	3
366	122	Option D	4
367	123	True	1
368	123	False	2
369	124	Option A	1
370	124	Option B	2
371	124	Option C	3
372	124	Option D	4
373	125	True	1
374	125	False	2
375	126	Option A	1
376	126	Option B	2
377	126	Option C	3
378	126	Option D	4
379	127	True	1
380	127	False	2
381	128	Option A	1
382	128	Option B	2
383	128	Option C	3
384	128	Option D	4
385	129	True	1
386	129	False	2
387	130	Option A	1
388	130	Option B	2
389	130	Option C	3
390	130	Option D	4
391	131	True	1
392	131	False	2
393	132	Option A	1
394	132	Option B	2
395	132	Option C	3
396	132	Option D	4
397	133	True	1
398	133	False	2
399	134	Option A	1
400	134	Option B	2
401	134	Option C	3
402	134	Option D	4
403	135	True	1
404	135	False	2
405	136	Option A	1
406	136	Option B	2
407	136	Option C	3
408	136	Option D	4
409	137	True	1
410	137	False	2
411	138	Option A	1
412	138	Option B	2
413	138	Option C	3
414	138	Option D	4
415	139	True	1
416	139	False	2
417	140	Option A	1
418	140	Option B	2
419	140	Option C	3
420	140	Option D	4
421	141	True	1
422	141	False	2
423	142	Option A	1
424	142	Option B	2
425	142	Option C	3
426	142	Option D	4
427	143	True	1
428	143	False	2
429	144	Option A	1
430	144	Option B	2
431	144	Option C	3
432	144	Option D	4
433	145	True	1
434	145	False	2
435	146	Option A	1
436	146	Option B	2
437	146	Option C	3
438	146	Option D	4
439	147	True	1
440	147	False	2
441	148	Option A	1
442	148	Option B	2
443	148	Option C	3
444	148	Option D	4
445	149	True	1
446	149	False	2
447	150	Option A	1
448	150	Option B	2
449	150	Option C	3
450	150	Option D	4
451	151	True	1
452	151	False	2
453	152	Option A	1
454	152	Option B	2
455	152	Option C	3
456	152	Option D	4
457	153	True	1
458	153	False	2
459	154	Option A	1
460	154	Option B	2
461	154	Option C	3
462	154	Option D	4
463	155	True	1
464	155	False	2
465	156	Option A	1
466	156	Option B	2
467	156	Option C	3
468	156	Option D	4
469	157	True	1
470	157	False	2
471	158	Option A	1
472	158	Option B	2
473	158	Option C	3
474	158	Option D	4
475	159	True	1
476	159	False	2
477	160	Option A	1
478	160	Option B	2
479	160	Option C	3
480	160	Option D	4
481	161	True	1
482	161	False	2
483	162	Option A	1
484	162	Option B	2
485	162	Option C	3
486	162	Option D	4
487	163	True	1
488	163	False	2
489	164	Option A	1
490	164	Option B	2
491	164	Option C	3
492	164	Option D	4
493	165	True	1
494	165	False	2
495	166	Option A	1
496	166	Option B	2
497	166	Option C	3
498	166	Option D	4
499	167	True	1
500	167	False	2
501	168	Option A	1
502	168	Option B	2
503	168	Option C	3
504	168	Option D	4
505	169	True	1
506	169	False	2
507	170	Option A	1
508	170	Option B	2
509	170	Option C	3
510	170	Option D	4
511	171	True	1
512	171	False	2
513	172	Option A	1
514	172	Option B	2
515	172	Option C	3
516	172	Option D	4
517	173	True	1
518	173	False	2
519	174	Option A	1
520	174	Option B	2
521	174	Option C	3
522	174	Option D	4
523	175	True	1
524	175	False	2
525	176	Option A	1
526	176	Option B	2
527	176	Option C	3
528	176	Option D	4
529	177	True	1
530	177	False	2
531	178	Option A	1
532	178	Option B	2
533	178	Option C	3
534	178	Option D	4
535	179	True	1
536	179	False	2
537	180	Option A	1
538	180	Option B	2
539	180	Option C	3
540	180	Option D	4
541	181	True	1
542	181	False	2
543	182	Option A	1
544	182	Option B	2
545	182	Option C	3
546	182	Option D	4
547	183	True	1
548	183	False	2
549	184	Option A	1
550	184	Option B	2
551	184	Option C	3
552	184	Option D	4
553	185	True	1
554	185	False	2
555	186	Option A	1
556	186	Option B	2
557	186	Option C	3
558	186	Option D	4
559	187	True	1
560	187	False	2
561	188	Option A	1
562	188	Option B	2
563	188	Option C	3
564	188	Option D	4
565	189	True	1
566	189	False	2
567	190	Option A	1
568	190	Option B	2
569	190	Option C	3
570	190	Option D	4
571	191	True	1
572	191	False	2
573	192	Option A	1
574	192	Option B	2
575	192	Option C	3
576	192	Option D	4
577	193	True	1
578	193	False	2
579	194	Option A	1
580	194	Option B	2
581	194	Option C	3
582	194	Option D	4
583	195	True	1
584	195	False	2
585	196	Option A	1
586	196	Option B	2
587	196	Option C	3
588	196	Option D	4
589	197	True	1
590	197	False	2
591	198	Option A	1
592	198	Option B	2
593	198	Option C	3
594	198	Option D	4
595	199	True	1
596	199	False	2
597	200	Option A	1
598	200	Option B	2
599	200	Option C	3
600	200	Option D	4
601	201	True	1
602	201	False	2
603	202	Option A	1
604	202	Option B	2
605	202	Option C	3
606	202	Option D	4
607	203	True	1
608	203	False	2
609	204	Option A	1
610	204	Option B	2
611	204	Option C	3
612	204	Option D	4
613	205	True	1
614	205	False	2
615	206	Option A	1
616	206	Option B	2
617	206	Option C	3
618	206	Option D	4
619	207	True	1
620	207	False	2
621	208	Option A	1
622	208	Option B	2
623	208	Option C	3
624	208	Option D	4
625	209	True	1
626	209	False	2
627	210	Option A	1
628	210	Option B	2
629	210	Option C	3
630	210	Option D	4
631	211	True	1
632	211	False	2
633	212	Option A	1
634	212	Option B	2
635	212	Option C	3
636	212	Option D	4
637	213	True	1
638	213	False	2
639	214	Option A	1
640	214	Option B	2
641	214	Option C	3
642	214	Option D	4
643	215	True	1
644	215	False	2
645	216	Option A	1
646	216	Option B	2
647	216	Option C	3
648	216	Option D	4
649	217	True	1
650	217	False	2
651	218	Option A	1
652	218	Option B	2
653	218	Option C	3
654	218	Option D	4
655	219	True	1
656	219	False	2
657	220	Option A	1
658	220	Option B	2
659	220	Option C	3
660	220	Option D	4
661	221	True	1
662	221	False	2
663	222	Option A	1
664	222	Option B	2
665	222	Option C	3
666	222	Option D	4
667	223	True	1
668	223	False	2
669	224	Option A	1
670	224	Option B	2
671	224	Option C	3
672	224	Option D	4
673	225	True	1
674	225	False	2
675	226	Option A	1
676	226	Option B	2
677	226	Option C	3
678	226	Option D	4
679	227	True	1
680	227	False	2
681	228	Option A	1
682	228	Option B	2
683	228	Option C	3
684	228	Option D	4
685	229	True	1
686	229	False	2
687	230	Option A	1
688	230	Option B	2
689	230	Option C	3
690	230	Option D	4
691	231	True	1
692	231	False	2
693	232	Option A	1
694	232	Option B	2
695	232	Option C	3
696	232	Option D	4
697	233	True	1
698	233	False	2
699	234	Option A	1
700	234	Option B	2
701	234	Option C	3
702	234	Option D	4
703	235	True	1
704	235	False	2
705	236	Option A	1
706	236	Option B	2
707	236	Option C	3
708	236	Option D	4
709	237	True	1
710	237	False	2
711	238	Option A	1
712	238	Option B	2
713	238	Option C	3
714	238	Option D	4
715	239	True	1
716	239	False	2
717	240	Option A	1
718	240	Option B	2
719	240	Option C	3
720	240	Option D	4
721	241	True	1
722	241	False	2
723	242	Option A	1
724	242	Option B	2
725	242	Option C	3
726	242	Option D	4
727	243	True	1
728	243	False	2
729	244	Option A	1
730	244	Option B	2
731	244	Option C	3
732	244	Option D	4
733	245	True	1
734	245	False	2
735	246	Option A	1
736	246	Option B	2
737	246	Option C	3
738	246	Option D	4
739	247	True	1
740	247	False	2
741	248	Option A	1
742	248	Option B	2
743	248	Option C	3
744	248	Option D	4
745	249	True	1
746	249	False	2
747	250	Option A	1
748	250	Option B	2
749	250	Option C	3
750	250	Option D	4
751	251	True	1
752	251	False	2
753	252	Option A	1
754	252	Option B	2
755	252	Option C	3
756	252	Option D	4
757	253	True	1
758	253	False	2
759	254	Option A	1
760	254	Option B	2
761	254	Option C	3
762	254	Option D	4
763	255	True	1
764	255	False	2
765	256	Option A	1
766	256	Option B	2
767	256	Option C	3
768	256	Option D	4
769	257	True	1
770	257	False	2
771	258	Option A	1
772	258	Option B	2
773	258	Option C	3
774	258	Option D	4
775	259	True	1
776	259	False	2
777	260	Option A	1
778	260	Option B	2
779	260	Option C	3
780	260	Option D	4
781	261	True	1
782	261	False	2
783	262	Option A	1
784	262	Option B	2
785	262	Option C	3
786	262	Option D	4
787	263	True	1
788	263	False	2
789	264	Option A	1
790	264	Option B	2
791	264	Option C	3
792	264	Option D	4
793	265	True	1
794	265	False	2
795	266	Option A	1
796	266	Option B	2
797	266	Option C	3
798	266	Option D	4
799	267	True	1
800	267	False	2
801	268	Option A	1
802	268	Option B	2
803	268	Option C	3
804	268	Option D	4
805	269	True	1
806	269	False	2
807	270	Option A	1
808	270	Option B	2
809	270	Option C	3
810	270	Option D	4
811	271	True	1
812	271	False	2
813	272	Option A	1
814	272	Option B	2
815	272	Option C	3
816	272	Option D	4
817	273	True	1
818	273	False	2
819	274	Option A	1
820	274	Option B	2
821	274	Option C	3
822	274	Option D	4
823	275	True	1
824	275	False	2
825	276	Option A	1
826	276	Option B	2
827	276	Option C	3
828	276	Option D	4
829	277	True	1
830	277	False	2
831	278	Option A	1
832	278	Option B	2
833	278	Option C	3
834	278	Option D	4
835	279	True	1
836	279	False	2
837	280	Option A	1
838	280	Option B	2
839	280	Option C	3
840	280	Option D	4
841	281	True	1
842	281	False	2
843	282	Option A	1
844	282	Option B	2
845	282	Option C	3
846	282	Option D	4
847	283	True	1
848	283	False	2
849	284	Option A	1
850	284	Option B	2
851	284	Option C	3
852	284	Option D	4
853	285	True	1
854	285	False	2
855	286	Option A	1
856	286	Option B	2
857	286	Option C	3
858	286	Option D	4
859	287	True	1
860	287	False	2
861	288	Option A	1
862	288	Option B	2
863	288	Option C	3
864	288	Option D	4
865	289	True	1
866	289	False	2
867	290	Option A	1
868	290	Option B	2
869	290	Option C	3
870	290	Option D	4
871	291	True	1
872	291	False	2
873	292	Option A	1
874	292	Option B	2
875	292	Option C	3
876	292	Option D	4
877	293	True	1
878	293	False	2
879	294	Option A	1
880	294	Option B	2
881	294	Option C	3
882	294	Option D	4
883	295	True	1
884	295	False	2
885	296	Option A	1
886	296	Option B	2
887	296	Option C	3
888	296	Option D	4
889	297	True	1
890	297	False	2
891	298	Option A	1
892	298	Option B	2
893	298	Option C	3
894	298	Option D	4
895	299	True	1
896	299	False	2
897	300	Option A	1
898	300	Option B	2
899	300	Option C	3
900	300	Option D	4
901	301	True	1
902	301	False	2
903	302	Option A	1
904	302	Option B	2
905	302	Option C	3
906	302	Option D	4
907	303	True	1
908	303	False	2
909	304	Option A	1
910	304	Option B	2
911	304	Option C	3
912	304	Option D	4
913	305	True	1
914	305	False	2
915	306	Option A	1
916	306	Option B	2
917	306	Option C	3
918	306	Option D	4
919	307	True	1
920	307	False	2
921	308	Option A	1
922	308	Option B	2
923	308	Option C	3
924	308	Option D	4
925	309	True	1
926	309	False	2
927	310	Option A	1
928	310	Option B	2
929	310	Option C	3
930	310	Option D	4
931	311	True	1
932	311	False	2
933	312	Option A	1
934	312	Option B	2
935	312	Option C	3
936	312	Option D	4
937	313	True	1
938	313	False	2
939	314	Option A	1
940	314	Option B	2
941	314	Option C	3
942	314	Option D	4
943	315	True	1
944	315	False	2
945	316	Option A	1
946	316	Option B	2
947	316	Option C	3
948	316	Option D	4
949	317	True	1
950	317	False	2
951	318	Option A	1
952	318	Option B	2
953	318	Option C	3
954	318	Option D	4
955	319	True	1
956	319	False	2
957	320	Option A	1
958	320	Option B	2
959	320	Option C	3
960	320	Option D	4
961	321	True	1
962	321	False	2
963	322	Option A	1
964	322	Option B	2
965	322	Option C	3
966	322	Option D	4
967	323	True	1
968	323	False	2
969	324	Option A	1
970	324	Option B	2
971	324	Option C	3
972	324	Option D	4
973	325	True	1
974	325	False	2
975	326	Option A	1
976	326	Option B	2
977	326	Option C	3
978	326	Option D	4
979	327	True	1
980	327	False	2
981	328	Option A	1
982	328	Option B	2
983	328	Option C	3
984	328	Option D	4
985	329	True	1
986	329	False	2
987	330	Option A	1
988	330	Option B	2
989	330	Option C	3
990	330	Option D	4
991	331	True	1
992	331	False	2
993	332	Option A	1
994	332	Option B	2
995	332	Option C	3
996	332	Option D	4
997	333	True	1
998	333	False	2
999	334	Option A	1
1000	334	Option B	2
1001	334	Option C	3
1002	334	Option D	4
1003	335	True	1
1004	335	False	2
1005	336	Option A	1
1006	336	Option B	2
1007	336	Option C	3
1008	336	Option D	4
1009	337	True	1
1010	337	False	2
1011	338	Option A	1
1012	338	Option B	2
1013	338	Option C	3
1014	338	Option D	4
1015	339	True	1
1016	339	False	2
1017	340	Option A	1
1018	340	Option B	2
1019	340	Option C	3
1020	340	Option D	4
1021	341	True	1
1022	341	False	2
1023	342	Option A	1
1024	342	Option B	2
1025	342	Option C	3
1026	342	Option D	4
1027	343	True	1
1028	343	False	2
1029	344	Option A	1
1030	344	Option B	2
1031	344	Option C	3
1032	344	Option D	4
1033	345	True	1
1034	345	False	2
1035	346	Option A	1
1036	346	Option B	2
1037	346	Option C	3
1038	346	Option D	4
1039	347	True	1
1040	347	False	2
1041	348	Option A	1
1042	348	Option B	2
1043	348	Option C	3
1044	348	Option D	4
1045	349	True	1
1046	349	False	2
1047	350	Option A	1
1048	350	Option B	2
1049	350	Option C	3
1050	350	Option D	4
1051	351	True	1
1052	351	False	2
1053	352	Option A	1
1054	352	Option B	2
1055	352	Option C	3
1056	352	Option D	4
1057	353	True	1
1058	353	False	2
1059	354	Option A	1
1060	354	Option B	2
1061	354	Option C	3
1062	354	Option D	4
1063	355	True	1
1064	355	False	2
1065	356	Option A	1
1066	356	Option B	2
1067	356	Option C	3
1068	356	Option D	4
1069	357	True	1
1070	357	False	2
1071	358	Option A	1
1072	358	Option B	2
1073	358	Option C	3
1074	358	Option D	4
1075	359	True	1
1076	359	False	2
1077	360	Option A	1
1078	360	Option B	2
1079	360	Option C	3
1080	360	Option D	4
1081	361	True	1
1082	361	False	2
1083	362	Option A	1
1084	362	Option B	2
1085	362	Option C	3
1086	362	Option D	4
1087	363	True	1
1088	363	False	2
1089	364	Option A	1
1090	364	Option B	2
1091	364	Option C	3
1092	364	Option D	4
1093	365	True	1
1094	365	False	2
1095	366	Option A	1
1096	366	Option B	2
1097	366	Option C	3
1098	366	Option D	4
1099	367	True	1
1100	367	False	2
1101	368	Option A	1
1102	368	Option B	2
1103	368	Option C	3
1104	368	Option D	4
1105	369	True	1
1106	369	False	2
1107	370	Option A	1
1108	370	Option B	2
1109	370	Option C	3
1110	370	Option D	4
1111	371	True	1
1112	371	False	2
1113	372	Option A	1
1114	372	Option B	2
1115	372	Option C	3
1116	372	Option D	4
1117	373	True	1
1118	373	False	2
1119	374	Option A	1
1120	374	Option B	2
1121	374	Option C	3
1122	374	Option D	4
1123	375	True	1
1124	375	False	2
1125	376	Option A	1
1126	376	Option B	2
1127	376	Option C	3
1128	376	Option D	4
1129	377	True	1
1130	377	False	2
1131	378	Option A	1
1132	378	Option B	2
1133	378	Option C	3
1134	378	Option D	4
1135	379	True	1
1136	379	False	2
1137	380	Option A	1
1138	380	Option B	2
1139	380	Option C	3
1140	380	Option D	4
1141	381	True	1
1142	381	False	2
1143	382	Option A	1
1144	382	Option B	2
1145	382	Option C	3
1146	382	Option D	4
1147	383	True	1
1148	383	False	2
1149	384	Option A	1
1150	384	Option B	2
1151	384	Option C	3
1152	384	Option D	4
1153	385	True	1
1154	385	False	2
1155	386	Option A	1
1156	386	Option B	2
1157	386	Option C	3
1158	386	Option D	4
1159	387	True	1
1160	387	False	2
1161	388	Option A	1
1162	388	Option B	2
1163	388	Option C	3
1164	388	Option D	4
1165	389	True	1
1166	389	False	2
1167	390	Option A	1
1168	390	Option B	2
1169	390	Option C	3
1170	390	Option D	4
1171	391	True	1
1172	391	False	2
1173	392	Option A	1
1174	392	Option B	2
1175	392	Option C	3
1176	392	Option D	4
1177	393	True	1
1178	393	False	2
1179	394	Option A	1
1180	394	Option B	2
1181	394	Option C	3
1182	394	Option D	4
1183	395	True	1
1184	395	False	2
1185	396	Option A	1
1186	396	Option B	2
1187	396	Option C	3
1188	396	Option D	4
1189	397	True	1
1190	397	False	2
1191	398	Option A	1
1192	398	Option B	2
1193	398	Option C	3
1194	398	Option D	4
1195	399	True	1
1196	399	False	2
1197	400	Option A	1
1198	400	Option B	2
1199	400	Option C	3
1200	400	Option D	4
1201	401	True	1
1202	401	False	2
1203	402	Option A	1
1204	402	Option B	2
1205	402	Option C	3
1206	402	Option D	4
1207	403	True	1
1208	403	False	2
1209	404	Option A	1
1210	404	Option B	2
1211	404	Option C	3
1212	404	Option D	4
1213	405	True	1
1214	405	False	2
1215	406	Option A	1
1216	406	Option B	2
1217	406	Option C	3
1218	406	Option D	4
1219	407	True	1
1220	407	False	2
1221	408	Option A	1
1222	408	Option B	2
1223	408	Option C	3
1224	408	Option D	4
1225	409	True	1
1226	409	False	2
1227	410	Option A	1
1228	410	Option B	2
1229	410	Option C	3
1230	410	Option D	4
1231	411	True	1
1232	411	False	2
1233	412	Option A	1
1234	412	Option B	2
1235	412	Option C	3
1236	412	Option D	4
1237	413	True	1
1238	413	False	2
1239	414	Option A	1
1240	414	Option B	2
1241	414	Option C	3
1242	414	Option D	4
1243	415	True	1
1244	415	False	2
1245	416	Option A	1
1246	416	Option B	2
1247	416	Option C	3
1248	416	Option D	4
1249	417	True	1
1250	417	False	2
1251	418	Option A	1
1252	418	Option B	2
1253	418	Option C	3
1254	418	Option D	4
1255	419	True	1
1256	419	False	2
1257	420	Option A	1
1258	420	Option B	2
1259	420	Option C	3
1260	420	Option D	4
1261	421	True	1
1262	421	False	2
1263	422	Option A	1
1264	422	Option B	2
1265	422	Option C	3
1266	422	Option D	4
1267	423	True	1
1268	423	False	2
1269	424	Option A	1
1270	424	Option B	2
1271	424	Option C	3
1272	424	Option D	4
1273	425	True	1
1274	425	False	2
1275	426	Option A	1
1276	426	Option B	2
1277	426	Option C	3
1278	426	Option D	4
1279	427	True	1
1280	427	False	2
1281	428	Option A	1
1282	428	Option B	2
1283	428	Option C	3
1284	428	Option D	4
1285	429	True	1
1286	429	False	2
1287	430	Option A	1
1288	430	Option B	2
1289	430	Option C	3
1290	430	Option D	4
1291	431	True	1
1292	431	False	2
1293	432	Option A	1
1294	432	Option B	2
1295	432	Option C	3
1296	432	Option D	4
1297	433	True	1
1298	433	False	2
1299	434	Option A	1
1300	434	Option B	2
1301	434	Option C	3
1302	434	Option D	4
1303	435	True	1
1304	435	False	2
1305	436	Option A	1
1306	436	Option B	2
1307	436	Option C	3
1308	436	Option D	4
1309	437	True	1
1310	437	False	2
1311	438	Option A	1
1312	438	Option B	2
1313	438	Option C	3
1314	438	Option D	4
1315	439	True	1
1316	439	False	2
1317	440	Option A	1
1318	440	Option B	2
1319	440	Option C	3
1320	440	Option D	4
1321	441	True	1
1322	441	False	2
1323	442	Option A	1
1324	442	Option B	2
1325	442	Option C	3
1326	442	Option D	4
1327	443	True	1
1328	443	False	2
1329	444	Option A	1
1330	444	Option B	2
1331	444	Option C	3
1332	444	Option D	4
1333	445	True	1
1334	445	False	2
1335	446	Option A	1
1336	446	Option B	2
1337	446	Option C	3
1338	446	Option D	4
1339	447	True	1
1340	447	False	2
1341	448	Option A	1
1342	448	Option B	2
1343	448	Option C	3
1344	448	Option D	4
1345	449	True	1
1346	449	False	2
1347	450	Option A	1
1348	450	Option B	2
1349	450	Option C	3
1350	450	Option D	4
1351	451	True	1
1352	451	False	2
1353	452	Option A	1
1354	452	Option B	2
1355	452	Option C	3
1356	452	Option D	4
1357	453	True	1
1358	453	False	2
1359	454	Option A	1
1360	454	Option B	2
1361	454	Option C	3
1362	454	Option D	4
1363	455	True	1
1364	455	False	2
1365	456	Option A	1
1366	456	Option B	2
1367	456	Option C	3
1368	456	Option D	4
1369	457	True	1
1370	457	False	2
1371	458	Option A	1
1372	458	Option B	2
1373	458	Option C	3
1374	458	Option D	4
1375	459	True	1
1376	459	False	2
1377	460	Option A	1
1378	460	Option B	2
1379	460	Option C	3
1380	460	Option D	4
1381	461	True	1
1382	461	False	2
1383	462	Option A	1
1384	462	Option B	2
1385	462	Option C	3
1386	462	Option D	4
1387	463	True	1
1388	463	False	2
1389	464	Option A	1
1390	464	Option B	2
1391	464	Option C	3
1392	464	Option D	4
1393	465	True	1
1394	465	False	2
1395	466	Option A	1
1396	466	Option B	2
1397	466	Option C	3
1398	466	Option D	4
1399	467	True	1
1400	467	False	2
1401	468	Option A	1
1402	468	Option B	2
1403	468	Option C	3
1404	468	Option D	4
1405	469	True	1
1406	469	False	2
1407	470	Option A	1
1408	470	Option B	2
1409	470	Option C	3
1410	470	Option D	4
1411	471	True	1
1412	471	False	2
1413	472	Option A	1
1414	472	Option B	2
1415	472	Option C	3
1416	472	Option D	4
1417	473	True	1
1418	473	False	2
1419	474	Option A	1
1420	474	Option B	2
1421	474	Option C	3
1422	474	Option D	4
1423	475	True	1
1424	475	False	2
1425	476	Option A	1
1426	476	Option B	2
1427	476	Option C	3
1428	476	Option D	4
1429	477	True	1
1430	477	False	2
1431	478	Option A	1
1432	478	Option B	2
1433	478	Option C	3
1434	478	Option D	4
1435	479	True	1
1436	479	False	2
1437	480	Option A	1
1438	480	Option B	2
1439	480	Option C	3
1440	480	Option D	4
1441	481	True	1
1442	481	False	2
1443	482	Option A	1
1444	482	Option B	2
1445	482	Option C	3
1446	482	Option D	4
1447	483	True	1
1448	483	False	2
1449	484	Option A	1
1450	484	Option B	2
1451	484	Option C	3
1452	484	Option D	4
1453	485	True	1
1454	485	False	2
1455	486	Option A	1
1456	486	Option B	2
1457	486	Option C	3
1458	486	Option D	4
1459	487	True	1
1460	487	False	2
1461	488	Option A	1
1462	488	Option B	2
1463	488	Option C	3
1464	488	Option D	4
1465	489	True	1
1466	489	False	2
1467	490	Option A	1
1468	490	Option B	2
1469	490	Option C	3
1470	490	Option D	4
1471	491	True	1
1472	491	False	2
1473	492	Option A	1
1474	492	Option B	2
1475	492	Option C	3
1476	492	Option D	4
1477	493	True	1
1478	493	False	2
1479	494	Option A	1
1480	494	Option B	2
1481	494	Option C	3
1482	494	Option D	4
1483	495	True	1
1484	495	False	2
1485	496	Option A	1
1486	496	Option B	2
1487	496	Option C	3
1488	496	Option D	4
1489	497	True	1
1490	497	False	2
1491	498	Option A	1
1492	498	Option B	2
1493	498	Option C	3
1494	498	Option D	4
1495	499	True	1
1496	499	False	2
1497	500	Option A	1
1498	500	Option B	2
1499	500	Option C	3
1500	500	Option D	4
1501	501	True	1
1502	501	False	2
1503	502	Option A	1
1504	502	Option B	2
1505	502	Option C	3
1506	502	Option D	4
1507	503	True	1
1508	503	False	2
1509	504	Option A	1
1510	504	Option B	2
1511	504	Option C	3
1512	504	Option D	4
1513	505	True	1
1514	505	False	2
1515	506	Option A	1
1516	506	Option B	2
1517	506	Option C	3
1518	506	Option D	4
1519	507	True	1
1520	507	False	2
1521	508	Option A	1
1522	508	Option B	2
1523	508	Option C	3
1524	508	Option D	4
1525	509	True	1
1526	509	False	2
1527	510	Option A	1
1528	510	Option B	2
1529	510	Option C	3
1530	510	Option D	4
1531	511	True	1
1532	511	False	2
1533	512	Option A	1
1534	512	Option B	2
1535	512	Option C	3
1536	512	Option D	4
1537	513	True	1
1538	513	False	2
1539	514	Option A	1
1540	514	Option B	2
1541	514	Option C	3
1542	514	Option D	4
1543	515	True	1
1544	515	False	2
1545	516	Option A	1
1546	516	Option B	2
1547	516	Option C	3
1548	516	Option D	4
1549	517	True	1
1550	517	False	2
1551	518	Option A	1
1552	518	Option B	2
1553	518	Option C	3
1554	518	Option D	4
1555	519	True	1
1556	519	False	2
1557	520	Option A	1
1558	520	Option B	2
1559	520	Option C	3
1560	520	Option D	4
1561	521	True	1
1562	521	False	2
1563	522	Option A	1
1564	522	Option B	2
1565	522	Option C	3
1566	522	Option D	4
1567	523	True	1
1568	523	False	2
1569	524	Option A	1
1570	524	Option B	2
1571	524	Option C	3
1572	524	Option D	4
1573	525	True	1
1574	525	False	2
1575	526	Option A	1
1576	526	Option B	2
1577	526	Option C	3
1578	526	Option D	4
1579	527	True	1
1580	527	False	2
1581	528	Option A	1
1582	528	Option B	2
1583	528	Option C	3
1584	528	Option D	4
1585	529	True	1
1586	529	False	2
1587	530	Option A	1
1588	530	Option B	2
1589	530	Option C	3
1590	530	Option D	4
1591	531	True	1
1592	531	False	2
1593	532	Option A	1
1594	532	Option B	2
1595	532	Option C	3
1596	532	Option D	4
1597	533	True	1
1598	533	False	2
1599	534	Option A	1
1600	534	Option B	2
1601	534	Option C	3
1602	534	Option D	4
1603	535	True	1
1604	535	False	2
1605	536	Option A	1
1606	536	Option B	2
1607	536	Option C	3
1608	536	Option D	4
1609	537	True	1
1610	537	False	2
1611	538	Option A	1
1612	538	Option B	2
1613	538	Option C	3
1614	538	Option D	4
1615	539	True	1
1616	539	False	2
1617	540	Option A	1
1618	540	Option B	2
1619	540	Option C	3
1620	540	Option D	4
1621	541	True	1
1622	541	False	2
1623	542	Option A	1
1624	542	Option B	2
1625	542	Option C	3
1626	542	Option D	4
1627	543	True	1
1628	543	False	2
1629	544	Option A	1
1630	544	Option B	2
1631	544	Option C	3
1632	544	Option D	4
1633	545	True	1
1634	545	False	2
1635	546	Option A	1
1636	546	Option B	2
1637	546	Option C	3
1638	546	Option D	4
1639	547	True	1
1640	547	False	2
1641	548	Option A	1
1642	548	Option B	2
1643	548	Option C	3
1644	548	Option D	4
1645	549	True	1
1646	549	False	2
1647	550	Option A	1
1648	550	Option B	2
1649	550	Option C	3
1650	550	Option D	4
1651	551	True	1
1652	551	False	2
1653	552	Option A	1
1654	552	Option B	2
1655	552	Option C	3
1656	552	Option D	4
1657	553	True	1
1658	553	False	2
1659	554	Option A	1
1660	554	Option B	2
1661	554	Option C	3
1662	554	Option D	4
1663	555	True	1
1664	555	False	2
1665	556	Option A	1
1666	556	Option B	2
1667	556	Option C	3
1668	556	Option D	4
1669	557	True	1
1670	557	False	2
1671	558	Option A	1
1672	558	Option B	2
1673	558	Option C	3
1674	558	Option D	4
1675	559	True	1
1676	559	False	2
1677	560	Option A	1
1678	560	Option B	2
1679	560	Option C	3
1680	560	Option D	4
1681	561	True	1
1682	561	False	2
1683	562	Option A	1
1684	562	Option B	2
1685	562	Option C	3
1686	562	Option D	4
1687	563	True	1
1688	563	False	2
1689	564	Option A	1
1690	564	Option B	2
1691	564	Option C	3
1692	564	Option D	4
1693	565	True	1
1694	565	False	2
1695	566	Option A	1
1696	566	Option B	2
1697	566	Option C	3
1698	566	Option D	4
1699	567	True	1
1700	567	False	2
1701	568	Option A	1
1702	568	Option B	2
1703	568	Option C	3
1704	568	Option D	4
1705	569	True	1
1706	569	False	2
1707	570	Option A	1
1708	570	Option B	2
1709	570	Option C	3
1710	570	Option D	4
1711	571	True	1
1712	571	False	2
1713	572	Option A	1
1714	572	Option B	2
1715	572	Option C	3
1716	572	Option D	4
1717	573	True	1
1718	573	False	2
1719	574	Option A	1
1720	574	Option B	2
1721	574	Option C	3
1722	574	Option D	4
1723	575	True	1
1724	575	False	2
1725	576	Option A	1
1726	576	Option B	2
1727	576	Option C	3
1728	576	Option D	4
1729	577	True	1
1730	577	False	2
1731	578	Option A	1
1732	578	Option B	2
1733	578	Option C	3
1734	578	Option D	4
1735	579	True	1
1736	579	False	2
1737	580	Option A	1
1738	580	Option B	2
1739	580	Option C	3
1740	580	Option D	4
1741	581	True	1
1742	581	False	2
1743	582	Option A	1
1744	582	Option B	2
1745	582	Option C	3
1746	582	Option D	4
1747	583	True	1
1748	583	False	2
1749	584	Option A	1
1750	584	Option B	2
1751	584	Option C	3
1752	584	Option D	4
1753	585	True	1
1754	585	False	2
1755	586	Option A	1
1756	586	Option B	2
1757	586	Option C	3
1758	586	Option D	4
1759	587	True	1
1760	587	False	2
1761	588	Option A	1
1762	588	Option B	2
1763	588	Option C	3
1764	588	Option D	4
1765	589	True	1
1766	589	False	2
1767	590	Option A	1
1768	590	Option B	2
1769	590	Option C	3
1770	590	Option D	4
1771	591	True	1
1772	591	False	2
1773	592	Option A	1
1774	592	Option B	2
1775	592	Option C	3
1776	592	Option D	4
1777	593	True	1
1778	593	False	2
1779	594	Option A	1
1780	594	Option B	2
1781	594	Option C	3
1782	594	Option D	4
1783	595	True	1
1784	595	False	2
1785	596	Option A	1
1786	596	Option B	2
1787	596	Option C	3
1788	596	Option D	4
1789	597	True	1
1790	597	False	2
1791	598	Option A	1
1792	598	Option B	2
1793	598	Option C	3
1794	598	Option D	4
1795	599	True	1
1796	599	False	2
1797	600	Option A	1
1798	600	Option B	2
1799	600	Option C	3
1800	600	Option D	4
\.


--
-- TOC entry 3187 (class 0 OID 16647)
-- Dependencies: 204
-- Data for Name: department; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.department (departmentid, departementname, deptlocation) FROM stdin;
1	Web Development	Cairo
2	Data Engineering	Alexandria
3	Cyber Security	Giza
4	Mobile Development	Cairo
5	Cloud Computing	Alexandria
\.


--
-- TOC entry 3205 (class 0 OID 16821)
-- Dependencies: 222
-- Data for Name: exam; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.exam (examid, examname, courseid, createddate, totalquestions) FROM stdin;
1	test_exam	2	2026-04-11 16:46:43.020559	5
2	test	1	2026-04-12 21:47:17.306981	50
\.


--
-- TOC entry 3206 (class 0 OID 16838)
-- Dependencies: 223
-- Data for Name: examquestion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.examquestion (examid, questionid, orderno) FROM stdin;
2	282	1
2	294	2
2	2	3
2	158	4
2	384	5
2	42	6
2	210	7
2	444	8
2	332	9
2	98	10
2	184	11
2	376	12
2	346	13
2	40	14
2	174	15
2	320	16
2	410	17
2	412	18
2	132	19
2	22	20
2	352	21
2	406	22
2	390	23
2	48	24
2	304	25
2	154	26
2	356	27
2	82	28
2	302	29
2	54	30
2	148	31
2	232	32
2	134	33
2	20	34
2	436	35
2	6	36
2	230	37
2	72	38
2	92	39
2	258	40
2	173	41
2	65	42
2	117	43
2	267	44
2	269	45
2	129	46
2	183	47
2	411	48
2	147	49
2	381	50
\.


--
-- TOC entry 3197 (class 0 OID 16734)
-- Dependencies: 214
-- Data for Name: instructor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.instructor (instructorid, name, email, departmentno) FROM stdin;
1	Ahmed Mohamed	ahmed.mohamed@gmail.com	1
2	Omar Ali	omar.ali@gmail.com	1
3	Mostafa Yamen	mostafa.yamen@gmail.com	1
4	Alaa Kareem	alaa.kareem@gmail.com	2
5	Wael Nasef	wael.nasef@gmail.com	2
6	Mahmoud Qasim	mahmoud.qasim@gmail.com	2
7	Zakria Bahaa	zakria.bahaa@gmail.com	3
8	Shady Shakr	shady.shakr@gmail.com	3
9	Shawgy Osama	shawgy.osama@gmail.com	3
10	Mohamed Omar	mohamed.omar47@gmail.com	4
11	Ali Ahmed	ali.ahmed83@gmail.com	4
12	Yamen Mostafa	yamen.mostafa@gmail.com	4
13	Kareem Wael	kareem.wael@gmail.com	5
14	Nasef Mahmoud	nasef.mahmoud@gmail.com	5
15	Qasim Zakria	qasim.zakria@gmail.com	5
16	Bahaa Shady	bahaa.shady@gmail.com	1
17	Osama Alaa	osama.alaa91@gmail.com	2
18	Mostafa Kareem	mostafa.kareem55@gmail.com	3
\.


--
-- TOC entry 3198 (class 0 OID 16751)
-- Dependencies: 215
-- Data for Name: instructor_course; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.instructor_course (instructorid, courseid) FROM stdin;
1	1
1	2
2	2
2	3
3	1
3	4
16	9
16	2
4	3
4	4
5	4
5	5
6	3
6	5
17	4
17	3
7	5
7	6
8	5
8	6
9	6
9	5
18	6
18	5
10	7
10	9
11	8
11	9
12	7
12	8
13	10
13	11
14	11
14	12
15	10
15	12
\.


--
-- TOC entry 3203 (class 0 OID 16803)
-- Dependencies: 220
-- Data for Name: modelanswer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.modelanswer (questionid, correctoptionid) FROM stdin;
1	1
2	3
3	7
4	9
5	13
6	15
7	19
8	21
9	25
10	27
11	31
12	33
13	37
14	39
15	43
16	45
17	49
18	51
19	55
20	57
21	61
22	63
23	67
24	69
25	73
26	75
27	79
28	81
29	85
30	87
31	91
32	93
33	97
34	99
35	103
36	105
37	109
38	111
39	115
40	117
41	121
42	123
43	127
44	129
45	133
46	135
47	139
48	141
49	145
50	147
51	151
52	153
53	157
54	159
55	163
56	165
57	169
58	171
59	175
60	177
61	181
62	183
63	187
64	189
65	193
66	195
67	199
68	201
69	205
70	207
71	211
72	213
73	217
74	219
75	223
76	225
77	229
78	231
79	235
80	237
81	241
82	243
83	247
84	249
85	253
86	255
87	259
88	261
89	265
90	267
91	271
92	273
93	277
94	279
95	283
96	285
97	289
98	291
99	295
100	297
101	301
102	303
103	307
104	309
105	313
106	315
107	319
108	321
109	325
110	327
111	331
112	333
113	337
114	339
115	343
116	345
117	349
118	351
119	355
120	357
121	361
122	363
123	367
124	369
125	373
126	375
127	379
128	381
129	385
130	387
131	391
132	393
133	397
134	399
135	403
136	405
137	409
138	411
139	415
140	417
141	421
142	423
143	427
144	429
145	433
146	435
147	439
148	441
149	445
150	447
151	451
152	453
153	457
154	459
155	463
156	465
157	469
158	471
159	475
160	477
161	481
162	483
163	487
164	489
165	493
166	495
167	499
168	501
169	505
170	507
171	511
172	513
173	517
174	519
175	523
176	525
177	529
178	531
179	535
180	537
181	541
182	543
183	547
184	549
185	553
186	555
187	559
188	561
189	565
190	567
191	571
192	573
193	577
194	579
195	583
196	585
197	589
198	591
199	595
200	597
201	601
202	603
203	607
204	609
205	613
206	615
207	619
208	621
209	625
210	627
211	631
212	633
213	637
214	639
215	643
216	645
217	649
218	651
219	655
220	657
221	661
222	663
223	667
224	669
225	673
226	675
227	679
228	681
229	685
230	687
231	691
232	693
233	697
234	699
235	703
236	705
237	709
238	711
239	715
240	717
241	721
242	723
243	727
244	729
245	733
246	735
247	739
248	741
249	745
250	747
251	751
252	753
253	757
254	759
255	763
256	765
257	769
258	771
259	775
260	777
261	781
262	783
263	787
264	789
265	793
266	795
267	799
268	801
269	805
270	807
271	811
272	813
273	817
274	819
275	823
276	825
277	829
278	831
279	835
280	837
281	841
282	843
283	847
284	849
285	853
286	855
287	859
288	861
289	865
290	867
291	871
292	873
293	877
294	879
295	883
296	885
297	889
298	891
299	895
300	897
301	901
302	903
303	907
304	909
305	913
306	915
307	919
308	921
309	925
310	927
311	931
312	933
313	937
314	939
315	943
316	945
317	949
318	951
319	955
320	957
321	961
322	963
323	967
324	969
325	973
326	975
327	979
328	981
329	985
330	987
331	991
332	993
333	997
334	999
335	1003
336	1005
337	1009
338	1011
339	1015
340	1017
341	1021
342	1023
343	1027
344	1029
345	1033
346	1035
347	1039
348	1041
349	1045
350	1047
351	1051
352	1053
353	1057
354	1059
355	1063
356	1065
357	1069
358	1071
359	1075
360	1077
361	1081
362	1083
363	1087
364	1089
365	1093
366	1095
367	1099
368	1101
369	1105
370	1107
371	1111
372	1113
373	1117
374	1119
375	1123
376	1125
377	1129
378	1131
379	1135
380	1137
381	1141
382	1143
383	1147
384	1149
385	1153
386	1155
387	1159
388	1161
389	1165
390	1167
391	1171
392	1173
393	1177
394	1179
395	1183
396	1185
397	1189
398	1191
399	1195
400	1197
401	1201
402	1203
403	1207
404	1209
405	1213
406	1215
407	1219
408	1221
409	1225
410	1227
411	1231
412	1233
413	1237
414	1239
415	1243
416	1245
417	1249
418	1251
419	1255
420	1257
421	1261
422	1263
423	1267
424	1269
425	1273
426	1275
427	1279
428	1281
429	1285
430	1287
431	1291
432	1293
433	1297
434	1299
435	1303
436	1305
437	1309
438	1311
439	1315
440	1317
441	1321
442	1323
443	1327
444	1329
445	1333
446	1335
447	1339
448	1341
449	1345
450	1347
451	1351
452	1353
453	1357
454	1359
455	1363
456	1365
457	1369
458	1371
459	1375
460	1377
461	1381
462	1383
463	1387
464	1389
465	1393
466	1395
467	1399
468	1401
469	1405
470	1407
471	1411
472	1413
473	1417
474	1419
475	1423
476	1425
477	1429
478	1431
479	1435
480	1437
481	1441
482	1443
483	1447
484	1449
485	1453
486	1455
487	1459
488	1461
489	1465
490	1467
491	1471
492	1473
493	1477
494	1479
495	1483
496	1485
497	1489
498	1491
499	1495
500	1497
501	1501
502	1503
503	1507
504	1509
505	1513
506	1515
507	1519
508	1521
509	1525
510	1527
511	1531
512	1533
513	1537
514	1539
515	1543
516	1545
517	1549
518	1551
519	1555
520	1557
521	1561
522	1563
523	1567
524	1569
525	1573
526	1575
527	1579
528	1581
529	1585
530	1587
531	1591
532	1593
533	1597
534	1599
535	1603
536	1605
537	1609
538	1611
539	1615
540	1617
541	1621
542	1623
543	1627
544	1629
545	1633
546	1635
547	1639
548	1641
549	1645
550	1647
551	1651
552	1653
553	1657
554	1659
555	1663
556	1665
557	1669
558	1671
559	1675
560	1677
561	1681
562	1683
563	1687
564	1689
565	1693
566	1695
567	1699
568	1701
569	1705
570	1707
571	1711
572	1713
573	1717
574	1719
575	1723
576	1725
577	1729
578	1731
579	1735
580	1737
581	1741
582	1743
583	1747
584	1749
585	1753
586	1755
587	1759
588	1761
589	1765
590	1767
591	1771
592	1773
593	1777
594	1779
595	1783
596	1785
597	1789
598	1791
599	1795
600	1797
\.


--
-- TOC entry 3194 (class 0 OID 16704)
-- Dependencies: 211
-- Data for Name: student; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.student (studentid, name, email, phone) FROM stdin;
1	Amal Mohamed	amal.mohamed@gmail.com	+201012345678
2	Nada Omar	nada.omar@gmail.com	+201112345679
3	Mariam Ali	mariam.ali@gmail.com	+201212345670
4	Reem Osama	reem.osama@gmail.com	+201512345671
5	Fatma Mostafa	fatma.mostafa@gmail.com	+201012345672
6	Eman Yamen	eman.yamen@gmail.com	+201112345673
7	Mona Alaa	mona.alaa@gmail.com	+201212345674
8	Noha Kareem	noha.kareem@gmail.com	+201512345675
9	Narmeen Wael	narmeen.wael@gmail.com	+201012345676
10	Nasreen Nasef	nasreen.nasef@gmail.com	+201112345677
11	Ahmed Mahmoud	ahmed.mahmoud22@gmail.com	+201212345680
12	Mohamed Qasim	mohamed.qasim@gmail.com	+201512345681
13	Omar Zakria	omar.zakria@gmail.com	+201012345682
14	Ali Bahaa	ali.bahaa@gmail.com	+201112345683
15	Osama Shady	osama.shady@gmail.com	+201212345684
16	Mostafa Shakr	mostafa.shakr@gmail.com	+201512345685
17	Yamen Shawgy	yamen.shawgy@gmail.com	+201012345686
18	Alaa Wael	alaa.wael77@gmail.com	+201112345687
19	Kareem Ahmed	kareem.ahmed@gmail.com	+201212345688
20	Mahmoud Omar	mahmoud.omar@gmail.com	+201512345689
\.


--
-- TOC entry 3189 (class 0 OID 16658)
-- Dependencies: 206
-- Data for Name: track; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.track (trackid, trackname, departmentid) FROM stdin;
2	Backend Development	1
3	Data Analysis	2
4	Machine Learning	2
5	Network Security	3
6	Ethical Hacking	3
7	Android Development	4
8	IOS Development	4
9	AWS Cloud	5
10	DevOps	5
\.


--
-- TOC entry 3195 (class 0 OID 16715)
-- Dependencies: 212
-- Data for Name: student_track; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.student_track (studentid, trackid) FROM stdin;
2	2
3	3
4	4
5	5
6	6
7	7
8	8
9	9
10	10
12	2
13	3
14	4
15	5
16	6
17	7
18	8
19	9
20	10
\.


--
-- TOC entry 3208 (class 0 OID 16856)
-- Dependencies: 225
-- Data for Name: studentexam; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.studentexam (studentexamid, studentid, examid, starttime, endtime, totalgrade) FROM stdin;
1	2	1	2026-04-11 20:09:21.172	2026-04-11 22:09:35.714996	10
2	12	1	2026-04-11 20:13:33.932	2026-04-11 22:14:18.835901	50
3	1	1	2025-01-01 09:00:00	2025-01-01 10:00:00	0
\.


--
-- TOC entry 3210 (class 0 OID 16878)
-- Dependencies: 227
-- Data for Name: studentanswer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.studentanswer (studentanswerid, studentexamid, questionid, chosenoptionid) FROM stdin;
\.


--
-- TOC entry 3192 (class 0 OID 16685)
-- Dependencies: 209
-- Data for Name: track_course; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.track_course (trackid, courseid) FROM stdin;
2	2
2	3
2	4
3	3
3	4
4	3
5	5
5	6
6	5
6	6
7	7
7	9
8	8
8	9
9	10
9	11
10	11
10	12
\.


--
-- TOC entry 3216 (class 0 OID 0)
-- Dependencies: 218
-- Name: choice_optionid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.choice_optionid_seq', 1800, true);


--
-- TOC entry 3217 (class 0 OID 0)
-- Dependencies: 207
-- Name: course_courseid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.course_courseid_seq', 12, true);


--
-- TOC entry 3218 (class 0 OID 0)
-- Dependencies: 203
-- Name: department_departmentid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.department_departmentid_seq', 5, true);


--
-- TOC entry 3219 (class 0 OID 0)
-- Dependencies: 221
-- Name: exam_examid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.exam_examid_seq', 2, true);


--
-- TOC entry 3220 (class 0 OID 0)
-- Dependencies: 213
-- Name: instructor_instructorid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.instructor_instructorid_seq', 18, true);


--
-- TOC entry 3221 (class 0 OID 0)
-- Dependencies: 216
-- Name: questions_questionid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.questions_questionid_seq', 600, true);


--
-- TOC entry 3222 (class 0 OID 0)
-- Dependencies: 210
-- Name: student_studentid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.student_studentid_seq', 20, true);


--
-- TOC entry 3223 (class 0 OID 0)
-- Dependencies: 226
-- Name: studentanswer_studentanswerid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.studentanswer_studentanswerid_seq', 1, false);


--
-- TOC entry 3224 (class 0 OID 0)
-- Dependencies: 224
-- Name: studentexam_studentexamid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.studentexam_studentexamid_seq', 3, true);


--
-- TOC entry 3225 (class 0 OID 0)
-- Dependencies: 205
-- Name: track_trackid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.track_trackid_seq', 10, true);


-- Completed on 2026-04-12 22:00:54

--
-- PostgreSQL database dump complete
--

\unrestrict vaVTsG6pGpUibCfjX0wTUGCht9gKVbqHNOfOOM6LaMbpwXBxRofH1sVa0noGCPj

