# Results

PostGraphile v4 is now in beta! https://github.com/graphile/postgraphile/releases/tag/v4.0.0-beta.0

Below are the results of running various GraphQL queries against [a sample database](db/reset.sh), with everything running on a Mid-2011 iMac.

- Query: the GraphQL query that we execute
- Version: which version of PostGraphQL/PostGraphile are we using?
- Conc: concurrency - how many requests do we try and make the server process in parallel?
- req/s: average requests per second - the total number of requests divided by the total number of seconds
- Latency p50: the average response time queries gave (50th percentile - 50% of queries completed this fast or faster)
- Latency p90: 90% of queries completed within this duration
- Latency p99: 99% of queries completed within this duration
- Max RSS: the peak memory usage of the node process. ⚠️ This does not work with `v4 cluster` because it only monitors the parent process. ⚠️ Do not trust this figure, it was not polled with sufficient resolution to be reliable.

---

<table>
<thead><tr>
<th><b>Query</b></th>
<th>Version</th>
<th>Conc</th>
<th>req/s</th>
<th><b>latency p50</b></th>
<th><b>latency p90</b></th>
<th><b>latency p99</b></th>
<th><b>max RSS</b></th>
</tr></thead>
<tbody>
<tr><th>
<a href="./graphql/PopularThreads.graphql">PopularThreads</a>
</th>
<td>v4</td>
<td>1</td>
<td>18.34</td>
<td>53</td>
<td>54</td>
<td>79</td>
<td>90920</td>
</tr>
<tr><th>
<a href="./graphql/PopularThreads.graphql">PopularThreads</a>
</th>
<td>v4</td>
<td>10</td>
<td>62.22</td>
<td>129</td>
<td>269</td>
<td>295</td>
<td>90928</td>
</tr>
<tr><th>
<a href="./graphql/PopularThreads.graphql">PopularThreads</a>
</th>
<td>v4</td>
<td>100</td>
<td>99.47</td>
<td>267</td>
<td>2075</td>
<td>2276</td>
<td>95132</td>
</tr>
<tr><th>
<a href="./graphql/PopularThreads.graphql">PopularThreads</a>
</th>
<td>v4cluster</td>
<td>1</td>
<td>17.29</td>
<td>53</td>
<td>72</td>
<td>82</td>
<td>66840</td>
</tr>
<tr><th>
<a href="./graphql/PopularThreads.graphql">PopularThreads</a>
</th>
<td>v4cluster</td>
<td>10</td>
<td>60.95</td>
<td>136</td>
<td>264</td>
<td>298</td>
<td>67060</td>
</tr>
<tr><th>
<a href="./graphql/PopularThreads.graphql">PopularThreads</a>
</th>
<td>v4cluster</td>
<td>100</td>
<td>119.21</td>
<td>63</td>
<td>2126</td>
<td>2395</td>
<td>69548</td>
</tr>
<tr><th>
<a href="./graphql/PopularThreads.graphql">PopularThreads</a>
</th>
<td>v3</td>
<td>1</td>
<td>13.17</td>
<td>69</td>
<td>70</td>
<td>176</td>
<td>364344</td>
</tr>
<tr><th>
<a href="./graphql/PopularThreads.graphql">PopularThreads</a>
</th>
<td>v3</td>
<td>10</td>
<td>51.15</td>
<td>182</td>
<td>261</td>
<td>348</td>
<td>362044</td>
</tr>
<tr><th>
<a href="./graphql/PopularThreads.graphql">PopularThreads</a>
</th>
<td>v3</td>
<td>100</td>
<td>71.1</td>
<td>406</td>
<td>3669</td>
<td>3706</td>
<td>410056</td>
</tr>
<tr><th>
<a href="./graphql/ProfileView.graphql">ProfileView</a>
</th>
<td>v4</td>
<td>1</td>
<td>212.47</td>
<td>3</td>
<td>3</td>
<td>14</td>
<td>110644</td>
</tr>
<tr><th>
<a href="./graphql/ProfileView.graphql">ProfileView</a>
</th>
<td>v4</td>
<td>10</td>
<td>604.76</td>
<td>14</td>
<td>30</td>
<td>32</td>
<td>110656</td>
</tr>
<tr><th>
<a href="./graphql/ProfileView.graphql">ProfileView</a>
</th>
<td>v4</td>
<td>100</td>
<td>453.22</td>
<td>185</td>
<td>344</td>
<td>379</td>
<td>111324</td>
</tr>
<tr><th>
<a href="./graphql/ProfileView.graphql">ProfileView</a>
</th>
<td>v4cluster</td>
<td>1</td>
<td>187.33</td>
<td>4</td>
<td>13</td>
<td>13</td>
<td>97428</td>
</tr>
<tr><th>
<a href="./graphql/ProfileView.graphql">ProfileView</a>
</th>
<td>v4cluster</td>
<td>10</td>
<td>724.38</td>
<td>10</td>
<td>26</td>
<td>42</td>
<td>97512</td>
</tr>
<tr><th>
<a href="./graphql/ProfileView.graphql">ProfileView</a>
</th>
<td>v4cluster</td>
<td>100</td>
<td>766.78</td>
<td>85</td>
<td>311</td>
<td>380</td>
<td>97512</td>
</tr>
<tr><th>
<a href="./graphql/ProfileView.graphql">ProfileView</a>
</th>
<td>v3</td>
<td>1</td>
<td>181.69</td>
<td>5</td>
<td>6</td>
<td>10</td>
<td>285248</td>
</tr>
<tr><th>
<a href="./graphql/ProfileView.graphql">ProfileView</a>
</th>
<td>v3</td>
<td>10</td>
<td>284.02</td>
<td>35</td>
<td>40</td>
<td>55</td>
<td>285248</td>
</tr>
<tr><th>
<a href="./graphql/ProfileView.graphql">ProfileView</a>
</th>
<td>v3</td>
<td>100</td>
<td>199.25</td>
<td>485</td>
<td>713</td>
<td>787</td>
<td>213692</td>
</tr>
<tr><th>
<a href="./graphql/ThreadList.graphql">ThreadList</a>
</th>
<td>v4</td>
<td>1</td>
<td>269.85</td>
<td>3</td>
<td>3</td>
<td>11</td>
<td>99292</td>
</tr>
<tr><th>
<a href="./graphql/ThreadList.graphql">ThreadList</a>
</th>
<td>v4</td>
<td>10</td>
<td>358.58</td>
<td>27</td>
<td>38</td>
<td>45</td>
<td>59600</td>
</tr>
<tr><th>
<a href="./graphql/ThreadList.graphql">ThreadList</a>
</th>
<td>v4</td>
<td>100</td>
<td>426.17</td>
<td>209</td>
<td>290</td>
<td>332</td>
<td>97888</td>
</tr>
<tr><th>
<a href="./graphql/ThreadList.graphql">ThreadList</a>
</th>
<td>v4cluster</td>
<td>1</td>
<td>187.86</td>
<td>4</td>
<td>12</td>
<td>12</td>
<td>99112</td>
</tr>
<tr><th>
<a href="./graphql/ThreadList.graphql">ThreadList</a>
</th>
<td>v4cluster</td>
<td>10</td>
<td>532.11</td>
<td>12</td>
<td>37</td>
<td>57</td>
<td>99116</td>
</tr>
<tr><th>
<a href="./graphql/ThreadList.graphql">ThreadList</a>
</th>
<td>v4cluster</td>
<td>100</td>
<td>684.36</td>
<td>106</td>
<td>265</td>
<td>324</td>
<td>101080</td>
</tr>
<tr><th>
<a href="./graphql/ThreadList.graphql">ThreadList</a>
</th>
<td>v3</td>
<td>1</td>
<td>45.71</td>
<td>20</td>
<td>29</td>
<td>29</td>
<td>366244</td>
</tr>
<tr><th>
<a href="./graphql/ThreadList.graphql">ThreadList</a>
</th>
<td>v3</td>
<td>10</td>
<td>63.29</td>
<td>135</td>
<td>230</td>
<td>255</td>
<td>368272</td>
</tr>
<tr><th>
<a href="./graphql/ThreadList.graphql">ThreadList</a>
</th>
<td>v3</td>
<td>100</td>
<td>114.02</td>
<td>606</td>
<td>1589</td>
<td>1593</td>
<td>390096</td>
</tr>
<tr><th>
<a href="./graphql/ThreadListHeavy.graphql">ThreadListHeavy</a>
</th>
<td>v4</td>
<td>1</td>
<td>15.79</td>
<td>63</td>
<td>63</td>
<td>76</td>
<td>97508</td>
</tr>
<tr><th>
<a href="./graphql/ThreadListHeavy.graphql">ThreadListHeavy</a>
</th>
<td>v4</td>
<td>10</td>
<td>31.44</td>
<td>304</td>
<td>374</td>
<td>503</td>
<td>87504</td>
</tr>
<tr><th>
<a href="./graphql/ThreadListHeavy.graphql">ThreadListHeavy</a>
</th>
<td>v4</td>
<td>100</td>
<td>67.06</td>
<td>481</td>
<td>2909</td>
<td>3148</td>
<td>132224</td>
</tr>
<tr><th>
<a href="./graphql/ThreadListHeavy.graphql">ThreadListHeavy</a>
</th>
<td>v4cluster</td>
<td>1</td>
<td>15.13</td>
<td>64</td>
<td>75</td>
<td>77</td>
<td>58268</td>
</tr>
<tr><th>
<a href="./graphql/ThreadListHeavy.graphql">ThreadListHeavy</a>
</th>
<td>v4cluster</td>
<td>10</td>
<td>48.89</td>
<td>184</td>
<td>248</td>
<td>326</td>
<td>58456</td>
</tr>
<tr><th>
<a href="./graphql/ThreadListHeavy.graphql">ThreadListHeavy</a>
</th>
<td>v4cluster</td>
<td>100</td>
<td>116.86</td>
<td>352</td>
<td>1793</td>
<td>2356</td>
<td>60228</td>
</tr>
<tr><th>
<a href="./graphql/ThreadListHeavy.graphql">ThreadListHeavy</a>
</th>
<td>v3</td>
<td>1</td>
<td>1.85</td>
<td>514</td>
<td>645</td>
<td>645</td>
<td>540224</td>
</tr>
<tr><th>
<a href="./graphql/ThreadListHeavy.graphql">ThreadListHeavy</a>
</th>
<td>v3</td>
<td>10</td>
<td>2.45</td>
<td>4125</td>
<td>4618</td>
<td>4888</td>
<td>619364</td>
</tr>
<tr><th>
<a href="./graphql/ThreadListHeavy.graphql">ThreadListHeavy</a>
</th>
<td>v3</td>
<td>100</td>
<td>6.84</td>
<td>99</td>
<td>59523</td>
<td>59793</td>
<td>1456536</td>
</tr>
<tr><th>
<a href="./graphql/ThreadView.graphql">ThreadView</a>
</th>
<td>v4</td>
<td>1</td>
<td>152.3</td>
<td>6</td>
<td>7</td>
<td>16</td>
<td>102708</td>
</tr>
<tr><th>
<a href="./graphql/ThreadView.graphql">ThreadView</a>
</th>
<td>v4</td>
<td>10</td>
<td>293.7</td>
<td>27</td>
<td>46</td>
<td>49</td>
<td>103064</td>
</tr>
<tr><th>
<a href="./graphql/ThreadView.graphql">ThreadView</a>
</th>
<td>v4</td>
<td>100</td>
<td>271.87</td>
<td>330</td>
<td>435</td>
<td>506</td>
<td>107528</td>
</tr>
<tr><th>
<a href="./graphql/ThreadView.graphql">ThreadView</a>
</th>
<td>v4cluster</td>
<td>1</td>
<td>114.33</td>
<td>7</td>
<td>16</td>
<td>16</td>
<td>92200</td>
</tr>
<tr><th>
<a href="./graphql/ThreadView.graphql">ThreadView</a>
</th>
<td>v4cluster</td>
<td>10</td>
<td>351.11</td>
<td>24</td>
<td>42</td>
<td>72</td>
<td>92236</td>
</tr>
<tr><th>
<a href="./graphql/ThreadView.graphql">ThreadView</a>
</th>
<td>v4cluster</td>
<td>100</td>
<td>420.64</td>
<td>189</td>
<td>382</td>
<td>441</td>
<td>92280</td>
</tr>
<tr><th>
<a href="./graphql/ThreadView.graphql">ThreadView</a>
</th>
<td>v3</td>
<td>1</td>
<td>16.77</td>
<td>47</td>
<td>131</td>
<td>150</td>
<td>322684</td>
</tr>
<tr><th>
<a href="./graphql/ThreadView.graphql">ThreadView</a>
</th>
<td>v3</td>
<td>10</td>
<td>26.47</td>
<td>340</td>
<td>531</td>
<td>640</td>
<td>292700</td>
</tr>
<tr><th>
<a href="./graphql/ThreadView.graphql">ThreadView</a>
</th>
<td>v3</td>
<td>100</td>
<td>54.77</td>
<td>306</td>
<td>3990</td>
<td>4114</td>
<td>484732</td>
</tr>
<tr><th>
<a href="./graphql/ThreadViewWithEmoji.graphql">ThreadViewWithEmoji</a>
</th>
<td>v4</td>
<td>1</td>
<td>16.26</td>
<td>60</td>
<td>61</td>
<td>79</td>
<td>106736</td>
</tr>
<tr><th>
<a href="./graphql/ThreadViewWithEmoji.graphql">ThreadViewWithEmoji</a>
</th>
<td>v4</td>
<td>10</td>
<td>29.55</td>
<td>315</td>
<td>371</td>
<td>400</td>
<td>106736</td>
</tr>
<tr><th>
<a href="./graphql/ThreadViewWithEmoji.graphql">ThreadViewWithEmoji</a>
</th>
<td>v4</td>
<td>100</td>
<td>36.87</td>
<td>3160</td>
<td>3491</td>
<td>3757</td>
<td>207104</td>
</tr>
<tr><th>
<a href="./graphql/ThreadViewWithEmoji.graphql">ThreadViewWithEmoji</a>
</th>
<td>v4cluster</td>
<td>1</td>
<td>15.38</td>
<td>62</td>
<td>75</td>
<td>77</td>
<td>52172</td>
</tr>
<tr><th>
<a href="./graphql/ThreadViewWithEmoji.graphql">ThreadViewWithEmoji</a>
</th>
<td>v4cluster</td>
<td>10</td>
<td>52.51</td>
<td>178</td>
<td>216</td>
<td>243</td>
<td>52356</td>
</tr>
<tr><th>
<a href="./graphql/ThreadViewWithEmoji.graphql">ThreadViewWithEmoji</a>
</th>
<td>v4cluster</td>
<td>100</td>
<td>65.49</td>
<td>1627</td>
<td>1835</td>
<td>2156</td>
<td>54160</td>
</tr>
<tr><th>
<a href="./graphql/ThreadViewWithEmoji.graphql">ThreadViewWithEmoji</a>
</th>
<td>v3</td>
<td>1</td>
<td>1.38</td>
<td>673</td>
<td>951</td>
<td>1037</td>
<td>1094588</td>
</tr>
<tr><th>
<a href="./graphql/ThreadViewWithEmoji.graphql">ThreadViewWithEmoji</a>
</th>
<td>v3</td>
<td>10</td>
<td>1.74</td>
<td>5627</td>
<td>7712</td>
<td>8248</td>
<td>1305480</td>
</tr>
<tr><th>
<a href="./graphql/ThreadViewWithEmoji.graphql">ThreadViewWithEmoji</a>
</th>
<td>v3</td>
<td>100</td>
<td>0.67</td>
<td>142974</td>
<td>168540</td>
<td>170217</td>
<td>2379992</td>
</tr>
</tbody>
</table>
