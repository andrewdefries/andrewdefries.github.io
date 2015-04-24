---
output:
  html_document:
    self_contained: no
---

```r
library(knitr)
knit_hooks$set(webgl = hook_webgl)
cat('<script type="text/javascript">', readLines(system.file('WebGL', 'CanvasMatrix.js', package = 'rgl')), '</script>', sep = '\n')
```

<script type="text/javascript">
CanvasMatrix4=function(m){if(typeof m=='object'){if("length"in m&&m.length>=16){this.load(m[0],m[1],m[2],m[3],m[4],m[5],m[6],m[7],m[8],m[9],m[10],m[11],m[12],m[13],m[14],m[15]);return}else if(m instanceof CanvasMatrix4){this.load(m);return}}this.makeIdentity()};CanvasMatrix4.prototype.load=function(){if(arguments.length==1&&typeof arguments[0]=='object'){var matrix=arguments[0];if("length"in matrix&&matrix.length==16){this.m11=matrix[0];this.m12=matrix[1];this.m13=matrix[2];this.m14=matrix[3];this.m21=matrix[4];this.m22=matrix[5];this.m23=matrix[6];this.m24=matrix[7];this.m31=matrix[8];this.m32=matrix[9];this.m33=matrix[10];this.m34=matrix[11];this.m41=matrix[12];this.m42=matrix[13];this.m43=matrix[14];this.m44=matrix[15];return}if(arguments[0]instanceof CanvasMatrix4){this.m11=matrix.m11;this.m12=matrix.m12;this.m13=matrix.m13;this.m14=matrix.m14;this.m21=matrix.m21;this.m22=matrix.m22;this.m23=matrix.m23;this.m24=matrix.m24;this.m31=matrix.m31;this.m32=matrix.m32;this.m33=matrix.m33;this.m34=matrix.m34;this.m41=matrix.m41;this.m42=matrix.m42;this.m43=matrix.m43;this.m44=matrix.m44;return}}this.makeIdentity()};CanvasMatrix4.prototype.getAsArray=function(){return[this.m11,this.m12,this.m13,this.m14,this.m21,this.m22,this.m23,this.m24,this.m31,this.m32,this.m33,this.m34,this.m41,this.m42,this.m43,this.m44]};CanvasMatrix4.prototype.getAsWebGLFloatArray=function(){return new WebGLFloatArray(this.getAsArray())};CanvasMatrix4.prototype.makeIdentity=function(){this.m11=1;this.m12=0;this.m13=0;this.m14=0;this.m21=0;this.m22=1;this.m23=0;this.m24=0;this.m31=0;this.m32=0;this.m33=1;this.m34=0;this.m41=0;this.m42=0;this.m43=0;this.m44=1};CanvasMatrix4.prototype.transpose=function(){var tmp=this.m12;this.m12=this.m21;this.m21=tmp;tmp=this.m13;this.m13=this.m31;this.m31=tmp;tmp=this.m14;this.m14=this.m41;this.m41=tmp;tmp=this.m23;this.m23=this.m32;this.m32=tmp;tmp=this.m24;this.m24=this.m42;this.m42=tmp;tmp=this.m34;this.m34=this.m43;this.m43=tmp};CanvasMatrix4.prototype.invert=function(){var det=this._determinant4x4();if(Math.abs(det)<1e-8)return null;this._makeAdjoint();this.m11/=det;this.m12/=det;this.m13/=det;this.m14/=det;this.m21/=det;this.m22/=det;this.m23/=det;this.m24/=det;this.m31/=det;this.m32/=det;this.m33/=det;this.m34/=det;this.m41/=det;this.m42/=det;this.m43/=det;this.m44/=det};CanvasMatrix4.prototype.translate=function(x,y,z){if(x==undefined)x=0;if(y==undefined)y=0;if(z==undefined)z=0;var matrix=new CanvasMatrix4();matrix.m41=x;matrix.m42=y;matrix.m43=z;this.multRight(matrix)};CanvasMatrix4.prototype.scale=function(x,y,z){if(x==undefined)x=1;if(z==undefined){if(y==undefined){y=x;z=x}else z=1}else if(y==undefined)y=x;var matrix=new CanvasMatrix4();matrix.m11=x;matrix.m22=y;matrix.m33=z;this.multRight(matrix)};CanvasMatrix4.prototype.rotate=function(angle,x,y,z){angle=angle/180*Math.PI;angle/=2;var sinA=Math.sin(angle);var cosA=Math.cos(angle);var sinA2=sinA*sinA;var length=Math.sqrt(x*x+y*y+z*z);if(length==0){x=0;y=0;z=1}else if(length!=1){x/=length;y/=length;z/=length}var mat=new CanvasMatrix4();if(x==1&&y==0&&z==0){mat.m11=1;mat.m12=0;mat.m13=0;mat.m21=0;mat.m22=1-2*sinA2;mat.m23=2*sinA*cosA;mat.m31=0;mat.m32=-2*sinA*cosA;mat.m33=1-2*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else if(x==0&&y==1&&z==0){mat.m11=1-2*sinA2;mat.m12=0;mat.m13=-2*sinA*cosA;mat.m21=0;mat.m22=1;mat.m23=0;mat.m31=2*sinA*cosA;mat.m32=0;mat.m33=1-2*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else if(x==0&&y==0&&z==1){mat.m11=1-2*sinA2;mat.m12=2*sinA*cosA;mat.m13=0;mat.m21=-2*sinA*cosA;mat.m22=1-2*sinA2;mat.m23=0;mat.m31=0;mat.m32=0;mat.m33=1;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else{var x2=x*x;var y2=y*y;var z2=z*z;mat.m11=1-2*(y2+z2)*sinA2;mat.m12=2*(x*y*sinA2+z*sinA*cosA);mat.m13=2*(x*z*sinA2-y*sinA*cosA);mat.m21=2*(y*x*sinA2-z*sinA*cosA);mat.m22=1-2*(z2+x2)*sinA2;mat.m23=2*(y*z*sinA2+x*sinA*cosA);mat.m31=2*(z*x*sinA2+y*sinA*cosA);mat.m32=2*(z*y*sinA2-x*sinA*cosA);mat.m33=1-2*(x2+y2)*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}this.multRight(mat)};CanvasMatrix4.prototype.multRight=function(mat){var m11=(this.m11*mat.m11+this.m12*mat.m21+this.m13*mat.m31+this.m14*mat.m41);var m12=(this.m11*mat.m12+this.m12*mat.m22+this.m13*mat.m32+this.m14*mat.m42);var m13=(this.m11*mat.m13+this.m12*mat.m23+this.m13*mat.m33+this.m14*mat.m43);var m14=(this.m11*mat.m14+this.m12*mat.m24+this.m13*mat.m34+this.m14*mat.m44);var m21=(this.m21*mat.m11+this.m22*mat.m21+this.m23*mat.m31+this.m24*mat.m41);var m22=(this.m21*mat.m12+this.m22*mat.m22+this.m23*mat.m32+this.m24*mat.m42);var m23=(this.m21*mat.m13+this.m22*mat.m23+this.m23*mat.m33+this.m24*mat.m43);var m24=(this.m21*mat.m14+this.m22*mat.m24+this.m23*mat.m34+this.m24*mat.m44);var m31=(this.m31*mat.m11+this.m32*mat.m21+this.m33*mat.m31+this.m34*mat.m41);var m32=(this.m31*mat.m12+this.m32*mat.m22+this.m33*mat.m32+this.m34*mat.m42);var m33=(this.m31*mat.m13+this.m32*mat.m23+this.m33*mat.m33+this.m34*mat.m43);var m34=(this.m31*mat.m14+this.m32*mat.m24+this.m33*mat.m34+this.m34*mat.m44);var m41=(this.m41*mat.m11+this.m42*mat.m21+this.m43*mat.m31+this.m44*mat.m41);var m42=(this.m41*mat.m12+this.m42*mat.m22+this.m43*mat.m32+this.m44*mat.m42);var m43=(this.m41*mat.m13+this.m42*mat.m23+this.m43*mat.m33+this.m44*mat.m43);var m44=(this.m41*mat.m14+this.m42*mat.m24+this.m43*mat.m34+this.m44*mat.m44);this.m11=m11;this.m12=m12;this.m13=m13;this.m14=m14;this.m21=m21;this.m22=m22;this.m23=m23;this.m24=m24;this.m31=m31;this.m32=m32;this.m33=m33;this.m34=m34;this.m41=m41;this.m42=m42;this.m43=m43;this.m44=m44};CanvasMatrix4.prototype.multLeft=function(mat){var m11=(mat.m11*this.m11+mat.m12*this.m21+mat.m13*this.m31+mat.m14*this.m41);var m12=(mat.m11*this.m12+mat.m12*this.m22+mat.m13*this.m32+mat.m14*this.m42);var m13=(mat.m11*this.m13+mat.m12*this.m23+mat.m13*this.m33+mat.m14*this.m43);var m14=(mat.m11*this.m14+mat.m12*this.m24+mat.m13*this.m34+mat.m14*this.m44);var m21=(mat.m21*this.m11+mat.m22*this.m21+mat.m23*this.m31+mat.m24*this.m41);var m22=(mat.m21*this.m12+mat.m22*this.m22+mat.m23*this.m32+mat.m24*this.m42);var m23=(mat.m21*this.m13+mat.m22*this.m23+mat.m23*this.m33+mat.m24*this.m43);var m24=(mat.m21*this.m14+mat.m22*this.m24+mat.m23*this.m34+mat.m24*this.m44);var m31=(mat.m31*this.m11+mat.m32*this.m21+mat.m33*this.m31+mat.m34*this.m41);var m32=(mat.m31*this.m12+mat.m32*this.m22+mat.m33*this.m32+mat.m34*this.m42);var m33=(mat.m31*this.m13+mat.m32*this.m23+mat.m33*this.m33+mat.m34*this.m43);var m34=(mat.m31*this.m14+mat.m32*this.m24+mat.m33*this.m34+mat.m34*this.m44);var m41=(mat.m41*this.m11+mat.m42*this.m21+mat.m43*this.m31+mat.m44*this.m41);var m42=(mat.m41*this.m12+mat.m42*this.m22+mat.m43*this.m32+mat.m44*this.m42);var m43=(mat.m41*this.m13+mat.m42*this.m23+mat.m43*this.m33+mat.m44*this.m43);var m44=(mat.m41*this.m14+mat.m42*this.m24+mat.m43*this.m34+mat.m44*this.m44);this.m11=m11;this.m12=m12;this.m13=m13;this.m14=m14;this.m21=m21;this.m22=m22;this.m23=m23;this.m24=m24;this.m31=m31;this.m32=m32;this.m33=m33;this.m34=m34;this.m41=m41;this.m42=m42;this.m43=m43;this.m44=m44};CanvasMatrix4.prototype.ortho=function(left,right,bottom,top,near,far){var tx=(left+right)/(left-right);var ty=(top+bottom)/(top-bottom);var tz=(far+near)/(far-near);var matrix=new CanvasMatrix4();matrix.m11=2/(left-right);matrix.m12=0;matrix.m13=0;matrix.m14=0;matrix.m21=0;matrix.m22=2/(top-bottom);matrix.m23=0;matrix.m24=0;matrix.m31=0;matrix.m32=0;matrix.m33=-2/(far-near);matrix.m34=0;matrix.m41=tx;matrix.m42=ty;matrix.m43=tz;matrix.m44=1;this.multRight(matrix)};CanvasMatrix4.prototype.frustum=function(left,right,bottom,top,near,far){var matrix=new CanvasMatrix4();var A=(right+left)/(right-left);var B=(top+bottom)/(top-bottom);var C=-(far+near)/(far-near);var D=-(2*far*near)/(far-near);matrix.m11=(2*near)/(right-left);matrix.m12=0;matrix.m13=0;matrix.m14=0;matrix.m21=0;matrix.m22=2*near/(top-bottom);matrix.m23=0;matrix.m24=0;matrix.m31=A;matrix.m32=B;matrix.m33=C;matrix.m34=-1;matrix.m41=0;matrix.m42=0;matrix.m43=D;matrix.m44=0;this.multRight(matrix)};CanvasMatrix4.prototype.perspective=function(fovy,aspect,zNear,zFar){var top=Math.tan(fovy*Math.PI/360)*zNear;var bottom=-top;var left=aspect*bottom;var right=aspect*top;this.frustum(left,right,bottom,top,zNear,zFar)};CanvasMatrix4.prototype.lookat=function(eyex,eyey,eyez,centerx,centery,centerz,upx,upy,upz){var matrix=new CanvasMatrix4();var zx=eyex-centerx;var zy=eyey-centery;var zz=eyez-centerz;var mag=Math.sqrt(zx*zx+zy*zy+zz*zz);if(mag){zx/=mag;zy/=mag;zz/=mag}var yx=upx;var yy=upy;var yz=upz;xx=yy*zz-yz*zy;xy=-yx*zz+yz*zx;xz=yx*zy-yy*zx;yx=zy*xz-zz*xy;yy=-zx*xz+zz*xx;yx=zx*xy-zy*xx;mag=Math.sqrt(xx*xx+xy*xy+xz*xz);if(mag){xx/=mag;xy/=mag;xz/=mag}mag=Math.sqrt(yx*yx+yy*yy+yz*yz);if(mag){yx/=mag;yy/=mag;yz/=mag}matrix.m11=xx;matrix.m12=xy;matrix.m13=xz;matrix.m14=0;matrix.m21=yx;matrix.m22=yy;matrix.m23=yz;matrix.m24=0;matrix.m31=zx;matrix.m32=zy;matrix.m33=zz;matrix.m34=0;matrix.m41=0;matrix.m42=0;matrix.m43=0;matrix.m44=1;matrix.translate(-eyex,-eyey,-eyez);this.multRight(matrix)};CanvasMatrix4.prototype._determinant2x2=function(a,b,c,d){return a*d-b*c};CanvasMatrix4.prototype._determinant3x3=function(a1,a2,a3,b1,b2,b3,c1,c2,c3){return a1*this._determinant2x2(b2,b3,c2,c3)-b1*this._determinant2x2(a2,a3,c2,c3)+c1*this._determinant2x2(a2,a3,b2,b3)};CanvasMatrix4.prototype._determinant4x4=function(){var a1=this.m11;var b1=this.m12;var c1=this.m13;var d1=this.m14;var a2=this.m21;var b2=this.m22;var c2=this.m23;var d2=this.m24;var a3=this.m31;var b3=this.m32;var c3=this.m33;var d3=this.m34;var a4=this.m41;var b4=this.m42;var c4=this.m43;var d4=this.m44;return a1*this._determinant3x3(b2,b3,b4,c2,c3,c4,d2,d3,d4)-b1*this._determinant3x3(a2,a3,a4,c2,c3,c4,d2,d3,d4)+c1*this._determinant3x3(a2,a3,a4,b2,b3,b4,d2,d3,d4)-d1*this._determinant3x3(a2,a3,a4,b2,b3,b4,c2,c3,c4)};CanvasMatrix4.prototype._makeAdjoint=function(){var a1=this.m11;var b1=this.m12;var c1=this.m13;var d1=this.m14;var a2=this.m21;var b2=this.m22;var c2=this.m23;var d2=this.m24;var a3=this.m31;var b3=this.m32;var c3=this.m33;var d3=this.m34;var a4=this.m41;var b4=this.m42;var c4=this.m43;var d4=this.m44;this.m11=this._determinant3x3(b2,b3,b4,c2,c3,c4,d2,d3,d4);this.m21=-this._determinant3x3(a2,a3,a4,c2,c3,c4,d2,d3,d4);this.m31=this._determinant3x3(a2,a3,a4,b2,b3,b4,d2,d3,d4);this.m41=-this._determinant3x3(a2,a3,a4,b2,b3,b4,c2,c3,c4);this.m12=-this._determinant3x3(b1,b3,b4,c1,c3,c4,d1,d3,d4);this.m22=this._determinant3x3(a1,a3,a4,c1,c3,c4,d1,d3,d4);this.m32=-this._determinant3x3(a1,a3,a4,b1,b3,b4,d1,d3,d4);this.m42=this._determinant3x3(a1,a3,a4,b1,b3,b4,c1,c3,c4);this.m13=this._determinant3x3(b1,b2,b4,c1,c2,c4,d1,d2,d4);this.m23=-this._determinant3x3(a1,a2,a4,c1,c2,c4,d1,d2,d4);this.m33=this._determinant3x3(a1,a2,a4,b1,b2,b4,d1,d2,d4);this.m43=-this._determinant3x3(a1,a2,a4,b1,b2,b4,c1,c2,c4);this.m14=-this._determinant3x3(b1,b2,b3,c1,c2,c3,d1,d2,d3);this.m24=this._determinant3x3(a1,a2,a3,c1,c2,c3,d1,d2,d3);this.m34=-this._determinant3x3(a1,a2,a3,b1,b2,b3,d1,d2,d3);this.m44=this._determinant3x3(a1,a2,a3,b1,b2,b3,c1,c2,c3)}
</script>

This works fine.


```r
x <- sort(rnorm(1000))
y <- rnorm(1000)
z <- rnorm(1000) + atan2(x,y)
plot3d(x, y, z, col=rainbow(1000))
```

<canvas id="testgltextureCanvas" style="display: none;" width="256" height="256">
Your browser does not support the HTML5 canvas element.</canvas>
<!-- ****** points object 7 ****** -->
<script id="testglvshader7" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
gl_PointSize = 3.;
vCol = aCol;
}
</script>
<script id="testglfshader7" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 9 ****** -->
<script id="testglvshader9" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader9" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** text object 10 ****** -->
<script id="testglvshader10" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader10" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** text object 11 ****** -->
<script id="testglvshader11" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader11" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 12 ****** -->
<script id="testglvshader12" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader12" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 13 ****** -->
<script id="testglvshader13" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader13" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 14 ****** -->
<script id="testglvshader14" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader14" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 15 ****** -->
<script id="testglvshader15" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader15" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 16 ****** -->
<script id="testglvshader16" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader16" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 17 ****** -->
<script id="testglvshader17" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader17" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 18 ****** -->
<script id="testglvshader18" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader18" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<script type="text/javascript"> 
function getShader ( gl, id ){
var shaderScript = document.getElementById ( id );
var str = "";
var k = shaderScript.firstChild;
while ( k ){
if ( k.nodeType == 3 ) str += k.textContent;
k = k.nextSibling;
}
var shader;
if ( shaderScript.type == "x-shader/x-fragment" )
shader = gl.createShader ( gl.FRAGMENT_SHADER );
else if ( shaderScript.type == "x-shader/x-vertex" )
shader = gl.createShader(gl.VERTEX_SHADER);
else return null;
gl.shaderSource(shader, str);
gl.compileShader(shader);
if (gl.getShaderParameter(shader, gl.COMPILE_STATUS) == 0)
alert(gl.getShaderInfoLog(shader));
return shader;
}
var min = Math.min;
var max = Math.max;
var sqrt = Math.sqrt;
var sin = Math.sin;
var acos = Math.acos;
var tan = Math.tan;
var SQRT2 = Math.SQRT2;
var PI = Math.PI;
var log = Math.log;
var exp = Math.exp;
function testglwebGLStart() {
var debug = function(msg) {
document.getElementById("testgldebug").innerHTML = msg;
}
debug("");
var canvas = document.getElementById("testglcanvas");
if (!window.WebGLRenderingContext){
debug(" Your browser does not support WebGL. See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var gl;
try {
// Try to grab the standard context. If it fails, fallback to experimental.
gl = canvas.getContext("webgl") 
|| canvas.getContext("experimental-webgl");
}
catch(e) {}
if ( !gl ) {
debug(" Your browser appears to support WebGL, but did not create a WebGL context.  See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var width = 505;  var height = 505;
canvas.width = width;   canvas.height = height;
var prMatrix = new CanvasMatrix4();
var mvMatrix = new CanvasMatrix4();
var normMatrix = new CanvasMatrix4();
var saveMat = new CanvasMatrix4();
saveMat.makeIdentity();
var distance;
var posLoc = 0;
var colLoc = 1;
var zoom = new Object();
var fov = new Object();
var userMatrix = new Object();
var activeSubscene = 1;
zoom[1] = 1;
fov[1] = 30;
userMatrix[1] = new CanvasMatrix4();
userMatrix[1].load([
1, 0, 0, 0,
0, 0.3420201, -0.9396926, 0,
0, 0.9396926, 0.3420201, 0,
0, 0, 0, 1
]);
function getPowerOfTwo(value) {
var pow = 1;
while(pow<value) {
pow *= 2;
}
return pow;
}
function handleLoadedTexture(texture, textureCanvas) {
gl.pixelStorei(gl.UNPACK_FLIP_Y_WEBGL, true);
gl.bindTexture(gl.TEXTURE_2D, texture);
gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, gl.RGBA, gl.UNSIGNED_BYTE, textureCanvas);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.LINEAR);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR_MIPMAP_NEAREST);
gl.generateMipmap(gl.TEXTURE_2D);
gl.bindTexture(gl.TEXTURE_2D, null);
}
function loadImageToTexture(filename, texture) {   
var canvas = document.getElementById("testgltextureCanvas");
var ctx = canvas.getContext("2d");
var image = new Image();
image.onload = function() {
var w = image.width;
var h = image.height;
var canvasX = getPowerOfTwo(w);
var canvasY = getPowerOfTwo(h);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.imageSmoothingEnabled = true;
ctx.drawImage(image, 0, 0, canvasX, canvasY);
handleLoadedTexture(texture, canvas);
drawScene();
}
image.src = filename;
}  	   
function drawTextToCanvas(text, cex) {
var canvasX, canvasY;
var textX, textY;
var textHeight = 20 * cex;
var textColour = "white";
var fontFamily = "Arial";
var backgroundColour = "rgba(0,0,0,0)";
var canvas = document.getElementById("testgltextureCanvas");
var ctx = canvas.getContext("2d");
ctx.font = textHeight+"px "+fontFamily;
canvasX = 1;
var widths = [];
for (var i = 0; i < text.length; i++)  {
widths[i] = ctx.measureText(text[i]).width;
canvasX = (widths[i] > canvasX) ? widths[i] : canvasX;
}	  
canvasX = getPowerOfTwo(canvasX);
var offset = 2*textHeight; // offset to first baseline
var skip = 2*textHeight;   // skip between baselines	  
canvasY = getPowerOfTwo(offset + text.length*skip);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.fillStyle = backgroundColour;
ctx.fillRect(0, 0, ctx.canvas.width, ctx.canvas.height);
ctx.fillStyle = textColour;
ctx.textAlign = "left";
ctx.textBaseline = "alphabetic";
ctx.font = textHeight+"px "+fontFamily;
for(var i = 0; i < text.length; i++) {
textY = i*skip + offset;
ctx.fillText(text[i], 0,  textY);
}
return {canvasX:canvasX, canvasY:canvasY,
widths:widths, textHeight:textHeight,
offset:offset, skip:skip};
}
// ****** points object 7 ******
var prog7  = gl.createProgram();
gl.attachShader(prog7, getShader( gl, "testglvshader7" ));
gl.attachShader(prog7, getShader( gl, "testglfshader7" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog7, 0, "aPos");
gl.bindAttribLocation(prog7, 1, "aCol");
gl.linkProgram(prog7);
var v=new Float32Array([
-3.022628, 0.2621176, -3.125586, 1, 0, 0, 1,
-2.955641, -0.9564625, -2.706409, 1, 0.007843138, 0, 1,
-2.91593, -0.5603616, -1.818244, 1, 0.01176471, 0, 1,
-2.530219, -0.3269466, -0.7674246, 1, 0.01960784, 0, 1,
-2.48084, 0.4648278, -1.809871, 1, 0.02352941, 0, 1,
-2.476121, 0.7781771, -1.496221, 1, 0.03137255, 0, 1,
-2.342408, -0.5198576, -1.064275, 1, 0.03529412, 0, 1,
-2.325608, 1.121155, -0.5315479, 1, 0.04313726, 0, 1,
-2.298467, -0.7810976, -2.080985, 1, 0.04705882, 0, 1,
-2.210149, -0.4322972, -2.878106, 1, 0.05490196, 0, 1,
-2.197864, 1.117183, -0.3771197, 1, 0.05882353, 0, 1,
-2.194058, 0.4955695, -2.12873, 1, 0.06666667, 0, 1,
-2.186242, -0.8056863, -1.672891, 1, 0.07058824, 0, 1,
-2.127781, 0.4683827, 0.5031291, 1, 0.07843138, 0, 1,
-2.126872, -0.2192932, -2.235277, 1, 0.08235294, 0, 1,
-2.11001, -1.471052, -2.341645, 1, 0.09019608, 0, 1,
-2.108067, -1.698268, -0.8844709, 1, 0.09411765, 0, 1,
-2.089029, -0.6385345, -1.918379, 1, 0.1019608, 0, 1,
-2.023427, 0.2757588, -2.900586, 1, 0.1098039, 0, 1,
-1.988652, 1.547634, -0.8512756, 1, 0.1137255, 0, 1,
-1.973069, -1.043105, -1.331408, 1, 0.1215686, 0, 1,
-1.92784, 0.1859779, -1.209426, 1, 0.1254902, 0, 1,
-1.92667, 0.8757237, -1.087208, 1, 0.1333333, 0, 1,
-1.924666, -1.230259, -2.693503, 1, 0.1372549, 0, 1,
-1.910149, -0.1640408, -3.777787, 1, 0.145098, 0, 1,
-1.903299, 0.9842263, -2.238311, 1, 0.1490196, 0, 1,
-1.858251, 0.573684, -1.16596, 1, 0.1568628, 0, 1,
-1.833795, 0.6896127, 0.4955374, 1, 0.1607843, 0, 1,
-1.824185, 0.4025321, -1.158175, 1, 0.1686275, 0, 1,
-1.823572, -0.001589943, -1.311382, 1, 0.172549, 0, 1,
-1.811816, 1.29545, -0.4905615, 1, 0.1803922, 0, 1,
-1.811365, 0.06889481, -1.488725, 1, 0.1843137, 0, 1,
-1.806071, 0.6440275, -1.68167, 1, 0.1921569, 0, 1,
-1.798658, 1.343695, -3.2099, 1, 0.1960784, 0, 1,
-1.79625, -1.317008, -3.959465, 1, 0.2039216, 0, 1,
-1.794984, -0.6428569, -1.737775, 1, 0.2117647, 0, 1,
-1.792824, -0.5065473, -3.687914, 1, 0.2156863, 0, 1,
-1.790189, -0.5935, -0.525671, 1, 0.2235294, 0, 1,
-1.788675, 1.834702, -0.04392533, 1, 0.227451, 0, 1,
-1.778838, -1.640288, -2.291143, 1, 0.2352941, 0, 1,
-1.755826, 0.2999169, -2.296262, 1, 0.2392157, 0, 1,
-1.754254, 0.2104377, -0.7787583, 1, 0.2470588, 0, 1,
-1.736556, -1.438701, -2.060312, 1, 0.2509804, 0, 1,
-1.731282, -1.314105, -1.652555, 1, 0.2588235, 0, 1,
-1.711401, 1.266294, -1.344451, 1, 0.2627451, 0, 1,
-1.711168, -0.4591207, -2.673113, 1, 0.2705882, 0, 1,
-1.701504, -0.3143367, 0.357237, 1, 0.2745098, 0, 1,
-1.693401, -1.183382, -2.91956, 1, 0.282353, 0, 1,
-1.686091, -0.1377962, -0.915593, 1, 0.2862745, 0, 1,
-1.681288, -0.9379307, -0.9886342, 1, 0.2941177, 0, 1,
-1.675164, 1.712789, -1.166045, 1, 0.3019608, 0, 1,
-1.655304, 0.2936292, -3.395893, 1, 0.3058824, 0, 1,
-1.654263, -1.074795, -1.336653, 1, 0.3137255, 0, 1,
-1.65221, -1.342274, -2.225134, 1, 0.3176471, 0, 1,
-1.640575, 2.237133, -1.000318, 1, 0.3254902, 0, 1,
-1.634321, -0.3376998, -1.936116, 1, 0.3294118, 0, 1,
-1.626874, 0.5895087, -1.066932, 1, 0.3372549, 0, 1,
-1.62531, 1.030707, -0.2263893, 1, 0.3411765, 0, 1,
-1.607161, -0.8495981, -2.212628, 1, 0.3490196, 0, 1,
-1.601567, 0.08332641, -1.971178, 1, 0.3529412, 0, 1,
-1.585935, 0.121607, -0.3343652, 1, 0.3607843, 0, 1,
-1.58118, 0.3298311, 1.662491, 1, 0.3647059, 0, 1,
-1.556343, -0.4244953, -1.260345, 1, 0.372549, 0, 1,
-1.551997, 0.008610861, -2.854409, 1, 0.3764706, 0, 1,
-1.551296, 1.617068, 0.4260572, 1, 0.3843137, 0, 1,
-1.549337, 1.444266, -2.225183, 1, 0.3882353, 0, 1,
-1.544275, 0.08927063, -1.979417, 1, 0.3960784, 0, 1,
-1.534209, -2.329731, -0.9033947, 1, 0.4039216, 0, 1,
-1.525247, 1.12402, -2.560491, 1, 0.4078431, 0, 1,
-1.518879, 0.1965, -1.922526, 1, 0.4156863, 0, 1,
-1.50903, 0.1418189, -1.846239, 1, 0.4196078, 0, 1,
-1.500257, 0.8262444, 1.090829, 1, 0.427451, 0, 1,
-1.495582, -1.911025, -2.53849, 1, 0.4313726, 0, 1,
-1.492761, -1.410876, -3.396055, 1, 0.4392157, 0, 1,
-1.480418, -0.06559234, -0.7943938, 1, 0.4431373, 0, 1,
-1.467395, -0.9985868, -1.243012, 1, 0.4509804, 0, 1,
-1.462615, -0.8764736, -0.9726962, 1, 0.454902, 0, 1,
-1.459227, -1.105405, -1.053813, 1, 0.4627451, 0, 1,
-1.453285, 0.02619241, -2.613727, 1, 0.4666667, 0, 1,
-1.427621, -1.449921, -2.462607, 1, 0.4745098, 0, 1,
-1.423546, 1.117889, -0.6798344, 1, 0.4784314, 0, 1,
-1.422774, 0.8051443, -0.9549276, 1, 0.4862745, 0, 1,
-1.408011, -0.7456477, -1.296524, 1, 0.4901961, 0, 1,
-1.408002, 1.553521, -1.219689, 1, 0.4980392, 0, 1,
-1.393619, 1.785622, -0.3138283, 1, 0.5058824, 0, 1,
-1.381904, -0.1098373, -3.241223, 1, 0.509804, 0, 1,
-1.380516, -0.4805325, -1.676592, 1, 0.5176471, 0, 1,
-1.373575, 1.187187, -1.028893, 1, 0.5215687, 0, 1,
-1.364946, 0.9121495, -1.549482, 1, 0.5294118, 0, 1,
-1.364234, 1.571641, -0.7606923, 1, 0.5333334, 0, 1,
-1.361103, 0.6037852, -1.25609, 1, 0.5411765, 0, 1,
-1.360206, -0.3832999, -1.400714, 1, 0.5450981, 0, 1,
-1.357267, 0.9163817, -0.1683683, 1, 0.5529412, 0, 1,
-1.353845, -0.1326954, -1.64918, 1, 0.5568628, 0, 1,
-1.352429, -0.4754059, -1.545874, 1, 0.5647059, 0, 1,
-1.344732, 0.5570609, -1.196561, 1, 0.5686275, 0, 1,
-1.340443, 0.4911165, -1.691971, 1, 0.5764706, 0, 1,
-1.329427, -0.2726674, 0.09396531, 1, 0.5803922, 0, 1,
-1.324213, -0.9492017, -1.831673, 1, 0.5882353, 0, 1,
-1.312979, 0.04776506, -2.085446, 1, 0.5921569, 0, 1,
-1.306592, 0.5335354, -1.465742, 1, 0.6, 0, 1,
-1.298971, 0.07146797, -0.209097, 1, 0.6078432, 0, 1,
-1.286103, 0.7469721, -0.81716, 1, 0.6117647, 0, 1,
-1.274765, 1.295331, -1.133629, 1, 0.6196079, 0, 1,
-1.255828, 0.4721943, -0.9631205, 1, 0.6235294, 0, 1,
-1.250622, 0.5166957, 0.6756773, 1, 0.6313726, 0, 1,
-1.24, -0.2481479, -0.892526, 1, 0.6352941, 0, 1,
-1.237811, -0.5106424, -2.564504, 1, 0.6431373, 0, 1,
-1.234384, 0.2174776, -3.043786, 1, 0.6470588, 0, 1,
-1.233362, 0.8171939, -0.8332579, 1, 0.654902, 0, 1,
-1.231513, -0.9595498, -2.758315, 1, 0.6588235, 0, 1,
-1.217194, -0.05574387, -1.787947, 1, 0.6666667, 0, 1,
-1.213026, 1.811807, 0.1992322, 1, 0.6705883, 0, 1,
-1.211476, -1.234329, -1.532616, 1, 0.6784314, 0, 1,
-1.204818, -1.130866, -2.637435, 1, 0.682353, 0, 1,
-1.204735, 0.3207507, -1.025438, 1, 0.6901961, 0, 1,
-1.195572, -0.04135174, -1.692453, 1, 0.6941177, 0, 1,
-1.19294, -0.1705899, -3.08799, 1, 0.7019608, 0, 1,
-1.183673, -0.2836352, -1.903619, 1, 0.7098039, 0, 1,
-1.18025, 1.08072, -1.187772, 1, 0.7137255, 0, 1,
-1.18016, -2.318065, -0.8181975, 1, 0.7215686, 0, 1,
-1.178429, -0.2002759, -0.7843825, 1, 0.7254902, 0, 1,
-1.176734, -0.8237531, -0.4024576, 1, 0.7333333, 0, 1,
-1.176614, -0.1234608, -1.797651, 1, 0.7372549, 0, 1,
-1.167877, -0.7533374, -1.088614, 1, 0.7450981, 0, 1,
-1.165205, -0.592577, -1.667661, 1, 0.7490196, 0, 1,
-1.164999, 0.5540753, 0.6345767, 1, 0.7568628, 0, 1,
-1.157107, 0.7686938, -0.7273588, 1, 0.7607843, 0, 1,
-1.152471, 0.4503435, -0.02563318, 1, 0.7686275, 0, 1,
-1.149673, -0.107517, -1.908963, 1, 0.772549, 0, 1,
-1.146364, 1.192964, -1.342653, 1, 0.7803922, 0, 1,
-1.136145, -0.5530489, -2.386775, 1, 0.7843137, 0, 1,
-1.131246, 0.1703738, -1.953961, 1, 0.7921569, 0, 1,
-1.125366, -1.266206, -3.527285, 1, 0.7960784, 0, 1,
-1.12333, 0.4047122, -0.6720858, 1, 0.8039216, 0, 1,
-1.11711, -0.5589201, -1.461428, 1, 0.8117647, 0, 1,
-1.11541, 0.4301535, 0.6212965, 1, 0.8156863, 0, 1,
-1.115407, -0.7556643, -2.688681, 1, 0.8235294, 0, 1,
-1.112988, -0.3687835, -3.170623, 1, 0.827451, 0, 1,
-1.112575, 0.03933773, -1.217137, 1, 0.8352941, 0, 1,
-1.106883, 0.02643055, -0.7942922, 1, 0.8392157, 0, 1,
-1.088955, -0.6367099, -1.141467, 1, 0.8470588, 0, 1,
-1.08599, -0.3201553, -2.848404, 1, 0.8509804, 0, 1,
-1.08488, -0.04914114, -2.743783, 1, 0.8588235, 0, 1,
-1.082081, -0.104752, -2.119172, 1, 0.8627451, 0, 1,
-1.074677, -0.9551076, -2.843947, 1, 0.8705882, 0, 1,
-1.073169, 0.09668658, -2.020758, 1, 0.8745098, 0, 1,
-1.070202, 0.06528972, -1.945657, 1, 0.8823529, 0, 1,
-1.065388, 0.5090894, -0.9691268, 1, 0.8862745, 0, 1,
-1.062871, 0.2866763, -2.842713, 1, 0.8941177, 0, 1,
-1.062644, -3.307949, -2.21708, 1, 0.8980392, 0, 1,
-1.058973, -1.360319, -1.879082, 1, 0.9058824, 0, 1,
-1.05274, 0.8359832, -0.7567928, 1, 0.9137255, 0, 1,
-1.043525, 1.408017, -0.3863935, 1, 0.9176471, 0, 1,
-1.029865, 0.1679108, -2.304696, 1, 0.9254902, 0, 1,
-1.029413, 1.730163, 1.224057, 1, 0.9294118, 0, 1,
-1.020683, -0.5283819, -2.913834, 1, 0.9372549, 0, 1,
-1.018658, 1.272902, 0.6080742, 1, 0.9411765, 0, 1,
-1.014979, 1.376642, -1.990549, 1, 0.9490196, 0, 1,
-1.013269, -0.5117093, -3.329303, 1, 0.9529412, 0, 1,
-1.013177, -0.4511091, -1.594461, 1, 0.9607843, 0, 1,
-1.00529, -1.062206, -2.854537, 1, 0.9647059, 0, 1,
-1.003984, -0.7780758, -1.90024, 1, 0.972549, 0, 1,
-0.997588, -0.6512353, -1.525147, 1, 0.9764706, 0, 1,
-0.9972976, -1.01477, -3.240007, 1, 0.9843137, 0, 1,
-0.9968965, 0.3564729, 0.5760131, 1, 0.9882353, 0, 1,
-0.995877, 0.6180779, 0.7653953, 1, 0.9960784, 0, 1,
-0.9817199, -0.8534352, -2.232019, 0.9960784, 1, 0, 1,
-0.9765437, 0.3587234, -0.3794732, 0.9921569, 1, 0, 1,
-0.973416, 1.118467, -0.1809938, 0.9843137, 1, 0, 1,
-0.9732076, -0.2120354, -0.3410022, 0.9803922, 1, 0, 1,
-0.9720755, -0.8118485, -3.586801, 0.972549, 1, 0, 1,
-0.9626915, 0.1533235, -0.8705609, 0.9686275, 1, 0, 1,
-0.9620231, 0.4245365, -0.9534529, 0.9607843, 1, 0, 1,
-0.9600099, -1.693775, -4.176732, 0.9568627, 1, 0, 1,
-0.9587814, 0.6356698, 0.1843407, 0.9490196, 1, 0, 1,
-0.9581837, -1.601829, -3.910825, 0.945098, 1, 0, 1,
-0.9581561, -1.067792, -3.007226, 0.9372549, 1, 0, 1,
-0.9509549, -1.002617, -1.26217, 0.9333333, 1, 0, 1,
-0.9494827, 0.7409533, -1.030698, 0.9254902, 1, 0, 1,
-0.9284897, 0.5552985, -0.5357656, 0.9215686, 1, 0, 1,
-0.927632, 0.24611, -3.076025, 0.9137255, 1, 0, 1,
-0.9173301, 1.169098, -0.6635482, 0.9098039, 1, 0, 1,
-0.9076069, 0.1645482, -1.786948, 0.9019608, 1, 0, 1,
-0.9057983, -1.880572, -4.257782, 0.8941177, 1, 0, 1,
-0.9047796, -0.8443601, -0.3635216, 0.8901961, 1, 0, 1,
-0.9042692, -1.008209, -3.14157, 0.8823529, 1, 0, 1,
-0.8994049, -0.1683574, -1.430708, 0.8784314, 1, 0, 1,
-0.8990132, 0.01499999, -1.407426, 0.8705882, 1, 0, 1,
-0.8981276, -0.8756965, -3.064853, 0.8666667, 1, 0, 1,
-0.893239, 1.343702, -1.152838, 0.8588235, 1, 0, 1,
-0.8914533, -0.4328798, -3.710012, 0.854902, 1, 0, 1,
-0.8834064, -0.07122466, -1.534279, 0.8470588, 1, 0, 1,
-0.8792359, 0.1628577, -2.345561, 0.8431373, 1, 0, 1,
-0.8777601, -0.8375829, -3.545894, 0.8352941, 1, 0, 1,
-0.8744088, 0.4985332, -0.8185309, 0.8313726, 1, 0, 1,
-0.8624337, -1.394449, -2.573745, 0.8235294, 1, 0, 1,
-0.8607106, -1.710351, -2.137357, 0.8196079, 1, 0, 1,
-0.8546754, 0.8952857, -2.343543, 0.8117647, 1, 0, 1,
-0.8527003, 1.058996, -1.695752, 0.8078431, 1, 0, 1,
-0.8523972, 0.4714831, -2.135419, 0.8, 1, 0, 1,
-0.8520998, 0.3805417, -1.74622, 0.7921569, 1, 0, 1,
-0.8512833, 1.441644, -1.775706, 0.7882353, 1, 0, 1,
-0.8495733, -0.7083856, -2.208279, 0.7803922, 1, 0, 1,
-0.8488093, -0.3664159, -1.104494, 0.7764706, 1, 0, 1,
-0.8377169, 0.7336234, -2.656122, 0.7686275, 1, 0, 1,
-0.8333184, -0.1121842, -0.6902446, 0.7647059, 1, 0, 1,
-0.8309571, -0.02928434, -1.237048, 0.7568628, 1, 0, 1,
-0.8308674, 1.118695, -0.9991673, 0.7529412, 1, 0, 1,
-0.8297982, 0.2802309, -0.5998085, 0.7450981, 1, 0, 1,
-0.8152548, 1.085361, 1.155511, 0.7411765, 1, 0, 1,
-0.8151702, 1.835187, -0.1466716, 0.7333333, 1, 0, 1,
-0.8149999, 0.08476481, -1.175786, 0.7294118, 1, 0, 1,
-0.8147979, 0.7395369, -0.7617302, 0.7215686, 1, 0, 1,
-0.8131507, 0.4689769, -1.096529, 0.7176471, 1, 0, 1,
-0.8052536, -0.704762, -2.589006, 0.7098039, 1, 0, 1,
-0.7986773, -1.840684, -1.556756, 0.7058824, 1, 0, 1,
-0.792513, 1.018148, 0.5879264, 0.6980392, 1, 0, 1,
-0.7763807, -0.6097213, -2.103714, 0.6901961, 1, 0, 1,
-0.7762008, 0.2014117, -1.312403, 0.6862745, 1, 0, 1,
-0.774398, 1.736567, -2.650596, 0.6784314, 1, 0, 1,
-0.7734128, -0.9857913, -2.649112, 0.6745098, 1, 0, 1,
-0.7729614, -0.2066499, -1.121632, 0.6666667, 1, 0, 1,
-0.7667167, -2.008073, -2.032969, 0.6627451, 1, 0, 1,
-0.7609656, 2.004907, 1.562367, 0.654902, 1, 0, 1,
-0.7586248, -0.4555896, -1.915808, 0.6509804, 1, 0, 1,
-0.7556547, -0.5113494, -3.219285, 0.6431373, 1, 0, 1,
-0.7497139, -0.3279107, -3.002051, 0.6392157, 1, 0, 1,
-0.7493216, 1.948459, -1.199938, 0.6313726, 1, 0, 1,
-0.7391157, 0.2903459, -2.322585, 0.627451, 1, 0, 1,
-0.7382028, -0.2819192, -1.585892, 0.6196079, 1, 0, 1,
-0.7381162, 1.156531, 0.6480694, 0.6156863, 1, 0, 1,
-0.7377694, 0.6119584, -0.4670784, 0.6078432, 1, 0, 1,
-0.7322415, 0.1053287, -2.619593, 0.6039216, 1, 0, 1,
-0.7287514, 0.5808137, -0.9988165, 0.5960785, 1, 0, 1,
-0.7284365, 0.7882996, -2.292675, 0.5882353, 1, 0, 1,
-0.7265606, 0.9728542, -0.3288004, 0.5843138, 1, 0, 1,
-0.7264142, 1.254516, -0.882885, 0.5764706, 1, 0, 1,
-0.7252871, 0.002956965, -2.955148, 0.572549, 1, 0, 1,
-0.7214722, 0.7520005, -0.4011755, 0.5647059, 1, 0, 1,
-0.7185603, 1.133942, -1.129564, 0.5607843, 1, 0, 1,
-0.7183581, 0.2416676, -1.435587, 0.5529412, 1, 0, 1,
-0.7168706, -0.7025123, -2.393709, 0.5490196, 1, 0, 1,
-0.7083459, 1.449133, -2.876042, 0.5411765, 1, 0, 1,
-0.707568, -0.3804252, -1.772455, 0.5372549, 1, 0, 1,
-0.7065991, 0.46525, -2.631129, 0.5294118, 1, 0, 1,
-0.6931092, -1.977913, -2.380338, 0.5254902, 1, 0, 1,
-0.6921465, -0.3197018, -2.044256, 0.5176471, 1, 0, 1,
-0.6888053, -0.1475094, -0.4244235, 0.5137255, 1, 0, 1,
-0.6886045, 1.660296, -1.755034, 0.5058824, 1, 0, 1,
-0.688215, 1.106723, 2.388079, 0.5019608, 1, 0, 1,
-0.6852852, 0.3499837, -2.366951, 0.4941176, 1, 0, 1,
-0.6830803, 0.9531753, -0.5164917, 0.4862745, 1, 0, 1,
-0.6804883, -0.3508026, -1.936345, 0.4823529, 1, 0, 1,
-0.6800475, -0.5755985, -3.115773, 0.4745098, 1, 0, 1,
-0.67882, 2.298137, -0.8445971, 0.4705882, 1, 0, 1,
-0.6730976, -0.3423156, -1.835498, 0.4627451, 1, 0, 1,
-0.6699076, -0.1804266, -1.786108, 0.4588235, 1, 0, 1,
-0.6689594, -0.6963198, -4.067109, 0.4509804, 1, 0, 1,
-0.6678517, -0.08484573, -4.080988, 0.4470588, 1, 0, 1,
-0.6630219, -2.160838, -2.488973, 0.4392157, 1, 0, 1,
-0.6624016, 0.04191499, -2.316138, 0.4352941, 1, 0, 1,
-0.6605244, -1.862172, -3.049611, 0.427451, 1, 0, 1,
-0.6592994, -0.4817717, -3.343261, 0.4235294, 1, 0, 1,
-0.6570444, -0.4154164, -2.144807, 0.4156863, 1, 0, 1,
-0.651995, -1.137864, -3.582583, 0.4117647, 1, 0, 1,
-0.648895, 0.9309953, 0.7717612, 0.4039216, 1, 0, 1,
-0.6485016, -0.03346757, -2.54814, 0.3960784, 1, 0, 1,
-0.6442125, -0.5699863, -2.071112, 0.3921569, 1, 0, 1,
-0.6379215, -0.3430553, -2.673716, 0.3843137, 1, 0, 1,
-0.6353539, -0.4864128, -1.376054, 0.3803922, 1, 0, 1,
-0.6334063, -0.5245279, -3.305665, 0.372549, 1, 0, 1,
-0.6291421, 0.17971, -0.7512738, 0.3686275, 1, 0, 1,
-0.6251614, -0.6845624, -3.671528, 0.3607843, 1, 0, 1,
-0.6180281, -1.37803, -3.900029, 0.3568628, 1, 0, 1,
-0.6170772, -0.193988, -2.826127, 0.3490196, 1, 0, 1,
-0.6137512, 0.1083267, -1.350526, 0.345098, 1, 0, 1,
-0.61319, -1.405745, -1.444315, 0.3372549, 1, 0, 1,
-0.6090608, 0.5084701, 0.2070968, 0.3333333, 1, 0, 1,
-0.6048149, -0.4847283, -3.315993, 0.3254902, 1, 0, 1,
-0.5933239, -0.4840104, -1.493481, 0.3215686, 1, 0, 1,
-0.5909982, -0.1864487, -1.196798, 0.3137255, 1, 0, 1,
-0.5854748, 0.008719257, -3.199542, 0.3098039, 1, 0, 1,
-0.5853836, -0.3260197, -1.481541, 0.3019608, 1, 0, 1,
-0.5846005, -0.09219514, -2.632614, 0.2941177, 1, 0, 1,
-0.5813888, 0.4840454, -1.376599, 0.2901961, 1, 0, 1,
-0.572387, -0.3883405, -1.437253, 0.282353, 1, 0, 1,
-0.5692635, 1.350594, -0.7715988, 0.2784314, 1, 0, 1,
-0.5596331, 0.02595594, -0.6401441, 0.2705882, 1, 0, 1,
-0.5575021, -0.5690139, -1.467416, 0.2666667, 1, 0, 1,
-0.5559968, 0.3989856, -2.041542, 0.2588235, 1, 0, 1,
-0.5542821, 0.21949, -1.153367, 0.254902, 1, 0, 1,
-0.5482393, 0.4886492, -0.587613, 0.2470588, 1, 0, 1,
-0.545297, -0.4386945, -3.273635, 0.2431373, 1, 0, 1,
-0.5379982, -0.7680501, -1.295209, 0.2352941, 1, 0, 1,
-0.5378163, 0.4426482, -0.6520792, 0.2313726, 1, 0, 1,
-0.5375062, -0.1198587, -1.002966, 0.2235294, 1, 0, 1,
-0.5371984, 0.01159001, -1.315932, 0.2196078, 1, 0, 1,
-0.5361757, -0.5353295, -2.191563, 0.2117647, 1, 0, 1,
-0.5354367, -0.3514942, -4.049438, 0.2078431, 1, 0, 1,
-0.5209776, -0.4737065, -2.997641, 0.2, 1, 0, 1,
-0.5191063, -0.5434377, -2.074864, 0.1921569, 1, 0, 1,
-0.5172357, 0.976306, -1.28915, 0.1882353, 1, 0, 1,
-0.517164, 0.3884596, -0.8190767, 0.1803922, 1, 0, 1,
-0.5127847, -0.3840982, -2.364165, 0.1764706, 1, 0, 1,
-0.5106626, -0.1414779, -2.025738, 0.1686275, 1, 0, 1,
-0.5098972, -0.0523138, -2.600739, 0.1647059, 1, 0, 1,
-0.5079639, -0.351871, -1.946657, 0.1568628, 1, 0, 1,
-0.5015581, -0.5938119, -1.793082, 0.1529412, 1, 0, 1,
-0.5011108, -0.4995817, -1.22459, 0.145098, 1, 0, 1,
-0.4951595, -0.388991, -1.811525, 0.1411765, 1, 0, 1,
-0.4854091, -0.6323699, -2.455864, 0.1333333, 1, 0, 1,
-0.4798944, -3.527028, -2.443579, 0.1294118, 1, 0, 1,
-0.4798606, -0.02446931, -2.052132, 0.1215686, 1, 0, 1,
-0.4786792, 1.05703, 0.5165169, 0.1176471, 1, 0, 1,
-0.4782994, 1.122804, 0.02880114, 0.1098039, 1, 0, 1,
-0.4776, 0.261396, 0.411182, 0.1058824, 1, 0, 1,
-0.4755278, 0.07270526, -0.6704339, 0.09803922, 1, 0, 1,
-0.4736435, 0.1987863, -0.03699877, 0.09019608, 1, 0, 1,
-0.4703965, 0.1557579, -1.599547, 0.08627451, 1, 0, 1,
-0.4573835, -0.1226728, -2.451817, 0.07843138, 1, 0, 1,
-0.4549879, 0.5094239, -1.159659, 0.07450981, 1, 0, 1,
-0.4536965, 0.9881373, 0.02527762, 0.06666667, 1, 0, 1,
-0.4533502, -0.687763, -2.385205, 0.0627451, 1, 0, 1,
-0.4464888, 1.328851, 1.116036, 0.05490196, 1, 0, 1,
-0.445129, 0.7251352, -1.885864, 0.05098039, 1, 0, 1,
-0.4354512, 0.602904, -1.468439, 0.04313726, 1, 0, 1,
-0.4291503, -1.319708, -1.680619, 0.03921569, 1, 0, 1,
-0.425412, 0.3792088, 0.5282855, 0.03137255, 1, 0, 1,
-0.4186293, -0.5014809, -2.050537, 0.02745098, 1, 0, 1,
-0.4153795, -0.3896502, -3.067328, 0.01960784, 1, 0, 1,
-0.4140322, -0.3665859, -0.3012692, 0.01568628, 1, 0, 1,
-0.4116258, -0.1737948, -1.178532, 0.007843138, 1, 0, 1,
-0.4079835, 0.5863446, -1.491512, 0.003921569, 1, 0, 1,
-0.4074765, 0.8859724, -1.893764, 0, 1, 0.003921569, 1,
-0.4061861, -2.357287, -4.534391, 0, 1, 0.01176471, 1,
-0.4058151, -0.02043564, -2.342914, 0, 1, 0.01568628, 1,
-0.4052121, 0.2928398, -0.6240519, 0, 1, 0.02352941, 1,
-0.4046937, 0.587234, -1.450671, 0, 1, 0.02745098, 1,
-0.4009566, -0.9500578, -2.559906, 0, 1, 0.03529412, 1,
-0.4004419, -1.271223, -2.570059, 0, 1, 0.03921569, 1,
-0.3966706, 0.01031842, 1.575798, 0, 1, 0.04705882, 1,
-0.3932403, 0.8832799, -1.026539, 0, 1, 0.05098039, 1,
-0.3901464, 1.467489, 0.7333302, 0, 1, 0.05882353, 1,
-0.3892709, 0.7953359, 0.4634062, 0, 1, 0.0627451, 1,
-0.3884336, -0.4961457, -2.671476, 0, 1, 0.07058824, 1,
-0.3875998, 0.07307459, -1.794238, 0, 1, 0.07450981, 1,
-0.3860882, -1.263412, -2.668603, 0, 1, 0.08235294, 1,
-0.385587, 1.900371, 0.02614645, 0, 1, 0.08627451, 1,
-0.3841095, 0.9458269, 0.1944307, 0, 1, 0.09411765, 1,
-0.376059, -2.017966, -1.717373, 0, 1, 0.1019608, 1,
-0.3740879, -0.7645541, -2.373594, 0, 1, 0.1058824, 1,
-0.3733549, -0.5344717, -2.361848, 0, 1, 0.1137255, 1,
-0.3710812, -0.3266942, -0.6801921, 0, 1, 0.1176471, 1,
-0.3676704, -0.02174589, -2.22957, 0, 1, 0.1254902, 1,
-0.3672972, -1.119059, -2.230887, 0, 1, 0.1294118, 1,
-0.3672954, -0.7599987, -4.414866, 0, 1, 0.1372549, 1,
-0.3621997, 0.04609288, -1.155844, 0, 1, 0.1411765, 1,
-0.353212, -0.0298033, -1.664508, 0, 1, 0.1490196, 1,
-0.3513694, 0.5849813, -0.0420365, 0, 1, 0.1529412, 1,
-0.3499846, 1.58068, -0.4009607, 0, 1, 0.1607843, 1,
-0.3488133, -0.1891513, -0.769228, 0, 1, 0.1647059, 1,
-0.3487478, 0.7198704, 0.4556293, 0, 1, 0.172549, 1,
-0.3464022, -2.618071, -4.223216, 0, 1, 0.1764706, 1,
-0.3438146, 0.6179389, 0.4902005, 0, 1, 0.1843137, 1,
-0.3427106, 0.01415095, -0.6695024, 0, 1, 0.1882353, 1,
-0.3411916, -0.5419862, -2.980563, 0, 1, 0.1960784, 1,
-0.3360798, 0.4927062, -3.366937, 0, 1, 0.2039216, 1,
-0.3336011, -1.019748, -2.587404, 0, 1, 0.2078431, 1,
-0.3319593, 1.46082, 0.5710884, 0, 1, 0.2156863, 1,
-0.3300024, -2.212851, -0.7939073, 0, 1, 0.2196078, 1,
-0.3296032, 0.1346218, -2.279465, 0, 1, 0.227451, 1,
-0.3269875, 0.01903091, -2.738358, 0, 1, 0.2313726, 1,
-0.3199574, -1.443351, -2.546679, 0, 1, 0.2392157, 1,
-0.3193653, -0.3576488, -5.054519, 0, 1, 0.2431373, 1,
-0.3189273, -2.07812, -3.165962, 0, 1, 0.2509804, 1,
-0.3182452, 0.2424714, 0.9898247, 0, 1, 0.254902, 1,
-0.3071496, 2.137011, -0.6382287, 0, 1, 0.2627451, 1,
-0.3065688, 0.4801032, -1.424311, 0, 1, 0.2666667, 1,
-0.3017941, 0.284479, -1.457769, 0, 1, 0.2745098, 1,
-0.297252, -0.3502273, -2.410946, 0, 1, 0.2784314, 1,
-0.29596, -0.5229988, -2.697981, 0, 1, 0.2862745, 1,
-0.2955826, 0.0495584, -2.02226, 0, 1, 0.2901961, 1,
-0.2945594, -1.131624, -3.41063, 0, 1, 0.2980392, 1,
-0.2932653, -0.3537056, -3.972786, 0, 1, 0.3058824, 1,
-0.2843408, -0.248114, -0.04452904, 0, 1, 0.3098039, 1,
-0.283265, -0.3474238, -2.149717, 0, 1, 0.3176471, 1,
-0.282953, -2.231299, -3.300481, 0, 1, 0.3215686, 1,
-0.2800399, -2.118266, -2.948579, 0, 1, 0.3294118, 1,
-0.2778304, -0.05577209, -0.8465303, 0, 1, 0.3333333, 1,
-0.273315, 0.04119914, -1.213399, 0, 1, 0.3411765, 1,
-0.2595399, -0.5796289, -1.374429, 0, 1, 0.345098, 1,
-0.2589901, 0.4335741, 1.076025, 0, 1, 0.3529412, 1,
-0.2571264, 0.05220749, -0.7017835, 0, 1, 0.3568628, 1,
-0.2537459, 0.7403175, -0.4374988, 0, 1, 0.3647059, 1,
-0.2517057, 2.174557, 0.5962811, 0, 1, 0.3686275, 1,
-0.2513005, -0.2751483, -2.905957, 0, 1, 0.3764706, 1,
-0.2425462, 0.6779792, -0.5116502, 0, 1, 0.3803922, 1,
-0.2392921, 0.1025779, -0.5447198, 0, 1, 0.3882353, 1,
-0.238733, 0.206036, -1.023976, 0, 1, 0.3921569, 1,
-0.2375402, 0.8832328, -1.25043, 0, 1, 0.4, 1,
-0.2365815, 0.5751192, -2.102062, 0, 1, 0.4078431, 1,
-0.2361196, 0.08462565, -0.709642, 0, 1, 0.4117647, 1,
-0.2332974, -1.833466, -2.392889, 0, 1, 0.4196078, 1,
-0.2326484, -0.8465211, -3.835708, 0, 1, 0.4235294, 1,
-0.2307645, 0.1668198, -0.1157343, 0, 1, 0.4313726, 1,
-0.2306844, -0.5386616, -4.633165, 0, 1, 0.4352941, 1,
-0.2275602, -0.8549906, -4.210915, 0, 1, 0.4431373, 1,
-0.2273031, -0.0911802, -2.566078, 0, 1, 0.4470588, 1,
-0.2244273, -1.695495, -2.849974, 0, 1, 0.454902, 1,
-0.2230467, -0.2789825, -2.16627, 0, 1, 0.4588235, 1,
-0.2212123, 0.6228058, 0.8416995, 0, 1, 0.4666667, 1,
-0.2206221, 0.1299084, -0.9071438, 0, 1, 0.4705882, 1,
-0.2176786, 0.155548, 0.6527295, 0, 1, 0.4784314, 1,
-0.2156116, 0.5673444, 0.18247, 0, 1, 0.4823529, 1,
-0.2146927, -0.4179454, -3.835543, 0, 1, 0.4901961, 1,
-0.2145267, -0.496594, -2.857043, 0, 1, 0.4941176, 1,
-0.2137719, 1.493034, 1.780037, 0, 1, 0.5019608, 1,
-0.2137665, 0.1265828, -4.228683, 0, 1, 0.509804, 1,
-0.2130093, 0.2982486, -0.4775079, 0, 1, 0.5137255, 1,
-0.2094404, 0.4737596, -1.101739, 0, 1, 0.5215687, 1,
-0.208299, 0.4159093, -0.1827813, 0, 1, 0.5254902, 1,
-0.2072844, -2.043879, -0.9014195, 0, 1, 0.5333334, 1,
-0.2003004, -0.06899145, -1.107176, 0, 1, 0.5372549, 1,
-0.2001481, -0.6823874, -0.5892706, 0, 1, 0.5450981, 1,
-0.1935995, 0.5170083, 0.4085592, 0, 1, 0.5490196, 1,
-0.192142, -0.671928, -3.103474, 0, 1, 0.5568628, 1,
-0.1866103, -0.639789, -3.390636, 0, 1, 0.5607843, 1,
-0.1845392, -1.683083, -3.880036, 0, 1, 0.5686275, 1,
-0.1841993, 0.9004228, 0.9403356, 0, 1, 0.572549, 1,
-0.1840421, -0.1032189, -1.835438, 0, 1, 0.5803922, 1,
-0.1834187, -1.488125, -2.893947, 0, 1, 0.5843138, 1,
-0.182278, 0.3236216, -0.2945853, 0, 1, 0.5921569, 1,
-0.1820875, 0.6089389, -0.01388302, 0, 1, 0.5960785, 1,
-0.1760953, 1.684414, 0.4675922, 0, 1, 0.6039216, 1,
-0.1733741, 0.8009281, 0.2499382, 0, 1, 0.6117647, 1,
-0.1652626, -0.5383225, -1.862309, 0, 1, 0.6156863, 1,
-0.1640341, 0.04318219, -3.654475, 0, 1, 0.6235294, 1,
-0.1522405, -1.266466, -2.663928, 0, 1, 0.627451, 1,
-0.1489374, 2.127388, 0.2715532, 0, 1, 0.6352941, 1,
-0.1445891, -0.8694782, -4.653376, 0, 1, 0.6392157, 1,
-0.1441165, -0.4976424, -4.033907, 0, 1, 0.6470588, 1,
-0.1419809, 0.1383823, -0.02689578, 0, 1, 0.6509804, 1,
-0.1245081, -0.01792357, -2.814009, 0, 1, 0.6588235, 1,
-0.1240688, 0.1266597, -2.135807, 0, 1, 0.6627451, 1,
-0.1184602, -0.9373025, -2.875845, 0, 1, 0.6705883, 1,
-0.1175701, 1.460999, -2.483229, 0, 1, 0.6745098, 1,
-0.1150741, -0.5100085, -3.032841, 0, 1, 0.682353, 1,
-0.1120184, 2.796687, -0.07644475, 0, 1, 0.6862745, 1,
-0.1076488, -0.3061034, -3.965833, 0, 1, 0.6941177, 1,
-0.1072452, 1.611331, 0.6550851, 0, 1, 0.7019608, 1,
-0.1005954, -0.2797275, -3.972138, 0, 1, 0.7058824, 1,
-0.09700271, 1.5075, 2.017499, 0, 1, 0.7137255, 1,
-0.09556037, 1.450476, -0.09723326, 0, 1, 0.7176471, 1,
-0.09541556, -0.8198832, -4.037813, 0, 1, 0.7254902, 1,
-0.09381923, 1.722927, 1.470891, 0, 1, 0.7294118, 1,
-0.09349003, -0.2036916, -2.073938, 0, 1, 0.7372549, 1,
-0.09300014, 0.5285741, -0.5307029, 0, 1, 0.7411765, 1,
-0.09091855, 0.3465166, 0.07776581, 0, 1, 0.7490196, 1,
-0.09057841, 0.1974311, -2.167126, 0, 1, 0.7529412, 1,
-0.08789907, -2.765743, -3.572328, 0, 1, 0.7607843, 1,
-0.08604707, 1.016083, -1.261102, 0, 1, 0.7647059, 1,
-0.07621771, -1.0204, -3.137618, 0, 1, 0.772549, 1,
-0.07587904, 0.7231652, -0.1272552, 0, 1, 0.7764706, 1,
-0.07525901, 1.998405, 2.024699, 0, 1, 0.7843137, 1,
-0.07427252, -1.211024, -2.166567, 0, 1, 0.7882353, 1,
-0.06578769, 0.6951103, -0.6811165, 0, 1, 0.7960784, 1,
-0.06314695, 0.1560939, -2.433449, 0, 1, 0.8039216, 1,
-0.06166723, 0.1836649, 0.6961634, 0, 1, 0.8078431, 1,
-0.05522304, 0.02249746, -2.079456, 0, 1, 0.8156863, 1,
-0.05338043, 0.733876, 0.618524, 0, 1, 0.8196079, 1,
-0.05077298, -0.602973, -3.461229, 0, 1, 0.827451, 1,
-0.0474964, -0.6621527, -4.559763, 0, 1, 0.8313726, 1,
-0.04197502, 1.1225, 0.1116693, 0, 1, 0.8392157, 1,
-0.02890005, 0.03045059, -0.6920698, 0, 1, 0.8431373, 1,
-0.02758051, 1.22714, -0.7647845, 0, 1, 0.8509804, 1,
-0.02746526, 0.2961835, -1.254053, 0, 1, 0.854902, 1,
-0.02641484, 1.348615, 1.192892, 0, 1, 0.8627451, 1,
-0.02640353, -0.7256491, -1.960809, 0, 1, 0.8666667, 1,
-0.02361451, -0.8060291, -3.965859, 0, 1, 0.8745098, 1,
-0.02128935, -1.454278, -4.677431, 0, 1, 0.8784314, 1,
-0.02111119, 0.3041909, 1.640578, 0, 1, 0.8862745, 1,
-0.01938387, -0.2270964, -2.462118, 0, 1, 0.8901961, 1,
-0.01855974, 1.487646, 0.4466091, 0, 1, 0.8980392, 1,
-0.01830851, -0.1427387, -3.540369, 0, 1, 0.9058824, 1,
-0.01692342, -1.170708, -2.261189, 0, 1, 0.9098039, 1,
-0.01221616, -0.757761, -3.934034, 0, 1, 0.9176471, 1,
-0.01105509, 1.479591, -0.2454097, 0, 1, 0.9215686, 1,
-0.002803429, 0.4591797, 0.961289, 0, 1, 0.9294118, 1,
-0.0005077404, 0.376948, 1.173531, 0, 1, 0.9333333, 1,
1.241833e-05, 0.7953918, 1.601532, 0, 1, 0.9411765, 1,
0.002463191, -0.1297036, 3.315336, 0, 1, 0.945098, 1,
0.003815642, 0.3470014, -1.462973, 0, 1, 0.9529412, 1,
0.008135066, -0.06197497, 3.579261, 0, 1, 0.9568627, 1,
0.009027804, 1.303434, 1.717445, 0, 1, 0.9647059, 1,
0.01066768, 0.8314243, 1.034381, 0, 1, 0.9686275, 1,
0.0115826, 0.8466233, -1.048187, 0, 1, 0.9764706, 1,
0.01203875, 0.3656776, 1.432365, 0, 1, 0.9803922, 1,
0.01364426, -0.4685057, 3.52931, 0, 1, 0.9882353, 1,
0.01544008, 2.153029, 1.869316, 0, 1, 0.9921569, 1,
0.01688926, -1.264384, 4.73097, 0, 1, 1, 1,
0.01747899, -0.9120992, 3.600177, 0, 0.9921569, 1, 1,
0.0176291, 0.5606604, -0.9856656, 0, 0.9882353, 1, 1,
0.01907077, 0.6881808, 0.4993367, 0, 0.9803922, 1, 1,
0.01927726, 0.5787988, 0.4086034, 0, 0.9764706, 1, 1,
0.0216783, -0.9823192, 2.259897, 0, 0.9686275, 1, 1,
0.02910797, -2.029256, 3.046924, 0, 0.9647059, 1, 1,
0.03248425, 0.04477707, 0.8532989, 0, 0.9568627, 1, 1,
0.03984346, 1.013777, -0.6473212, 0, 0.9529412, 1, 1,
0.04231359, -1.228369, 1.654254, 0, 0.945098, 1, 1,
0.04831108, -1.32023, 2.734031, 0, 0.9411765, 1, 1,
0.04909744, 1.08486, -0.579771, 0, 0.9333333, 1, 1,
0.05140124, -0.7812797, 2.760601, 0, 0.9294118, 1, 1,
0.05241014, -0.3334361, 3.930033, 0, 0.9215686, 1, 1,
0.0528701, 0.5727995, -0.7254162, 0, 0.9176471, 1, 1,
0.05398389, 1.312938, -1.852832, 0, 0.9098039, 1, 1,
0.05777952, -0.6990401, 2.805186, 0, 0.9058824, 1, 1,
0.05878903, 0.6647934, 1.08602, 0, 0.8980392, 1, 1,
0.05885709, -0.4720281, 2.821692, 0, 0.8901961, 1, 1,
0.05912255, 0.4629778, 0.399599, 0, 0.8862745, 1, 1,
0.05975717, 0.2486541, 2.562819, 0, 0.8784314, 1, 1,
0.05977176, 1.018882, 1.421131, 0, 0.8745098, 1, 1,
0.06188615, -0.5815033, 0.8870285, 0, 0.8666667, 1, 1,
0.06197571, -0.2526901, 2.404225, 0, 0.8627451, 1, 1,
0.06346872, 1.462798, 0.3119832, 0, 0.854902, 1, 1,
0.06651337, 1.445868, 1.021612, 0, 0.8509804, 1, 1,
0.0702054, -0.4096465, 4.465007, 0, 0.8431373, 1, 1,
0.07182513, 0.1765537, 0.09813109, 0, 0.8392157, 1, 1,
0.07374593, -0.1648173, 5.323134, 0, 0.8313726, 1, 1,
0.07397102, 0.4648355, 1.03061, 0, 0.827451, 1, 1,
0.07514843, -0.01241746, 1.979036, 0, 0.8196079, 1, 1,
0.07729979, -0.7842114, 2.773061, 0, 0.8156863, 1, 1,
0.08190767, -0.9538829, 2.61252, 0, 0.8078431, 1, 1,
0.08484016, 0.8526937, 1.081876, 0, 0.8039216, 1, 1,
0.08548087, 0.8625101, -0.8759972, 0, 0.7960784, 1, 1,
0.08735588, 0.6850084, -0.3025889, 0, 0.7882353, 1, 1,
0.08779332, 1.30272, -1.185077, 0, 0.7843137, 1, 1,
0.09267694, 0.3121426, -0.8451174, 0, 0.7764706, 1, 1,
0.09991134, 1.194315, 0.6521922, 0, 0.772549, 1, 1,
0.1065571, -1.909972, 1.939295, 0, 0.7647059, 1, 1,
0.1108298, 0.1472389, -0.4640937, 0, 0.7607843, 1, 1,
0.1114488, -2.516881, 2.929017, 0, 0.7529412, 1, 1,
0.120482, -2.967807, 3.876828, 0, 0.7490196, 1, 1,
0.1213377, -0.1559157, 1.39625, 0, 0.7411765, 1, 1,
0.1236134, 1.137844, 1.286317, 0, 0.7372549, 1, 1,
0.1272495, -0.09875913, 2.579571, 0, 0.7294118, 1, 1,
0.1314142, -0.7703931, 1.644401, 0, 0.7254902, 1, 1,
0.1324631, -0.9362175, 3.832935, 0, 0.7176471, 1, 1,
0.1389791, 0.9062572, 2.128987, 0, 0.7137255, 1, 1,
0.1419673, 0.6476581, 2.035691, 0, 0.7058824, 1, 1,
0.1423115, -0.6587268, 0.8206448, 0, 0.6980392, 1, 1,
0.1432463, 1.527476, 0.1041798, 0, 0.6941177, 1, 1,
0.14497, 0.304707, 0.8810626, 0, 0.6862745, 1, 1,
0.1469997, -0.5986521, 4.777207, 0, 0.682353, 1, 1,
0.147757, -0.3173498, 2.433168, 0, 0.6745098, 1, 1,
0.1479661, -0.6149607, 2.738633, 0, 0.6705883, 1, 1,
0.1541161, 1.619039, -0.7026446, 0, 0.6627451, 1, 1,
0.1562605, -0.9860258, 2.0928, 0, 0.6588235, 1, 1,
0.1582133, 0.8742232, -0.3904286, 0, 0.6509804, 1, 1,
0.1586175, -0.2201294, 3.027565, 0, 0.6470588, 1, 1,
0.1598926, 1.298976, -1.208881, 0, 0.6392157, 1, 1,
0.1599912, 0.944554, 0.4935509, 0, 0.6352941, 1, 1,
0.1601295, 0.3500672, 0.4696704, 0, 0.627451, 1, 1,
0.1617887, 0.4903319, -0.874708, 0, 0.6235294, 1, 1,
0.1728531, -0.2071985, 1.913268, 0, 0.6156863, 1, 1,
0.1738964, -1.781077, 3.919889, 0, 0.6117647, 1, 1,
0.1805834, 1.315441, 0.15182, 0, 0.6039216, 1, 1,
0.1894747, -1.273769, 3.766663, 0, 0.5960785, 1, 1,
0.1905721, 1.62696, 0.1805083, 0, 0.5921569, 1, 1,
0.1906079, -0.05260121, 2.217981, 0, 0.5843138, 1, 1,
0.192303, 1.363009, -0.4735112, 0, 0.5803922, 1, 1,
0.1951715, -1.324624, 2.926126, 0, 0.572549, 1, 1,
0.1954454, 1.50987, -0.5144988, 0, 0.5686275, 1, 1,
0.1967923, -0.5123767, 4.075288, 0, 0.5607843, 1, 1,
0.1998243, -0.8354855, 3.933279, 0, 0.5568628, 1, 1,
0.2012575, 0.3123527, 0.9036316, 0, 0.5490196, 1, 1,
0.2069932, 2.648001, 0.1011849, 0, 0.5450981, 1, 1,
0.209679, -0.0482456, 1.910595, 0, 0.5372549, 1, 1,
0.2119406, -0.5577682, 2.043828, 0, 0.5333334, 1, 1,
0.2141479, 0.3176654, 0.1876498, 0, 0.5254902, 1, 1,
0.2192145, 1.109002, -0.6673021, 0, 0.5215687, 1, 1,
0.2196455, 0.9062249, 0.0654662, 0, 0.5137255, 1, 1,
0.2210971, 2.804691, 0.4905535, 0, 0.509804, 1, 1,
0.2228795, 0.260584, 0.5575311, 0, 0.5019608, 1, 1,
0.2234701, -1.71662, 3.366871, 0, 0.4941176, 1, 1,
0.2283573, 0.1780481, 0.6017639, 0, 0.4901961, 1, 1,
0.2302599, 1.238116, 0.4990126, 0, 0.4823529, 1, 1,
0.2307961, 0.3393568, 0.477647, 0, 0.4784314, 1, 1,
0.2357538, -0.2027431, 3.272308, 0, 0.4705882, 1, 1,
0.238593, -0.3777217, 2.822616, 0, 0.4666667, 1, 1,
0.2397461, -0.7213173, 3.116764, 0, 0.4588235, 1, 1,
0.2420613, 0.4145798, 0.02784702, 0, 0.454902, 1, 1,
0.242774, -0.7087769, 3.081329, 0, 0.4470588, 1, 1,
0.2439546, -0.03335249, 3.661961, 0, 0.4431373, 1, 1,
0.2461568, 0.6855736, -0.2169476, 0, 0.4352941, 1, 1,
0.2594254, -0.6015269, 2.92735, 0, 0.4313726, 1, 1,
0.2634164, 0.0446904, 1.381725, 0, 0.4235294, 1, 1,
0.2636655, -0.1660984, 2.520741, 0, 0.4196078, 1, 1,
0.2653006, 0.5863664, -1.136107, 0, 0.4117647, 1, 1,
0.2653397, -0.06960531, 1.723509, 0, 0.4078431, 1, 1,
0.2665889, 0.05236709, 1.074255, 0, 0.4, 1, 1,
0.2678615, 0.3661227, -0.6480092, 0, 0.3921569, 1, 1,
0.2682339, 0.2169553, 1.043419, 0, 0.3882353, 1, 1,
0.2696533, 1.032397, 0.1495455, 0, 0.3803922, 1, 1,
0.2703991, 0.8898571, -0.2232788, 0, 0.3764706, 1, 1,
0.2749655, -1.263157, 1.538633, 0, 0.3686275, 1, 1,
0.2766303, -0.4905252, -0.1544237, 0, 0.3647059, 1, 1,
0.2797184, 0.16602, -0.3008538, 0, 0.3568628, 1, 1,
0.2859399, 0.3234321, 1.466448, 0, 0.3529412, 1, 1,
0.2865947, 0.709227, -0.3410636, 0, 0.345098, 1, 1,
0.2922421, 0.8703611, 0.391356, 0, 0.3411765, 1, 1,
0.3026576, 0.5564358, 0.3135588, 0, 0.3333333, 1, 1,
0.304305, 0.7133955, 1.863967, 0, 0.3294118, 1, 1,
0.304472, -1.754503, 1.114379, 0, 0.3215686, 1, 1,
0.3045116, -1.37286, 2.89677, 0, 0.3176471, 1, 1,
0.306353, 0.2942819, -0.5449493, 0, 0.3098039, 1, 1,
0.306512, 1.322728, -0.04496843, 0, 0.3058824, 1, 1,
0.3119769, -1.272342, 3.311647, 0, 0.2980392, 1, 1,
0.3176194, 0.01907223, 2.54062, 0, 0.2901961, 1, 1,
0.3188327, 0.8209047, 1.03421, 0, 0.2862745, 1, 1,
0.3199126, -0.59815, 3.009303, 0, 0.2784314, 1, 1,
0.32145, 1.259679, -1.127414, 0, 0.2745098, 1, 1,
0.3238416, -0.5661151, 1.51388, 0, 0.2666667, 1, 1,
0.3292712, -1.880051, 4.190701, 0, 0.2627451, 1, 1,
0.3293884, -0.09447179, 2.419388, 0, 0.254902, 1, 1,
0.3349992, 0.008710573, 2.36686, 0, 0.2509804, 1, 1,
0.3372265, 1.19716, 0.5699083, 0, 0.2431373, 1, 1,
0.3374378, 0.1756677, 0.7657937, 0, 0.2392157, 1, 1,
0.3395071, 0.5141643, -0.1622571, 0, 0.2313726, 1, 1,
0.3473384, -1.171806, 2.292887, 0, 0.227451, 1, 1,
0.3497623, -0.2411142, 4.564936, 0, 0.2196078, 1, 1,
0.3517085, -0.6287151, 1.58763, 0, 0.2156863, 1, 1,
0.3517222, 0.7159939, 0.4899052, 0, 0.2078431, 1, 1,
0.3523133, 1.018753, 1.604207, 0, 0.2039216, 1, 1,
0.355434, 0.9967647, -1.198688, 0, 0.1960784, 1, 1,
0.3557059, -1.520716, 2.295148, 0, 0.1882353, 1, 1,
0.3596565, -1.194634, 3.565042, 0, 0.1843137, 1, 1,
0.3667632, -0.8057446, 3.95972, 0, 0.1764706, 1, 1,
0.3675844, 1.220377, 0.6596105, 0, 0.172549, 1, 1,
0.3712183, -1.384745, 3.041243, 0, 0.1647059, 1, 1,
0.3734936, -0.5580285, 3.993464, 0, 0.1607843, 1, 1,
0.3746072, 0.9383056, 0.2606069, 0, 0.1529412, 1, 1,
0.3747051, 1.116319, 1.340596, 0, 0.1490196, 1, 1,
0.3755407, -2.233304, 3.137046, 0, 0.1411765, 1, 1,
0.3792086, 1.159007, -0.5626185, 0, 0.1372549, 1, 1,
0.3840785, -0.0771644, 0.8917561, 0, 0.1294118, 1, 1,
0.3871627, -0.4093707, 2.219637, 0, 0.1254902, 1, 1,
0.387325, -2.112579, 3.581455, 0, 0.1176471, 1, 1,
0.3874627, -1.16923, 2.591342, 0, 0.1137255, 1, 1,
0.3907416, 2.280743, -0.5346407, 0, 0.1058824, 1, 1,
0.3920238, -0.1443641, 1.656138, 0, 0.09803922, 1, 1,
0.3926093, 1.625989, -0.4384927, 0, 0.09411765, 1, 1,
0.3942496, -0.2015167, 2.152274, 0, 0.08627451, 1, 1,
0.396706, 0.6405411, 0.5488037, 0, 0.08235294, 1, 1,
0.4009997, 0.4865169, -0.06573416, 0, 0.07450981, 1, 1,
0.4010698, -1.581717, 3.501249, 0, 0.07058824, 1, 1,
0.4028799, -1.613278, 1.600464, 0, 0.0627451, 1, 1,
0.4049515, 0.7324636, -1.077037, 0, 0.05882353, 1, 1,
0.4098248, 0.3686383, 0.9272828, 0, 0.05098039, 1, 1,
0.4105239, 1.134223, 0.1288633, 0, 0.04705882, 1, 1,
0.4138872, 0.4424722, 2.246529, 0, 0.03921569, 1, 1,
0.4190263, 1.293432, -1.183506, 0, 0.03529412, 1, 1,
0.4226549, -0.4977288, 3.452303, 0, 0.02745098, 1, 1,
0.4254705, -0.7890888, 3.055818, 0, 0.02352941, 1, 1,
0.4261916, 1.56814, 0.7130683, 0, 0.01568628, 1, 1,
0.4261976, 0.1741232, 2.418804, 0, 0.01176471, 1, 1,
0.4277531, -0.4946927, 2.339309, 0, 0.003921569, 1, 1,
0.4334903, 0.1810638, -0.8001951, 0.003921569, 0, 1, 1,
0.4378622, -1.444191, 3.25737, 0.007843138, 0, 1, 1,
0.4400369, -1.809088, 3.677849, 0.01568628, 0, 1, 1,
0.4415657, 0.6687701, -0.5500202, 0.01960784, 0, 1, 1,
0.4419485, -0.1687741, 2.531381, 0.02745098, 0, 1, 1,
0.4458919, -0.5261437, 2.441865, 0.03137255, 0, 1, 1,
0.4473386, 0.9950311, -0.3611801, 0.03921569, 0, 1, 1,
0.4496054, -1.560135, 2.578979, 0.04313726, 0, 1, 1,
0.4534494, -0.9970792, 2.488113, 0.05098039, 0, 1, 1,
0.4536079, -0.7481171, 0.4903003, 0.05490196, 0, 1, 1,
0.4578889, -1.352306, 4.111187, 0.0627451, 0, 1, 1,
0.4593809, 1.151113, 1.555071, 0.06666667, 0, 1, 1,
0.4646228, 0.1703221, -0.3831041, 0.07450981, 0, 1, 1,
0.4659487, -0.3643765, 0.9950652, 0.07843138, 0, 1, 1,
0.4663449, 1.932128, 1.091419, 0.08627451, 0, 1, 1,
0.4677351, 0.4283698, 2.543749, 0.09019608, 0, 1, 1,
0.4697348, 0.7858433, -0.2974305, 0.09803922, 0, 1, 1,
0.4711221, -0.3919245, 2.758831, 0.1058824, 0, 1, 1,
0.4733783, -0.3625492, 2.765981, 0.1098039, 0, 1, 1,
0.4763966, -2.429468, 3.742758, 0.1176471, 0, 1, 1,
0.4771803, 0.2495197, 1.45512, 0.1215686, 0, 1, 1,
0.4809039, 0.2029377, 0.7409192, 0.1294118, 0, 1, 1,
0.4845732, -1.794513, 2.983764, 0.1333333, 0, 1, 1,
0.4879476, 0.1493019, 3.92273, 0.1411765, 0, 1, 1,
0.4885026, -0.1165559, 3.311379, 0.145098, 0, 1, 1,
0.4919265, 0.1143261, 2.451199, 0.1529412, 0, 1, 1,
0.4924214, -0.2379266, 2.636996, 0.1568628, 0, 1, 1,
0.4941571, 1.014184, -0.9329919, 0.1647059, 0, 1, 1,
0.4971684, -0.01027211, 2.271629, 0.1686275, 0, 1, 1,
0.4997239, -0.2418211, 1.709392, 0.1764706, 0, 1, 1,
0.5002893, 0.1686117, 0.6254589, 0.1803922, 0, 1, 1,
0.5031641, -0.0343248, 1.704607, 0.1882353, 0, 1, 1,
0.5039624, -1.2665, 3.217932, 0.1921569, 0, 1, 1,
0.5053176, -0.7734826, 2.252036, 0.2, 0, 1, 1,
0.5068707, -0.6641535, 4.85599, 0.2078431, 0, 1, 1,
0.5072053, 1.453787, 2.41239, 0.2117647, 0, 1, 1,
0.5113754, -1.123258, 2.197059, 0.2196078, 0, 1, 1,
0.5141156, 2.379854, 1.085262, 0.2235294, 0, 1, 1,
0.5152064, -0.3812409, 3.270455, 0.2313726, 0, 1, 1,
0.5227808, -0.7369965, 3.402776, 0.2352941, 0, 1, 1,
0.5242822, 1.280736, 0.06098073, 0.2431373, 0, 1, 1,
0.5266774, -0.6056731, 2.921309, 0.2470588, 0, 1, 1,
0.529723, 0.862191, 0.3805674, 0.254902, 0, 1, 1,
0.5306965, -0.8628445, 2.166843, 0.2588235, 0, 1, 1,
0.5317585, 1.675631, 0.9185776, 0.2666667, 0, 1, 1,
0.5392959, -1.561106, 3.904036, 0.2705882, 0, 1, 1,
0.5400892, -1.074969, 2.323531, 0.2784314, 0, 1, 1,
0.5418855, -0.0614262, 0.826536, 0.282353, 0, 1, 1,
0.5486483, -0.5758599, 2.811177, 0.2901961, 0, 1, 1,
0.5607278, 0.02092203, 1.768534, 0.2941177, 0, 1, 1,
0.5616183, -0.6549402, 4.181958, 0.3019608, 0, 1, 1,
0.5628704, 0.4225315, 0.2168079, 0.3098039, 0, 1, 1,
0.5701272, 1.097032, 0.6046019, 0.3137255, 0, 1, 1,
0.5703876, -1.64281, 2.596818, 0.3215686, 0, 1, 1,
0.5746784, -1.156093, 3.209781, 0.3254902, 0, 1, 1,
0.5856103, 0.4232609, 1.375098, 0.3333333, 0, 1, 1,
0.5959462, 1.205405, -1.018695, 0.3372549, 0, 1, 1,
0.5998955, -0.008815919, 1.714165, 0.345098, 0, 1, 1,
0.6004206, 1.093285, 0.8480312, 0.3490196, 0, 1, 1,
0.6037382, 2.068001, 0.8386437, 0.3568628, 0, 1, 1,
0.6046162, 0.4110158, 0.5557007, 0.3607843, 0, 1, 1,
0.6094582, -1.150426, 2.142652, 0.3686275, 0, 1, 1,
0.6129513, -1.698958, 4.244657, 0.372549, 0, 1, 1,
0.6161053, -1.333066, 1.808486, 0.3803922, 0, 1, 1,
0.6164766, 2.62732, -0.4936711, 0.3843137, 0, 1, 1,
0.6295622, -1.850633, 2.132389, 0.3921569, 0, 1, 1,
0.6380187, 0.526226, 2.599028, 0.3960784, 0, 1, 1,
0.6388816, -0.3916907, 1.448062, 0.4039216, 0, 1, 1,
0.6424599, -1.114171, 3.368176, 0.4117647, 0, 1, 1,
0.6444715, -0.5871998, 3.0303, 0.4156863, 0, 1, 1,
0.6446195, -1.122995, 3.303499, 0.4235294, 0, 1, 1,
0.6522352, 0.6018435, -0.05865612, 0.427451, 0, 1, 1,
0.6589155, 0.2576815, 2.314934, 0.4352941, 0, 1, 1,
0.6644563, -1.041399, 2.461543, 0.4392157, 0, 1, 1,
0.6654928, 0.1124193, 2.08774, 0.4470588, 0, 1, 1,
0.6677979, 0.5392769, 0.08251675, 0.4509804, 0, 1, 1,
0.6690418, -0.9913898, 1.366127, 0.4588235, 0, 1, 1,
0.6712028, -0.01341754, 2.849748, 0.4627451, 0, 1, 1,
0.671973, -0.4306096, 2.23448, 0.4705882, 0, 1, 1,
0.6725246, 0.4323546, 2.449189, 0.4745098, 0, 1, 1,
0.6737176, 0.4635412, 2.771783, 0.4823529, 0, 1, 1,
0.6738127, 0.4480897, -1.072207, 0.4862745, 0, 1, 1,
0.6762221, -2.596486, 3.43824, 0.4941176, 0, 1, 1,
0.6831397, -0.5132757, 3.238383, 0.5019608, 0, 1, 1,
0.6855961, -1.144592, 3.67101, 0.5058824, 0, 1, 1,
0.6913315, 1.697962, 0.875634, 0.5137255, 0, 1, 1,
0.6932193, 1.285497, 2.335756, 0.5176471, 0, 1, 1,
0.6956121, -0.03885252, 0.6989423, 0.5254902, 0, 1, 1,
0.6969084, 0.3641875, 0.9791884, 0.5294118, 0, 1, 1,
0.7013321, 0.004044325, 1.385167, 0.5372549, 0, 1, 1,
0.7013913, 0.2662954, -0.1006448, 0.5411765, 0, 1, 1,
0.7045718, -0.2851899, 2.321405, 0.5490196, 0, 1, 1,
0.7069106, -1.661981, 1.889537, 0.5529412, 0, 1, 1,
0.7073416, -1.311286, 3.38429, 0.5607843, 0, 1, 1,
0.7079331, 0.1195383, 1.507548, 0.5647059, 0, 1, 1,
0.7092703, 0.3210452, 1.995628, 0.572549, 0, 1, 1,
0.709664, 1.161408, 1.716995, 0.5764706, 0, 1, 1,
0.7115306, -1.05558, 5.03198, 0.5843138, 0, 1, 1,
0.7120951, 0.6917402, 0.9814115, 0.5882353, 0, 1, 1,
0.7131045, -0.2491567, 1.161431, 0.5960785, 0, 1, 1,
0.7131088, -0.1467533, 1.980359, 0.6039216, 0, 1, 1,
0.7164711, -0.4438111, 2.12988, 0.6078432, 0, 1, 1,
0.7207733, 1.328339, 0.9009587, 0.6156863, 0, 1, 1,
0.7229766, 2.218636, 1.112943, 0.6196079, 0, 1, 1,
0.7268131, -1.016985, 3.283728, 0.627451, 0, 1, 1,
0.7303343, -0.4101819, 0.5063069, 0.6313726, 0, 1, 1,
0.7324547, -0.4653619, 1.138231, 0.6392157, 0, 1, 1,
0.7333702, -0.6901193, 2.894455, 0.6431373, 0, 1, 1,
0.7384597, 0.3155725, -0.1685565, 0.6509804, 0, 1, 1,
0.7411354, 0.09053599, 0.1043945, 0.654902, 0, 1, 1,
0.7462325, 0.9417229, 1.697953, 0.6627451, 0, 1, 1,
0.7475452, 2.435062, -0.274479, 0.6666667, 0, 1, 1,
0.7507191, -0.5272053, 1.354178, 0.6745098, 0, 1, 1,
0.7552348, 0.2365265, 1.504134, 0.6784314, 0, 1, 1,
0.7675862, 0.6553012, 2.178376, 0.6862745, 0, 1, 1,
0.7705882, 0.1870328, -0.1563465, 0.6901961, 0, 1, 1,
0.7773191, -0.6150633, 1.971081, 0.6980392, 0, 1, 1,
0.7795939, 0.9407969, -0.4208015, 0.7058824, 0, 1, 1,
0.7796565, 0.3012511, 2.034947, 0.7098039, 0, 1, 1,
0.781646, -0.4231681, 2.445879, 0.7176471, 0, 1, 1,
0.7824978, 0.2316606, 0.8699981, 0.7215686, 0, 1, 1,
0.7874061, 0.9800449, 1.751238, 0.7294118, 0, 1, 1,
0.795381, 0.5867898, 0.4802744, 0.7333333, 0, 1, 1,
0.7958775, 0.119346, -0.228322, 0.7411765, 0, 1, 1,
0.8108098, -0.9401151, 2.146925, 0.7450981, 0, 1, 1,
0.8138554, -0.5536184, 2.253205, 0.7529412, 0, 1, 1,
0.8175236, 0.9106029, 0.3868667, 0.7568628, 0, 1, 1,
0.818122, -0.0203669, 1.193552, 0.7647059, 0, 1, 1,
0.8271878, 0.2091428, 1.510177, 0.7686275, 0, 1, 1,
0.8276925, -1.177135, 1.086911, 0.7764706, 0, 1, 1,
0.8290997, 1.764223, 1.410252, 0.7803922, 0, 1, 1,
0.8303064, 0.2509311, 0.7386626, 0.7882353, 0, 1, 1,
0.8371739, 2.263345, -0.1496264, 0.7921569, 0, 1, 1,
0.8407686, 1.318222, 1.187104, 0.8, 0, 1, 1,
0.8410448, -0.09863842, 1.932385, 0.8078431, 0, 1, 1,
0.8429189, 0.9634514, 0.4568686, 0.8117647, 0, 1, 1,
0.84383, 1.120503, 1.603894, 0.8196079, 0, 1, 1,
0.8548002, -2.114532, 3.298284, 0.8235294, 0, 1, 1,
0.8553011, -0.008197163, 3.965214, 0.8313726, 0, 1, 1,
0.8577127, 1.56109, 0.6121501, 0.8352941, 0, 1, 1,
0.8608661, 0.1353591, 3.056491, 0.8431373, 0, 1, 1,
0.8656712, 1.048443, -0.244807, 0.8470588, 0, 1, 1,
0.8675172, -1.924762, 4.338203, 0.854902, 0, 1, 1,
0.8710102, 0.006897715, 1.330606, 0.8588235, 0, 1, 1,
0.8718997, -1.700271, 1.815898, 0.8666667, 0, 1, 1,
0.8758834, 0.5436631, 1.935088, 0.8705882, 0, 1, 1,
0.8770477, -0.9712632, 1.759671, 0.8784314, 0, 1, 1,
0.8877134, 1.403655, 0.7192612, 0.8823529, 0, 1, 1,
0.8893492, 2.277427, -1.493389, 0.8901961, 0, 1, 1,
0.8904679, 1.482846, 0.5389205, 0.8941177, 0, 1, 1,
0.8939309, 0.4392333, -1.040726, 0.9019608, 0, 1, 1,
0.8954169, 0.830348, 2.044865, 0.9098039, 0, 1, 1,
0.9090468, 2.310801, 1.482661, 0.9137255, 0, 1, 1,
0.9118243, 0.6543667, -0.7554007, 0.9215686, 0, 1, 1,
0.9147134, -0.2561043, 1.849879, 0.9254902, 0, 1, 1,
0.9158009, 0.09343956, 0.56142, 0.9333333, 0, 1, 1,
0.9182336, -1.96876, 0.9887912, 0.9372549, 0, 1, 1,
0.9204916, -0.298643, 1.95689, 0.945098, 0, 1, 1,
0.9235804, -0.01080761, 1.415868, 0.9490196, 0, 1, 1,
0.9287032, 0.05525957, 0.820862, 0.9568627, 0, 1, 1,
0.9327174, -0.4397534, -0.04688146, 0.9607843, 0, 1, 1,
0.9388146, 0.8206351, -0.1553371, 0.9686275, 0, 1, 1,
0.9562338, 0.6243063, 0.6744263, 0.972549, 0, 1, 1,
0.9660406, -0.104428, 1.518267, 0.9803922, 0, 1, 1,
0.9698412, -0.456989, 2.732734, 0.9843137, 0, 1, 1,
0.972507, 1.463762, -0.5107954, 0.9921569, 0, 1, 1,
0.973568, 0.3096324, 1.669041, 0.9960784, 0, 1, 1,
0.9752343, -0.3913193, 0.1196403, 1, 0, 0.9960784, 1,
0.9760951, -0.02788517, 0.1996428, 1, 0, 0.9882353, 1,
0.9769139, 0.5622829, 0.2863191, 1, 0, 0.9843137, 1,
0.9806101, 0.9420252, 0.9246218, 1, 0, 0.9764706, 1,
0.9901565, 0.1670449, 0.983135, 1, 0, 0.972549, 1,
0.9928806, 1.26121, 0.4795518, 1, 0, 0.9647059, 1,
0.9933956, -1.66424, 4.142364, 1, 0, 0.9607843, 1,
1.00255, 1.077796, 0.5360669, 1, 0, 0.9529412, 1,
1.011651, 0.1920747, 0.3018596, 1, 0, 0.9490196, 1,
1.012249, 0.2018006, 0.7518662, 1, 0, 0.9411765, 1,
1.01521, -1.19681, 2.480138, 1, 0, 0.9372549, 1,
1.017975, -0.217392, 4.135273, 1, 0, 0.9294118, 1,
1.021531, 0.2561601, 2.525451, 1, 0, 0.9254902, 1,
1.026541, -0.6665418, 2.617669, 1, 0, 0.9176471, 1,
1.028256, -0.9450185, 1.957737, 1, 0, 0.9137255, 1,
1.032014, -1.086495, 1.787552, 1, 0, 0.9058824, 1,
1.044899, 0.1592941, 0.3992468, 1, 0, 0.9019608, 1,
1.048152, -0.1348516, 1.683118, 1, 0, 0.8941177, 1,
1.04876, 0.6209436, 1.193769, 1, 0, 0.8862745, 1,
1.048873, -0.2655168, 1.155953, 1, 0, 0.8823529, 1,
1.051819, 1.07433, -0.666538, 1, 0, 0.8745098, 1,
1.052366, -0.7337648, 1.370575, 1, 0, 0.8705882, 1,
1.06406, -0.30972, 2.860468, 1, 0, 0.8627451, 1,
1.06448, 1.455378, 1.246176, 1, 0, 0.8588235, 1,
1.065005, -0.2941695, 0.282159, 1, 0, 0.8509804, 1,
1.070209, 0.1618985, 0.6299429, 1, 0, 0.8470588, 1,
1.070941, -1.817258, 2.60282, 1, 0, 0.8392157, 1,
1.073398, 0.427361, 0.6305895, 1, 0, 0.8352941, 1,
1.075234, 0.6933162, 0.05364516, 1, 0, 0.827451, 1,
1.075491, 0.1151957, 1.449783, 1, 0, 0.8235294, 1,
1.085533, -0.8334387, 2.922366, 1, 0, 0.8156863, 1,
1.1212, -0.4577607, 1.792648, 1, 0, 0.8117647, 1,
1.123402, 0.4361598, 1.058175, 1, 0, 0.8039216, 1,
1.128992, 1.858388, -0.2085678, 1, 0, 0.7960784, 1,
1.131237, 1.002049, 1.213521, 1, 0, 0.7921569, 1,
1.131982, -1.381941, 2.18331, 1, 0, 0.7843137, 1,
1.141497, 1.05352, 0.9231825, 1, 0, 0.7803922, 1,
1.142554, 0.7979162, 2.035712, 1, 0, 0.772549, 1,
1.143377, -1.038255, 1.582909, 1, 0, 0.7686275, 1,
1.143883, -1.591893, 1.41981, 1, 0, 0.7607843, 1,
1.145821, 0.1994758, 4.131583, 1, 0, 0.7568628, 1,
1.149323, -0.05470236, 1.775303, 1, 0, 0.7490196, 1,
1.156114, 0.3013135, 2.715816, 1, 0, 0.7450981, 1,
1.15625, -1.391168, 3.56431, 1, 0, 0.7372549, 1,
1.169022, -1.461935, 0.9600559, 1, 0, 0.7333333, 1,
1.184039, -0.8620298, 2.050832, 1, 0, 0.7254902, 1,
1.186216, -0.3739865, 1.057103, 1, 0, 0.7215686, 1,
1.190647, 0.04695713, 0.7444489, 1, 0, 0.7137255, 1,
1.19426, 2.490989, -0.506272, 1, 0, 0.7098039, 1,
1.195893, -0.2424357, 1.89975, 1, 0, 0.7019608, 1,
1.202322, 0.2764618, 2.245019, 1, 0, 0.6941177, 1,
1.203401, 0.4037855, 1.159885, 1, 0, 0.6901961, 1,
1.203644, 1.456828, 1.940848, 1, 0, 0.682353, 1,
1.205664, 0.8294047, 0.8499255, 1, 0, 0.6784314, 1,
1.206625, -0.3483066, 2.765104, 1, 0, 0.6705883, 1,
1.210398, -0.08398022, 1.155874, 1, 0, 0.6666667, 1,
1.210782, -1.032726, 2.815919, 1, 0, 0.6588235, 1,
1.212539, -0.5082605, -0.1245948, 1, 0, 0.654902, 1,
1.218841, 0.246237, 1.387945, 1, 0, 0.6470588, 1,
1.219027, -0.01363127, 1.332314, 1, 0, 0.6431373, 1,
1.229903, -1.257103, 2.439119, 1, 0, 0.6352941, 1,
1.23752, -1.868426, 2.696961, 1, 0, 0.6313726, 1,
1.239289, 1.455338, 2.683885, 1, 0, 0.6235294, 1,
1.254239, 0.5730366, 0.1928755, 1, 0, 0.6196079, 1,
1.256499, -0.4899918, 0.9485729, 1, 0, 0.6117647, 1,
1.261797, -0.4494124, 2.876817, 1, 0, 0.6078432, 1,
1.267312, -0.09460171, 2.986654, 1, 0, 0.6, 1,
1.270331, 0.4424568, 1.799735, 1, 0, 0.5921569, 1,
1.270544, -0.2412348, 2.713846, 1, 0, 0.5882353, 1,
1.284027, 2.097827, 2.159174, 1, 0, 0.5803922, 1,
1.289275, 0.5088743, 1.458433, 1, 0, 0.5764706, 1,
1.294183, -1.341264, 0.9042829, 1, 0, 0.5686275, 1,
1.300308, 0.8439118, 0.689162, 1, 0, 0.5647059, 1,
1.301826, 0.02292658, -0.6782123, 1, 0, 0.5568628, 1,
1.303437, -0.4501498, 3.691389, 1, 0, 0.5529412, 1,
1.313087, -0.3406469, 1.552651, 1, 0, 0.5450981, 1,
1.315707, 1.621837, 0.2168509, 1, 0, 0.5411765, 1,
1.333757, 0.3095247, -0.7148025, 1, 0, 0.5333334, 1,
1.339796, -0.466924, -1.219937, 1, 0, 0.5294118, 1,
1.346311, 0.9216819, 0.1418297, 1, 0, 0.5215687, 1,
1.347885, -0.6746135, 1.690472, 1, 0, 0.5176471, 1,
1.348219, -0.2431759, 1.20739, 1, 0, 0.509804, 1,
1.359692, 0.2368987, 2.986692, 1, 0, 0.5058824, 1,
1.368768, 0.1907991, 1.530387, 1, 0, 0.4980392, 1,
1.390271, -0.306601, 1.586454, 1, 0, 0.4901961, 1,
1.392863, 0.4407167, 0.7199391, 1, 0, 0.4862745, 1,
1.397504, -0.05309395, 2.494885, 1, 0, 0.4784314, 1,
1.409291, -0.0694759, 1.201304, 1, 0, 0.4745098, 1,
1.415371, -0.8385827, 2.273758, 1, 0, 0.4666667, 1,
1.422077, 0.6347036, 1.618048, 1, 0, 0.4627451, 1,
1.427142, 0.4831492, 0.8999519, 1, 0, 0.454902, 1,
1.438279, 1.555018, 0.732375, 1, 0, 0.4509804, 1,
1.45064, 0.5236096, 1.049903, 1, 0, 0.4431373, 1,
1.461792, 1.763814, 0.9137005, 1, 0, 0.4392157, 1,
1.470932, -0.8200746, 2.934867, 1, 0, 0.4313726, 1,
1.49107, 1.015634, 1.323975, 1, 0, 0.427451, 1,
1.493271, -0.7451566, -0.1121258, 1, 0, 0.4196078, 1,
1.507902, -2.53192, 3.063515, 1, 0, 0.4156863, 1,
1.548927, -1.021649, 3.24736, 1, 0, 0.4078431, 1,
1.551154, -0.9677649, 2.375281, 1, 0, 0.4039216, 1,
1.56154, 0.5952101, 2.29606, 1, 0, 0.3960784, 1,
1.563981, 0.2691671, 0.6947516, 1, 0, 0.3882353, 1,
1.573357, 1.008076, 1.986231, 1, 0, 0.3843137, 1,
1.600673, -0.9010686, 1.978184, 1, 0, 0.3764706, 1,
1.601883, -0.363594, 2.088112, 1, 0, 0.372549, 1,
1.608082, -2.033759, 1.253384, 1, 0, 0.3647059, 1,
1.61024, 1.542662, 1.082664, 1, 0, 0.3607843, 1,
1.618418, 1.110778, 1.525133, 1, 0, 0.3529412, 1,
1.647175, 0.3038647, 2.643835, 1, 0, 0.3490196, 1,
1.674373, 1.345637, 2.43604, 1, 0, 0.3411765, 1,
1.677871, 0.9942721, 1.157741, 1, 0, 0.3372549, 1,
1.695519, -0.6880956, -0.09414741, 1, 0, 0.3294118, 1,
1.73291, -0.8730312, 2.358432, 1, 0, 0.3254902, 1,
1.735029, -0.9165018, 0.4890172, 1, 0, 0.3176471, 1,
1.743693, -0.436633, 2.752298, 1, 0, 0.3137255, 1,
1.744504, 0.882373, 1.945384, 1, 0, 0.3058824, 1,
1.761051, -0.06274257, 0.8265356, 1, 0, 0.2980392, 1,
1.778429, -0.6892502, 1.834883, 1, 0, 0.2941177, 1,
1.781924, -0.68828, 2.074688, 1, 0, 0.2862745, 1,
1.789854, -0.07331699, 0.04717713, 1, 0, 0.282353, 1,
1.79359, 3.056189, -0.72233, 1, 0, 0.2745098, 1,
1.823771, -1.205572, 1.466768, 1, 0, 0.2705882, 1,
1.859786, -1.02612, 0.6750756, 1, 0, 0.2627451, 1,
1.863225, 0.8449099, 0.1584669, 1, 0, 0.2588235, 1,
1.868604, -0.2651471, 1.272895, 1, 0, 0.2509804, 1,
1.880084, -0.7165182, 2.76965, 1, 0, 0.2470588, 1,
1.889796, -0.2605122, 2.181626, 1, 0, 0.2392157, 1,
1.893688, 0.6775494, 0.8464365, 1, 0, 0.2352941, 1,
1.909819, -0.1613001, 2.622393, 1, 0, 0.227451, 1,
1.910845, -0.08407929, 1.16826, 1, 0, 0.2235294, 1,
1.92868, -0.3208553, 2.421438, 1, 0, 0.2156863, 1,
1.929419, 2.021549, 0.5567835, 1, 0, 0.2117647, 1,
1.934251, -0.193615, 0.5582572, 1, 0, 0.2039216, 1,
1.934985, 0.09350283, 1.151254, 1, 0, 0.1960784, 1,
1.989673, -0.05442565, 1.234161, 1, 0, 0.1921569, 1,
2.004905, -0.507413, 2.794578, 1, 0, 0.1843137, 1,
2.008764, 0.1500834, 0.8438098, 1, 0, 0.1803922, 1,
2.040131, -1.898297, 1.829111, 1, 0, 0.172549, 1,
2.043362, 0.4877334, 1.273291, 1, 0, 0.1686275, 1,
2.106138, -0.6021914, 2.534655, 1, 0, 0.1607843, 1,
2.151017, 0.05857375, 1.662418, 1, 0, 0.1568628, 1,
2.154726, -0.7351059, 1.672494, 1, 0, 0.1490196, 1,
2.170518, -1.862436, 2.076197, 1, 0, 0.145098, 1,
2.178538, 0.809507, 1.015711, 1, 0, 0.1372549, 1,
2.179388, -0.2879369, 0.6705031, 1, 0, 0.1333333, 1,
2.201739, 0.9917759, 1.068336, 1, 0, 0.1254902, 1,
2.203396, 0.07678292, 2.692909, 1, 0, 0.1215686, 1,
2.265132, -1.07269, 0.7008643, 1, 0, 0.1137255, 1,
2.272329, -0.934579, 1.503702, 1, 0, 0.1098039, 1,
2.277476, 0.2005879, 3.187042, 1, 0, 0.1019608, 1,
2.321782, -1.571216, 1.737356, 1, 0, 0.09411765, 1,
2.443091, 1.029555, 1.387823, 1, 0, 0.09019608, 1,
2.456281, 0.4168283, 0.09712356, 1, 0, 0.08235294, 1,
2.464523, 0.0963392, 3.288516, 1, 0, 0.07843138, 1,
2.479789, -1.894444, 2.292139, 1, 0, 0.07058824, 1,
2.485208, -0.7740787, 1.537802, 1, 0, 0.06666667, 1,
2.493057, -0.8148147, 3.623223, 1, 0, 0.05882353, 1,
2.532398, -0.05724012, 1.383584, 1, 0, 0.05490196, 1,
2.675031, -0.3713441, 2.818642, 1, 0, 0.04705882, 1,
2.67529, -0.1413471, 2.246848, 1, 0, 0.04313726, 1,
2.702104, 0.05957386, -0.1920841, 1, 0, 0.03529412, 1,
2.998374, -0.1918755, 2.433484, 1, 0, 0.03137255, 1,
3.042624, -1.538525, -0.394128, 1, 0, 0.02352941, 1,
3.062552, -0.8404313, 1.114098, 1, 0, 0.01960784, 1,
3.290337, 1.527689, -0.6201319, 1, 0, 0.01176471, 1,
3.429494, 1.642504, 1.610469, 1, 0, 0.007843138, 1
]);
var buf7 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf7);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc7 = gl.getUniformLocation(prog7,"mvMatrix");
var prMatLoc7 = gl.getUniformLocation(prog7,"prMatrix");
// ****** text object 9 ******
var prog9  = gl.createProgram();
gl.attachShader(prog9, getShader( gl, "testglvshader9" ));
gl.attachShader(prog9, getShader( gl, "testglfshader9" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog9, 0, "aPos");
gl.bindAttribLocation(prog9, 1, "aCol");
gl.linkProgram(prog9);
var texts = [
"x"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX9 = texinfo.canvasX;
var canvasY9 = texinfo.canvasY;
var ofsLoc9 = gl.getAttribLocation(prog9, "aOfs");
var texture9 = gl.createTexture();
var texLoc9 = gl.getAttribLocation(prog9, "aTexcoord");
var sampler9 = gl.getUniformLocation(prog9,"uSampler");
handleLoadedTexture(texture9, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
0.203433, -4.642883, -6.813531, 0, -0.5, 0.5, 0.5,
0.203433, -4.642883, -6.813531, 1, -0.5, 0.5, 0.5,
0.203433, -4.642883, -6.813531, 1, 1.5, 0.5, 0.5,
0.203433, -4.642883, -6.813531, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf9 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf9);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf9 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf9);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc9 = gl.getUniformLocation(prog9,"mvMatrix");
var prMatLoc9 = gl.getUniformLocation(prog9,"prMatrix");
var textScaleLoc9 = gl.getUniformLocation(prog9,"textScale");
// ****** text object 10 ******
var prog10  = gl.createProgram();
gl.attachShader(prog10, getShader( gl, "testglvshader10" ));
gl.attachShader(prog10, getShader( gl, "testglfshader10" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog10, 0, "aPos");
gl.bindAttribLocation(prog10, 1, "aCol");
gl.linkProgram(prog10);
var texts = [
"y"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX10 = texinfo.canvasX;
var canvasY10 = texinfo.canvasY;
var ofsLoc10 = gl.getAttribLocation(prog10, "aOfs");
var texture10 = gl.createTexture();
var texLoc10 = gl.getAttribLocation(prog10, "aTexcoord");
var sampler10 = gl.getUniformLocation(prog10,"uSampler");
handleLoadedTexture(texture10, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-4.116263, -0.2354194, -6.813531, 0, -0.5, 0.5, 0.5,
-4.116263, -0.2354194, -6.813531, 1, -0.5, 0.5, 0.5,
-4.116263, -0.2354194, -6.813531, 1, 1.5, 0.5, 0.5,
-4.116263, -0.2354194, -6.813531, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf10 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf10);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf10 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf10);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc10 = gl.getUniformLocation(prog10,"mvMatrix");
var prMatLoc10 = gl.getUniformLocation(prog10,"prMatrix");
var textScaleLoc10 = gl.getUniformLocation(prog10,"textScale");
// ****** text object 11 ******
var prog11  = gl.createProgram();
gl.attachShader(prog11, getShader( gl, "testglvshader11" ));
gl.attachShader(prog11, getShader( gl, "testglfshader11" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog11, 0, "aPos");
gl.bindAttribLocation(prog11, 1, "aCol");
gl.linkProgram(prog11);
var texts = [
"z"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX11 = texinfo.canvasX;
var canvasY11 = texinfo.canvasY;
var ofsLoc11 = gl.getAttribLocation(prog11, "aOfs");
var texture11 = gl.createTexture();
var texLoc11 = gl.getAttribLocation(prog11, "aTexcoord");
var sampler11 = gl.getUniformLocation(prog11,"uSampler");
handleLoadedTexture(texture11, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-4.116263, -4.642883, 0.1343076, 0, -0.5, 0.5, 0.5,
-4.116263, -4.642883, 0.1343076, 1, -0.5, 0.5, 0.5,
-4.116263, -4.642883, 0.1343076, 1, 1.5, 0.5, 0.5,
-4.116263, -4.642883, 0.1343076, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf11 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf11);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf11 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf11);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc11 = gl.getUniformLocation(prog11,"mvMatrix");
var prMatLoc11 = gl.getUniformLocation(prog11,"prMatrix");
var textScaleLoc11 = gl.getUniformLocation(prog11,"textScale");
// ****** lines object 12 ******
var prog12  = gl.createProgram();
gl.attachShader(prog12, getShader( gl, "testglvshader12" ));
gl.attachShader(prog12, getShader( gl, "testglfshader12" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog12, 0, "aPos");
gl.bindAttribLocation(prog12, 1, "aCol");
gl.linkProgram(prog12);
var v=new Float32Array([
-3, -3.625776, -5.210184,
3, -3.625776, -5.210184,
-3, -3.625776, -5.210184,
-3, -3.795294, -5.477408,
-2, -3.625776, -5.210184,
-2, -3.795294, -5.477408,
-1, -3.625776, -5.210184,
-1, -3.795294, -5.477408,
0, -3.625776, -5.210184,
0, -3.795294, -5.477408,
1, -3.625776, -5.210184,
1, -3.795294, -5.477408,
2, -3.625776, -5.210184,
2, -3.795294, -5.477408,
3, -3.625776, -5.210184,
3, -3.795294, -5.477408
]);
var buf12 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf12);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc12 = gl.getUniformLocation(prog12,"mvMatrix");
var prMatLoc12 = gl.getUniformLocation(prog12,"prMatrix");
// ****** text object 13 ******
var prog13  = gl.createProgram();
gl.attachShader(prog13, getShader( gl, "testglvshader13" ));
gl.attachShader(prog13, getShader( gl, "testglfshader13" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog13, 0, "aPos");
gl.bindAttribLocation(prog13, 1, "aCol");
gl.linkProgram(prog13);
var texts = [
"-3",
"-2",
"-1",
"0",
"1",
"2",
"3"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX13 = texinfo.canvasX;
var canvasY13 = texinfo.canvasY;
var ofsLoc13 = gl.getAttribLocation(prog13, "aOfs");
var texture13 = gl.createTexture();
var texLoc13 = gl.getAttribLocation(prog13, "aTexcoord");
var sampler13 = gl.getUniformLocation(prog13,"uSampler");
handleLoadedTexture(texture13, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-3, -4.134329, -6.011857, 0, -0.5, 0.5, 0.5,
-3, -4.134329, -6.011857, 1, -0.5, 0.5, 0.5,
-3, -4.134329, -6.011857, 1, 1.5, 0.5, 0.5,
-3, -4.134329, -6.011857, 0, 1.5, 0.5, 0.5,
-2, -4.134329, -6.011857, 0, -0.5, 0.5, 0.5,
-2, -4.134329, -6.011857, 1, -0.5, 0.5, 0.5,
-2, -4.134329, -6.011857, 1, 1.5, 0.5, 0.5,
-2, -4.134329, -6.011857, 0, 1.5, 0.5, 0.5,
-1, -4.134329, -6.011857, 0, -0.5, 0.5, 0.5,
-1, -4.134329, -6.011857, 1, -0.5, 0.5, 0.5,
-1, -4.134329, -6.011857, 1, 1.5, 0.5, 0.5,
-1, -4.134329, -6.011857, 0, 1.5, 0.5, 0.5,
0, -4.134329, -6.011857, 0, -0.5, 0.5, 0.5,
0, -4.134329, -6.011857, 1, -0.5, 0.5, 0.5,
0, -4.134329, -6.011857, 1, 1.5, 0.5, 0.5,
0, -4.134329, -6.011857, 0, 1.5, 0.5, 0.5,
1, -4.134329, -6.011857, 0, -0.5, 0.5, 0.5,
1, -4.134329, -6.011857, 1, -0.5, 0.5, 0.5,
1, -4.134329, -6.011857, 1, 1.5, 0.5, 0.5,
1, -4.134329, -6.011857, 0, 1.5, 0.5, 0.5,
2, -4.134329, -6.011857, 0, -0.5, 0.5, 0.5,
2, -4.134329, -6.011857, 1, -0.5, 0.5, 0.5,
2, -4.134329, -6.011857, 1, 1.5, 0.5, 0.5,
2, -4.134329, -6.011857, 0, 1.5, 0.5, 0.5,
3, -4.134329, -6.011857, 0, -0.5, 0.5, 0.5,
3, -4.134329, -6.011857, 1, -0.5, 0.5, 0.5,
3, -4.134329, -6.011857, 1, 1.5, 0.5, 0.5,
3, -4.134329, -6.011857, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<7; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15,
16, 17, 18, 16, 18, 19,
20, 21, 22, 20, 22, 23,
24, 25, 26, 24, 26, 27
]);
var buf13 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf13);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf13 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf13);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc13 = gl.getUniformLocation(prog13,"mvMatrix");
var prMatLoc13 = gl.getUniformLocation(prog13,"prMatrix");
var textScaleLoc13 = gl.getUniformLocation(prog13,"textScale");
// ****** lines object 14 ******
var prog14  = gl.createProgram();
gl.attachShader(prog14, getShader( gl, "testglvshader14" ));
gl.attachShader(prog14, getShader( gl, "testglfshader14" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog14, 0, "aPos");
gl.bindAttribLocation(prog14, 1, "aCol");
gl.linkProgram(prog14);
var v=new Float32Array([
-3.11941, -3, -5.210184,
-3.11941, 3, -5.210184,
-3.11941, -3, -5.210184,
-3.285552, -3, -5.477408,
-3.11941, -2, -5.210184,
-3.285552, -2, -5.477408,
-3.11941, -1, -5.210184,
-3.285552, -1, -5.477408,
-3.11941, 0, -5.210184,
-3.285552, 0, -5.477408,
-3.11941, 1, -5.210184,
-3.285552, 1, -5.477408,
-3.11941, 2, -5.210184,
-3.285552, 2, -5.477408,
-3.11941, 3, -5.210184,
-3.285552, 3, -5.477408
]);
var buf14 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf14);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc14 = gl.getUniformLocation(prog14,"mvMatrix");
var prMatLoc14 = gl.getUniformLocation(prog14,"prMatrix");
// ****** text object 15 ******
var prog15  = gl.createProgram();
gl.attachShader(prog15, getShader( gl, "testglvshader15" ));
gl.attachShader(prog15, getShader( gl, "testglfshader15" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog15, 0, "aPos");
gl.bindAttribLocation(prog15, 1, "aCol");
gl.linkProgram(prog15);
var texts = [
"-3",
"-2",
"-1",
"0",
"1",
"2",
"3"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX15 = texinfo.canvasX;
var canvasY15 = texinfo.canvasY;
var ofsLoc15 = gl.getAttribLocation(prog15, "aOfs");
var texture15 = gl.createTexture();
var texLoc15 = gl.getAttribLocation(prog15, "aTexcoord");
var sampler15 = gl.getUniformLocation(prog15,"uSampler");
handleLoadedTexture(texture15, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-3.617836, -3, -6.011857, 0, -0.5, 0.5, 0.5,
-3.617836, -3, -6.011857, 1, -0.5, 0.5, 0.5,
-3.617836, -3, -6.011857, 1, 1.5, 0.5, 0.5,
-3.617836, -3, -6.011857, 0, 1.5, 0.5, 0.5,
-3.617836, -2, -6.011857, 0, -0.5, 0.5, 0.5,
-3.617836, -2, -6.011857, 1, -0.5, 0.5, 0.5,
-3.617836, -2, -6.011857, 1, 1.5, 0.5, 0.5,
-3.617836, -2, -6.011857, 0, 1.5, 0.5, 0.5,
-3.617836, -1, -6.011857, 0, -0.5, 0.5, 0.5,
-3.617836, -1, -6.011857, 1, -0.5, 0.5, 0.5,
-3.617836, -1, -6.011857, 1, 1.5, 0.5, 0.5,
-3.617836, -1, -6.011857, 0, 1.5, 0.5, 0.5,
-3.617836, 0, -6.011857, 0, -0.5, 0.5, 0.5,
-3.617836, 0, -6.011857, 1, -0.5, 0.5, 0.5,
-3.617836, 0, -6.011857, 1, 1.5, 0.5, 0.5,
-3.617836, 0, -6.011857, 0, 1.5, 0.5, 0.5,
-3.617836, 1, -6.011857, 0, -0.5, 0.5, 0.5,
-3.617836, 1, -6.011857, 1, -0.5, 0.5, 0.5,
-3.617836, 1, -6.011857, 1, 1.5, 0.5, 0.5,
-3.617836, 1, -6.011857, 0, 1.5, 0.5, 0.5,
-3.617836, 2, -6.011857, 0, -0.5, 0.5, 0.5,
-3.617836, 2, -6.011857, 1, -0.5, 0.5, 0.5,
-3.617836, 2, -6.011857, 1, 1.5, 0.5, 0.5,
-3.617836, 2, -6.011857, 0, 1.5, 0.5, 0.5,
-3.617836, 3, -6.011857, 0, -0.5, 0.5, 0.5,
-3.617836, 3, -6.011857, 1, -0.5, 0.5, 0.5,
-3.617836, 3, -6.011857, 1, 1.5, 0.5, 0.5,
-3.617836, 3, -6.011857, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<7; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15,
16, 17, 18, 16, 18, 19,
20, 21, 22, 20, 22, 23,
24, 25, 26, 24, 26, 27
]);
var buf15 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf15);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf15 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf15);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc15 = gl.getUniformLocation(prog15,"mvMatrix");
var prMatLoc15 = gl.getUniformLocation(prog15,"prMatrix");
var textScaleLoc15 = gl.getUniformLocation(prog15,"textScale");
// ****** lines object 16 ******
var prog16  = gl.createProgram();
gl.attachShader(prog16, getShader( gl, "testglvshader16" ));
gl.attachShader(prog16, getShader( gl, "testglfshader16" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog16, 0, "aPos");
gl.bindAttribLocation(prog16, 1, "aCol");
gl.linkProgram(prog16);
var v=new Float32Array([
-3.11941, -3.625776, -4,
-3.11941, -3.625776, 4,
-3.11941, -3.625776, -4,
-3.285552, -3.795294, -4,
-3.11941, -3.625776, -2,
-3.285552, -3.795294, -2,
-3.11941, -3.625776, 0,
-3.285552, -3.795294, 0,
-3.11941, -3.625776, 2,
-3.285552, -3.795294, 2,
-3.11941, -3.625776, 4,
-3.285552, -3.795294, 4
]);
var buf16 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf16);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc16 = gl.getUniformLocation(prog16,"mvMatrix");
var prMatLoc16 = gl.getUniformLocation(prog16,"prMatrix");
// ****** text object 17 ******
var prog17  = gl.createProgram();
gl.attachShader(prog17, getShader( gl, "testglvshader17" ));
gl.attachShader(prog17, getShader( gl, "testglfshader17" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog17, 0, "aPos");
gl.bindAttribLocation(prog17, 1, "aCol");
gl.linkProgram(prog17);
var texts = [
"-4",
"-2",
"0",
"2",
"4"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX17 = texinfo.canvasX;
var canvasY17 = texinfo.canvasY;
var ofsLoc17 = gl.getAttribLocation(prog17, "aOfs");
var texture17 = gl.createTexture();
var texLoc17 = gl.getAttribLocation(prog17, "aTexcoord");
var sampler17 = gl.getUniformLocation(prog17,"uSampler");
handleLoadedTexture(texture17, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-3.617836, -4.134329, -4, 0, -0.5, 0.5, 0.5,
-3.617836, -4.134329, -4, 1, -0.5, 0.5, 0.5,
-3.617836, -4.134329, -4, 1, 1.5, 0.5, 0.5,
-3.617836, -4.134329, -4, 0, 1.5, 0.5, 0.5,
-3.617836, -4.134329, -2, 0, -0.5, 0.5, 0.5,
-3.617836, -4.134329, -2, 1, -0.5, 0.5, 0.5,
-3.617836, -4.134329, -2, 1, 1.5, 0.5, 0.5,
-3.617836, -4.134329, -2, 0, 1.5, 0.5, 0.5,
-3.617836, -4.134329, 0, 0, -0.5, 0.5, 0.5,
-3.617836, -4.134329, 0, 1, -0.5, 0.5, 0.5,
-3.617836, -4.134329, 0, 1, 1.5, 0.5, 0.5,
-3.617836, -4.134329, 0, 0, 1.5, 0.5, 0.5,
-3.617836, -4.134329, 2, 0, -0.5, 0.5, 0.5,
-3.617836, -4.134329, 2, 1, -0.5, 0.5, 0.5,
-3.617836, -4.134329, 2, 1, 1.5, 0.5, 0.5,
-3.617836, -4.134329, 2, 0, 1.5, 0.5, 0.5,
-3.617836, -4.134329, 4, 0, -0.5, 0.5, 0.5,
-3.617836, -4.134329, 4, 1, -0.5, 0.5, 0.5,
-3.617836, -4.134329, 4, 1, 1.5, 0.5, 0.5,
-3.617836, -4.134329, 4, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<5; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15,
16, 17, 18, 16, 18, 19
]);
var buf17 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf17);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf17 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf17);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc17 = gl.getUniformLocation(prog17,"mvMatrix");
var prMatLoc17 = gl.getUniformLocation(prog17,"prMatrix");
var textScaleLoc17 = gl.getUniformLocation(prog17,"textScale");
// ****** lines object 18 ******
var prog18  = gl.createProgram();
gl.attachShader(prog18, getShader( gl, "testglvshader18" ));
gl.attachShader(prog18, getShader( gl, "testglfshader18" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog18, 0, "aPos");
gl.bindAttribLocation(prog18, 1, "aCol");
gl.linkProgram(prog18);
var v=new Float32Array([
-3.11941, -3.625776, -5.210184,
-3.11941, 3.154937, -5.210184,
-3.11941, -3.625776, 5.478799,
-3.11941, 3.154937, 5.478799,
-3.11941, -3.625776, -5.210184,
-3.11941, -3.625776, 5.478799,
-3.11941, 3.154937, -5.210184,
-3.11941, 3.154937, 5.478799,
-3.11941, -3.625776, -5.210184,
3.526276, -3.625776, -5.210184,
-3.11941, -3.625776, 5.478799,
3.526276, -3.625776, 5.478799,
-3.11941, 3.154937, -5.210184,
3.526276, 3.154937, -5.210184,
-3.11941, 3.154937, 5.478799,
3.526276, 3.154937, 5.478799,
3.526276, -3.625776, -5.210184,
3.526276, 3.154937, -5.210184,
3.526276, -3.625776, 5.478799,
3.526276, 3.154937, 5.478799,
3.526276, -3.625776, -5.210184,
3.526276, -3.625776, 5.478799,
3.526276, 3.154937, -5.210184,
3.526276, 3.154937, 5.478799
]);
var buf18 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf18);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc18 = gl.getUniformLocation(prog18,"mvMatrix");
var prMatLoc18 = gl.getUniformLocation(prog18,"prMatrix");
gl.enable(gl.DEPTH_TEST);
gl.depthFunc(gl.LEQUAL);
gl.clearDepth(1.0);
gl.clearColor(1,1,1,1);
var xOffs = yOffs = 0,  drag  = 0;
function multMV(M, v) {
return [M.m11*v[0] + M.m12*v[1] + M.m13*v[2] + M.m14*v[3],
M.m21*v[0] + M.m22*v[1] + M.m23*v[2] + M.m24*v[3],
M.m31*v[0] + M.m32*v[1] + M.m33*v[2] + M.m34*v[3],
M.m41*v[0] + M.m42*v[1] + M.m43*v[2] + M.m44*v[3]];
}
drawScene();
function drawScene(){
gl.depthMask(true);
gl.disable(gl.BLEND);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
// ***** subscene 1 ****
gl.viewport(0, 0, 504, 504);
gl.scissor(0, 0, 504, 504);
gl.clearColor(1, 1, 1, 1);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
var radius = 7.634196;
var distance = 33.9654;
var t = tan(fov[1]*PI/360);
var near = distance - radius;
var far = distance + radius;
var hlen = t*near;
var aspect = 1;
prMatrix.makeIdentity();
if (aspect > 1)
prMatrix.frustum(-hlen*aspect*zoom[1], hlen*aspect*zoom[1], 
-hlen*zoom[1], hlen*zoom[1], near, far);
else  
prMatrix.frustum(-hlen*zoom[1], hlen*zoom[1], 
-hlen*zoom[1]/aspect, hlen*zoom[1]/aspect, 
near, far);
mvMatrix.makeIdentity();
mvMatrix.translate( -0.203433, 0.2354194, -0.1343076 );
mvMatrix.scale( 1.242045, 1.217312, 0.7722197 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.9654);
// ****** points object 7 *******
gl.useProgram(prog7);
gl.bindBuffer(gl.ARRAY_BUFFER, buf7);
gl.uniformMatrix4fv( prMatLoc7, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc7, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.enableVertexAttribArray( colLoc );
gl.vertexAttribPointer(colLoc, 4, gl.FLOAT, false, 28, 12);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawArrays(gl.POINTS, 0, 1000);
// ****** text object 9 *******
gl.useProgram(prog9);
gl.bindBuffer(gl.ARRAY_BUFFER, buf9);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf9);
gl.uniformMatrix4fv( prMatLoc9, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc9, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc9, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc9 );
gl.vertexAttribPointer(texLoc9, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture9);
gl.uniform1i( sampler9, 0);
gl.enableVertexAttribArray( ofsLoc9 );
gl.vertexAttribPointer(ofsLoc9, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** text object 10 *******
gl.useProgram(prog10);
gl.bindBuffer(gl.ARRAY_BUFFER, buf10);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf10);
gl.uniformMatrix4fv( prMatLoc10, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc10, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc10, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc10 );
gl.vertexAttribPointer(texLoc10, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture10);
gl.uniform1i( sampler10, 0);
gl.enableVertexAttribArray( ofsLoc10 );
gl.vertexAttribPointer(ofsLoc10, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** text object 11 *******
gl.useProgram(prog11);
gl.bindBuffer(gl.ARRAY_BUFFER, buf11);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf11);
gl.uniformMatrix4fv( prMatLoc11, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc11, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc11, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc11 );
gl.vertexAttribPointer(texLoc11, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture11);
gl.uniform1i( sampler11, 0);
gl.enableVertexAttribArray( ofsLoc11 );
gl.vertexAttribPointer(ofsLoc11, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** lines object 12 *******
gl.useProgram(prog12);
gl.bindBuffer(gl.ARRAY_BUFFER, buf12);
gl.uniformMatrix4fv( prMatLoc12, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc12, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 16);
// ****** text object 13 *******
gl.useProgram(prog13);
gl.bindBuffer(gl.ARRAY_BUFFER, buf13);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf13);
gl.uniformMatrix4fv( prMatLoc13, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc13, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc13, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc13 );
gl.vertexAttribPointer(texLoc13, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture13);
gl.uniform1i( sampler13, 0);
gl.enableVertexAttribArray( ofsLoc13 );
gl.vertexAttribPointer(ofsLoc13, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 42, gl.UNSIGNED_SHORT, 0);
// ****** lines object 14 *******
gl.useProgram(prog14);
gl.bindBuffer(gl.ARRAY_BUFFER, buf14);
gl.uniformMatrix4fv( prMatLoc14, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc14, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 16);
// ****** text object 15 *******
gl.useProgram(prog15);
gl.bindBuffer(gl.ARRAY_BUFFER, buf15);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf15);
gl.uniformMatrix4fv( prMatLoc15, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc15, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc15, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc15 );
gl.vertexAttribPointer(texLoc15, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture15);
gl.uniform1i( sampler15, 0);
gl.enableVertexAttribArray( ofsLoc15 );
gl.vertexAttribPointer(ofsLoc15, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 42, gl.UNSIGNED_SHORT, 0);
// ****** lines object 16 *******
gl.useProgram(prog16);
gl.bindBuffer(gl.ARRAY_BUFFER, buf16);
gl.uniformMatrix4fv( prMatLoc16, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc16, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 12);
// ****** text object 17 *******
gl.useProgram(prog17);
gl.bindBuffer(gl.ARRAY_BUFFER, buf17);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf17);
gl.uniformMatrix4fv( prMatLoc17, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc17, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc17, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc17 );
gl.vertexAttribPointer(texLoc17, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture17);
gl.uniform1i( sampler17, 0);
gl.enableVertexAttribArray( ofsLoc17 );
gl.vertexAttribPointer(ofsLoc17, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
// ****** lines object 18 *******
gl.useProgram(prog18);
gl.bindBuffer(gl.ARRAY_BUFFER, buf18);
gl.uniformMatrix4fv( prMatLoc18, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc18, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 24);
gl.flush ();
}
var vpx0 = {
1: 0
};
var vpy0 = {
1: 0
};
var vpWidths = {
1: 504
};
var vpHeights = {
1: 504
};
var activeModel = {
1: 1
};
var activeProjection = {
1: 1
};
var whichSubscene = function(coords){
if (0 <= coords.x && coords.x <= 504 && 0 <= coords.y && coords.y <= 504) return(1);
return(1);
}
var translateCoords = function(subsceneid, coords){
return {x:coords.x - vpx0[subsceneid], y:coords.y - vpy0[subsceneid]};
}
var vlen = function(v) {
return sqrt(v[0]*v[0] + v[1]*v[1] + v[2]*v[2])
}
var xprod = function(a, b) {
return [a[1]*b[2] - a[2]*b[1],
a[2]*b[0] - a[0]*b[2],
a[0]*b[1] - a[1]*b[0]];
}
var screenToVector = function(x, y) {
var width = vpWidths[activeSubscene];
var height = vpHeights[activeSubscene];
var radius = max(width, height)/2.0;
var cx = width/2.0;
var cy = height/2.0;
var px = (x-cx)/radius;
var py = (y-cy)/radius;
var plen = sqrt(px*px+py*py);
if (plen > 1.e-6) { 
px = px/plen;
py = py/plen;
}
var angle = (SQRT2 - plen)/SQRT2*PI/2;
var z = sin(angle);
var zlen = sqrt(1.0 - z*z);
px = px * zlen;
py = py * zlen;
return [px, py, z];
}
var rotBase;
var trackballdown = function(x,y) {
rotBase = screenToVector(x, y);
saveMat.load(userMatrix[activeModel[activeSubscene]]);
}
var trackballmove = function(x,y) {
var rotCurrent = screenToVector(x,y);
var dot = rotBase[0]*rotCurrent[0] + 
rotBase[1]*rotCurrent[1] + 
rotBase[2]*rotCurrent[2];
var angle = acos( dot/vlen(rotBase)/vlen(rotCurrent) )*180./PI;
var axis = xprod(rotBase, rotCurrent);
userMatrix[activeModel[activeSubscene]].load(saveMat);
userMatrix[activeModel[activeSubscene]].rotate(angle, axis[0], axis[1], axis[2]);
drawScene();
}
var y0zoom = 0;
var zoom0 = 1;
var zoomdown = function(x, y) {
y0zoom = y;
zoom0 = log(zoom[activeProjection[activeSubscene]]);
}
var zoommove = function(x, y) {
zoom[activeProjection[activeSubscene]] = exp(zoom0 + (y-y0zoom)/height);
drawScene();
}
var y0fov = 0;
var fov0 = 1;
var fovdown = function(x, y) {
y0fov = y;
fov0 = fov[activeProjection[activeSubscene]];
}
var fovmove = function(x, y) {
fov[activeProjection[activeSubscene]] = max(1, min(179, fov0 + 180*(y-y0fov)/height));
drawScene();
}
var mousedown = [trackballdown, zoomdown, fovdown];
var mousemove = [trackballmove, zoommove, fovmove];
function relMouseCoords(event){
var totalOffsetX = 0;
var totalOffsetY = 0;
var currentElement = canvas;
do{
totalOffsetX += currentElement.offsetLeft;
totalOffsetY += currentElement.offsetTop;
}
while(currentElement = currentElement.offsetParent)
var canvasX = event.pageX - totalOffsetX;
var canvasY = event.pageY - totalOffsetY;
return {x:canvasX, y:canvasY}
}
canvas.onmousedown = function ( ev ){
if (!ev.which) // Use w3c defns in preference to MS
switch (ev.button) {
case 0: ev.which = 1; break;
case 1: 
case 4: ev.which = 2; break;
case 2: ev.which = 3;
}
drag = ev.which;
var f = mousedown[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height-coords.y;
activeSubscene = whichSubscene(coords);
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y); 
ev.preventDefault();
}
}    
canvas.onmouseup = function ( ev ){	
drag = 0;
}
canvas.onmouseout = canvas.onmouseup;
canvas.onmousemove = function ( ev ){
if ( drag == 0 ) return;
var f = mousemove[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height - coords.y;
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y);
}
}
var wheelHandler = function(ev) {
var del = 1.1;
if (ev.shiftKey) del = 1.01;
var ds = ((ev.detail || ev.wheelDelta) > 0) ? del : (1 / del);
zoom[activeProjection[activeSubscene]] *= ds;
drawScene();
ev.preventDefault();
};
canvas.addEventListener("DOMMouseScroll", wheelHandler, false);
canvas.addEventListener("mousewheel", wheelHandler, false);
}
</script>
<canvas id="testglcanvas" width="1" height="1"></canvas> 
<p id="testgldebug">
You must enable Javascript to view this page properly.</p>
<script>testglwebGLStart();</script>

The following a 3D image is of Atrazine rendered from the 3D conformer file derived from here (http://pubchem.ncbi.nlm.nih.gov/compound/2256). The atoms are represented as spheres Nitrogen as blue, carbon as black, hydrogen as white, and chlorine as blue.


```r
open3d()
```

```
## glX 
##   2
```

```r
Methyl_carbamate<-read.table("Methyl_carbamate.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Methyl_carbamate$V2
```

```
## Error in eval(expr, envir, enclos): object 'Methyl_carbamate' not found
```

```r
y<-Methyl_carbamate$V3
```

```
## Error in eval(expr, envir, enclos): object 'Methyl_carbamate' not found
```

```r
z<-Methyl_carbamate$V4
```

```
## Error in eval(expr, envir, enclos): object 'Methyl_carbamate' not found
```

```r
atomcolor=c(rep("blue", 1), rep("red", 5), rep("black", 7), rep("white", 15))
#spheres3d(x, y, z, col=rainbow(1000))
spheres3d(x, y, z, col=atomcolor)
```

<canvas id="testgl2textureCanvas" style="display: none;" width="256" height="256">
Your browser does not support the HTML5 canvas element.</canvas>
<!-- ****** spheres object 25 ****** -->
<script id="testgl2vshader25" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec3 aNorm;
uniform mat4 normMatrix;
varying vec3 vNormal;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
vNormal = normalize((normMatrix * vec4(aNorm, 1.)).xyz);
}
</script>
<script id="testgl2fshader25" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec3 vNormal;
void main(void) {
vec3 eye = normalize(-vPosition.xyz);
const vec3 emission = vec3(0., 0., 0.);
const vec3 ambient1 = vec3(0., 0., 0.);
const vec3 specular1 = vec3(1., 1., 1.);// light*material
const float shininess1 = 50.;
vec4 colDiff1 = vec4(vCol.rgb * vec3(1., 1., 1.), vCol.a);
const vec3 lightDir1 = vec3(0., 0., 1.);
vec3 halfVec1 = normalize(lightDir1 + eye);
vec4 lighteffect = vec4(emission, 0.);
vec3 n = normalize(vNormal);
n = -faceforward(n, n, eye);
vec3 col1 = ambient1;
float nDotL1 = dot(n, lightDir1);
col1 = col1 + max(nDotL1, 0.) * colDiff1.rgb;
col1 = col1 + pow(max(dot(halfVec1, n), 0.), shininess1) * specular1;
lighteffect = lighteffect + vec4(col1, colDiff1.a);
gl_FragColor = lighteffect;
}
</script> 
<script type="text/javascript"> 
function getShader ( gl, id ){
var shaderScript = document.getElementById ( id );
var str = "";
var k = shaderScript.firstChild;
while ( k ){
if ( k.nodeType == 3 ) str += k.textContent;
k = k.nextSibling;
}
var shader;
if ( shaderScript.type == "x-shader/x-fragment" )
shader = gl.createShader ( gl.FRAGMENT_SHADER );
else if ( shaderScript.type == "x-shader/x-vertex" )
shader = gl.createShader(gl.VERTEX_SHADER);
else return null;
gl.shaderSource(shader, str);
gl.compileShader(shader);
if (gl.getShaderParameter(shader, gl.COMPILE_STATUS) == 0)
alert(gl.getShaderInfoLog(shader));
return shader;
}
var min = Math.min;
var max = Math.max;
var sqrt = Math.sqrt;
var sin = Math.sin;
var acos = Math.acos;
var tan = Math.tan;
var SQRT2 = Math.SQRT2;
var PI = Math.PI;
var log = Math.log;
var exp = Math.exp;
function testgl2webGLStart() {
var debug = function(msg) {
document.getElementById("testgl2debug").innerHTML = msg;
}
debug("");
var canvas = document.getElementById("testgl2canvas");
if (!window.WebGLRenderingContext){
debug(" Your browser does not support WebGL. See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var gl;
try {
// Try to grab the standard context. If it fails, fallback to experimental.
gl = canvas.getContext("webgl") 
|| canvas.getContext("experimental-webgl");
}
catch(e) {}
if ( !gl ) {
debug(" Your browser appears to support WebGL, but did not create a WebGL context.  See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var width = 505;  var height = 505;
canvas.width = width;   canvas.height = height;
var prMatrix = new CanvasMatrix4();
var mvMatrix = new CanvasMatrix4();
var normMatrix = new CanvasMatrix4();
var saveMat = new CanvasMatrix4();
saveMat.makeIdentity();
var distance;
var posLoc = 0;
var colLoc = 1;
var zoom = new Object();
var fov = new Object();
var userMatrix = new Object();
var activeSubscene = 19;
zoom[19] = 1;
fov[19] = 30;
userMatrix[19] = new CanvasMatrix4();
userMatrix[19].load([
1, 0, 0, 0,
0, 0.3420201, -0.9396926, 0,
0, 0.9396926, 0.3420201, 0,
0, 0, 0, 1
]);
function getPowerOfTwo(value) {
var pow = 1;
while(pow<value) {
pow *= 2;
}
return pow;
}
function handleLoadedTexture(texture, textureCanvas) {
gl.pixelStorei(gl.UNPACK_FLIP_Y_WEBGL, true);
gl.bindTexture(gl.TEXTURE_2D, texture);
gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, gl.RGBA, gl.UNSIGNED_BYTE, textureCanvas);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.LINEAR);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR_MIPMAP_NEAREST);
gl.generateMipmap(gl.TEXTURE_2D);
gl.bindTexture(gl.TEXTURE_2D, null);
}
function loadImageToTexture(filename, texture) {   
var canvas = document.getElementById("testgl2textureCanvas");
var ctx = canvas.getContext("2d");
var image = new Image();
image.onload = function() {
var w = image.width;
var h = image.height;
var canvasX = getPowerOfTwo(w);
var canvasY = getPowerOfTwo(h);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.imageSmoothingEnabled = true;
ctx.drawImage(image, 0, 0, canvasX, canvasY);
handleLoadedTexture(texture, canvas);
drawScene();
}
image.src = filename;
}  	   
// ****** sphere object ******
var v=new Float32Array([
-1, 0, 0,
1, 0, 0,
0, -1, 0,
0, 1, 0,
0, 0, -1,
0, 0, 1,
-0.7071068, 0, -0.7071068,
-0.7071068, -0.7071068, 0,
0, -0.7071068, -0.7071068,
-0.7071068, 0, 0.7071068,
0, -0.7071068, 0.7071068,
-0.7071068, 0.7071068, 0,
0, 0.7071068, -0.7071068,
0, 0.7071068, 0.7071068,
0.7071068, -0.7071068, 0,
0.7071068, 0, -0.7071068,
0.7071068, 0, 0.7071068,
0.7071068, 0.7071068, 0,
-0.9349975, 0, -0.3546542,
-0.9349975, -0.3546542, 0,
-0.77044, -0.4507894, -0.4507894,
0, -0.3546542, -0.9349975,
-0.3546542, 0, -0.9349975,
-0.4507894, -0.4507894, -0.77044,
-0.3546542, -0.9349975, 0,
0, -0.9349975, -0.3546542,
-0.4507894, -0.77044, -0.4507894,
-0.9349975, 0, 0.3546542,
-0.77044, -0.4507894, 0.4507894,
0, -0.9349975, 0.3546542,
-0.4507894, -0.77044, 0.4507894,
-0.3546542, 0, 0.9349975,
0, -0.3546542, 0.9349975,
-0.4507894, -0.4507894, 0.77044,
-0.9349975, 0.3546542, 0,
-0.77044, 0.4507894, -0.4507894,
0, 0.9349975, -0.3546542,
-0.3546542, 0.9349975, 0,
-0.4507894, 0.77044, -0.4507894,
0, 0.3546542, -0.9349975,
-0.4507894, 0.4507894, -0.77044,
-0.77044, 0.4507894, 0.4507894,
0, 0.3546542, 0.9349975,
-0.4507894, 0.4507894, 0.77044,
0, 0.9349975, 0.3546542,
-0.4507894, 0.77044, 0.4507894,
0.9349975, -0.3546542, 0,
0.9349975, 0, -0.3546542,
0.77044, -0.4507894, -0.4507894,
0.3546542, -0.9349975, 0,
0.4507894, -0.77044, -0.4507894,
0.3546542, 0, -0.9349975,
0.4507894, -0.4507894, -0.77044,
0.9349975, 0, 0.3546542,
0.77044, -0.4507894, 0.4507894,
0.3546542, 0, 0.9349975,
0.4507894, -0.4507894, 0.77044,
0.4507894, -0.77044, 0.4507894,
0.9349975, 0.3546542, 0,
0.77044, 0.4507894, -0.4507894,
0.4507894, 0.4507894, -0.77044,
0.3546542, 0.9349975, 0,
0.4507894, 0.77044, -0.4507894,
0.77044, 0.4507894, 0.4507894,
0.4507894, 0.77044, 0.4507894,
0.4507894, 0.4507894, 0.77044
]);
var f=new Uint16Array([
0, 18, 19,
6, 20, 18,
7, 19, 20,
19, 18, 20,
4, 21, 22,
8, 23, 21,
6, 22, 23,
22, 21, 23,
2, 24, 25,
7, 26, 24,
8, 25, 26,
25, 24, 26,
7, 20, 26,
6, 23, 20,
8, 26, 23,
26, 20, 23,
0, 19, 27,
7, 28, 19,
9, 27, 28,
27, 19, 28,
2, 29, 24,
10, 30, 29,
7, 24, 30,
24, 29, 30,
5, 31, 32,
9, 33, 31,
10, 32, 33,
32, 31, 33,
9, 28, 33,
7, 30, 28,
10, 33, 30,
33, 28, 30,
0, 34, 18,
11, 35, 34,
6, 18, 35,
18, 34, 35,
3, 36, 37,
12, 38, 36,
11, 37, 38,
37, 36, 38,
4, 22, 39,
6, 40, 22,
12, 39, 40,
39, 22, 40,
6, 35, 40,
11, 38, 35,
12, 40, 38,
40, 35, 38,
0, 27, 34,
9, 41, 27,
11, 34, 41,
34, 27, 41,
5, 42, 31,
13, 43, 42,
9, 31, 43,
31, 42, 43,
3, 37, 44,
11, 45, 37,
13, 44, 45,
44, 37, 45,
11, 41, 45,
9, 43, 41,
13, 45, 43,
45, 41, 43,
1, 46, 47,
14, 48, 46,
15, 47, 48,
47, 46, 48,
2, 25, 49,
8, 50, 25,
14, 49, 50,
49, 25, 50,
4, 51, 21,
15, 52, 51,
8, 21, 52,
21, 51, 52,
15, 48, 52,
14, 50, 48,
8, 52, 50,
52, 48, 50,
1, 53, 46,
16, 54, 53,
14, 46, 54,
46, 53, 54,
5, 32, 55,
10, 56, 32,
16, 55, 56,
55, 32, 56,
2, 49, 29,
14, 57, 49,
10, 29, 57,
29, 49, 57,
14, 54, 57,
16, 56, 54,
10, 57, 56,
57, 54, 56,
1, 47, 58,
15, 59, 47,
17, 58, 59,
58, 47, 59,
4, 39, 51,
12, 60, 39,
15, 51, 60,
51, 39, 60,
3, 61, 36,
17, 62, 61,
12, 36, 62,
36, 61, 62,
17, 59, 62,
15, 60, 59,
12, 62, 60,
62, 59, 60,
1, 58, 53,
17, 63, 58,
16, 53, 63,
53, 58, 63,
3, 44, 61,
13, 64, 44,
17, 61, 64,
61, 44, 64,
5, 55, 42,
16, 65, 55,
13, 42, 65,
42, 55, 65,
16, 63, 65,
17, 64, 63,
13, 65, 64,
65, 63, 64
]);
var sphereBuf = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, sphereBuf);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var sphereIbuf = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, sphereIbuf);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
// ****** spheres object 25 ******
var prog25  = gl.createProgram();
gl.attachShader(prog25, getShader( gl, "testgl2vshader25" ));
gl.attachShader(prog25, getShader( gl, "testgl2fshader25" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog25, 0, "aPos");
gl.bindAttribLocation(prog25, 1, "aCol");
gl.linkProgram(prog25);
var v=new Float32Array([
-3.022628, 0.2621176, -3.125586, 0, 0, 1, 1, 1,
-2.955641, -0.9564625, -2.706409, 1, 0, 0, 1, 1,
-2.91593, -0.5603616, -1.818244, 1, 0, 0, 1, 1,
-2.530219, -0.3269466, -0.7674246, 1, 0, 0, 1, 1,
-2.48084, 0.4648278, -1.809871, 1, 0, 0, 1, 1,
-2.476121, 0.7781771, -1.496221, 1, 0, 0, 1, 1,
-2.342408, -0.5198576, -1.064275, 0, 0, 0, 1, 1,
-2.325608, 1.121155, -0.5315479, 0, 0, 0, 1, 1,
-2.298467, -0.7810976, -2.080985, 0, 0, 0, 1, 1,
-2.210149, -0.4322972, -2.878106, 0, 0, 0, 1, 1,
-2.197864, 1.117183, -0.3771197, 0, 0, 0, 1, 1,
-2.194058, 0.4955695, -2.12873, 0, 0, 0, 1, 1,
-2.186242, -0.8056863, -1.672891, 0, 0, 0, 1, 1,
-2.127781, 0.4683827, 0.5031291, 1, 1, 1, 1, 1,
-2.126872, -0.2192932, -2.235277, 1, 1, 1, 1, 1,
-2.11001, -1.471052, -2.341645, 1, 1, 1, 1, 1,
-2.108067, -1.698268, -0.8844709, 1, 1, 1, 1, 1,
-2.089029, -0.6385345, -1.918379, 1, 1, 1, 1, 1,
-2.023427, 0.2757588, -2.900586, 1, 1, 1, 1, 1,
-1.988652, 1.547634, -0.8512756, 1, 1, 1, 1, 1,
-1.973069, -1.043105, -1.331408, 1, 1, 1, 1, 1,
-1.92784, 0.1859779, -1.209426, 1, 1, 1, 1, 1,
-1.92667, 0.8757237, -1.087208, 1, 1, 1, 1, 1,
-1.924666, -1.230259, -2.693503, 1, 1, 1, 1, 1,
-1.910149, -0.1640408, -3.777787, 1, 1, 1, 1, 1,
-1.903299, 0.9842263, -2.238311, 1, 1, 1, 1, 1,
-1.858251, 0.573684, -1.16596, 1, 1, 1, 1, 1,
-1.833795, 0.6896127, 0.4955374, 1, 1, 1, 1, 1,
-1.824185, 0.4025321, -1.158175, 0, 0, 1, 1, 1,
-1.823572, -0.001589943, -1.311382, 1, 0, 0, 1, 1,
-1.811816, 1.29545, -0.4905615, 1, 0, 0, 1, 1,
-1.811365, 0.06889481, -1.488725, 1, 0, 0, 1, 1,
-1.806071, 0.6440275, -1.68167, 1, 0, 0, 1, 1,
-1.798658, 1.343695, -3.2099, 1, 0, 0, 1, 1,
-1.79625, -1.317008, -3.959465, 0, 0, 0, 1, 1,
-1.794984, -0.6428569, -1.737775, 0, 0, 0, 1, 1,
-1.792824, -0.5065473, -3.687914, 0, 0, 0, 1, 1,
-1.790189, -0.5935, -0.525671, 0, 0, 0, 1, 1,
-1.788675, 1.834702, -0.04392533, 0, 0, 0, 1, 1,
-1.778838, -1.640288, -2.291143, 0, 0, 0, 1, 1,
-1.755826, 0.2999169, -2.296262, 0, 0, 0, 1, 1,
-1.754254, 0.2104377, -0.7787583, 1, 1, 1, 1, 1,
-1.736556, -1.438701, -2.060312, 1, 1, 1, 1, 1,
-1.731282, -1.314105, -1.652555, 1, 1, 1, 1, 1,
-1.711401, 1.266294, -1.344451, 1, 1, 1, 1, 1,
-1.711168, -0.4591207, -2.673113, 1, 1, 1, 1, 1,
-1.701504, -0.3143367, 0.357237, 1, 1, 1, 1, 1,
-1.693401, -1.183382, -2.91956, 1, 1, 1, 1, 1,
-1.686091, -0.1377962, -0.915593, 1, 1, 1, 1, 1,
-1.681288, -0.9379307, -0.9886342, 1, 1, 1, 1, 1,
-1.675164, 1.712789, -1.166045, 1, 1, 1, 1, 1,
-1.655304, 0.2936292, -3.395893, 1, 1, 1, 1, 1,
-1.654263, -1.074795, -1.336653, 1, 1, 1, 1, 1,
-1.65221, -1.342274, -2.225134, 1, 1, 1, 1, 1,
-1.640575, 2.237133, -1.000318, 1, 1, 1, 1, 1,
-1.634321, -0.3376998, -1.936116, 1, 1, 1, 1, 1,
-1.626874, 0.5895087, -1.066932, 0, 0, 1, 1, 1,
-1.62531, 1.030707, -0.2263893, 1, 0, 0, 1, 1,
-1.607161, -0.8495981, -2.212628, 1, 0, 0, 1, 1,
-1.601567, 0.08332641, -1.971178, 1, 0, 0, 1, 1,
-1.585935, 0.121607, -0.3343652, 1, 0, 0, 1, 1,
-1.58118, 0.3298311, 1.662491, 1, 0, 0, 1, 1,
-1.556343, -0.4244953, -1.260345, 0, 0, 0, 1, 1,
-1.551997, 0.008610861, -2.854409, 0, 0, 0, 1, 1,
-1.551296, 1.617068, 0.4260572, 0, 0, 0, 1, 1,
-1.549337, 1.444266, -2.225183, 0, 0, 0, 1, 1,
-1.544275, 0.08927063, -1.979417, 0, 0, 0, 1, 1,
-1.534209, -2.329731, -0.9033947, 0, 0, 0, 1, 1,
-1.525247, 1.12402, -2.560491, 0, 0, 0, 1, 1,
-1.518879, 0.1965, -1.922526, 1, 1, 1, 1, 1,
-1.50903, 0.1418189, -1.846239, 1, 1, 1, 1, 1,
-1.500257, 0.8262444, 1.090829, 1, 1, 1, 1, 1,
-1.495582, -1.911025, -2.53849, 1, 1, 1, 1, 1,
-1.492761, -1.410876, -3.396055, 1, 1, 1, 1, 1,
-1.480418, -0.06559234, -0.7943938, 1, 1, 1, 1, 1,
-1.467395, -0.9985868, -1.243012, 1, 1, 1, 1, 1,
-1.462615, -0.8764736, -0.9726962, 1, 1, 1, 1, 1,
-1.459227, -1.105405, -1.053813, 1, 1, 1, 1, 1,
-1.453285, 0.02619241, -2.613727, 1, 1, 1, 1, 1,
-1.427621, -1.449921, -2.462607, 1, 1, 1, 1, 1,
-1.423546, 1.117889, -0.6798344, 1, 1, 1, 1, 1,
-1.422774, 0.8051443, -0.9549276, 1, 1, 1, 1, 1,
-1.408011, -0.7456477, -1.296524, 1, 1, 1, 1, 1,
-1.408002, 1.553521, -1.219689, 1, 1, 1, 1, 1,
-1.393619, 1.785622, -0.3138283, 0, 0, 1, 1, 1,
-1.381904, -0.1098373, -3.241223, 1, 0, 0, 1, 1,
-1.380516, -0.4805325, -1.676592, 1, 0, 0, 1, 1,
-1.373575, 1.187187, -1.028893, 1, 0, 0, 1, 1,
-1.364946, 0.9121495, -1.549482, 1, 0, 0, 1, 1,
-1.364234, 1.571641, -0.7606923, 1, 0, 0, 1, 1,
-1.361103, 0.6037852, -1.25609, 0, 0, 0, 1, 1,
-1.360206, -0.3832999, -1.400714, 0, 0, 0, 1, 1,
-1.357267, 0.9163817, -0.1683683, 0, 0, 0, 1, 1,
-1.353845, -0.1326954, -1.64918, 0, 0, 0, 1, 1,
-1.352429, -0.4754059, -1.545874, 0, 0, 0, 1, 1,
-1.344732, 0.5570609, -1.196561, 0, 0, 0, 1, 1,
-1.340443, 0.4911165, -1.691971, 0, 0, 0, 1, 1,
-1.329427, -0.2726674, 0.09396531, 1, 1, 1, 1, 1,
-1.324213, -0.9492017, -1.831673, 1, 1, 1, 1, 1,
-1.312979, 0.04776506, -2.085446, 1, 1, 1, 1, 1,
-1.306592, 0.5335354, -1.465742, 1, 1, 1, 1, 1,
-1.298971, 0.07146797, -0.209097, 1, 1, 1, 1, 1,
-1.286103, 0.7469721, -0.81716, 1, 1, 1, 1, 1,
-1.274765, 1.295331, -1.133629, 1, 1, 1, 1, 1,
-1.255828, 0.4721943, -0.9631205, 1, 1, 1, 1, 1,
-1.250622, 0.5166957, 0.6756773, 1, 1, 1, 1, 1,
-1.24, -0.2481479, -0.892526, 1, 1, 1, 1, 1,
-1.237811, -0.5106424, -2.564504, 1, 1, 1, 1, 1,
-1.234384, 0.2174776, -3.043786, 1, 1, 1, 1, 1,
-1.233362, 0.8171939, -0.8332579, 1, 1, 1, 1, 1,
-1.231513, -0.9595498, -2.758315, 1, 1, 1, 1, 1,
-1.217194, -0.05574387, -1.787947, 1, 1, 1, 1, 1,
-1.213026, 1.811807, 0.1992322, 0, 0, 1, 1, 1,
-1.211476, -1.234329, -1.532616, 1, 0, 0, 1, 1,
-1.204818, -1.130866, -2.637435, 1, 0, 0, 1, 1,
-1.204735, 0.3207507, -1.025438, 1, 0, 0, 1, 1,
-1.195572, -0.04135174, -1.692453, 1, 0, 0, 1, 1,
-1.19294, -0.1705899, -3.08799, 1, 0, 0, 1, 1,
-1.183673, -0.2836352, -1.903619, 0, 0, 0, 1, 1,
-1.18025, 1.08072, -1.187772, 0, 0, 0, 1, 1,
-1.18016, -2.318065, -0.8181975, 0, 0, 0, 1, 1,
-1.178429, -0.2002759, -0.7843825, 0, 0, 0, 1, 1,
-1.176734, -0.8237531, -0.4024576, 0, 0, 0, 1, 1,
-1.176614, -0.1234608, -1.797651, 0, 0, 0, 1, 1,
-1.167877, -0.7533374, -1.088614, 0, 0, 0, 1, 1,
-1.165205, -0.592577, -1.667661, 1, 1, 1, 1, 1,
-1.164999, 0.5540753, 0.6345767, 1, 1, 1, 1, 1,
-1.157107, 0.7686938, -0.7273588, 1, 1, 1, 1, 1,
-1.152471, 0.4503435, -0.02563318, 1, 1, 1, 1, 1,
-1.149673, -0.107517, -1.908963, 1, 1, 1, 1, 1,
-1.146364, 1.192964, -1.342653, 1, 1, 1, 1, 1,
-1.136145, -0.5530489, -2.386775, 1, 1, 1, 1, 1,
-1.131246, 0.1703738, -1.953961, 1, 1, 1, 1, 1,
-1.125366, -1.266206, -3.527285, 1, 1, 1, 1, 1,
-1.12333, 0.4047122, -0.6720858, 1, 1, 1, 1, 1,
-1.11711, -0.5589201, -1.461428, 1, 1, 1, 1, 1,
-1.11541, 0.4301535, 0.6212965, 1, 1, 1, 1, 1,
-1.115407, -0.7556643, -2.688681, 1, 1, 1, 1, 1,
-1.112988, -0.3687835, -3.170623, 1, 1, 1, 1, 1,
-1.112575, 0.03933773, -1.217137, 1, 1, 1, 1, 1,
-1.106883, 0.02643055, -0.7942922, 0, 0, 1, 1, 1,
-1.088955, -0.6367099, -1.141467, 1, 0, 0, 1, 1,
-1.08599, -0.3201553, -2.848404, 1, 0, 0, 1, 1,
-1.08488, -0.04914114, -2.743783, 1, 0, 0, 1, 1,
-1.082081, -0.104752, -2.119172, 1, 0, 0, 1, 1,
-1.074677, -0.9551076, -2.843947, 1, 0, 0, 1, 1,
-1.073169, 0.09668658, -2.020758, 0, 0, 0, 1, 1,
-1.070202, 0.06528972, -1.945657, 0, 0, 0, 1, 1,
-1.065388, 0.5090894, -0.9691268, 0, 0, 0, 1, 1,
-1.062871, 0.2866763, -2.842713, 0, 0, 0, 1, 1,
-1.062644, -3.307949, -2.21708, 0, 0, 0, 1, 1,
-1.058973, -1.360319, -1.879082, 0, 0, 0, 1, 1,
-1.05274, 0.8359832, -0.7567928, 0, 0, 0, 1, 1,
-1.043525, 1.408017, -0.3863935, 1, 1, 1, 1, 1,
-1.029865, 0.1679108, -2.304696, 1, 1, 1, 1, 1,
-1.029413, 1.730163, 1.224057, 1, 1, 1, 1, 1,
-1.020683, -0.5283819, -2.913834, 1, 1, 1, 1, 1,
-1.018658, 1.272902, 0.6080742, 1, 1, 1, 1, 1,
-1.014979, 1.376642, -1.990549, 1, 1, 1, 1, 1,
-1.013269, -0.5117093, -3.329303, 1, 1, 1, 1, 1,
-1.013177, -0.4511091, -1.594461, 1, 1, 1, 1, 1,
-1.00529, -1.062206, -2.854537, 1, 1, 1, 1, 1,
-1.003984, -0.7780758, -1.90024, 1, 1, 1, 1, 1,
-0.997588, -0.6512353, -1.525147, 1, 1, 1, 1, 1,
-0.9972976, -1.01477, -3.240007, 1, 1, 1, 1, 1,
-0.9968965, 0.3564729, 0.5760131, 1, 1, 1, 1, 1,
-0.995877, 0.6180779, 0.7653953, 1, 1, 1, 1, 1,
-0.9817199, -0.8534352, -2.232019, 1, 1, 1, 1, 1,
-0.9765437, 0.3587234, -0.3794732, 0, 0, 1, 1, 1,
-0.973416, 1.118467, -0.1809938, 1, 0, 0, 1, 1,
-0.9732076, -0.2120354, -0.3410022, 1, 0, 0, 1, 1,
-0.9720755, -0.8118485, -3.586801, 1, 0, 0, 1, 1,
-0.9626915, 0.1533235, -0.8705609, 1, 0, 0, 1, 1,
-0.9620231, 0.4245365, -0.9534529, 1, 0, 0, 1, 1,
-0.9600099, -1.693775, -4.176732, 0, 0, 0, 1, 1,
-0.9587814, 0.6356698, 0.1843407, 0, 0, 0, 1, 1,
-0.9581837, -1.601829, -3.910825, 0, 0, 0, 1, 1,
-0.9581561, -1.067792, -3.007226, 0, 0, 0, 1, 1,
-0.9509549, -1.002617, -1.26217, 0, 0, 0, 1, 1,
-0.9494827, 0.7409533, -1.030698, 0, 0, 0, 1, 1,
-0.9284897, 0.5552985, -0.5357656, 0, 0, 0, 1, 1,
-0.927632, 0.24611, -3.076025, 1, 1, 1, 1, 1,
-0.9173301, 1.169098, -0.6635482, 1, 1, 1, 1, 1,
-0.9076069, 0.1645482, -1.786948, 1, 1, 1, 1, 1,
-0.9057983, -1.880572, -4.257782, 1, 1, 1, 1, 1,
-0.9047796, -0.8443601, -0.3635216, 1, 1, 1, 1, 1,
-0.9042692, -1.008209, -3.14157, 1, 1, 1, 1, 1,
-0.8994049, -0.1683574, -1.430708, 1, 1, 1, 1, 1,
-0.8990132, 0.01499999, -1.407426, 1, 1, 1, 1, 1,
-0.8981276, -0.8756965, -3.064853, 1, 1, 1, 1, 1,
-0.893239, 1.343702, -1.152838, 1, 1, 1, 1, 1,
-0.8914533, -0.4328798, -3.710012, 1, 1, 1, 1, 1,
-0.8834064, -0.07122466, -1.534279, 1, 1, 1, 1, 1,
-0.8792359, 0.1628577, -2.345561, 1, 1, 1, 1, 1,
-0.8777601, -0.8375829, -3.545894, 1, 1, 1, 1, 1,
-0.8744088, 0.4985332, -0.8185309, 1, 1, 1, 1, 1,
-0.8624337, -1.394449, -2.573745, 0, 0, 1, 1, 1,
-0.8607106, -1.710351, -2.137357, 1, 0, 0, 1, 1,
-0.8546754, 0.8952857, -2.343543, 1, 0, 0, 1, 1,
-0.8527003, 1.058996, -1.695752, 1, 0, 0, 1, 1,
-0.8523972, 0.4714831, -2.135419, 1, 0, 0, 1, 1,
-0.8520998, 0.3805417, -1.74622, 1, 0, 0, 1, 1,
-0.8512833, 1.441644, -1.775706, 0, 0, 0, 1, 1,
-0.8495733, -0.7083856, -2.208279, 0, 0, 0, 1, 1,
-0.8488093, -0.3664159, -1.104494, 0, 0, 0, 1, 1,
-0.8377169, 0.7336234, -2.656122, 0, 0, 0, 1, 1,
-0.8333184, -0.1121842, -0.6902446, 0, 0, 0, 1, 1,
-0.8309571, -0.02928434, -1.237048, 0, 0, 0, 1, 1,
-0.8308674, 1.118695, -0.9991673, 0, 0, 0, 1, 1,
-0.8297982, 0.2802309, -0.5998085, 1, 1, 1, 1, 1,
-0.8152548, 1.085361, 1.155511, 1, 1, 1, 1, 1,
-0.8151702, 1.835187, -0.1466716, 1, 1, 1, 1, 1,
-0.8149999, 0.08476481, -1.175786, 1, 1, 1, 1, 1,
-0.8147979, 0.7395369, -0.7617302, 1, 1, 1, 1, 1,
-0.8131507, 0.4689769, -1.096529, 1, 1, 1, 1, 1,
-0.8052536, -0.704762, -2.589006, 1, 1, 1, 1, 1,
-0.7986773, -1.840684, -1.556756, 1, 1, 1, 1, 1,
-0.792513, 1.018148, 0.5879264, 1, 1, 1, 1, 1,
-0.7763807, -0.6097213, -2.103714, 1, 1, 1, 1, 1,
-0.7762008, 0.2014117, -1.312403, 1, 1, 1, 1, 1,
-0.774398, 1.736567, -2.650596, 1, 1, 1, 1, 1,
-0.7734128, -0.9857913, -2.649112, 1, 1, 1, 1, 1,
-0.7729614, -0.2066499, -1.121632, 1, 1, 1, 1, 1,
-0.7667167, -2.008073, -2.032969, 1, 1, 1, 1, 1,
-0.7609656, 2.004907, 1.562367, 0, 0, 1, 1, 1,
-0.7586248, -0.4555896, -1.915808, 1, 0, 0, 1, 1,
-0.7556547, -0.5113494, -3.219285, 1, 0, 0, 1, 1,
-0.7497139, -0.3279107, -3.002051, 1, 0, 0, 1, 1,
-0.7493216, 1.948459, -1.199938, 1, 0, 0, 1, 1,
-0.7391157, 0.2903459, -2.322585, 1, 0, 0, 1, 1,
-0.7382028, -0.2819192, -1.585892, 0, 0, 0, 1, 1,
-0.7381162, 1.156531, 0.6480694, 0, 0, 0, 1, 1,
-0.7377694, 0.6119584, -0.4670784, 0, 0, 0, 1, 1,
-0.7322415, 0.1053287, -2.619593, 0, 0, 0, 1, 1,
-0.7287514, 0.5808137, -0.9988165, 0, 0, 0, 1, 1,
-0.7284365, 0.7882996, -2.292675, 0, 0, 0, 1, 1,
-0.7265606, 0.9728542, -0.3288004, 0, 0, 0, 1, 1,
-0.7264142, 1.254516, -0.882885, 1, 1, 1, 1, 1,
-0.7252871, 0.002956965, -2.955148, 1, 1, 1, 1, 1,
-0.7214722, 0.7520005, -0.4011755, 1, 1, 1, 1, 1,
-0.7185603, 1.133942, -1.129564, 1, 1, 1, 1, 1,
-0.7183581, 0.2416676, -1.435587, 1, 1, 1, 1, 1,
-0.7168706, -0.7025123, -2.393709, 1, 1, 1, 1, 1,
-0.7083459, 1.449133, -2.876042, 1, 1, 1, 1, 1,
-0.707568, -0.3804252, -1.772455, 1, 1, 1, 1, 1,
-0.7065991, 0.46525, -2.631129, 1, 1, 1, 1, 1,
-0.6931092, -1.977913, -2.380338, 1, 1, 1, 1, 1,
-0.6921465, -0.3197018, -2.044256, 1, 1, 1, 1, 1,
-0.6888053, -0.1475094, -0.4244235, 1, 1, 1, 1, 1,
-0.6886045, 1.660296, -1.755034, 1, 1, 1, 1, 1,
-0.688215, 1.106723, 2.388079, 1, 1, 1, 1, 1,
-0.6852852, 0.3499837, -2.366951, 1, 1, 1, 1, 1,
-0.6830803, 0.9531753, -0.5164917, 0, 0, 1, 1, 1,
-0.6804883, -0.3508026, -1.936345, 1, 0, 0, 1, 1,
-0.6800475, -0.5755985, -3.115773, 1, 0, 0, 1, 1,
-0.67882, 2.298137, -0.8445971, 1, 0, 0, 1, 1,
-0.6730976, -0.3423156, -1.835498, 1, 0, 0, 1, 1,
-0.6699076, -0.1804266, -1.786108, 1, 0, 0, 1, 1,
-0.6689594, -0.6963198, -4.067109, 0, 0, 0, 1, 1,
-0.6678517, -0.08484573, -4.080988, 0, 0, 0, 1, 1,
-0.6630219, -2.160838, -2.488973, 0, 0, 0, 1, 1,
-0.6624016, 0.04191499, -2.316138, 0, 0, 0, 1, 1,
-0.6605244, -1.862172, -3.049611, 0, 0, 0, 1, 1,
-0.6592994, -0.4817717, -3.343261, 0, 0, 0, 1, 1,
-0.6570444, -0.4154164, -2.144807, 0, 0, 0, 1, 1,
-0.651995, -1.137864, -3.582583, 1, 1, 1, 1, 1,
-0.648895, 0.9309953, 0.7717612, 1, 1, 1, 1, 1,
-0.6485016, -0.03346757, -2.54814, 1, 1, 1, 1, 1,
-0.6442125, -0.5699863, -2.071112, 1, 1, 1, 1, 1,
-0.6379215, -0.3430553, -2.673716, 1, 1, 1, 1, 1,
-0.6353539, -0.4864128, -1.376054, 1, 1, 1, 1, 1,
-0.6334063, -0.5245279, -3.305665, 1, 1, 1, 1, 1,
-0.6291421, 0.17971, -0.7512738, 1, 1, 1, 1, 1,
-0.6251614, -0.6845624, -3.671528, 1, 1, 1, 1, 1,
-0.6180281, -1.37803, -3.900029, 1, 1, 1, 1, 1,
-0.6170772, -0.193988, -2.826127, 1, 1, 1, 1, 1,
-0.6137512, 0.1083267, -1.350526, 1, 1, 1, 1, 1,
-0.61319, -1.405745, -1.444315, 1, 1, 1, 1, 1,
-0.6090608, 0.5084701, 0.2070968, 1, 1, 1, 1, 1,
-0.6048149, -0.4847283, -3.315993, 1, 1, 1, 1, 1,
-0.5933239, -0.4840104, -1.493481, 0, 0, 1, 1, 1,
-0.5909982, -0.1864487, -1.196798, 1, 0, 0, 1, 1,
-0.5854748, 0.008719257, -3.199542, 1, 0, 0, 1, 1,
-0.5853836, -0.3260197, -1.481541, 1, 0, 0, 1, 1,
-0.5846005, -0.09219514, -2.632614, 1, 0, 0, 1, 1,
-0.5813888, 0.4840454, -1.376599, 1, 0, 0, 1, 1,
-0.572387, -0.3883405, -1.437253, 0, 0, 0, 1, 1,
-0.5692635, 1.350594, -0.7715988, 0, 0, 0, 1, 1,
-0.5596331, 0.02595594, -0.6401441, 0, 0, 0, 1, 1,
-0.5575021, -0.5690139, -1.467416, 0, 0, 0, 1, 1,
-0.5559968, 0.3989856, -2.041542, 0, 0, 0, 1, 1,
-0.5542821, 0.21949, -1.153367, 0, 0, 0, 1, 1,
-0.5482393, 0.4886492, -0.587613, 0, 0, 0, 1, 1,
-0.545297, -0.4386945, -3.273635, 1, 1, 1, 1, 1,
-0.5379982, -0.7680501, -1.295209, 1, 1, 1, 1, 1,
-0.5378163, 0.4426482, -0.6520792, 1, 1, 1, 1, 1,
-0.5375062, -0.1198587, -1.002966, 1, 1, 1, 1, 1,
-0.5371984, 0.01159001, -1.315932, 1, 1, 1, 1, 1,
-0.5361757, -0.5353295, -2.191563, 1, 1, 1, 1, 1,
-0.5354367, -0.3514942, -4.049438, 1, 1, 1, 1, 1,
-0.5209776, -0.4737065, -2.997641, 1, 1, 1, 1, 1,
-0.5191063, -0.5434377, -2.074864, 1, 1, 1, 1, 1,
-0.5172357, 0.976306, -1.28915, 1, 1, 1, 1, 1,
-0.517164, 0.3884596, -0.8190767, 1, 1, 1, 1, 1,
-0.5127847, -0.3840982, -2.364165, 1, 1, 1, 1, 1,
-0.5106626, -0.1414779, -2.025738, 1, 1, 1, 1, 1,
-0.5098972, -0.0523138, -2.600739, 1, 1, 1, 1, 1,
-0.5079639, -0.351871, -1.946657, 1, 1, 1, 1, 1,
-0.5015581, -0.5938119, -1.793082, 0, 0, 1, 1, 1,
-0.5011108, -0.4995817, -1.22459, 1, 0, 0, 1, 1,
-0.4951595, -0.388991, -1.811525, 1, 0, 0, 1, 1,
-0.4854091, -0.6323699, -2.455864, 1, 0, 0, 1, 1,
-0.4798944, -3.527028, -2.443579, 1, 0, 0, 1, 1,
-0.4798606, -0.02446931, -2.052132, 1, 0, 0, 1, 1,
-0.4786792, 1.05703, 0.5165169, 0, 0, 0, 1, 1,
-0.4782994, 1.122804, 0.02880114, 0, 0, 0, 1, 1,
-0.4776, 0.261396, 0.411182, 0, 0, 0, 1, 1,
-0.4755278, 0.07270526, -0.6704339, 0, 0, 0, 1, 1,
-0.4736435, 0.1987863, -0.03699877, 0, 0, 0, 1, 1,
-0.4703965, 0.1557579, -1.599547, 0, 0, 0, 1, 1,
-0.4573835, -0.1226728, -2.451817, 0, 0, 0, 1, 1,
-0.4549879, 0.5094239, -1.159659, 1, 1, 1, 1, 1,
-0.4536965, 0.9881373, 0.02527762, 1, 1, 1, 1, 1,
-0.4533502, -0.687763, -2.385205, 1, 1, 1, 1, 1,
-0.4464888, 1.328851, 1.116036, 1, 1, 1, 1, 1,
-0.445129, 0.7251352, -1.885864, 1, 1, 1, 1, 1,
-0.4354512, 0.602904, -1.468439, 1, 1, 1, 1, 1,
-0.4291503, -1.319708, -1.680619, 1, 1, 1, 1, 1,
-0.425412, 0.3792088, 0.5282855, 1, 1, 1, 1, 1,
-0.4186293, -0.5014809, -2.050537, 1, 1, 1, 1, 1,
-0.4153795, -0.3896502, -3.067328, 1, 1, 1, 1, 1,
-0.4140322, -0.3665859, -0.3012692, 1, 1, 1, 1, 1,
-0.4116258, -0.1737948, -1.178532, 1, 1, 1, 1, 1,
-0.4079835, 0.5863446, -1.491512, 1, 1, 1, 1, 1,
-0.4074765, 0.8859724, -1.893764, 1, 1, 1, 1, 1,
-0.4061861, -2.357287, -4.534391, 1, 1, 1, 1, 1,
-0.4058151, -0.02043564, -2.342914, 0, 0, 1, 1, 1,
-0.4052121, 0.2928398, -0.6240519, 1, 0, 0, 1, 1,
-0.4046937, 0.587234, -1.450671, 1, 0, 0, 1, 1,
-0.4009566, -0.9500578, -2.559906, 1, 0, 0, 1, 1,
-0.4004419, -1.271223, -2.570059, 1, 0, 0, 1, 1,
-0.3966706, 0.01031842, 1.575798, 1, 0, 0, 1, 1,
-0.3932403, 0.8832799, -1.026539, 0, 0, 0, 1, 1,
-0.3901464, 1.467489, 0.7333302, 0, 0, 0, 1, 1,
-0.3892709, 0.7953359, 0.4634062, 0, 0, 0, 1, 1,
-0.3884336, -0.4961457, -2.671476, 0, 0, 0, 1, 1,
-0.3875998, 0.07307459, -1.794238, 0, 0, 0, 1, 1,
-0.3860882, -1.263412, -2.668603, 0, 0, 0, 1, 1,
-0.385587, 1.900371, 0.02614645, 0, 0, 0, 1, 1,
-0.3841095, 0.9458269, 0.1944307, 1, 1, 1, 1, 1,
-0.376059, -2.017966, -1.717373, 1, 1, 1, 1, 1,
-0.3740879, -0.7645541, -2.373594, 1, 1, 1, 1, 1,
-0.3733549, -0.5344717, -2.361848, 1, 1, 1, 1, 1,
-0.3710812, -0.3266942, -0.6801921, 1, 1, 1, 1, 1,
-0.3676704, -0.02174589, -2.22957, 1, 1, 1, 1, 1,
-0.3672972, -1.119059, -2.230887, 1, 1, 1, 1, 1,
-0.3672954, -0.7599987, -4.414866, 1, 1, 1, 1, 1,
-0.3621997, 0.04609288, -1.155844, 1, 1, 1, 1, 1,
-0.353212, -0.0298033, -1.664508, 1, 1, 1, 1, 1,
-0.3513694, 0.5849813, -0.0420365, 1, 1, 1, 1, 1,
-0.3499846, 1.58068, -0.4009607, 1, 1, 1, 1, 1,
-0.3488133, -0.1891513, -0.769228, 1, 1, 1, 1, 1,
-0.3487478, 0.7198704, 0.4556293, 1, 1, 1, 1, 1,
-0.3464022, -2.618071, -4.223216, 1, 1, 1, 1, 1,
-0.3438146, 0.6179389, 0.4902005, 0, 0, 1, 1, 1,
-0.3427106, 0.01415095, -0.6695024, 1, 0, 0, 1, 1,
-0.3411916, -0.5419862, -2.980563, 1, 0, 0, 1, 1,
-0.3360798, 0.4927062, -3.366937, 1, 0, 0, 1, 1,
-0.3336011, -1.019748, -2.587404, 1, 0, 0, 1, 1,
-0.3319593, 1.46082, 0.5710884, 1, 0, 0, 1, 1,
-0.3300024, -2.212851, -0.7939073, 0, 0, 0, 1, 1,
-0.3296032, 0.1346218, -2.279465, 0, 0, 0, 1, 1,
-0.3269875, 0.01903091, -2.738358, 0, 0, 0, 1, 1,
-0.3199574, -1.443351, -2.546679, 0, 0, 0, 1, 1,
-0.3193653, -0.3576488, -5.054519, 0, 0, 0, 1, 1,
-0.3189273, -2.07812, -3.165962, 0, 0, 0, 1, 1,
-0.3182452, 0.2424714, 0.9898247, 0, 0, 0, 1, 1,
-0.3071496, 2.137011, -0.6382287, 1, 1, 1, 1, 1,
-0.3065688, 0.4801032, -1.424311, 1, 1, 1, 1, 1,
-0.3017941, 0.284479, -1.457769, 1, 1, 1, 1, 1,
-0.297252, -0.3502273, -2.410946, 1, 1, 1, 1, 1,
-0.29596, -0.5229988, -2.697981, 1, 1, 1, 1, 1,
-0.2955826, 0.0495584, -2.02226, 1, 1, 1, 1, 1,
-0.2945594, -1.131624, -3.41063, 1, 1, 1, 1, 1,
-0.2932653, -0.3537056, -3.972786, 1, 1, 1, 1, 1,
-0.2843408, -0.248114, -0.04452904, 1, 1, 1, 1, 1,
-0.283265, -0.3474238, -2.149717, 1, 1, 1, 1, 1,
-0.282953, -2.231299, -3.300481, 1, 1, 1, 1, 1,
-0.2800399, -2.118266, -2.948579, 1, 1, 1, 1, 1,
-0.2778304, -0.05577209, -0.8465303, 1, 1, 1, 1, 1,
-0.273315, 0.04119914, -1.213399, 1, 1, 1, 1, 1,
-0.2595399, -0.5796289, -1.374429, 1, 1, 1, 1, 1,
-0.2589901, 0.4335741, 1.076025, 0, 0, 1, 1, 1,
-0.2571264, 0.05220749, -0.7017835, 1, 0, 0, 1, 1,
-0.2537459, 0.7403175, -0.4374988, 1, 0, 0, 1, 1,
-0.2517057, 2.174557, 0.5962811, 1, 0, 0, 1, 1,
-0.2513005, -0.2751483, -2.905957, 1, 0, 0, 1, 1,
-0.2425462, 0.6779792, -0.5116502, 1, 0, 0, 1, 1,
-0.2392921, 0.1025779, -0.5447198, 0, 0, 0, 1, 1,
-0.238733, 0.206036, -1.023976, 0, 0, 0, 1, 1,
-0.2375402, 0.8832328, -1.25043, 0, 0, 0, 1, 1,
-0.2365815, 0.5751192, -2.102062, 0, 0, 0, 1, 1,
-0.2361196, 0.08462565, -0.709642, 0, 0, 0, 1, 1,
-0.2332974, -1.833466, -2.392889, 0, 0, 0, 1, 1,
-0.2326484, -0.8465211, -3.835708, 0, 0, 0, 1, 1,
-0.2307645, 0.1668198, -0.1157343, 1, 1, 1, 1, 1,
-0.2306844, -0.5386616, -4.633165, 1, 1, 1, 1, 1,
-0.2275602, -0.8549906, -4.210915, 1, 1, 1, 1, 1,
-0.2273031, -0.0911802, -2.566078, 1, 1, 1, 1, 1,
-0.2244273, -1.695495, -2.849974, 1, 1, 1, 1, 1,
-0.2230467, -0.2789825, -2.16627, 1, 1, 1, 1, 1,
-0.2212123, 0.6228058, 0.8416995, 1, 1, 1, 1, 1,
-0.2206221, 0.1299084, -0.9071438, 1, 1, 1, 1, 1,
-0.2176786, 0.155548, 0.6527295, 1, 1, 1, 1, 1,
-0.2156116, 0.5673444, 0.18247, 1, 1, 1, 1, 1,
-0.2146927, -0.4179454, -3.835543, 1, 1, 1, 1, 1,
-0.2145267, -0.496594, -2.857043, 1, 1, 1, 1, 1,
-0.2137719, 1.493034, 1.780037, 1, 1, 1, 1, 1,
-0.2137665, 0.1265828, -4.228683, 1, 1, 1, 1, 1,
-0.2130093, 0.2982486, -0.4775079, 1, 1, 1, 1, 1,
-0.2094404, 0.4737596, -1.101739, 0, 0, 1, 1, 1,
-0.208299, 0.4159093, -0.1827813, 1, 0, 0, 1, 1,
-0.2072844, -2.043879, -0.9014195, 1, 0, 0, 1, 1,
-0.2003004, -0.06899145, -1.107176, 1, 0, 0, 1, 1,
-0.2001481, -0.6823874, -0.5892706, 1, 0, 0, 1, 1,
-0.1935995, 0.5170083, 0.4085592, 1, 0, 0, 1, 1,
-0.192142, -0.671928, -3.103474, 0, 0, 0, 1, 1,
-0.1866103, -0.639789, -3.390636, 0, 0, 0, 1, 1,
-0.1845392, -1.683083, -3.880036, 0, 0, 0, 1, 1,
-0.1841993, 0.9004228, 0.9403356, 0, 0, 0, 1, 1,
-0.1840421, -0.1032189, -1.835438, 0, 0, 0, 1, 1,
-0.1834187, -1.488125, -2.893947, 0, 0, 0, 1, 1,
-0.182278, 0.3236216, -0.2945853, 0, 0, 0, 1, 1,
-0.1820875, 0.6089389, -0.01388302, 1, 1, 1, 1, 1,
-0.1760953, 1.684414, 0.4675922, 1, 1, 1, 1, 1,
-0.1733741, 0.8009281, 0.2499382, 1, 1, 1, 1, 1,
-0.1652626, -0.5383225, -1.862309, 1, 1, 1, 1, 1,
-0.1640341, 0.04318219, -3.654475, 1, 1, 1, 1, 1,
-0.1522405, -1.266466, -2.663928, 1, 1, 1, 1, 1,
-0.1489374, 2.127388, 0.2715532, 1, 1, 1, 1, 1,
-0.1445891, -0.8694782, -4.653376, 1, 1, 1, 1, 1,
-0.1441165, -0.4976424, -4.033907, 1, 1, 1, 1, 1,
-0.1419809, 0.1383823, -0.02689578, 1, 1, 1, 1, 1,
-0.1245081, -0.01792357, -2.814009, 1, 1, 1, 1, 1,
-0.1240688, 0.1266597, -2.135807, 1, 1, 1, 1, 1,
-0.1184602, -0.9373025, -2.875845, 1, 1, 1, 1, 1,
-0.1175701, 1.460999, -2.483229, 1, 1, 1, 1, 1,
-0.1150741, -0.5100085, -3.032841, 1, 1, 1, 1, 1,
-0.1120184, 2.796687, -0.07644475, 0, 0, 1, 1, 1,
-0.1076488, -0.3061034, -3.965833, 1, 0, 0, 1, 1,
-0.1072452, 1.611331, 0.6550851, 1, 0, 0, 1, 1,
-0.1005954, -0.2797275, -3.972138, 1, 0, 0, 1, 1,
-0.09700271, 1.5075, 2.017499, 1, 0, 0, 1, 1,
-0.09556037, 1.450476, -0.09723326, 1, 0, 0, 1, 1,
-0.09541556, -0.8198832, -4.037813, 0, 0, 0, 1, 1,
-0.09381923, 1.722927, 1.470891, 0, 0, 0, 1, 1,
-0.09349003, -0.2036916, -2.073938, 0, 0, 0, 1, 1,
-0.09300014, 0.5285741, -0.5307029, 0, 0, 0, 1, 1,
-0.09091855, 0.3465166, 0.07776581, 0, 0, 0, 1, 1,
-0.09057841, 0.1974311, -2.167126, 0, 0, 0, 1, 1,
-0.08789907, -2.765743, -3.572328, 0, 0, 0, 1, 1,
-0.08604707, 1.016083, -1.261102, 1, 1, 1, 1, 1,
-0.07621771, -1.0204, -3.137618, 1, 1, 1, 1, 1,
-0.07587904, 0.7231652, -0.1272552, 1, 1, 1, 1, 1,
-0.07525901, 1.998405, 2.024699, 1, 1, 1, 1, 1,
-0.07427252, -1.211024, -2.166567, 1, 1, 1, 1, 1,
-0.06578769, 0.6951103, -0.6811165, 1, 1, 1, 1, 1,
-0.06314695, 0.1560939, -2.433449, 1, 1, 1, 1, 1,
-0.06166723, 0.1836649, 0.6961634, 1, 1, 1, 1, 1,
-0.05522304, 0.02249746, -2.079456, 1, 1, 1, 1, 1,
-0.05338043, 0.733876, 0.618524, 1, 1, 1, 1, 1,
-0.05077298, -0.602973, -3.461229, 1, 1, 1, 1, 1,
-0.0474964, -0.6621527, -4.559763, 1, 1, 1, 1, 1,
-0.04197502, 1.1225, 0.1116693, 1, 1, 1, 1, 1,
-0.02890005, 0.03045059, -0.6920698, 1, 1, 1, 1, 1,
-0.02758051, 1.22714, -0.7647845, 1, 1, 1, 1, 1,
-0.02746526, 0.2961835, -1.254053, 0, 0, 1, 1, 1,
-0.02641484, 1.348615, 1.192892, 1, 0, 0, 1, 1,
-0.02640353, -0.7256491, -1.960809, 1, 0, 0, 1, 1,
-0.02361451, -0.8060291, -3.965859, 1, 0, 0, 1, 1,
-0.02128935, -1.454278, -4.677431, 1, 0, 0, 1, 1,
-0.02111119, 0.3041909, 1.640578, 1, 0, 0, 1, 1,
-0.01938387, -0.2270964, -2.462118, 0, 0, 0, 1, 1,
-0.01855974, 1.487646, 0.4466091, 0, 0, 0, 1, 1,
-0.01830851, -0.1427387, -3.540369, 0, 0, 0, 1, 1,
-0.01692342, -1.170708, -2.261189, 0, 0, 0, 1, 1,
-0.01221616, -0.757761, -3.934034, 0, 0, 0, 1, 1,
-0.01105509, 1.479591, -0.2454097, 0, 0, 0, 1, 1,
-0.002803429, 0.4591797, 0.961289, 0, 0, 0, 1, 1,
-0.0005077404, 0.376948, 1.173531, 1, 1, 1, 1, 1,
1.241833e-05, 0.7953918, 1.601532, 1, 1, 1, 1, 1,
0.002463191, -0.1297036, 3.315336, 1, 1, 1, 1, 1,
0.003815642, 0.3470014, -1.462973, 1, 1, 1, 1, 1,
0.008135066, -0.06197497, 3.579261, 1, 1, 1, 1, 1,
0.009027804, 1.303434, 1.717445, 1, 1, 1, 1, 1,
0.01066768, 0.8314243, 1.034381, 1, 1, 1, 1, 1,
0.0115826, 0.8466233, -1.048187, 1, 1, 1, 1, 1,
0.01203875, 0.3656776, 1.432365, 1, 1, 1, 1, 1,
0.01364426, -0.4685057, 3.52931, 1, 1, 1, 1, 1,
0.01544008, 2.153029, 1.869316, 1, 1, 1, 1, 1,
0.01688926, -1.264384, 4.73097, 1, 1, 1, 1, 1,
0.01747899, -0.9120992, 3.600177, 1, 1, 1, 1, 1,
0.0176291, 0.5606604, -0.9856656, 1, 1, 1, 1, 1,
0.01907077, 0.6881808, 0.4993367, 1, 1, 1, 1, 1,
0.01927726, 0.5787988, 0.4086034, 0, 0, 1, 1, 1,
0.0216783, -0.9823192, 2.259897, 1, 0, 0, 1, 1,
0.02910797, -2.029256, 3.046924, 1, 0, 0, 1, 1,
0.03248425, 0.04477707, 0.8532989, 1, 0, 0, 1, 1,
0.03984346, 1.013777, -0.6473212, 1, 0, 0, 1, 1,
0.04231359, -1.228369, 1.654254, 1, 0, 0, 1, 1,
0.04831108, -1.32023, 2.734031, 0, 0, 0, 1, 1,
0.04909744, 1.08486, -0.579771, 0, 0, 0, 1, 1,
0.05140124, -0.7812797, 2.760601, 0, 0, 0, 1, 1,
0.05241014, -0.3334361, 3.930033, 0, 0, 0, 1, 1,
0.0528701, 0.5727995, -0.7254162, 0, 0, 0, 1, 1,
0.05398389, 1.312938, -1.852832, 0, 0, 0, 1, 1,
0.05777952, -0.6990401, 2.805186, 0, 0, 0, 1, 1,
0.05878903, 0.6647934, 1.08602, 1, 1, 1, 1, 1,
0.05885709, -0.4720281, 2.821692, 1, 1, 1, 1, 1,
0.05912255, 0.4629778, 0.399599, 1, 1, 1, 1, 1,
0.05975717, 0.2486541, 2.562819, 1, 1, 1, 1, 1,
0.05977176, 1.018882, 1.421131, 1, 1, 1, 1, 1,
0.06188615, -0.5815033, 0.8870285, 1, 1, 1, 1, 1,
0.06197571, -0.2526901, 2.404225, 1, 1, 1, 1, 1,
0.06346872, 1.462798, 0.3119832, 1, 1, 1, 1, 1,
0.06651337, 1.445868, 1.021612, 1, 1, 1, 1, 1,
0.0702054, -0.4096465, 4.465007, 1, 1, 1, 1, 1,
0.07182513, 0.1765537, 0.09813109, 1, 1, 1, 1, 1,
0.07374593, -0.1648173, 5.323134, 1, 1, 1, 1, 1,
0.07397102, 0.4648355, 1.03061, 1, 1, 1, 1, 1,
0.07514843, -0.01241746, 1.979036, 1, 1, 1, 1, 1,
0.07729979, -0.7842114, 2.773061, 1, 1, 1, 1, 1,
0.08190767, -0.9538829, 2.61252, 0, 0, 1, 1, 1,
0.08484016, 0.8526937, 1.081876, 1, 0, 0, 1, 1,
0.08548087, 0.8625101, -0.8759972, 1, 0, 0, 1, 1,
0.08735588, 0.6850084, -0.3025889, 1, 0, 0, 1, 1,
0.08779332, 1.30272, -1.185077, 1, 0, 0, 1, 1,
0.09267694, 0.3121426, -0.8451174, 1, 0, 0, 1, 1,
0.09991134, 1.194315, 0.6521922, 0, 0, 0, 1, 1,
0.1065571, -1.909972, 1.939295, 0, 0, 0, 1, 1,
0.1108298, 0.1472389, -0.4640937, 0, 0, 0, 1, 1,
0.1114488, -2.516881, 2.929017, 0, 0, 0, 1, 1,
0.120482, -2.967807, 3.876828, 0, 0, 0, 1, 1,
0.1213377, -0.1559157, 1.39625, 0, 0, 0, 1, 1,
0.1236134, 1.137844, 1.286317, 0, 0, 0, 1, 1,
0.1272495, -0.09875913, 2.579571, 1, 1, 1, 1, 1,
0.1314142, -0.7703931, 1.644401, 1, 1, 1, 1, 1,
0.1324631, -0.9362175, 3.832935, 1, 1, 1, 1, 1,
0.1389791, 0.9062572, 2.128987, 1, 1, 1, 1, 1,
0.1419673, 0.6476581, 2.035691, 1, 1, 1, 1, 1,
0.1423115, -0.6587268, 0.8206448, 1, 1, 1, 1, 1,
0.1432463, 1.527476, 0.1041798, 1, 1, 1, 1, 1,
0.14497, 0.304707, 0.8810626, 1, 1, 1, 1, 1,
0.1469997, -0.5986521, 4.777207, 1, 1, 1, 1, 1,
0.147757, -0.3173498, 2.433168, 1, 1, 1, 1, 1,
0.1479661, -0.6149607, 2.738633, 1, 1, 1, 1, 1,
0.1541161, 1.619039, -0.7026446, 1, 1, 1, 1, 1,
0.1562605, -0.9860258, 2.0928, 1, 1, 1, 1, 1,
0.1582133, 0.8742232, -0.3904286, 1, 1, 1, 1, 1,
0.1586175, -0.2201294, 3.027565, 1, 1, 1, 1, 1,
0.1598926, 1.298976, -1.208881, 0, 0, 1, 1, 1,
0.1599912, 0.944554, 0.4935509, 1, 0, 0, 1, 1,
0.1601295, 0.3500672, 0.4696704, 1, 0, 0, 1, 1,
0.1617887, 0.4903319, -0.874708, 1, 0, 0, 1, 1,
0.1728531, -0.2071985, 1.913268, 1, 0, 0, 1, 1,
0.1738964, -1.781077, 3.919889, 1, 0, 0, 1, 1,
0.1805834, 1.315441, 0.15182, 0, 0, 0, 1, 1,
0.1894747, -1.273769, 3.766663, 0, 0, 0, 1, 1,
0.1905721, 1.62696, 0.1805083, 0, 0, 0, 1, 1,
0.1906079, -0.05260121, 2.217981, 0, 0, 0, 1, 1,
0.192303, 1.363009, -0.4735112, 0, 0, 0, 1, 1,
0.1951715, -1.324624, 2.926126, 0, 0, 0, 1, 1,
0.1954454, 1.50987, -0.5144988, 0, 0, 0, 1, 1,
0.1967923, -0.5123767, 4.075288, 1, 1, 1, 1, 1,
0.1998243, -0.8354855, 3.933279, 1, 1, 1, 1, 1,
0.2012575, 0.3123527, 0.9036316, 1, 1, 1, 1, 1,
0.2069932, 2.648001, 0.1011849, 1, 1, 1, 1, 1,
0.209679, -0.0482456, 1.910595, 1, 1, 1, 1, 1,
0.2119406, -0.5577682, 2.043828, 1, 1, 1, 1, 1,
0.2141479, 0.3176654, 0.1876498, 1, 1, 1, 1, 1,
0.2192145, 1.109002, -0.6673021, 1, 1, 1, 1, 1,
0.2196455, 0.9062249, 0.0654662, 1, 1, 1, 1, 1,
0.2210971, 2.804691, 0.4905535, 1, 1, 1, 1, 1,
0.2228795, 0.260584, 0.5575311, 1, 1, 1, 1, 1,
0.2234701, -1.71662, 3.366871, 1, 1, 1, 1, 1,
0.2283573, 0.1780481, 0.6017639, 1, 1, 1, 1, 1,
0.2302599, 1.238116, 0.4990126, 1, 1, 1, 1, 1,
0.2307961, 0.3393568, 0.477647, 1, 1, 1, 1, 1,
0.2357538, -0.2027431, 3.272308, 0, 0, 1, 1, 1,
0.238593, -0.3777217, 2.822616, 1, 0, 0, 1, 1,
0.2397461, -0.7213173, 3.116764, 1, 0, 0, 1, 1,
0.2420613, 0.4145798, 0.02784702, 1, 0, 0, 1, 1,
0.242774, -0.7087769, 3.081329, 1, 0, 0, 1, 1,
0.2439546, -0.03335249, 3.661961, 1, 0, 0, 1, 1,
0.2461568, 0.6855736, -0.2169476, 0, 0, 0, 1, 1,
0.2594254, -0.6015269, 2.92735, 0, 0, 0, 1, 1,
0.2634164, 0.0446904, 1.381725, 0, 0, 0, 1, 1,
0.2636655, -0.1660984, 2.520741, 0, 0, 0, 1, 1,
0.2653006, 0.5863664, -1.136107, 0, 0, 0, 1, 1,
0.2653397, -0.06960531, 1.723509, 0, 0, 0, 1, 1,
0.2665889, 0.05236709, 1.074255, 0, 0, 0, 1, 1,
0.2678615, 0.3661227, -0.6480092, 1, 1, 1, 1, 1,
0.2682339, 0.2169553, 1.043419, 1, 1, 1, 1, 1,
0.2696533, 1.032397, 0.1495455, 1, 1, 1, 1, 1,
0.2703991, 0.8898571, -0.2232788, 1, 1, 1, 1, 1,
0.2749655, -1.263157, 1.538633, 1, 1, 1, 1, 1,
0.2766303, -0.4905252, -0.1544237, 1, 1, 1, 1, 1,
0.2797184, 0.16602, -0.3008538, 1, 1, 1, 1, 1,
0.2859399, 0.3234321, 1.466448, 1, 1, 1, 1, 1,
0.2865947, 0.709227, -0.3410636, 1, 1, 1, 1, 1,
0.2922421, 0.8703611, 0.391356, 1, 1, 1, 1, 1,
0.3026576, 0.5564358, 0.3135588, 1, 1, 1, 1, 1,
0.304305, 0.7133955, 1.863967, 1, 1, 1, 1, 1,
0.304472, -1.754503, 1.114379, 1, 1, 1, 1, 1,
0.3045116, -1.37286, 2.89677, 1, 1, 1, 1, 1,
0.306353, 0.2942819, -0.5449493, 1, 1, 1, 1, 1,
0.306512, 1.322728, -0.04496843, 0, 0, 1, 1, 1,
0.3119769, -1.272342, 3.311647, 1, 0, 0, 1, 1,
0.3176194, 0.01907223, 2.54062, 1, 0, 0, 1, 1,
0.3188327, 0.8209047, 1.03421, 1, 0, 0, 1, 1,
0.3199126, -0.59815, 3.009303, 1, 0, 0, 1, 1,
0.32145, 1.259679, -1.127414, 1, 0, 0, 1, 1,
0.3238416, -0.5661151, 1.51388, 0, 0, 0, 1, 1,
0.3292712, -1.880051, 4.190701, 0, 0, 0, 1, 1,
0.3293884, -0.09447179, 2.419388, 0, 0, 0, 1, 1,
0.3349992, 0.008710573, 2.36686, 0, 0, 0, 1, 1,
0.3372265, 1.19716, 0.5699083, 0, 0, 0, 1, 1,
0.3374378, 0.1756677, 0.7657937, 0, 0, 0, 1, 1,
0.3395071, 0.5141643, -0.1622571, 0, 0, 0, 1, 1,
0.3473384, -1.171806, 2.292887, 1, 1, 1, 1, 1,
0.3497623, -0.2411142, 4.564936, 1, 1, 1, 1, 1,
0.3517085, -0.6287151, 1.58763, 1, 1, 1, 1, 1,
0.3517222, 0.7159939, 0.4899052, 1, 1, 1, 1, 1,
0.3523133, 1.018753, 1.604207, 1, 1, 1, 1, 1,
0.355434, 0.9967647, -1.198688, 1, 1, 1, 1, 1,
0.3557059, -1.520716, 2.295148, 1, 1, 1, 1, 1,
0.3596565, -1.194634, 3.565042, 1, 1, 1, 1, 1,
0.3667632, -0.8057446, 3.95972, 1, 1, 1, 1, 1,
0.3675844, 1.220377, 0.6596105, 1, 1, 1, 1, 1,
0.3712183, -1.384745, 3.041243, 1, 1, 1, 1, 1,
0.3734936, -0.5580285, 3.993464, 1, 1, 1, 1, 1,
0.3746072, 0.9383056, 0.2606069, 1, 1, 1, 1, 1,
0.3747051, 1.116319, 1.340596, 1, 1, 1, 1, 1,
0.3755407, -2.233304, 3.137046, 1, 1, 1, 1, 1,
0.3792086, 1.159007, -0.5626185, 0, 0, 1, 1, 1,
0.3840785, -0.0771644, 0.8917561, 1, 0, 0, 1, 1,
0.3871627, -0.4093707, 2.219637, 1, 0, 0, 1, 1,
0.387325, -2.112579, 3.581455, 1, 0, 0, 1, 1,
0.3874627, -1.16923, 2.591342, 1, 0, 0, 1, 1,
0.3907416, 2.280743, -0.5346407, 1, 0, 0, 1, 1,
0.3920238, -0.1443641, 1.656138, 0, 0, 0, 1, 1,
0.3926093, 1.625989, -0.4384927, 0, 0, 0, 1, 1,
0.3942496, -0.2015167, 2.152274, 0, 0, 0, 1, 1,
0.396706, 0.6405411, 0.5488037, 0, 0, 0, 1, 1,
0.4009997, 0.4865169, -0.06573416, 0, 0, 0, 1, 1,
0.4010698, -1.581717, 3.501249, 0, 0, 0, 1, 1,
0.4028799, -1.613278, 1.600464, 0, 0, 0, 1, 1,
0.4049515, 0.7324636, -1.077037, 1, 1, 1, 1, 1,
0.4098248, 0.3686383, 0.9272828, 1, 1, 1, 1, 1,
0.4105239, 1.134223, 0.1288633, 1, 1, 1, 1, 1,
0.4138872, 0.4424722, 2.246529, 1, 1, 1, 1, 1,
0.4190263, 1.293432, -1.183506, 1, 1, 1, 1, 1,
0.4226549, -0.4977288, 3.452303, 1, 1, 1, 1, 1,
0.4254705, -0.7890888, 3.055818, 1, 1, 1, 1, 1,
0.4261916, 1.56814, 0.7130683, 1, 1, 1, 1, 1,
0.4261976, 0.1741232, 2.418804, 1, 1, 1, 1, 1,
0.4277531, -0.4946927, 2.339309, 1, 1, 1, 1, 1,
0.4334903, 0.1810638, -0.8001951, 1, 1, 1, 1, 1,
0.4378622, -1.444191, 3.25737, 1, 1, 1, 1, 1,
0.4400369, -1.809088, 3.677849, 1, 1, 1, 1, 1,
0.4415657, 0.6687701, -0.5500202, 1, 1, 1, 1, 1,
0.4419485, -0.1687741, 2.531381, 1, 1, 1, 1, 1,
0.4458919, -0.5261437, 2.441865, 0, 0, 1, 1, 1,
0.4473386, 0.9950311, -0.3611801, 1, 0, 0, 1, 1,
0.4496054, -1.560135, 2.578979, 1, 0, 0, 1, 1,
0.4534494, -0.9970792, 2.488113, 1, 0, 0, 1, 1,
0.4536079, -0.7481171, 0.4903003, 1, 0, 0, 1, 1,
0.4578889, -1.352306, 4.111187, 1, 0, 0, 1, 1,
0.4593809, 1.151113, 1.555071, 0, 0, 0, 1, 1,
0.4646228, 0.1703221, -0.3831041, 0, 0, 0, 1, 1,
0.4659487, -0.3643765, 0.9950652, 0, 0, 0, 1, 1,
0.4663449, 1.932128, 1.091419, 0, 0, 0, 1, 1,
0.4677351, 0.4283698, 2.543749, 0, 0, 0, 1, 1,
0.4697348, 0.7858433, -0.2974305, 0, 0, 0, 1, 1,
0.4711221, -0.3919245, 2.758831, 0, 0, 0, 1, 1,
0.4733783, -0.3625492, 2.765981, 1, 1, 1, 1, 1,
0.4763966, -2.429468, 3.742758, 1, 1, 1, 1, 1,
0.4771803, 0.2495197, 1.45512, 1, 1, 1, 1, 1,
0.4809039, 0.2029377, 0.7409192, 1, 1, 1, 1, 1,
0.4845732, -1.794513, 2.983764, 1, 1, 1, 1, 1,
0.4879476, 0.1493019, 3.92273, 1, 1, 1, 1, 1,
0.4885026, -0.1165559, 3.311379, 1, 1, 1, 1, 1,
0.4919265, 0.1143261, 2.451199, 1, 1, 1, 1, 1,
0.4924214, -0.2379266, 2.636996, 1, 1, 1, 1, 1,
0.4941571, 1.014184, -0.9329919, 1, 1, 1, 1, 1,
0.4971684, -0.01027211, 2.271629, 1, 1, 1, 1, 1,
0.4997239, -0.2418211, 1.709392, 1, 1, 1, 1, 1,
0.5002893, 0.1686117, 0.6254589, 1, 1, 1, 1, 1,
0.5031641, -0.0343248, 1.704607, 1, 1, 1, 1, 1,
0.5039624, -1.2665, 3.217932, 1, 1, 1, 1, 1,
0.5053176, -0.7734826, 2.252036, 0, 0, 1, 1, 1,
0.5068707, -0.6641535, 4.85599, 1, 0, 0, 1, 1,
0.5072053, 1.453787, 2.41239, 1, 0, 0, 1, 1,
0.5113754, -1.123258, 2.197059, 1, 0, 0, 1, 1,
0.5141156, 2.379854, 1.085262, 1, 0, 0, 1, 1,
0.5152064, -0.3812409, 3.270455, 1, 0, 0, 1, 1,
0.5227808, -0.7369965, 3.402776, 0, 0, 0, 1, 1,
0.5242822, 1.280736, 0.06098073, 0, 0, 0, 1, 1,
0.5266774, -0.6056731, 2.921309, 0, 0, 0, 1, 1,
0.529723, 0.862191, 0.3805674, 0, 0, 0, 1, 1,
0.5306965, -0.8628445, 2.166843, 0, 0, 0, 1, 1,
0.5317585, 1.675631, 0.9185776, 0, 0, 0, 1, 1,
0.5392959, -1.561106, 3.904036, 0, 0, 0, 1, 1,
0.5400892, -1.074969, 2.323531, 1, 1, 1, 1, 1,
0.5418855, -0.0614262, 0.826536, 1, 1, 1, 1, 1,
0.5486483, -0.5758599, 2.811177, 1, 1, 1, 1, 1,
0.5607278, 0.02092203, 1.768534, 1, 1, 1, 1, 1,
0.5616183, -0.6549402, 4.181958, 1, 1, 1, 1, 1,
0.5628704, 0.4225315, 0.2168079, 1, 1, 1, 1, 1,
0.5701272, 1.097032, 0.6046019, 1, 1, 1, 1, 1,
0.5703876, -1.64281, 2.596818, 1, 1, 1, 1, 1,
0.5746784, -1.156093, 3.209781, 1, 1, 1, 1, 1,
0.5856103, 0.4232609, 1.375098, 1, 1, 1, 1, 1,
0.5959462, 1.205405, -1.018695, 1, 1, 1, 1, 1,
0.5998955, -0.008815919, 1.714165, 1, 1, 1, 1, 1,
0.6004206, 1.093285, 0.8480312, 1, 1, 1, 1, 1,
0.6037382, 2.068001, 0.8386437, 1, 1, 1, 1, 1,
0.6046162, 0.4110158, 0.5557007, 1, 1, 1, 1, 1,
0.6094582, -1.150426, 2.142652, 0, 0, 1, 1, 1,
0.6129513, -1.698958, 4.244657, 1, 0, 0, 1, 1,
0.6161053, -1.333066, 1.808486, 1, 0, 0, 1, 1,
0.6164766, 2.62732, -0.4936711, 1, 0, 0, 1, 1,
0.6295622, -1.850633, 2.132389, 1, 0, 0, 1, 1,
0.6380187, 0.526226, 2.599028, 1, 0, 0, 1, 1,
0.6388816, -0.3916907, 1.448062, 0, 0, 0, 1, 1,
0.6424599, -1.114171, 3.368176, 0, 0, 0, 1, 1,
0.6444715, -0.5871998, 3.0303, 0, 0, 0, 1, 1,
0.6446195, -1.122995, 3.303499, 0, 0, 0, 1, 1,
0.6522352, 0.6018435, -0.05865612, 0, 0, 0, 1, 1,
0.6589155, 0.2576815, 2.314934, 0, 0, 0, 1, 1,
0.6644563, -1.041399, 2.461543, 0, 0, 0, 1, 1,
0.6654928, 0.1124193, 2.08774, 1, 1, 1, 1, 1,
0.6677979, 0.5392769, 0.08251675, 1, 1, 1, 1, 1,
0.6690418, -0.9913898, 1.366127, 1, 1, 1, 1, 1,
0.6712028, -0.01341754, 2.849748, 1, 1, 1, 1, 1,
0.671973, -0.4306096, 2.23448, 1, 1, 1, 1, 1,
0.6725246, 0.4323546, 2.449189, 1, 1, 1, 1, 1,
0.6737176, 0.4635412, 2.771783, 1, 1, 1, 1, 1,
0.6738127, 0.4480897, -1.072207, 1, 1, 1, 1, 1,
0.6762221, -2.596486, 3.43824, 1, 1, 1, 1, 1,
0.6831397, -0.5132757, 3.238383, 1, 1, 1, 1, 1,
0.6855961, -1.144592, 3.67101, 1, 1, 1, 1, 1,
0.6913315, 1.697962, 0.875634, 1, 1, 1, 1, 1,
0.6932193, 1.285497, 2.335756, 1, 1, 1, 1, 1,
0.6956121, -0.03885252, 0.6989423, 1, 1, 1, 1, 1,
0.6969084, 0.3641875, 0.9791884, 1, 1, 1, 1, 1,
0.7013321, 0.004044325, 1.385167, 0, 0, 1, 1, 1,
0.7013913, 0.2662954, -0.1006448, 1, 0, 0, 1, 1,
0.7045718, -0.2851899, 2.321405, 1, 0, 0, 1, 1,
0.7069106, -1.661981, 1.889537, 1, 0, 0, 1, 1,
0.7073416, -1.311286, 3.38429, 1, 0, 0, 1, 1,
0.7079331, 0.1195383, 1.507548, 1, 0, 0, 1, 1,
0.7092703, 0.3210452, 1.995628, 0, 0, 0, 1, 1,
0.709664, 1.161408, 1.716995, 0, 0, 0, 1, 1,
0.7115306, -1.05558, 5.03198, 0, 0, 0, 1, 1,
0.7120951, 0.6917402, 0.9814115, 0, 0, 0, 1, 1,
0.7131045, -0.2491567, 1.161431, 0, 0, 0, 1, 1,
0.7131088, -0.1467533, 1.980359, 0, 0, 0, 1, 1,
0.7164711, -0.4438111, 2.12988, 0, 0, 0, 1, 1,
0.7207733, 1.328339, 0.9009587, 1, 1, 1, 1, 1,
0.7229766, 2.218636, 1.112943, 1, 1, 1, 1, 1,
0.7268131, -1.016985, 3.283728, 1, 1, 1, 1, 1,
0.7303343, -0.4101819, 0.5063069, 1, 1, 1, 1, 1,
0.7324547, -0.4653619, 1.138231, 1, 1, 1, 1, 1,
0.7333702, -0.6901193, 2.894455, 1, 1, 1, 1, 1,
0.7384597, 0.3155725, -0.1685565, 1, 1, 1, 1, 1,
0.7411354, 0.09053599, 0.1043945, 1, 1, 1, 1, 1,
0.7462325, 0.9417229, 1.697953, 1, 1, 1, 1, 1,
0.7475452, 2.435062, -0.274479, 1, 1, 1, 1, 1,
0.7507191, -0.5272053, 1.354178, 1, 1, 1, 1, 1,
0.7552348, 0.2365265, 1.504134, 1, 1, 1, 1, 1,
0.7675862, 0.6553012, 2.178376, 1, 1, 1, 1, 1,
0.7705882, 0.1870328, -0.1563465, 1, 1, 1, 1, 1,
0.7773191, -0.6150633, 1.971081, 1, 1, 1, 1, 1,
0.7795939, 0.9407969, -0.4208015, 0, 0, 1, 1, 1,
0.7796565, 0.3012511, 2.034947, 1, 0, 0, 1, 1,
0.781646, -0.4231681, 2.445879, 1, 0, 0, 1, 1,
0.7824978, 0.2316606, 0.8699981, 1, 0, 0, 1, 1,
0.7874061, 0.9800449, 1.751238, 1, 0, 0, 1, 1,
0.795381, 0.5867898, 0.4802744, 1, 0, 0, 1, 1,
0.7958775, 0.119346, -0.228322, 0, 0, 0, 1, 1,
0.8108098, -0.9401151, 2.146925, 0, 0, 0, 1, 1,
0.8138554, -0.5536184, 2.253205, 0, 0, 0, 1, 1,
0.8175236, 0.9106029, 0.3868667, 0, 0, 0, 1, 1,
0.818122, -0.0203669, 1.193552, 0, 0, 0, 1, 1,
0.8271878, 0.2091428, 1.510177, 0, 0, 0, 1, 1,
0.8276925, -1.177135, 1.086911, 0, 0, 0, 1, 1,
0.8290997, 1.764223, 1.410252, 1, 1, 1, 1, 1,
0.8303064, 0.2509311, 0.7386626, 1, 1, 1, 1, 1,
0.8371739, 2.263345, -0.1496264, 1, 1, 1, 1, 1,
0.8407686, 1.318222, 1.187104, 1, 1, 1, 1, 1,
0.8410448, -0.09863842, 1.932385, 1, 1, 1, 1, 1,
0.8429189, 0.9634514, 0.4568686, 1, 1, 1, 1, 1,
0.84383, 1.120503, 1.603894, 1, 1, 1, 1, 1,
0.8548002, -2.114532, 3.298284, 1, 1, 1, 1, 1,
0.8553011, -0.008197163, 3.965214, 1, 1, 1, 1, 1,
0.8577127, 1.56109, 0.6121501, 1, 1, 1, 1, 1,
0.8608661, 0.1353591, 3.056491, 1, 1, 1, 1, 1,
0.8656712, 1.048443, -0.244807, 1, 1, 1, 1, 1,
0.8675172, -1.924762, 4.338203, 1, 1, 1, 1, 1,
0.8710102, 0.006897715, 1.330606, 1, 1, 1, 1, 1,
0.8718997, -1.700271, 1.815898, 1, 1, 1, 1, 1,
0.8758834, 0.5436631, 1.935088, 0, 0, 1, 1, 1,
0.8770477, -0.9712632, 1.759671, 1, 0, 0, 1, 1,
0.8877134, 1.403655, 0.7192612, 1, 0, 0, 1, 1,
0.8893492, 2.277427, -1.493389, 1, 0, 0, 1, 1,
0.8904679, 1.482846, 0.5389205, 1, 0, 0, 1, 1,
0.8939309, 0.4392333, -1.040726, 1, 0, 0, 1, 1,
0.8954169, 0.830348, 2.044865, 0, 0, 0, 1, 1,
0.9090468, 2.310801, 1.482661, 0, 0, 0, 1, 1,
0.9118243, 0.6543667, -0.7554007, 0, 0, 0, 1, 1,
0.9147134, -0.2561043, 1.849879, 0, 0, 0, 1, 1,
0.9158009, 0.09343956, 0.56142, 0, 0, 0, 1, 1,
0.9182336, -1.96876, 0.9887912, 0, 0, 0, 1, 1,
0.9204916, -0.298643, 1.95689, 0, 0, 0, 1, 1,
0.9235804, -0.01080761, 1.415868, 1, 1, 1, 1, 1,
0.9287032, 0.05525957, 0.820862, 1, 1, 1, 1, 1,
0.9327174, -0.4397534, -0.04688146, 1, 1, 1, 1, 1,
0.9388146, 0.8206351, -0.1553371, 1, 1, 1, 1, 1,
0.9562338, 0.6243063, 0.6744263, 1, 1, 1, 1, 1,
0.9660406, -0.104428, 1.518267, 1, 1, 1, 1, 1,
0.9698412, -0.456989, 2.732734, 1, 1, 1, 1, 1,
0.972507, 1.463762, -0.5107954, 1, 1, 1, 1, 1,
0.973568, 0.3096324, 1.669041, 1, 1, 1, 1, 1,
0.9752343, -0.3913193, 0.1196403, 1, 1, 1, 1, 1,
0.9760951, -0.02788517, 0.1996428, 1, 1, 1, 1, 1,
0.9769139, 0.5622829, 0.2863191, 1, 1, 1, 1, 1,
0.9806101, 0.9420252, 0.9246218, 1, 1, 1, 1, 1,
0.9901565, 0.1670449, 0.983135, 1, 1, 1, 1, 1,
0.9928806, 1.26121, 0.4795518, 1, 1, 1, 1, 1,
0.9933956, -1.66424, 4.142364, 0, 0, 1, 1, 1,
1.00255, 1.077796, 0.5360669, 1, 0, 0, 1, 1,
1.011651, 0.1920747, 0.3018596, 1, 0, 0, 1, 1,
1.012249, 0.2018006, 0.7518662, 1, 0, 0, 1, 1,
1.01521, -1.19681, 2.480138, 1, 0, 0, 1, 1,
1.017975, -0.217392, 4.135273, 1, 0, 0, 1, 1,
1.021531, 0.2561601, 2.525451, 0, 0, 0, 1, 1,
1.026541, -0.6665418, 2.617669, 0, 0, 0, 1, 1,
1.028256, -0.9450185, 1.957737, 0, 0, 0, 1, 1,
1.032014, -1.086495, 1.787552, 0, 0, 0, 1, 1,
1.044899, 0.1592941, 0.3992468, 0, 0, 0, 1, 1,
1.048152, -0.1348516, 1.683118, 0, 0, 0, 1, 1,
1.04876, 0.6209436, 1.193769, 0, 0, 0, 1, 1,
1.048873, -0.2655168, 1.155953, 1, 1, 1, 1, 1,
1.051819, 1.07433, -0.666538, 1, 1, 1, 1, 1,
1.052366, -0.7337648, 1.370575, 1, 1, 1, 1, 1,
1.06406, -0.30972, 2.860468, 1, 1, 1, 1, 1,
1.06448, 1.455378, 1.246176, 1, 1, 1, 1, 1,
1.065005, -0.2941695, 0.282159, 1, 1, 1, 1, 1,
1.070209, 0.1618985, 0.6299429, 1, 1, 1, 1, 1,
1.070941, -1.817258, 2.60282, 1, 1, 1, 1, 1,
1.073398, 0.427361, 0.6305895, 1, 1, 1, 1, 1,
1.075234, 0.6933162, 0.05364516, 1, 1, 1, 1, 1,
1.075491, 0.1151957, 1.449783, 1, 1, 1, 1, 1,
1.085533, -0.8334387, 2.922366, 1, 1, 1, 1, 1,
1.1212, -0.4577607, 1.792648, 1, 1, 1, 1, 1,
1.123402, 0.4361598, 1.058175, 1, 1, 1, 1, 1,
1.128992, 1.858388, -0.2085678, 1, 1, 1, 1, 1,
1.131237, 1.002049, 1.213521, 0, 0, 1, 1, 1,
1.131982, -1.381941, 2.18331, 1, 0, 0, 1, 1,
1.141497, 1.05352, 0.9231825, 1, 0, 0, 1, 1,
1.142554, 0.7979162, 2.035712, 1, 0, 0, 1, 1,
1.143377, -1.038255, 1.582909, 1, 0, 0, 1, 1,
1.143883, -1.591893, 1.41981, 1, 0, 0, 1, 1,
1.145821, 0.1994758, 4.131583, 0, 0, 0, 1, 1,
1.149323, -0.05470236, 1.775303, 0, 0, 0, 1, 1,
1.156114, 0.3013135, 2.715816, 0, 0, 0, 1, 1,
1.15625, -1.391168, 3.56431, 0, 0, 0, 1, 1,
1.169022, -1.461935, 0.9600559, 0, 0, 0, 1, 1,
1.184039, -0.8620298, 2.050832, 0, 0, 0, 1, 1,
1.186216, -0.3739865, 1.057103, 0, 0, 0, 1, 1,
1.190647, 0.04695713, 0.7444489, 1, 1, 1, 1, 1,
1.19426, 2.490989, -0.506272, 1, 1, 1, 1, 1,
1.195893, -0.2424357, 1.89975, 1, 1, 1, 1, 1,
1.202322, 0.2764618, 2.245019, 1, 1, 1, 1, 1,
1.203401, 0.4037855, 1.159885, 1, 1, 1, 1, 1,
1.203644, 1.456828, 1.940848, 1, 1, 1, 1, 1,
1.205664, 0.8294047, 0.8499255, 1, 1, 1, 1, 1,
1.206625, -0.3483066, 2.765104, 1, 1, 1, 1, 1,
1.210398, -0.08398022, 1.155874, 1, 1, 1, 1, 1,
1.210782, -1.032726, 2.815919, 1, 1, 1, 1, 1,
1.212539, -0.5082605, -0.1245948, 1, 1, 1, 1, 1,
1.218841, 0.246237, 1.387945, 1, 1, 1, 1, 1,
1.219027, -0.01363127, 1.332314, 1, 1, 1, 1, 1,
1.229903, -1.257103, 2.439119, 1, 1, 1, 1, 1,
1.23752, -1.868426, 2.696961, 1, 1, 1, 1, 1,
1.239289, 1.455338, 2.683885, 0, 0, 1, 1, 1,
1.254239, 0.5730366, 0.1928755, 1, 0, 0, 1, 1,
1.256499, -0.4899918, 0.9485729, 1, 0, 0, 1, 1,
1.261797, -0.4494124, 2.876817, 1, 0, 0, 1, 1,
1.267312, -0.09460171, 2.986654, 1, 0, 0, 1, 1,
1.270331, 0.4424568, 1.799735, 1, 0, 0, 1, 1,
1.270544, -0.2412348, 2.713846, 0, 0, 0, 1, 1,
1.284027, 2.097827, 2.159174, 0, 0, 0, 1, 1,
1.289275, 0.5088743, 1.458433, 0, 0, 0, 1, 1,
1.294183, -1.341264, 0.9042829, 0, 0, 0, 1, 1,
1.300308, 0.8439118, 0.689162, 0, 0, 0, 1, 1,
1.301826, 0.02292658, -0.6782123, 0, 0, 0, 1, 1,
1.303437, -0.4501498, 3.691389, 0, 0, 0, 1, 1,
1.313087, -0.3406469, 1.552651, 1, 1, 1, 1, 1,
1.315707, 1.621837, 0.2168509, 1, 1, 1, 1, 1,
1.333757, 0.3095247, -0.7148025, 1, 1, 1, 1, 1,
1.339796, -0.466924, -1.219937, 1, 1, 1, 1, 1,
1.346311, 0.9216819, 0.1418297, 1, 1, 1, 1, 1,
1.347885, -0.6746135, 1.690472, 1, 1, 1, 1, 1,
1.348219, -0.2431759, 1.20739, 1, 1, 1, 1, 1,
1.359692, 0.2368987, 2.986692, 1, 1, 1, 1, 1,
1.368768, 0.1907991, 1.530387, 1, 1, 1, 1, 1,
1.390271, -0.306601, 1.586454, 1, 1, 1, 1, 1,
1.392863, 0.4407167, 0.7199391, 1, 1, 1, 1, 1,
1.397504, -0.05309395, 2.494885, 1, 1, 1, 1, 1,
1.409291, -0.0694759, 1.201304, 1, 1, 1, 1, 1,
1.415371, -0.8385827, 2.273758, 1, 1, 1, 1, 1,
1.422077, 0.6347036, 1.618048, 1, 1, 1, 1, 1,
1.427142, 0.4831492, 0.8999519, 0, 0, 1, 1, 1,
1.438279, 1.555018, 0.732375, 1, 0, 0, 1, 1,
1.45064, 0.5236096, 1.049903, 1, 0, 0, 1, 1,
1.461792, 1.763814, 0.9137005, 1, 0, 0, 1, 1,
1.470932, -0.8200746, 2.934867, 1, 0, 0, 1, 1,
1.49107, 1.015634, 1.323975, 1, 0, 0, 1, 1,
1.493271, -0.7451566, -0.1121258, 0, 0, 0, 1, 1,
1.507902, -2.53192, 3.063515, 0, 0, 0, 1, 1,
1.548927, -1.021649, 3.24736, 0, 0, 0, 1, 1,
1.551154, -0.9677649, 2.375281, 0, 0, 0, 1, 1,
1.56154, 0.5952101, 2.29606, 0, 0, 0, 1, 1,
1.563981, 0.2691671, 0.6947516, 0, 0, 0, 1, 1,
1.573357, 1.008076, 1.986231, 0, 0, 0, 1, 1,
1.600673, -0.9010686, 1.978184, 1, 1, 1, 1, 1,
1.601883, -0.363594, 2.088112, 1, 1, 1, 1, 1,
1.608082, -2.033759, 1.253384, 1, 1, 1, 1, 1,
1.61024, 1.542662, 1.082664, 1, 1, 1, 1, 1,
1.618418, 1.110778, 1.525133, 1, 1, 1, 1, 1,
1.647175, 0.3038647, 2.643835, 1, 1, 1, 1, 1,
1.674373, 1.345637, 2.43604, 1, 1, 1, 1, 1,
1.677871, 0.9942721, 1.157741, 1, 1, 1, 1, 1,
1.695519, -0.6880956, -0.09414741, 1, 1, 1, 1, 1,
1.73291, -0.8730312, 2.358432, 1, 1, 1, 1, 1,
1.735029, -0.9165018, 0.4890172, 1, 1, 1, 1, 1,
1.743693, -0.436633, 2.752298, 1, 1, 1, 1, 1,
1.744504, 0.882373, 1.945384, 1, 1, 1, 1, 1,
1.761051, -0.06274257, 0.8265356, 1, 1, 1, 1, 1,
1.778429, -0.6892502, 1.834883, 1, 1, 1, 1, 1,
1.781924, -0.68828, 2.074688, 0, 0, 1, 1, 1,
1.789854, -0.07331699, 0.04717713, 1, 0, 0, 1, 1,
1.79359, 3.056189, -0.72233, 1, 0, 0, 1, 1,
1.823771, -1.205572, 1.466768, 1, 0, 0, 1, 1,
1.859786, -1.02612, 0.6750756, 1, 0, 0, 1, 1,
1.863225, 0.8449099, 0.1584669, 1, 0, 0, 1, 1,
1.868604, -0.2651471, 1.272895, 0, 0, 0, 1, 1,
1.880084, -0.7165182, 2.76965, 0, 0, 0, 1, 1,
1.889796, -0.2605122, 2.181626, 0, 0, 0, 1, 1,
1.893688, 0.6775494, 0.8464365, 0, 0, 0, 1, 1,
1.909819, -0.1613001, 2.622393, 0, 0, 0, 1, 1,
1.910845, -0.08407929, 1.16826, 0, 0, 0, 1, 1,
1.92868, -0.3208553, 2.421438, 0, 0, 0, 1, 1,
1.929419, 2.021549, 0.5567835, 1, 1, 1, 1, 1,
1.934251, -0.193615, 0.5582572, 1, 1, 1, 1, 1,
1.934985, 0.09350283, 1.151254, 1, 1, 1, 1, 1,
1.989673, -0.05442565, 1.234161, 1, 1, 1, 1, 1,
2.004905, -0.507413, 2.794578, 1, 1, 1, 1, 1,
2.008764, 0.1500834, 0.8438098, 1, 1, 1, 1, 1,
2.040131, -1.898297, 1.829111, 1, 1, 1, 1, 1,
2.043362, 0.4877334, 1.273291, 1, 1, 1, 1, 1,
2.106138, -0.6021914, 2.534655, 1, 1, 1, 1, 1,
2.151017, 0.05857375, 1.662418, 1, 1, 1, 1, 1,
2.154726, -0.7351059, 1.672494, 1, 1, 1, 1, 1,
2.170518, -1.862436, 2.076197, 1, 1, 1, 1, 1,
2.178538, 0.809507, 1.015711, 1, 1, 1, 1, 1,
2.179388, -0.2879369, 0.6705031, 1, 1, 1, 1, 1,
2.201739, 0.9917759, 1.068336, 1, 1, 1, 1, 1,
2.203396, 0.07678292, 2.692909, 0, 0, 1, 1, 1,
2.265132, -1.07269, 0.7008643, 1, 0, 0, 1, 1,
2.272329, -0.934579, 1.503702, 1, 0, 0, 1, 1,
2.277476, 0.2005879, 3.187042, 1, 0, 0, 1, 1,
2.321782, -1.571216, 1.737356, 1, 0, 0, 1, 1,
2.443091, 1.029555, 1.387823, 1, 0, 0, 1, 1,
2.456281, 0.4168283, 0.09712356, 0, 0, 0, 1, 1,
2.464523, 0.0963392, 3.288516, 0, 0, 0, 1, 1,
2.479789, -1.894444, 2.292139, 0, 0, 0, 1, 1,
2.485208, -0.7740787, 1.537802, 0, 0, 0, 1, 1,
2.493057, -0.8148147, 3.623223, 0, 0, 0, 1, 1,
2.532398, -0.05724012, 1.383584, 0, 0, 0, 1, 1,
2.675031, -0.3713441, 2.818642, 0, 0, 0, 1, 1,
2.67529, -0.1413471, 2.246848, 1, 1, 1, 1, 1,
2.702104, 0.05957386, -0.1920841, 1, 1, 1, 1, 1,
2.998374, -0.1918755, 2.433484, 1, 1, 1, 1, 1,
3.042624, -1.538525, -0.394128, 1, 1, 1, 1, 1,
3.062552, -0.8404313, 1.114098, 1, 1, 1, 1, 1,
3.290337, 1.527689, -0.6201319, 1, 1, 1, 1, 1,
3.429494, 1.642504, 1.610469, 1, 1, 1, 1, 1
]);
var values25 = v;
var normLoc25 = gl.getAttribLocation(prog25, "aNorm");
var mvMatLoc25 = gl.getUniformLocation(prog25,"mvMatrix");
var prMatLoc25 = gl.getUniformLocation(prog25,"prMatrix");
var normMatLoc25 = gl.getUniformLocation(prog25,"normMatrix");
gl.enable(gl.DEPTH_TEST);
gl.depthFunc(gl.LEQUAL);
gl.clearDepth(1.0);
gl.clearColor(1,1,1,1);
var xOffs = yOffs = 0,  drag  = 0;
function multMV(M, v) {
return [M.m11*v[0] + M.m12*v[1] + M.m13*v[2] + M.m14*v[3],
M.m21*v[0] + M.m22*v[1] + M.m23*v[2] + M.m24*v[3],
M.m31*v[0] + M.m32*v[1] + M.m33*v[2] + M.m34*v[3],
M.m41*v[0] + M.m42*v[1] + M.m43*v[2] + M.m44*v[3]];
}
drawScene();
function drawScene(){
gl.depthMask(true);
gl.disable(gl.BLEND);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
// ***** subscene 19 ****
gl.viewport(0, 0, 504, 504);
gl.scissor(0, 0, 504, 504);
gl.clearColor(1, 1, 1, 1);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
var radius = 9.499509;
var distance = 33.36662;
var t = tan(fov[19]*PI/360);
var near = distance - radius;
var far = distance + radius;
var hlen = t*near;
var aspect = 1;
prMatrix.makeIdentity();
if (aspect > 1)
prMatrix.frustum(-hlen*aspect*zoom[19], hlen*aspect*zoom[19], 
-hlen*zoom[19], hlen*zoom[19], near, far);
else  
prMatrix.frustum(-hlen*zoom[19], hlen*zoom[19], 
-hlen*zoom[19]/aspect, hlen*zoom[19]/aspect, 
near, far);
mvMatrix.makeIdentity();
mvMatrix.translate( -0.203433, 0.2354195, -0.1343076 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.36662);
normMatrix.makeIdentity();
normMatrix.scale( 1, 1, 1 );   
normMatrix.multRight( userMatrix[19] );
// ****** spheres object 25 *******
gl.useProgram(prog25);
gl.bindBuffer(gl.ARRAY_BUFFER, sphereBuf);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, sphereIbuf);
gl.uniformMatrix4fv( prMatLoc25, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc25, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniformMatrix4fv( normMatLoc25, false, new Float32Array(normMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.enableVertexAttribArray(normLoc25 );
gl.vertexAttribPointer(normLoc25,  3, gl.FLOAT, false, 12,  0);
gl.disableVertexAttribArray( colLoc );
var sphereNorm = new CanvasMatrix4();
sphereNorm.scale(1, 1, 1);
sphereNorm.multRight(normMatrix);
gl.uniformMatrix4fv( normMatLoc25, false, new Float32Array(sphereNorm.getAsArray()) );
for (var i = 0; i < 1000; i++) {
var sphereMV = new CanvasMatrix4();
var baseofs = i*8
var ofs = baseofs + 7;	       
var scale = values25[ofs];
sphereMV.scale(1*scale, 1*scale, 1*scale);
sphereMV.translate(values25[baseofs], 
values25[baseofs+1], 
values25[baseofs+2]);
sphereMV.multRight(mvMatrix);
gl.uniformMatrix4fv( mvMatLoc25, false, new Float32Array(sphereMV.getAsArray()) );
ofs = baseofs + 3;       
gl.vertexAttrib4f( colLoc, values25[ofs], 
values25[ofs+1], 
values25[ofs+2],
values25[ofs+3] );
gl.drawElements(gl.TRIANGLES, 384, gl.UNSIGNED_SHORT, 0);
}
gl.flush ();
}
var vpx0 = {
19: 0
};
var vpy0 = {
19: 0
};
var vpWidths = {
19: 504
};
var vpHeights = {
19: 504
};
var activeModel = {
19: 19
};
var activeProjection = {
19: 19
};
var whichSubscene = function(coords){
if (0 <= coords.x && coords.x <= 504 && 0 <= coords.y && coords.y <= 504) return(19);
return(19);
}
var translateCoords = function(subsceneid, coords){
return {x:coords.x - vpx0[subsceneid], y:coords.y - vpy0[subsceneid]};
}
var vlen = function(v) {
return sqrt(v[0]*v[0] + v[1]*v[1] + v[2]*v[2])
}
var xprod = function(a, b) {
return [a[1]*b[2] - a[2]*b[1],
a[2]*b[0] - a[0]*b[2],
a[0]*b[1] - a[1]*b[0]];
}
var screenToVector = function(x, y) {
var width = vpWidths[activeSubscene];
var height = vpHeights[activeSubscene];
var radius = max(width, height)/2.0;
var cx = width/2.0;
var cy = height/2.0;
var px = (x-cx)/radius;
var py = (y-cy)/radius;
var plen = sqrt(px*px+py*py);
if (plen > 1.e-6) { 
px = px/plen;
py = py/plen;
}
var angle = (SQRT2 - plen)/SQRT2*PI/2;
var z = sin(angle);
var zlen = sqrt(1.0 - z*z);
px = px * zlen;
py = py * zlen;
return [px, py, z];
}
var rotBase;
var trackballdown = function(x,y) {
rotBase = screenToVector(x, y);
saveMat.load(userMatrix[activeModel[activeSubscene]]);
}
var trackballmove = function(x,y) {
var rotCurrent = screenToVector(x,y);
var dot = rotBase[0]*rotCurrent[0] + 
rotBase[1]*rotCurrent[1] + 
rotBase[2]*rotCurrent[2];
var angle = acos( dot/vlen(rotBase)/vlen(rotCurrent) )*180./PI;
var axis = xprod(rotBase, rotCurrent);
userMatrix[activeModel[activeSubscene]].load(saveMat);
userMatrix[activeModel[activeSubscene]].rotate(angle, axis[0], axis[1], axis[2]);
drawScene();
}
var y0zoom = 0;
var zoom0 = 1;
var zoomdown = function(x, y) {
y0zoom = y;
zoom0 = log(zoom[activeProjection[activeSubscene]]);
}
var zoommove = function(x, y) {
zoom[activeProjection[activeSubscene]] = exp(zoom0 + (y-y0zoom)/height);
drawScene();
}
var y0fov = 0;
var fov0 = 1;
var fovdown = function(x, y) {
y0fov = y;
fov0 = fov[activeProjection[activeSubscene]];
}
var fovmove = function(x, y) {
fov[activeProjection[activeSubscene]] = max(1, min(179, fov0 + 180*(y-y0fov)/height));
drawScene();
}
var mousedown = [trackballdown, zoomdown, fovdown];
var mousemove = [trackballmove, zoommove, fovmove];
function relMouseCoords(event){
var totalOffsetX = 0;
var totalOffsetY = 0;
var currentElement = canvas;
do{
totalOffsetX += currentElement.offsetLeft;
totalOffsetY += currentElement.offsetTop;
}
while(currentElement = currentElement.offsetParent)
var canvasX = event.pageX - totalOffsetX;
var canvasY = event.pageY - totalOffsetY;
return {x:canvasX, y:canvasY}
}
canvas.onmousedown = function ( ev ){
if (!ev.which) // Use w3c defns in preference to MS
switch (ev.button) {
case 0: ev.which = 1; break;
case 1: 
case 4: ev.which = 2; break;
case 2: ev.which = 3;
}
drag = ev.which;
var f = mousedown[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height-coords.y;
activeSubscene = whichSubscene(coords);
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y); 
ev.preventDefault();
}
}    
canvas.onmouseup = function ( ev ){	
drag = 0;
}
canvas.onmouseout = canvas.onmouseup;
canvas.onmousemove = function ( ev ){
if ( drag == 0 ) return;
var f = mousemove[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height - coords.y;
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y);
}
}
var wheelHandler = function(ev) {
var del = 1.1;
if (ev.shiftKey) del = 1.01;
var ds = ((ev.detail || ev.wheelDelta) > 0) ? del : (1 / del);
zoom[activeProjection[activeSubscene]] *= ds;
drawScene();
ev.preventDefault();
};
canvas.addEventListener("DOMMouseScroll", wheelHandler, false);
canvas.addEventListener("mousewheel", wheelHandler, false);
}
</script>
<canvas id="testgl2canvas" width="1" height="1"></canvas> 
<p id="testgl2debug">
You must enable Javascript to view this page properly.</p>
<script>testgl2webGLStart();</script>